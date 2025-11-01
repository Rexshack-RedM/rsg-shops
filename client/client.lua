local RSGCore = exports['rsg-core']:GetCoreObject()
local spawnedNPCs = {}
lib.locale()

-------------------------
-- spawn npc
-------------------------
local function SpawnShopNPC(shopData)
    local model = shopData.npcmodel or Config.NPCModel
    local coords = shopData.npccoords or vector4(shopData.shopcoords.x, shopData.shopcoords.y, shopData.shopcoords.z, 0.0)
    
    lib.requestModel(model, 5000)
    
    local npc = CreatePed(model, coords.x, coords.y, coords.z -1, coords.w, false, false, false, false)
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true) -- SetRandomOutfitVariation
    SetEntityNoCollisionEntity(npc, PlayerPedId(), false)
    SetEntityCanBeDamaged(npc, false)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    
    -- Apply scenario if specified
    if shopData.scenario then
        TaskStartScenarioInPlace(npc, joaat(shopData.scenario), -1, true, false, false, false)
    end
    
    return npc
end

-------------------------
-- setup ox_target for npc
-------------------------
local function SetupNPCTarget(npc, shopData)
        exports.ox_target:addLocalEntity(npc, {
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
end

-------------------------
-- prompts & blips
-------------------------
CreateThread(function()
    for _, v in pairs(Config.StoreLocations) do
        -- setup based on UseNPCs config
        if Config.UseNPCs and v.npccoords then
            -- spawn NPC and setup ox_target
            local npc = SpawnShopNPC(v)
            if npc then
                spawnedNPCs[v.name] = npc
                SetupNPCTarget(npc, v)
            end
        else
            -- use traditional prompt system
            exports['rsg-core']:createPrompt(v.name, v.shopcoords, RSGCore.Shared.Keybinds[Config.Keybind], locale('lang_1') .. v.label, {
                type = 'server',
                event = 'rsg-shops:server:openstore',
                args = {v.products, v.name, v.label},
            })
        end
        
        -- create blip regardless of NPC setting
        if v.showblip == true then
            local StoreBlip = BlipAddForCoords(1664425300, v.shopcoords)
            SetBlipSprite(StoreBlip, joaat(v.blipsprite), true)
            SetBlipScale(StoreBlip, v.blipscale)
            SetBlipName(StoreBlip, v.label)
        end
    end
end)

-------------------------
-- cleanup on resource stop
-------------------------
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    for _, npc in pairs(spawnedNPCs) do
        if DoesEntityExist(npc) then
            DeleteEntity(npc)
        end
    end
end)
