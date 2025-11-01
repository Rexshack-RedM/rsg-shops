Config = {}

---------------------------------
-- settings
---------------------------------
Config.Keybind = 'J' -- keybind prompt to open shop
Config.UseNPCs = true -- enable NPC spawning at shop locations
Config.NPCModel = 's_m_m_unibutchers_01' -- default NPC model for shops

---------------------------------
-- shop items

-- amount: default stock (remove to enable unlimited stock)
-- buyPrice: enables selling items to shop
-- maxStock: limits how much items players can sell to shop
-- minQuality: minimum quality that can be sold to shop (default 1)
-- restock: amount of items to be restocked per restock cycle

-- example: { name = 'bread', amount = 50, price = 0.10, buyPrice = 0.05, maxStock = 100, minQuality = 50, restock = 10 },
---------------------------------
Config.Products = {
    ['normal'] = {
        { name = 'bread', amount = 50, price = 0.10 },
        { name = 'water', amount = 50, price = 0.10 },
    },
    ['weapons'] = {
        { name = 'weapon_revolver_cattleman',            amount = 1, price = 50 },
        { name = 'weapon_revolver_doubleaction',         amount = 1, price = 127 },
        { name = 'weapon_revolver_doubleaction_gambler', amount = 1, price = 190 },
        { name = 'weapon_revolver_lemat',                amount = 1, price = 317 },
        { name = 'weapon_revolver_navy',                 amount = 1, price = 275 },
        { name = 'weapon_revolver_schofield',            amount = 1, price = 192 },
        { name = 'weapon_pistol_mauser',                 amount = 1, price = 600 },
        { name = 'weapon_pistol_semiauto',               amount = 1, price = 537 },
        { name = 'weapon_pistol_volcanic',               amount = 1, price = 270 },
        { name = 'weapon_rifle_boltaction',              amount = 1, price = 216 },
        { name = 'weapon_rifle_elephant',                amount = 1, price = 580 },
        { name = 'weapon_rifle_springfield',             amount = 1, price = 156 },
        { name = 'weapon_rifle_varmint',                 amount = 1, price = 72 },
        { name = 'weapon_repeater_carbine',              amount = 1, price = 90 },
        { name = 'weapon_repeater_evans',                amount = 1, price = 300 },
        { name = 'weapon_repeater_winchester',           amount = 1, price = 243 },
        { name = 'weapon_repeater_henry',                amount = 1, price = 348 },
        { name = 'weapon_sniperrifle_rollingblock',      amount = 1, price = 411 },
        { name = 'weapon_sniperrifle_carcano',           amount = 1, price = 456 },
        { name = 'ammo_box_revolver',                    amount = 10, price = 10 },
        { name = 'ammo_box_pistol',                      amount = 10, price = 10 },
        { name = 'ammo_box_rifle',                       amount = 10, price = 10 },
        { name = 'ammo_box_repeater',                    amount = 10, price = 10 },
        { name = 'ammo_box_shotgun',                     amount = 10, price = 10 },
        { name = 'ammo_box_rifle_elephant',              amount = 10, price = 10 },
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
        shopcoords = vec3(1329.80, -1294.37, 77.02),
        npccoords = vec4(1329.80, -1294.37, 77.02, 60.72),
        npcmodel = 'u_m_m_rhdgenstoreowner_01',
        scenario = 'WORLD_HUMAN_WRITE_NOTEBOOK',
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Valentine General Store',
        name = 'gen-valentine',
        products = 'normal',
        shopcoords = vec3(-324.14, 803.51, 117.88),
        npccoords = vec4(-324.14, 803.51, 117.88, 280.98),
        npcmodel = 'u_m_m_valgenstoreowner_01',
        scenario = 'WORLD_HUMAN_WRITE_NOTEBOOK',
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Strawberry General Store',
        name = 'gen-strawberry',
        products = 'normal',
        shopcoords = vector3(-1789.78, -388.15, 160.33),
        npccoords = vec4(-1789.78, -388.15, 160.33, 65.43),
        npcmodel = 'u_m_m_strgenstoreowner_01',
        scenario = 'WORLD_HUMAN_WRITE_NOTEBOOK',
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Annesburg General Store',
        name = 'gen-annesburg',
        products = 'normal',
        shopcoords = vec3(2930.97, 1365.38, 45.20),
        npccoords = vec4(2930.97, 1365.38, 45.20, 252.02),
        npcmodel = 'u_m_m_rhdgenstoreowner_02',
        scenario = 'WORLD_HUMAN_WRITE_NOTEBOOK',
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Saint Denis General Store',
        name = 'gen-stdenis',
        products = 'normal',
        shopcoords = vec3(2859.36, -1202.19, 49.59),
        npccoords = vec4(2859.36, -1202.19, 49.59, 14.85),
        npcmodel = 'u_m_m_nbxgeneralstoreowner_01',
        scenario = 'WORLD_HUMAN_WRITE_NOTEBOOK',
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Tumbleweed General Store',
        name = 'gen-tumbleweed',
        products = 'normal',
        shopcoords = vec3(-5486.04, -2937.99, -0.40),
        npccoords = vec4(-5486.04, -2937.99, -0.40, 131.21),
        npcmodel = 's_m_m_unibutchers_01',
        scenario = 'WORLD_HUMAN_WRITE_NOTEBOOK',
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Armadillo General Store',
        name = 'gen-armadillo',
        products = 'normal',
        shopcoords = vec3(-3687.35, -2623.34, -13.43),
        npccoords = vec4(-3687.35, -2623.34, -13.43, 276.71),
        npcmodel = 'u_m_m_armgeneralstoreowner_01',
        scenario = 'WORLD_HUMAN_WRITE_NOTEBOOK',
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Blackwater General Store',
        name = 'gen-blackwater',
        products = 'normal',
        shopcoords = vec3(-784.77, -1322.15, 43.88),
        npccoords = vec4(-784.77, -1322.15, 43.88, 194.64),
        npcmodel = 'u_m_o_blwgeneralstoreowner_01',
        scenario = 'WORLD_HUMAN_WRITE_NOTEBOOK',
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Van Horn General Store',
        name = 'gen-vanhorn',
        products = 'normal',
        shopcoords = vector3(3025.60, 562.29, 44.72),
        npccoords = vec4(3025.60, 562.29, 44.72, 262.32),
        npcmodel = 's_m_m_unibutchers_01',
        scenario = 'WORLD_HUMAN_WRITE_NOTEBOOK',
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    ---------------------------------
    -- gunsmith
    ---------------------------------
    {
        label = 'Valentine Gunsmith',
        name = 'wep-valentine',
        products = 'weapons',
        shopcoords = vector3(-281.17, 778.94, 119.50),
        npccoords = vec4(-281.17, 778.94, 119.50, 0.59),
        npcmodel = 'u_m_m_valgunsmith_01',
        scenario = 'WORLD_HUMAN_WRITE_NOTEBOOK',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Tumbleweed Gunsmith',
        name = 'wep-tumbleweed',
        products = 'weapons',
        shopcoords = vec3(-5506.41, -2963.95, -0.64),
        npccoords = vec4(-5506.41, -2963.95, -0.64, 110.02),
        npcmodel = 'u_m_m_tumgunsmith_01',
        scenario = 'WORLD_HUMAN_WRITE_NOTEBOOK',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Saint Denis Gunsmith',
        name = 'wep-stdenis',
        products = 'weapons',
        shopcoords = vec3(2717.14, -1286.90, 49.64),
        npccoords = vec4(2717.14, -1286.90, 49.64, 29.91),
        npcmodel = 'u_m_m_nbxgunsmith_01',
        scenario = 'WORLD_HUMAN_WRITE_NOTEBOOK',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Rhodes Gunsmith',
        name = 'wep-rhodes',
        products = 'weapons',
        shopcoords = vec3(1322.31, -1323.02, 77.89),
        npccoords = vec4(1322.31, -1323.02, 77.89, 354.88),
        npcmodel = 'u_m_m_rhdgunsmith_01',
        scenario = 'WORLD_HUMAN_WRITE_NOTEBOOK',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Annesburg Gunsmith',
        name = 'wep-annesburg',
        products = 'weapons',
        shopcoords = vector3(2948.42, 1319.44, 44.82),
        npccoords = vec4(2948.42, 1319.44, 44.82, 79.11),
        npcmodel = 'u_m_m_asbgunsmith_01',
        scenario = 'WORLD_HUMAN_WRITE_NOTEBOOK',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },

}
