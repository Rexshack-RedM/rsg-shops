local RSGCore = exports['rsg-core']:GetCoreObject()

-------------------------
-- shop creation
-------------------------
CreateThread(function() 
    for _, shopConfig in pairs(Config.StoreLocations) do 
        local itemTable = Config.Products[shopConfig.products]

            -- skip "normal" and "weapons" since they have subcategories
            if shopConfig.products ~= 'normal' and shopConfig.products ~= 'weapons' then
                local items = applyPriceMultiplier(itemTable, shopConfig.priceMultiplier or 1)

                exports['rsg-inventory']:CreateShop({
                    name = shopConfig.name,
                    label = shopConfig.label,
                    slots = #items,
                    items = items,
                    persistentStock = shopConfig.persistentStock,
                })
            end

    end
end)


-------------------------
-- apply multipliers
-------------------------
local function applyPriceMultiplier(items, multiplier)
    local newItems = {}
    for _, item in ipairs(items) do
        local newItem = {}
        for k, v in pairs(item) do newItem[k] = v end
        if item.price then
            newItem.price = math.floor(item.price * (multiplier or 1) * 100) / 100
        end
        table.insert(newItems, newItem)
    end
    return newItems
end

-------------------------
-- open shop (entry point)
-------------------------
RegisterNetEvent('rsg-shops:server:openstore', function(products, name, label)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    -- find shop config
    local shopConfig
    for _, v in pairs(Config.StoreLocations) do
        if v.name == name then
            shopConfig = v
            break
        end
    end

    -- check time restrictions
    if shopConfig and shopConfig.useHours then
        local hour = tonumber(os.date("%H"))
        if not (hour >= shopConfig.openHour and hour < shopConfig.closeHour) then
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Shops Closed',
                description = shopConfig.label .. ' will open at ' .. shopConfig.openHour .. ':00',
                type = 'error'
            })
            return
        end
    end

    -- job restrictions
    local playerjobtype = Player.PlayerData.job.type
    if products == 'armoury' and playerjobtype ~= 'leo' then return end
    if products == 'medic' and playerjobtype ~= 'medic' then return end

    -- if general store or weapons store -> ask category, otherwise open directly
    if products == 'normal' or products == 'weapons' then
        TriggerClientEvent('rsg-shops:client:chooseCategory', src, name, label)
    else
        exports['rsg-inventory']:OpenShop(src, name)
    end

end)

-------------------------
-- open category shop
-------------------------
RegisterNetEvent('rsg-shops:server:openCategory', function(shopName, category)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local shopConfig
    for _, v in pairs(Config.StoreLocations) do
        if v.name == shopName then
            shopConfig = v
            break
        end
    end
    if not shopConfig then return end

    local categoryItems = Config.Products[shopConfig.products][category]
    if not categoryItems then return end

    --  applied multiplier here
    local items = applyPriceMultiplier(categoryItems, shopConfig.priceMultiplier or 1)

    local tempShopName = shopName .. '_' .. category
    exports['rsg-inventory']:CreateShop({
        name = tempShopName,
        label = shopConfig.label .. ' - ' .. category,
        slots = #items,
        items = items,
        persistentStock = shopConfig.persistentStock,
    })

    exports['rsg-inventory']:OpenShop(src, tempShopName)
end)
