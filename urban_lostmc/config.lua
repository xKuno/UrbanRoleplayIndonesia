Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = false -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'id'

Config.Uniforms = {
	seragam_rampok = {
		male = {
			   ['tshirt_1'] = 75,  ['tshirt_2'] = 3,
            ['torso_1'] = 161,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 55,
            ['pants_1'] = 3,   ['pants_2'] = 0,
            ['shoes_1'] = 54,   ['shoes_2'] = 0,
            ['chain_1'] = 1,  ['chain_2'] = 0,
			['helmet_1'] = 85, ['helmet_2'] = 6,
			['glasses_1'] = 9, ['glasses_2'] = 0,
			['bag_1'] = 0, ['bag_2'] = 0
		},
		female = {
			   ['tshirt_1'] = 97,   ['tshirt_2'] = 0,
            ['torso_1'] = 159,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 14,
            ['pants_1'] = 89,   ['pants_2'] = 16,
            ['shoes_1'] = 77,   ['shoes_2'] = 3,
            ['chain_1'] = 0,   ['chain_2'] = 0
		}
	},
  seragam_biker = {
		male = {
			     ['tshirt_1'] = 84,  ['tshirt_2'] = 9,
            ['torso_1'] = 173,   ['torso_2'] = 2,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 52,
            ['pants_1'] = 76,   ['pants_2'] = 2,
            ['shoes_1'] = 54,   ['shoes_2'] = 0,
            ['chain_1'] = 1, ['chain_2'] = 0,
			['helmet_1'] = 85, ['helmet_2'] = 6,
			['glasses_1'] = 5, ['glasses_2'] = 0,
			['bag_1'] = 0, ['bag_2'] = 0
		},
		female = {
			   ['tshirt_1'] = 70,   ['tshirt_2'] = 0,
            ['torso_1'] = 159,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 4,
            ['pants_1'] = 78,   ['pants_2'] = 2,
            ['shoes_1'] = 73,   ['shoes_2'] = 0,
            ['chain_1'] = 0,   ['chain_2'] = 0
		}	
	},
}

Config.bikerStations = {

	biker = {

		AuthorizedWeapons = {
			{ name = 'WEAPON_PISTOL50',       price = 10000000 },
			{ name = 'WEAPON_ASSAULTRIFLE',     price = 25500000 },
			{ name = 'WEAPON_SAWNOFFSHOTGUN',       price = 15000000 },
			{ name = 'WEAPON_MOLOTOV',     price = 1000000 },
			{ name = 'WEAPON_BAT',      price = 800000 },
		},
	  
		AuthorizedVehicles = {
			  { name = 'kamacho',  label = 'KAMACHO' },
			{ name = 'gargoyle',   label = 'GARGOYLE' },
		},
	  

		Cloakrooms = {
			vector3(886.29, -2109.17, 30.76),
		},

		Armories = {
			vector3(897.22, -2115.11, 30.76)
		},

		Vehicles = {
			{
				Spawner = vector3(878.39886962891, -2104.0271142578, 30.765155334473),
				SpawnPoints = {
					{ coords = vector3(883.659396972656, -2100.6429260254, 30.763291931152), heading = 257.27, radius = 6.0 }
				}
			}
		},

		VehicleDeleters = {
			{ x = 906.67, y = -2100.39, z = 29.78 },
		},

		BossActions = {
			vector3(884.34, -2107.04, 30.76)
		}

	}

}
