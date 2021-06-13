Config                            = {}
Config.DrawDistance               = 100.0
Config.NPCJobEarnings             = {min = 15, max = 40}

Config.MaxInService               = 2
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.Locale = 'en'

Config.AuthorizedVehicles = {

	{
		model = 'taco',
		label = 'Mobil pedagang'
	}

}

Config.Zones = {

	VehicleSpawner = {
		Pos   = {x = -1831.64, y = -1170.49, z = 13.02},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 255, g = 255, b = 255},
		Type  = 36, Rotate = true
	},

	VehicleSpawnPoint = {
		Pos     = {x = -1830.39, y = -1165.71, z = 13.02},
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Type    = -1, Rotate = false,
		Heading = 242.63
	},

	VehicleDeleter = {
		Pos   = {x = -1840.78, y = -1171.51, z = 12.02},
		Size  = {x = 3.0, y = 3.0, z = 0.55},
			Color = {r = 255, g = 0, b = 0},
		Type  = 1, Rotate = false
	},

	pedagangActions = {
		Pos   = {x = -1830.73, y = -1197.59, z = 19.42},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 255, g = 255, b = 255},
		Type  = 22, Rotate = true
	},

	Cloakroom = {
		Pos     = {x = -1832.56, y = -1189.3, z = 19.42},
		Size    = {x = 1.0, y = 1.0, z = 1.0},
			Color = {r = 255, g = 255, b = 255},
		Type    = 21, Rotate = true
	}

}

Config.JobLocations = {

}
