Config = {}

Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 1.5, y = 1.5, z = 1.0}
Config.MarkerColor  = {r = 102, g = 102, b = 204}
Config.MarkerType   = 1
Config.Locale = "en"

Config.NewESX = false -- true for esx v1.2 and above

Config.rentPrice = 20000
Config.rentTimer = 24 -- Time in hours, time between payments.
Config.autoRemoveLocker = 7 * Config.rentTimer -- This will remove the room after 7 missed payments.

Config.Lockers = {
    locker1 = {
        coords = vector3(1734.72, 3329.46, 40.22),
        name = "URI Locker SS"
    },
    locker2 = {
        coords = vector3(94.14, 6355.49, 30.38),
        name = "URI Locker Paleto"
    }
}

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Weight = 250000

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 10

Config.localWeight = {
  --- FOOD ---
    jeton = 0,
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
    alive_chicken = 50,
    clothe = 50,
    copper = 50,
    diamond = 50,
    cutted_wood = 50,
    essence = 50,
    fabric = 50,
    gold = 50,
    iron = 50,
    packaged_chicken = 50,
    packaged_plank = 50,
    petrol = 50,
    petrol_raffin = 50,
    slaughtered_chicken = 50,
    stone = 100,
    washed_stone = 50,
    wood = 50,
    wool = 50,
    fish = 50,
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
    
    ---WEAPONS----
    clip = 1000,
    WEAPON_GRENADE = 2000,
    WEAPON_BZGAS = 2000,
    WEAPON_SMOKEGRENADE = 2000,
    WEAPON_RAILGUN = 2000,
    WEAPON_STICKYBOMB = 2000,
    WEAPON_KNIFE = 2000,
    WEAPON_NIGHTSTICK = 2000,
    WEAPON_HAMMER = 2000,
    WEAPON_BAT = 2000,
    WEAPON_GOLFCLUB = 2000,
    WEAPON_CROWBAR = 2000,
    WEAPON_PETROLCAN = 2000,
    WEAPON_FIREEXTINGUISHER = 2000,
    WEAPON_BALL = 2000,
    WEAPON_DAGGER = 2000,
    WEAPON_SWEAPON_SNOWBALLTUNGUN = 2000,
    WEAPON_GARBAGEBAG = 2000,
    WEAPON_HANDCUFFS = 2000,
    WEAPON_KNUCKLE = 2000,
    WEAPON_HATCHET = 2000,
    WEAPON_MACHETE = 2000,
    WEAPON_SWITCHBLADE = 2000,
    WEAPON_BATTLEAXE = 2000,
    WEAPON_POOLCUE = 2000,
    WEAPON_FLASHLIGHT = 2000,
    WEAPON_FLAREGUN = 2000,
    WEAPON_PISTOL = 2000,
    WEAPON_COMBATPISTOL = 2000,
    WEAPON_APPISTOL = 2000,
    WEAPON_PISTOL50 = 2000,
    WEAPON_COMBATPDW = 2000,
    WEAPON_MARKSMANPISTOL = 2000,
    WEAPON_SNSPISTOL = 2000,
    WEAPON_HEAVYPISTOL = 2000,
    WEAPON_REVOLVER = 2000,
    WEAPON_VINTAGEPISTOL = 2000,
    WEAPON_STUNGUN = 2000,
    WEAPON_FIREWORK = 40000,
    WEAPON_MINISMG = 2000,
    WEAPON_SMG = 2000,
    WEAPON_MICROSMG = 2000,
    WEAPON_ASSAULTSMG = 2000,
    WEAPON_PUMPSHOTGUN = 2000,
    WEAPON_AUTOSHOTGUN = 2000,
    WEAPON_DBSHOTGUN = 2000,
    WEAPON_ASSAULTSHOTGUN = 2000,
    WEAPON_SAWNOFFSHOTGUN = 2000,
    WEAPON_HEAVYSHOTGUN = 2000,
    WEAPON_MUSKET = 2000,
    WEAPON_COMPACTRIFLE = 2000,
    WEAPON_MARKSMANRIFLE = 2000,
    WEAPON_SPECIALCARBINE = 2000,
    WEAPON_ADVANCEDRIFLE = 2000,
    WEAPON_CARBINERIFLE = 2000,
    WEAPON_ASSAULTRIFLE = 2000,
    WEAPON_BALL = 2000,
    WEAPON_MG = 2000,
    WEAPON_COMBATMG = 2000,
    WEAPON_BULLPUPRIFLE = 25000,
    WEAPON_BULLPUPSHOTGUN = 2000,
    WEAPON_HEAVYSNIPER = 2000,
    WEAPON_SNIPERRIFLE = 2000,
    WEAPON_FLARE = 2000,
    ---WEAPONS----
    
    --- ILEGALS ---
    coke = 250,
    coke_pooch = 500,
    meth = 250,
    meth_pooch = 500,
    opium = 250,
    opium_pooch = 500,
    weed = 250,
    weed_pooch = 500
}