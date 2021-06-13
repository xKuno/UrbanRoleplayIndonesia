Config = {}
Config.Locale = 'en'
Config.IncludeCash = true -- Include cash in inventory?
Config.IncludeWeapons = true -- Include weapons in inventory?
Config.IncludeAccounts = true -- Include accounts (bank, black money, ...)?
Config.ExcludeAccountsList = {"bank"} -- List of accounts names to exclude from inventory
Config.OpenControl = 289 -- Key for opening inventory. Edit html/js/config.js to change key for closing it.

Config.LicensePrice = 1000000

-- List of item names that will close ui when used
Config.CloseUiItems = {"headbag", "fishingrod", "radio", "phone", "notepad", "kalkulator", "rose", "bandage"}

Config.discord = {
    webhook = "https://discord.com/api/webhooks/835074707626786827/d-zmm8ic2mw3H4lzS3HvG3eJi9kAEY8AB0VBuwEye-dGkvayBKsIUNUrsJCZg2AOdBHY",
    username = "WS - LOGS",
    title = "LOG INVENTORY",
    footer = "WS - LOGS"
}

-- Limit Inventory
Config.DefaultWeight    = 150
Config.userSpeed        = false
Config.WeightSqlBased   = false
Config.Limit            = 50000

Config.localWeight = {
    bread = 75, 
    water = 75,
    chip = 0,
    jeton = 0,
    bandage = 200,
    WEAPON_PISTOL = 1800,
    WEAPON_PISTOL50 = 2000,
    WEAPON_APPISTOL = 2050,
    WEAPON_REVOLVER = 2300,
    WEAPON_REVOLVER_MK2 = 2300,
    WEAPON_SMG = 4100,
    WEAPON_MICROSMG = 3400,
    WEAPON_COMPACTSMG = 3100,
    WEAPON_MACHINEPISTOL = 2700,
    WEAPON_CARBINERIFLE = 5100,
    WEAPON_SPECIALCARBINE = 4900,
    WEAPON_ASSAULTRIFLE = 5300,
    WEAPON_HEAVYSNIPER = 6300,
    WEAPON_PUMPSHOTGUN = 3500,
    WEAPON_WEAPON_STUNGUN = 1500,
    WEAPON_ASSAULTSHOTGUN = 4500,
    WEAPON_FIREWORK = 40000,
    WEAPON_MOLOTOV = 500,
    WEAPON_FLARE = 800,
    WEAPON_HAMMER = 1500,
    WEAPON_POOLCUE = 1400,
    WEAPON_BAT = 1200,
    WEAPON_CROWBAR = 1800,
    WEAPON_GOLFCLUB = 1750,
}

