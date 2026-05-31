local RSGCore = exports['rsg-core']:GetCoreObject()
local resourceName = GetCurrentResourceName()
local spawnedNPCs = {}
lib.locale()

local function logError(msg)
    print(('[%s] ^1ERROR^7 %s'):format(resourceName, msg))
end

local function logWarn(msg)
    print(('[%s] ^3WARN^7 %s'):format(resourceName, msg))
end

-------------------------
-- spawn npc
-------------------------
local function SpawnShopNPC(shopData)
    if not shopData or not shopData.shopcoords then
        logError(locale('spawn_npc_invalid_data'))
        return nil
    end

    local model = shopData.npcmodel or Config.NPCModel
    local coords = shopData.npccoords or vector4(shopData.shopcoords.x, shopData.shopcoords.y, shopData.shopcoords.z, 0.0)

    local modelLoaded, modelLoadError = pcall(lib.requestModel, model, 5000)
    if not modelLoaded or not HasModelLoaded(joaat(model)) then
        logWarn(locale('model_load_failed', { model = tostring(model), shop = tostring(shopData.name) }))
        return nil
    end

    local npc = CreatePed(model, coords.x, coords.y, coords.z - 1, coords.w, false, false, false, false)
    if not npc or npc == 0 then
        logWarn(locale('npc_create_failed', { shop = tostring(shopData.name) }))
        return nil
    end

    Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
    SetEntityNoCollisionEntity(npc, PlayerPedId(), false)
    SetEntityCanBeDamaged(npc, false)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)

    if shopData.scenario then
        pcall(TaskStartScenarioInPlace, npc, joaat(shopData.scenario), -1, true, false, false, false)
    end

    return npc
end

-------------------------
-- setup ox_target for npc
-------------------------
local function SetupNPCTarget(npc, shopData)
    if not npc or npc == 0 then return end

    local success, err = pcall(exports.ox_target.addLocalEntity, exports.ox_target, npc, {
        {
            name = 'shop_' .. shopData.name,
            label = locale('lang_1') .. shopData.label,
            icon = 'fa-solid fa-basket-shopping',
            distance = 3.0,
            onSelect = function()
                TriggerServerEvent('rsg-shops:server:openstore', shopData.products, shopData.name, shopData.label)
            end
        }
    })
    if not success then
        logWarn(locale('ox_target_setup_failed', { shop = tostring(shopData.name), error = tostring(err) }))
    end
end

-------------------------
-- prompts & blips
-------------------------
CreateThread(function()
    local keybind = RSGCore.Shared.Keybinds[Config.Keybind] or Config.Keybind

    for _, v in pairs(Config.StoreLocations) do
        if not v.name or not v.shopcoords then
            logWarn(locale('shop_skipped_missing_fields'))
            goto continue
        end

        if Config.UseNPCs and v.npccoords then
            local npc = SpawnShopNPC(v)
            if npc then
                spawnedNPCs[v.name] = npc
                SetupNPCTarget(npc, v)
            end
        else
            pcall(exports['rsg-core'].createPrompt, exports['rsg-core'],
                v.name, v.shopcoords, keybind,
                locale('lang_1') .. v.label, {
                    type = 'server',
                    event = 'rsg-shops:server:openstore',
                    args = {v.products, v.name, v.label},
                })
        end

        if v.showblip == true then
            local StoreBlip = BlipAddForCoords(1664425300, v.shopcoords)
            if StoreBlip and StoreBlip ~= 0 then
                SetBlipSprite(StoreBlip, joaat(v.blipsprite), true)
                SetBlipScale(StoreBlip, v.blipscale)
                SetBlipName(StoreBlip, v.label)
            else
                logWarn(locale('blip_create_failed', { shop = tostring(v.label) }))
            end
        end

        ::continue::
    end
end)

-------------------------
-- cleanup on resource stop
-------------------------
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    for _, npc in pairs(spawnedNPCs) do
        if DoesEntityExist(npc) then
            pcall(DeleteEntity, npc)
        end
    end
end)
