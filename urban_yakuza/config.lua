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
['tshirt_1'] = 15, ['tshirt_2'] = 0,
            ['torso_1'] = 107,    ['torso_2'] = 2,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 33,
            ['pants_1'] = 24,   ['pants_2'] = 0,
            ['shoes_1'] = 36,   ['shoes_2'] = 3,
            ['helmet_1'] = 21,   ['helmet_2'] = 5,
            ['chain_1'] = 1,    ['chain_2'] = 0,
            ['bag_1'] = 0, ['bag_2'] = 0
		},
		female = {
			['tshirt_1'] = 9,   ['tshirt_2'] = 0,
            ['torso_1'] = 256,    ['torso_2'] = 21,
            ['decals_1'] = 1,   ['decals_2'] = 0,
            ['arms'] = 1,
            ['pants_1'] = 100,   ['pants_2'] = 21,
            ['chain_1'] = 3,    ['chain_2'] = 0
		}
	},
  seragam_yakuza = {
		male = {
			['tshirt_1'] = 67, ['tshirt_2'] = 5,
  ['torso_1'] = 31, ['torso_2'] = 1,
  ['arms'] = 6, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 24, ['pants_2'] = 1,
  ['shoes_1'] = 20, ['shoes_2'] = 5,
  ['chain_1'] = 0, ['chain_2'] = 0,
  ['helmet_1'] = 40, ['helmet_2'] = 2,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0
		},
		female = {
			['tshirt_1'] = 67,   ['tshirt_2'] = 3,
            ['torso_1'] = 34,   ['torso_2'] = 0,
            ['decals_1'] = 1,   ['decals_2'] = 0,
            ['arms'] = 1,
            ['pants_1'] = 54,   ['pants_2'] = 3,
            ['chain_1'] = 3,   ['chain_2'] = 3
		}	
	},
}

Config.yakuzaStations = {

	yakuza = {

		AuthorizedWeapons = {
			{ name = 'WEAPON_PISTOL50',       price = 10000000 },
			{ name = 'WEAPON_ASSAULTRIFLE',     price = 25500000 },
			{ name = 'WEAPON_SAWNOFFSHOTGUN',       price = 15000000 },
			{ name = 'WEAPON_MOLOTOV',     price = 1000000 },
			{ name = 'WEAPON_BAT',      price = 800000 },
		},
	  
		AuthorizedVehicles = {
		  { name = 'mesa3',  label = 'MESA3' },
      { name = 'bf400',   label = 'BF400' },
		},
	  

		Cloakrooms = {
					vector3(-867.65, -1458.14, 7.53),
		},

		Armories = {
			vector3(-900.88, -1445.67, 7.53)
		},

		Vehicles = {
			{
					Spawner = vector3(-957.3586962891, -1471.3771142578, 6.85155334473),
				SpawnPoints = {
					{ coords = vector3(-966.769396972656, -1473.92929260254, 5.023291931152), heading = 111.05, radius = 6.0 }
				}
			}
		},

		VehicleDeleters = {
			{ x = -965.42, y = -1493.59, z = 4.01 },
		},

		BossActions = {
			vector3(-881.78, -1460.88, 7.54)
		}

	}

}
