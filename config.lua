Config = {}

---------------------------------
-- settings
---------------------------------
Config.Keybind = 'J' -- keybind prompt to open shop
---------------------------------
-- shop products
---------------------------------
Config.Products = {
     ['normal'] = {
        food = {
            { name = 'bread', amount = 50, price = 0.10 },
            { name = 'meat', amount = 20, price = 0.50 },
        },
        drinks = {
            { name = 'water', amount = 50, price = 0.10 },
            { name = 'whiskey', amount = 10, price = 2.0 },
        },
        others = {
            { name = 'bandage', amount = 10, price = 1.5 },
            { name = 'torch', amount = 5, price = 3.0 },
        }
    },
    ['weapons'] = {
        weapons = {
            { name = 'weapon_revolver_cattleman',  amount = 1, price = 50 },
            { name = 'weapon_revolver_doubleaction', amount = 1, price = 127 },
            { name = 'weapon_revolver_lemat', amount = 1, price = 317 },
            { name = 'weapon_revolver_navy', amount = 1, price = 275 },
            { name = 'weapon_pistol_mauser', amount = 1, price = 600 },
            { name = 'weapon_rifle_boltaction', amount = 1, price = 216 },
            { name = 'weapon_repeater_winchester', amount = 1, price = 243 },
            { name = 'weapon_sniperrifle_rollingblock', amount = 1, price = 411 },
        },
        ammo = {
            { name = 'ammo_box_revolver', amount = 10, price = 10 },
            { name = 'ammo_box_pistol', amount = 10, price = 10 },
            { name = 'ammo_box_rifle', amount = 10, price = 10 },
            { name = 'ammo_box_repeater', amount = 10, price = 10 },
            { name = 'ammo_box_shotgun', amount = 10, price = 10 },
        }
    },
    ['armoury'] = {
        { name = 'weapon_revolver_cattleman',  amount = 1, price = 0 },
        { name = 'weapon_repeater_winchester', amount = 1, price = 0 },
        { name = 'ammo_box_revolver',          amount = 10, price = 0 },
        { name = 'ammo_box_repeater',          amount = 10, price = 0 },
    },
    ['prison'] = {
        { name = 'bread', amount = 50, price = 0.10 },
        { name = 'water', amount = 50, price = 0.10 },
    },
    ['medic'] = {
        { name = 'bandage',  amount = 50, price = 0 },
        { name = 'firstaid', amount = 50, price = 0 }
    },
}

---------------------------------
-- shop locations and blips

-- persistentStock (true/false): enables stock to persist over server restart
---------------------------------
Config.StoreLocations = {
    ---------------------------------
    -- general store
    ---------------------------------
    {
        label = 'Rhodes General Store',
        name = 'gen-rhodes',
        products = 'normal',
        shopcoords = vector3(1328.99, -1293.28, 77.02 -0.8),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
        useHours = true,
        openHour = 9,
        closeHour = 21,
        priceMultiplier = 10, 
    },
    {
        label = 'Valentine General Store',
        name = 'gen-valentine',
        products = 'normal',
        shopcoords = vector3(-322.433, 803.797, 117.882 -0.8),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
        useHours = true,
        openHour = 8,
        closeHour = 22,
        priceMultiplier = 20, 
    },
    {
        label = 'Strawberry General Store',
        name = 'gen-strawberry',
        products = 'normal',
        shopcoords = vector3(-1791.49, -386.87, 160.33 -0.8),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
        useHours = true,
        openHour = 10,
        closeHour = 18,
        priceMultiplier = 1, --- for the same price 
    },
    {
        label = 'Annesburg General Store',
        name = 'gen-annesburg',
        products = 'normal',
        shopcoords = vector3(2931.35, 1365.94, 45.19 -0.8),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
        useHours = true,
        openHour = 9,
        closeHour = 20,
        priceMultiplier = 1, --- for the same price 
    },
    {
        label = 'Saint Denis General Store',
        name = 'gen-stdenis',
        products = 'normal',
        shopcoords = vector3(2859.81, -1200.37, 49.59 -0.8),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
        useHours = true,
        openHour = 7,
        closeHour = 23,
        priceMultiplier = 1, --- for the same price 
    },
    {
        label = 'Tumbleweed General Store',
        name = 'gen-tumbleweed',
        products = 'normal',
        shopcoords = vector3(-5487.613, -2938.54, -0.38 -0.8),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
        useHours = true,
        openHour = 8,
        closeHour = 22,
        priceMultiplier = 1, --- for the same price 
    },
    {
        label = 'Armadillo General Store',
        name = 'gen-armadillo',
        products = 'normal',
        shopcoords = vector3(-3685.56, -2622.59, -13.43 -0.8),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
        useHours = true,
        openHour = 10,
        closeHour = 20,
        priceMultiplier = 1, --- for the same price 
    },
    {
        label = 'Blackwater General Store',
        name = 'gen-blackwater',
        products = 'normal',
        shopcoords = vector3(-785.18, -1323.83, 43.88 -0.8),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
        useHours = true,
        openHour = 9,
        closeHour = 21,
        priceMultiplier = 1, --- for the same price 
    },
    {
        label = 'Van Horn General Store',
        name = 'gen-vanhorn',
        products = 'normal',
        shopcoords = vector3(3027.03, 561.00, 44.72 -0.8),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = true,
        useHours = false, -- 24/7 outlaw town
        priceMultiplier = 1,
    },

    ---------------------------------
    -- gunsmith
    ---------------------------------
    {
    label = 'Valentine Gunsmith',
    name = 'wep-valentine',
    products = 'weapons',
    shopcoords = vector3(-281.24, 780.71, 119.53),
    blipsprite = 'blip_shop_gunsmith',
    blipscale = 0.2,
    showblip = true,
    persistentStock = false,
    useHours = true,
    openHour = 10,
    closeHour = 20,
    priceMultiplier = 5,  
},
{
    label = 'Tumbleweed Gunsmith',
    name = 'wep-tumbleweed',
    products = 'weapons',
    shopcoords = vector3(-5508.18, -2964.27, -0.63),
    blipsprite = 'blip_shop_gunsmith',
    blipscale = 0.2,
    showblip = true,
    persistentStock = false,
    useHours = true,
    openHour = 9,
    closeHour = 19,
    priceMultiplier = 2,  
},
{
    label = 'Saint Denis Gunsmith',
    name = 'wep-stdenis',
    products = 'weapons',
    shopcoords = vector3(2716.42, -1285.42, 49.63),
    blipsprite = 'blip_shop_gunsmith',
    blipscale = 0.2,
    showblip = true,
    persistentStock = false,
    useHours = true,
    openHour = 8,
    closeHour = 22,
    priceMultiplier = 3,  
},
{
    label = 'Rhodes Gunsmith',
    name = 'wep-rhodes',
    products = 'weapons',
    shopcoords = vector3(1322.75, -1321.47, 77.89),
    blipsprite = 'blip_shop_gunsmith',
    blipscale = 0.2,
    showblip = true,
    persistentStock = false,
    useHours = true,
    openHour = 10,
    closeHour = 20,
    priceMultiplier = 1,  
},
{
    label = 'Annesburg Gunsmith',
    name = 'wep-annesburg',
    products = 'weapons',
    shopcoords = vector3(2946.50, 1319.53, 44.82),
    blipsprite = 'blip_shop_gunsmith',
    blipscale = 0.2,
    showblip = true,
    persistentStock = false,
    useHours = true,
    openHour = 9,
    closeHour = 19,
    priceMultiplier = 4,  
},
}
