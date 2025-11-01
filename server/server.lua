local RSGCore = exports['rsg-core']:GetCoreObject()

CreateThread(function() 
    for _, shopConfig in pairs(Config.StoreLocations) do 
        local itemTable = Config.Products[shopConfig.products]
        if itemTable then
            exports['rsg-inventory']:CreateShop({
                name = shopConfig.name,
                label = shopConfig.label,
                slots = #itemTable,
                items = itemTable,
                persistentStock = shopConfig.persistentStock,
            })
        else
            print('^1[rsg-shops] ERROR: Product category "' .. tostring(shopConfig.products) .. '" not found for shop "' .. tostring(shopConfig.name) .. '". Skipping shop creation.^7')
        end
    end
end)

-------------------------
-- open shop
-------------------------
RegisterNetEvent('rsg-shops:server:openstore', function(products, name, label)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local playerjobtype = Player.PlayerData.job.type
    if products == 'armoury' and playerjobtype ~= 'leo' then return end
    if products == 'medic' and playerjobtype ~= 'medic' then return end

    local itemTable = Config.Products[products]
    if not exports['rsg-inventory']:DoesShopExist(name) then
        exports['rsg-inventory']:CreateShop({
            name = name,
            label = label,
            slots = itemTable and #itemTable or 0,
            items = itemTable,
        })
    end
    
    exports['rsg-inventory']:OpenShop(source, name)
end)
