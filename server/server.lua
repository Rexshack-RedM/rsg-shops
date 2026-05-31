local RSGCore = exports['rsg-core']:GetCoreObject()
local cooldowns = {}
local resourceName = GetCurrentResourceName()
lib.locale()

local function logError(msg)
    print(('[%s] ^1ERROR^7 %s'):format(resourceName, msg))
end

local function logWarn(msg)
    print(('[%s] ^3WARN^7 %s'):format(resourceName, msg))
end

local function setupValidated()
    local ok = true
    for _, shopConfig in pairs(Config.StoreLocations) do
        if not Config.Products[shopConfig.products] then
            logError(locale('unknown_product_category', { shop = shopConfig.name, category = tostring(shopConfig.products) }))
            ok = false
        end
        if type(shopConfig.name) ~= 'string' or shopConfig.name == '' then
            logError(locale('invalid_shop_name'))
            ok = false
        end
        if not shopConfig.shopcoords then
            logError(locale('missing_shopcoords', { shop = tostring(shopConfig.name) }))
            ok = false
        end
    end
    if not ok then
        logError(locale('config_validation_failed'))
    end
    return ok
end

CreateThread(function()
    if not setupValidated() then return end
    for _, shopConfig in pairs(Config.StoreLocations) do
        local itemTable = Config.Products[shopConfig.products]
        local success, err = pcall(exports['rsg-inventory'].CreateShop, exports['rsg-inventory'], {
            name = shopConfig.name,
            label = shopConfig.label,
            slots = #itemTable,
            items = itemTable,
            persistentStock = shopConfig.persistentStock,
        })
        if not success then
            logError(locale('shop_create_failed', { shop = shopConfig.name, error = tostring(err) }))
        end
    end
end)

-------------------------
-- open shop
-------------------------
RegisterNetEvent('rsg-shops:server:openstore', function(products, name, label)
    local src = source

    if cooldowns[src] and os.time() - cooldowns[src] < 1 then return end
    cooldowns[src] = os.time()

    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then
        logWarn(locale('invalid_player_store', { source = tostring(src) }))
        return
    end

    local shopConfig
    for _, v in pairs(Config.StoreLocations) do
        if v.name == name then
            shopConfig = v
            break
        end
    end
    if not shopConfig then
        logWarn(locale('unknown_shop_attempt', { player = Player.PlayerData.citizenid, shop = tostring(name) }))
        return
    end

    if products ~= shopConfig.products then
        logWarn(locale('mismatched_products', { player = Player.PlayerData.citizenid, products = tostring(products), shop = tostring(name) }))
        return
    end

    local playerPed = GetPlayerPed(src)
    if not playerPed or playerPed == 0 then
        logWarn(locale('no_valid_ped', { player = Player.PlayerData.citizenid }))
        return
    end
    local playerCoords = GetEntityCoords(playerPed)
    local shopCoords = shopConfig.shopcoords
    if #(playerCoords - vector3(shopCoords.x, shopCoords.y, shopCoords.z)) > 10.0 then
        logWarn(locale('too_far_from_shop', { player = Player.PlayerData.citizenid, shop = tostring(name) }))
        return
    end

    local playerjobtype = Player.PlayerData.job.type
    if products == 'armoury' and playerjobtype ~= 'leo' then return end
    if products == 'medic' and playerjobtype ~= 'medic' then return end

    local itemTable = Config.Products[products]
    if not itemTable then
        logError(locale('product_category_missing', { category = tostring(products) }))
        return
    end

    local success, err
    if not exports['rsg-inventory']:DoesShopExist(name) then
        success, err = pcall(exports['rsg-inventory'].CreateShop, exports['rsg-inventory'], {
            name = name,
            label = label,
            slots = #itemTable,
            items = itemTable,
        })
        if not success then
            logError(locale('shop_create_failed', { shop = name, error = tostring(err) }))
            return
        end
    end

    success, err = pcall(exports['rsg-inventory'].OpenShop, exports['rsg-inventory'], src, name)
    if not success then
        logError(locale('shop_open_failed', { shop = name, player = Player.PlayerData.citizenid, error = tostring(err) }))
    end
end)