Config.Shops = {
	Waroeng = {
		Items = {
	--    {name = 'teropong'},
     --       {name = 'chocolate'},
      --      {name = 'sandwich'},
      --      {name = 'hamburger'},
     --       {name = 'cupcake'},
	    {name = 'water'},
	    {name = 'bread'},
      --      {name = 'cocacola'},
       --     {name = 'icetea'},
      --      {name = 'radio'},
        --    {name = 'coffe'},
        --    {name = 'milk'},
            {name = 'cigarett'},
            {name = 'lighter'},
        --    {name = 'croquettes'},
        --    {name = 'protein_shake'},
        --    {name = 'rose'},
         --   {name = 'phone'},
        --    {name = 'nasi_bungkus'},
         --   {name = 'teh'},
         --   {name = 'siomay'},
            {name = 'fishbait'},
            {name = 'fishingrod'},
            {name = 'turtlebait'},
		--	{name = 'hifi'},
		--	{name = 'notepad'},
        },
		Locations = {
			{x = 373.875,   y = 325.896,  	z = 102.566},
            {x = 2557.458,  y = 382.282,  	z = 107.622},
            {x = -3038.939, y = 585.954,  	z = 6.908},
            {x = -3241.927, y = 1001.462, 	z = 11.830},
            {x = 547.431,   y = 2671.710, 	z = 41.156},
            {x = 1961.464,  y = 3740.672, 	z = 31.343},
            {x = 2678.916,  y = 3280.671, 	z = 54.241},
            {x = 1729.216,  y = 6414.131, 	z = 34.037},
            {x = 1135.808,  y = -982.281,  	z = 45.415},
            {x = -1222.915, y = -906.983,  	z = 11.326},
            {x = -1487.553, y = -379.107,  	z = 39.163},
            {x = -2968.243, y = 390.910,   	z = 14.043},
            {x = 1166.024,  y = 2708.930,  	z = 37.157},
            {x = 1392.562,  y = 3604.684,  	z = 33.980},
            {x = -48.519,   y = -1757.514, 	z = 28.421},
            {x = 1163.373,  y = -323.801,  	z = 68.205},
            {x = -707.501,  y = -914.260,  	z = 18.215},
            {x = -1820.523, y = 792.518,   	z = 137.118},
            {x = 26.17, 	y = -1347.33,   z = 28.5},
         --   {x = -2540.95,  y = 2314.05,  	z = 32.41},
            {x = 1698.388,  y = 4924.404,  	z = 41.063},
          --  {x = -160.33,  	y = 6322.71,  	z = 30.6},
        },
    },

    Kantin = {
    	Items = {
    		{name = 'bandage'},
    		{name = 'radio'},
    		{name = 'phone'},
			{name = 'bread'},
			{name = 'water'},
    	},
    	Locations = {
    		{x = -811.08, y = -1229.27, z = 7.34},
            {x = -752.26, y = -1318.01, z = 4.9},
          --   {x = -433.2, y =-341.63, z =34.91},
        },
    },
	
	Pedagang = {
    	Items = {
	    {name = 'teropong'},
            {name = 'chocolate'},
            {name = 'sandwich'},
            {name = 'hamburger'},
            {name = 'cupcake'},
	    {name = 'water'},
	    {name = 'bread'},
            {name = 'cocacola'},
            {name = 'icetea'},
            {name = 'radio'},
            {name = 'coffe'},
            {name = 'milk'},
            {name = 'pisangkeju'},
            {name = 'tehobeng'},
            {name = 'cigarett'},
            {name = 'lighter'},
            {name = 'croquettes'},
            {name = 'protein_shake'},
            {name = 'rose'},
            {name = 'phone'},
            {name = 'nasi_bungkus'},
            {name = 'teh'},
            {name = 'siomay'},
            {name = 'fishbait'},
            {name = 'fishingrod'},
            {name = 'turtlebait'},
			{name = 'hifi'},
			{name = 'notepad'},
    		{name = 'beer'},
    		{name = 'wine'},
    		{name = 'vodka'},
    		{name = 'kelapa'},
    		{name = 'tequila'},
			{name = 'sportlunch'},
    		{name = 'powerade'},
    		{name = 'whisky'},
    	},
    	Locations = {
    		{x = -1844.2, y = -1190.14, z = 14.31},
          --   {x = -433.2, y =-341.63, z =34.91},
        },
    },

    Bar = {
    	Items = {
    		{name = 'beer'},
    		{name = 'wine'},
    		{name = 'vodka'},
    		{name = 'tequila'},
            {name = 'cigarett'},
            {name = 'lighter'},
	--		{name = 'sportlunch'},
    --		{name = 'powerade'},
	--		{name = 'protein_shake'},
    		{name = 'whisky'},
    	},
    	Locations = {
    		{x = -450.42, y = 281.22,   z = 77.52},
           	{x = -1577.93, y = -3014.85,   z = -80.01},
           	{x = -1586.7, y = -3012.44,   z = -77.0},
        --    {x = -429.59, y = 268.26,   z = 82.02},
			{x = -1391.59, y = -608.68,   z = 29.32},
		--	{x = -635.93, y = 234.48,   z = 81.28},
         --   {x = 1420.48, y = 3558.65,   z = 35.71},
		    {x = 963.12, y = 23.56,   z = 76.99},
        },
    },



    WeaponShop = {
    	Items = {},
    	Weapons = {
            {name = "WEAPON_PISTOL", ammo = 250},
            {name = "WEAPON_FLASHLIGHT", ammo = 250},
            {name = "WEAPON_MACHETE", ammo = 250},
            {name = "WEAPON_STUNGUN", ammo = 250},
            {name = "WEAPON_KNIFE", ammo = 250},
            {name = "WEAPON_MUSKET", ammo = 250},
            {name = "WEAPON_MINISMG", ammo = 250},
			{ name = "GADGET_PARACHUTE", ammo = 0 },
			{name = "WEAPON_BAT", ammo = 250},
            {name = "WEAPON_FIREEXTINGUISHER", ammo = 250},
        },
        Ammo = {
            {name = "9mm_rounds", weaponhash = "WEAPON_PISTOL", ammo = 250},
            {name = "shotgun_shells", weaponhash = "WEAPON_PUMPSHOTGUN", ammo = 250}
        },
    	Locations = {
            { x = -662.180, y = -934.961, z = 20.829 },
            { x = 810.25, y = -2157.60, z = 28.62 },
            { x = 1693.44, y = 3760.16, z = 33.71 },
            { x = -330.24, y = 6083.88, z = 30.45 },
            { x = 252.63, y = -50.00, z = 68.94 },
            { x = 22.09, y = -1107.28, z = 28.80 },
            -- { x = 2567.69, y = 294.38, z = 107.73 },
            { x = -1117.58, y = 2698.61, z = 17.55 },
            { x = 842.44, y = -1033.42, z = 27.19 },
        },
    },

    WeaponShop2 = {
    	Items = {},
    	Weapons = {
           {name = "WEAPON_PISTOL50", ammo = 250},
            {name = "WEAPON_FLASHLIGHT", ammo = 250},
            {name = "WEAPON_MACHETE", ammo = 250},
        --    {name = "WEAPON_REVOLVER_MK2", ammo = 250},
           {name = "WEAPON_ASSAULTRIFLE", ammo = 250},
           {name = "WEAPON_COMPACTRIFLE", ammo = 250},
           {name = "WEAPON_HEAVYSNIPER", ammo = 250},
        {name = "WEAPON_MACHINEPISTOL", ammo = 250},
            {name = "GADGET_PARACHUTE", ammo = 0},
        },
        Ammo = {
            {name = "9mm_rounds", weaponhash = "WEAPON_PISTOL", ammo = 250},
            {name = "shotgun_shells", weaponhash = "WEAPON_PUMPSHOTGUN", ammo = 250}
        },
    	Locations = {
            { x = 2567.69, y = 294.38, z = 107.73 },
        },
    },
	
	
	PoliceShop = {
    	Items = {},
    	Weapons = {
			{ name = "WEAPON_NIGHTSTICK", ammo = 250 },
			{ name = "WEAPON_APPISTOL", ammo = 250 },
			{ name = "WEAPON_PISTOL", ammo = 250 },
			{ name = "WEAPON_COMBATPISTOL", ammo = 250 },			
			{ name = "WEAPON_REVOLVER", ammo = 250 },
			{ name = "WEAPON_FLASHLIGHT", ammo = 250 },
			{ name = "WEAPON_HEAVYPISTOL", ammo = 250 },
			{ name = "WEAPON_SMG", ammo = 250 },
			{ name = "WEAPON_BULLPUPRIFLE", ammo = 250 },
			{ name = "WEAPON_ADVANCEDRIFLE", ammo = 250 },
		--	{ name = "WEAPON_DOUBLEACTION", ammo = 250 },
			{ name = "WEAPON_SPECIALCARBINE", ammo = 250 },
		--	{ name = "WEAPON_CARBINERIFLE", ammo = 250 },
			{ name = "WEAPON_PUMPSHOTGUN", ammo = 250 },
			{ name = "WEAPON_STUNGUN", ammo = 250 },
			{ name = "GADGET_PARACHUTE", ammo = 0 },
			{ name = "WEAPON_HEAVYSNIPER", ammo = 250 },

        },
        Ammo = {
            {name = "9mm_rounds", weaponhash = "WEAPON_PISTOL", ammo = 250},
            {name = "shotgun_shells", weaponhash = "WEAPON_PUMPSHOTGUN", ammo = 250}
        },
    	Locations = {
            { x = 452.03, y = -973.2, z = 30.69 },
        },
    },
}