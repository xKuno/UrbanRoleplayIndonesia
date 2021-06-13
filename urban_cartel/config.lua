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
  ['tshirt_1'] = 134, ['tshirt_2'] = 2,
  ['torso_1'] = 146, ['torso_2'] = 0,
  ['arms'] = 74, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 24, ['pants_2'] = 5,
  ['shoes_1'] = 57, ['shoes_2'] = 0,
  ['chain_1'] = 0, ['chain_2'] = 0,
  ['helmet_1'] = -1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
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
  seragam_cartel = {
		male = {
  ['tshirt_1'] = 25, ['tshirt_2'] = 4,
  ['torso_1'] = 25, ['torso_2'] = 7,
  ['arms'] = 79, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 24, ['pants_2'] = 5,
  ['shoes_1'] = 57, ['shoes_2'] = 0,
  ['chain_1'] = 0, ['chain_2'] = 0,
  ['helmet_1'] = -1, ['helmet_2'] = 0,
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

Config.cartelStations = {

	cartel = {

		AuthorizedWeapons = {
			{ name = 'WEAPON_PISTOL50',       price = 10000000 },
			{ name = 'WEAPON_ASSAULTRIFLE',     price = 25500000 },
			{ name = 'WEAPON_SAWNOFFSHOTGUN',       price = 15000000 },
			{ name = 'WEAPON_MOLOTOV',     price = 1000000 },
			{ name = 'WEAPON_BAT',      price = 800000 },
		},
	  
		AuthorizedVehicles = {
		  { name = 'contender',  label = 'CONTENDER' },
      { name = 'schlagen',   label = 'SCHLAGEN' },
		},
	  

		Cloakrooms = {
			vector3(-1887.35, 2070.3, 145.57),
		},

		Armories = {
			vector3(-1872.09, 2059.5, 140.98)
		},

		Vehicles = {
			{
				Spawner = vector3(-1897.9386962891, 2058.5171142578, 140.95155334473),
				SpawnPoints = {
					{ coords = vector3(-1903.679396972656, 2056.89929260254, 140.723291931152), heading = 169.94, radius = 6.0 }
				}
			}
		},

		VehicleDeleters = {
			{ x = -1922.97, y = 2036.38, z = 139.74 },
		},

		BossActions = {
			vector3(-1875.94, 2060.84, 145.57)
		}

	}

}
