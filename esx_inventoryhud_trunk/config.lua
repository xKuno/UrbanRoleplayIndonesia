local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["-"] = 84,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

Config = {}

Config.CheckOwnership = false -- If true, Only owner of vehicle can store items in trunk.
Config.AllowPolice = true -- If true, police will be able to search players' trunks.

Config.Locale = "en"

Config.OpenKey = Keys["U"]

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 25000

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 250

Config.localWeight = {
   --- FOOD ---
    bread = 250,
    chocolate = 500,
    cocacola = 500,
    croquettes = 250,
    cupcake = 250,
    hamburger = 250,
    protein_shake = 500,
    sandwich = 250,
    sportlunch = 250,
    --- FOOD ---
	
    --- DRINKS ---
    water = 500,
    coffe = 500,
    milk = 500,
    beer = 500,
    tequila = 500,
    vodka = 500,
    whisky = 500,
    wine = 500,
    icetea = 500,
    protein_shake = 500,
    --- DRINKS ---
    
    --- MEDS ---
    bandage = 100,
    medikit = 500,
    --- MEDS ---
    
    --- JOBS ---
    alive_chicken = 100,
    clothe = 100,
    copper = 100,
    diamond = 100,
    cutted_wood = 100,
    essence = 100,
    fabric = 100,
    gold = 100,
    iron = 100,
    packaged_chicken = 100,
    packaged_plank = 100,
    petrol = 100,
    petrol_raffin = 100,
    slaughtered_chicken = 100,
    stone = 100,
    washed_stone = 250,
    wood = 100,
    wool = 100,
    fish = 100,
    --- JOBS ---
    
    --- MISC ---
    bulletproof = 2500,
    lighter = 100,
    cigarett = 100,
    gazbottle = 1000,
    scratchoff = 1,
    scratchoff_used = 1,
    gym_membership = 1,
    oxygen_mask = 1000,
    --- MISC ---
    
    --- TOOLS ---
    blowpipe = 1000,
    carokit = 1000,
    carotool = 1000,
    drill = 1000,
    fixkit = 1000,
    fixtool = 1000,
    lockpick = 1000,
    repairkit = 1000,
    --- TOOLS ---
    
	--- CHIP ---
	jeton = 0,
	chip = 0,
    ---WEAPONS----
    clip = 1000,
    WEAPON_GRENADE = 20000,
    WEAPON_BZGAS = 20000,
    WEAPON_SMOKEGRENADE = 20000,
    WEAPON_RAILGUN = 20000,
    WEAPON_STICKYBOMB = 20000,
    WEAPON_KNIFE = 20000,
    WEAPON_NIGHTSTICK = 20000,
    WEAPON_HAMMER = 20000,
    WEAPON_BAT = 20000,
    WEAPON_GOLFCLUB = 20000,
    WEAPON_CROWBAR = 20000,
    WEAPON_PETROLCAN = 20000,
    WEAPON_FIREEXTINGUISHER = 20000,
    WEAPON_BALL = 20000,
    WEAPON_DAGGER = 20000,
    WEAPON_SWEAPON_SNOWBALLTUNGUN = 20000,
    WEAPON_GARBAGEBAG = 20000,
    WEAPON_HANDCUFFS = 20000,
    WEAPON_KNUCKLE = 20000,
    WEAPON_HATCHET = 20000,
    WEAPON_MACHETE = 20000,
    WEAPON_SWITCHBLADE = 20000,
    WEAPON_BATTLEAXE = 20000,
    WEAPON_POOLCUE = 20000,
    WEAPON_FLASHLIGHT = 20000,
    WEAPON_FLAREGUN = 20000,
    WEAPON_PISTOL = 8000,
    WEAPON_COMBATPISTOL = 13000,
    WEAPON_APPISTOL = 20000,
    WEAPON_PISTOL50 = 10000,
    WEAPON_COMBATPDW = 20000,
    WEAPON_MARKSMANPISTOL = 20000,
    WEAPON_SNSPISTOL = 20000,
    WEAPON_HEAVYPISTOL = 20000,
    WEAPON_REVOLVER = 50000,
    WEAPON_VINTAGEPISTOL = 20000,
    WEAPON_STUNGUN = 20000,
    WEAPON_FIREWORK = 40000,
    WEAPON_MINISMG = 20000,
    WEAPON_SMG = 20000,
    WEAPON_MICROSMG = 20000,
    WEAPON_ASSAULTSMG = 20000,
    WEAPON_PUMPSHOTGUN = 20000,
    WEAPON_AUTOSHOTGUN = 20000,
    WEAPON_DBSHOTGUN = 20000,
    WEAPON_ASSAULTSHOTGUN = 20000,
    WEAPON_SAWNOFFSHOTGUN = 20000,
    WEAPON_HEAVYSHOTGUN = 20000,
    WEAPON_MUSKET = 20000,
    WEAPON_COMPACTRIFLE = 25000,
    WEAPON_MARKSMANRIFLE = 25000,
    WEAPON_SPECIALCARBINE = 25000,
    WEAPON_ADVANCEDRIFLE = 25000,
    WEAPON_CARBINERIFLE = 25000,
    WEAPON_ASSAULTRIFLE = 25000,
    WEAPON_BALL = 20000,
    WEAPON_MG = 20000,
    WEAPON_COMBATMG = 20000,
    WEAPON_BULLPUPRIFLE = 25000,
    WEAPON_BULLPUPSHOTGUN = 20000,
    WEAPON_HEAVYSNIPER = 300000,
    WEAPON_SNIPERRIFLE = 300000,
    WEAPON_FLARE = 20000,
    ---WEAPONS----
    
    --- ILEGALS ---
    coke = 250,
    coke_pooch = 500,
    meth = 250,
    meth_pooch = 500,
    opium = 250,
    opium_pooch = 500,
    weed = 250,
    weed_pooch = 500,
}

Config.VehicleLimit = {
    [0] = 30000, --Compact
    [1] = 40000, --Sedan
    [2] = 70000, --SUV
    [3] = 25000, --Coupes
    [4] = 30000, --Muscle
    [5] = 10000, --Sports Classics
    [6] = 5000, --Sports
    [7] = 5000, --Super
    [8] = 5000, --Motorcycles
    [9] = 180000, --Off-road
    [10] = 300000, --Industrial
    [11] = 70000, --Utility
    [12] = 100000, --Vans
    [13] = 0, --Cycles
    [14] = 300000, --Boats
    [15] = 20000, --Helicopters
    [16] = 0, --Planes
    [17] = 40000, --Service
    [18] = 40000, --Emergency
    [19] = 500000, --Military
    [20] = 300000, --Commercial
    [21] = 0 --Trains
}

Config.VehiclePlate = {
    taxi = "TAXI",
    cop = "LSPD",
    ambulance = "EMS0",
    mecano = "MECA"
}
