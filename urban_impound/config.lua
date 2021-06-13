Config 					= {}

Config.Impound 			= {
	Name = "MissionRow",
	RetrieveLocation = { X = 472.28, Y = -1114.72, Z = 29.4 },
	StoreLocation = { X = 486.33, Y = -1082.64, Z = 29.2 },
	SpawnLocations = {
		{ x = 471.54, y = -1106.14, z = 29.2 , h = 266.15 },
		{ x = 471.54, y = -1109.42, z = 29.2 , h = 266.15 },
		{ x = 485.5, y = -1102.04, z = 29.2 , h = 87.47 },
		{ x = 485.5, y = -1105.95, z = 29.2 , h = 87.47 },
		{ x = 485.5, y = -1109.06, z = 29.2 , h = 87.47 },
	},
	AdminTerminalLocations = {
		{ x = 472.18, y = -1078.19, z = 29.35 }
	}
}

Config.Rules = {
	maxWeeks		= 5,
	maxDays			= 6,
	maxHours		= 24,

	minFee			= 50,
	maxFee 			= 1000000,

	minReasonLength	= 10,
}

--------------------------------------------------------------------------------
----------------------- SERVERS WITHOUT ESX_MIGRATE ----------------------------
---------------- This could work, it also could not work... --------------------
--------------------------------------------------------------------------------
-- Should be true if you still have an owned_vehicles table without plate column.
Config.NoPlateColumn = true
-- Only change when NoPlateColumn is true, menu's will take longer to show but otherwise you might not have any data.
-- Try increments of 250
Config.WaitTime = 250
