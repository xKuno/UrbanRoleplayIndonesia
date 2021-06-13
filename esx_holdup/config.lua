Config = {}
Config.Locale = 'en'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 5
Config.TimerBeforeNewRob    = 2800 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.lastRobbing = 0

Config.MaxDistance    = 2   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

Config.CooldownCheckOnAllShops = 1 -- If ON (1) Cant rob a shop before cooldown timer if roobery was happend in someother shop

Stores = {
	-- WARUNG
	["paleto_twentyfourseven"] = {
		position = { x = 1736.32, y = 6419.47, z = 35.03 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Paleto Bay)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["sandyshores_twentyfoursever"] = {
		position = { x = 1961.24, y = 3749.46, z = 32.34 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Sandy Shores)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["littleseoul_twentyfourseven"] = {
		position = { x = -709.17, y = -904.21, z = 19.21 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Little Seoul)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["bar_one"] = {
		position = { x = 1990.57, y = 3044.95, z = 47.21 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Sandy Shores)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["ocean_liquor"] = {
		position = { x = -2959.33, y = 388.21, z = 14.00 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Great Ocean Highway)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["rancho_liquor"] = {
		position = { x = 1126.80, y = -980.40, z = 45.41 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (El Rancho Blvd)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["sanandreas_liquor"] = {
		position = { x = -1219.85, y = -916.27, z = 11.32 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (San Andreas Avenue)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["grove_ltd"] = {
		position = { x = -43.40, y = -1749.20, z = 29.42 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Grove Street)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["mirror_ltd"] = {
		position = { x = 1160.67, y = -314.40, z = 69.20 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Mirror Park Boulevard)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["Downtown_Vinewood"] = {
		position = { x = 380.27, y = 332.14, z = 103.57 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Downtown Vinewood)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["Downtown_Vinewood"] = {
		position = { x = -3248.95, y = 1006.28, z = 12.83 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Chumas / Barbareno RD)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["Harmony_ltd"] = {
		position = { x = 544.4, y = 2663.54, z = 42.16 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Harmony)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["BanhamC_ltd"] = {
		position = { x = -3047.8, y = 587.88, z = 7.91 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Banham Canyon)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["DowntonVine_ltd"] = {
		position = { x = 379.95, y = 332.05, z = 103.57 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Downtown Vinewood)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["Morningwood_ltd"] = {
		position = { x = -1479.28, y = -375.05, z = 39.16 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Morningwood)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["NorthRockford_ltd"] = {
		position = { x = -1828.02, y = 799.82, z = 138.16 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (North Rockford)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["GrandSenoraD_ltd"] = {
		position = { x = 2674.5, y = 3288.06, z = 55.24 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Grand Senora Desert)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["Grapeseed_ltd"] = {
		position = { x = 1707.08, y = 4919.16, z = 42.06 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Grapeseed)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["STRAWBERRY_ltd"] = {
		position = { x = 29.93, y = -1340.09, z = 29.5 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Strawberry)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["WSandyShores_ltd"] = {
		position = { x = 1394.02, y = 3609.29, z = 34.98 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Sandy Shores)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["LagoZancudo_ltd"] = {
		position = { x = -2544.93, y = 2306.29, z = 33.41 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Lago Zancudo)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["WaPaleto_ltd"] = {
		position = { x = -168.1, y = 6318.38, z = 30.6 },
		reward = math.random(420000, 600000),
		nameOfStore = "Warung (Paleto)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},

	-- BANK
	["fleeca"] = {
		position = { x = 147.04908752441, y = -1044.9448242188, z = 29.36802482605 },
		reward = math.random(850000, 1100000),
		nameOfStore = "BANK RAKYAT",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["fleeca2"] = {
		position = { x = -2957.6674804688, y = 481.45776367188, z = 15.697026252747 },
		reward = math.random(750000, 900000),
		nameOfStore = "BANK NASIONAL",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	--[[
	["blainecounty"] = {
		position = { x = -107.06505584717, y = 6474.8012695313, z = 31.62670135498 },
		reward = math.random(350000, 600000),
		nameOfStore = "BANK DAERAH",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	]]--
	["PrincipalBank"] = {
		position = { x = 255.001098632813, y = 225.855895996094, z = 101.88 },
		reward = math.random(1100000, 1300000),
		nameOfStore = "BANK URBAN INDONESIA",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["RusunBank"] = {
		position = { x = 311.29, y = -283.2, z = 54.17 },
		reward = math.random(780000, 1000000),
		nameOfStore = "BANK RUSUN",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["BankElite"] = {
		position = { x = -354.09, y = -54.03, z = 49.05 },
		reward = math.random(650000, 1000000),
		nameOfStore = "BANK ELITE",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["BankKarnaval"] = {
		position = { x = -1211.6, y = -335.63, z = 37.78 },
		reward = math.random(650000, 1000000),
		nameOfStore = "BANK KARNAVAL",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
}
