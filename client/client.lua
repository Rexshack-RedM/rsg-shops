
local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

-------------------------
-- prompts & blips
-------------------------
CreateThread(function()
    for _, v in pairs(Config.StoreLocations) do
        exports['rsg-core']:createPrompt(v.name, v.shopcoords, RSGCore.Shared.Keybinds[Config.Keybind], locale('lang_1') .. v.label, {
            type = 'server',
            event = 'rsg-shops:server:openstore',
            args = {v.products, v.name, v.label},
        })

        if v.showblip then
            local StoreBlip = BlipAddForCoords(1664425300, v.shopcoords)
            SetBlipSprite(StoreBlip, joaat(v.blipsprite), true)
            SetBlipScale(StoreBlip, v.blipscale)
            SetBlipName(StoreBlip, v.label)
            v.blipHandle = StoreBlip -- keep reference for color updates
        end
    end
end)

-- update blip colors based on time
CreateThread(function()
    while true do
        local hour = GetClockHours()
        for _, v in pairs(Config.StoreLocations) do
            if v.blipHandle then
                if v.useHours then
                    if hour >= v.openHour and hour < v.closeHour then
                        BlipAddModifier(v.blipHandle, joaat("BLIP_MODIFIER_MP_COLOR_8")) -- green
                    else
                        BlipAddModifier(v.blipHandle, joaat("BLIP_MODIFIER_MP_COLOR_10")) -- red
                    end
                else
                    BlipAddModifier(v.blipHandle, joaat("BLIP_MODIFIER_MP_COLOR_8")) -- always green
                end
            end
        end
        Wait(60000)
    end
end)

-------------------------
-- category selection
-------------------------
RegisterNetEvent('rsg-shops:client:chooseCategory', function(shopName, shopLabel)
    local shopConfig
    for _, v in pairs(Config.StoreLocations) do
        if v.name == shopName then
            shopConfig = v
            break
        end
    end
    if not shopConfig then return end

    -- get categories dynamically
    local categories = {}
    for cat, _ in pairs(Config.Products[shopConfig.products]) do
        categories[#categories+1] = { value = cat, label = cat:gsub("^%l", string.upper) }
    end

    local input = lib.inputDialog(shopLabel .. ' - Select Category', {
        { type = 'select', label = 'Category', options = categories }
    })

    if input and input[1] then
        TriggerServerEvent('rsg-shops:server:openCategory', shopName, input[1])
    end
end)


