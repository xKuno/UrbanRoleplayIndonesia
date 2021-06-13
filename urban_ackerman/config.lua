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
['tshirt_1'] = 5, ['tshirt_2'] = 0,
  ['torso_1'] = 230, ['torso_2'] = 8,
  ['arms'] = 20, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 28, ['pants_2'] = 0,
  ['shoes_1'] = 57, ['shoes_2'] = 0,
  ['chain_1'] = 0, ['chain_2'] = 0,
  ['helmet_1'] = 116, ['helmet_2'] = 24,
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
  seragam_ackerman = {
		male = {
['tshirt_1'] = 15, ['tshirt_2'] = 0,
  ['torso_1'] = 217, ['torso_2'] = 14,
  ['arms'] = 20, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 19, ['pants_2'] = 0,
  ['shoes_1'] = 51, ['shoes_2'] = 0,
  ['chain_1'] = 0, ['chain_2'] = 0,
  ['helmet_1'] = 116, ['helmet_2'] = 24,
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

Config.ackermanStations = {

	ackerman = {

		AuthorizedWeapons = {
			{ name = 'WEAPON_PISTOL50',       price = 10000000 },
			{ name = 'WEAPON_ASSAULTRIFLE',     price = 25500000 },
			{ name = 'WEAPON_SAWNOFFSHOTGUN',       price = 15000000 },
			{ name = 'WEAPON_MOLOTOV',     price = 1000000 },
			{ name = 'WEAPON_BAT',      price = 800000 },
		},
	  
		AuthorizedVehicles = {
		  { name = 'enduro',  label = 'ENDURO' },
      { name = 'guardian',   label = 'GUARDIAN' },
		},
	  

		Cloakrooms = {
			vector3(-1182.12, 297.55, 73.65),
		},

		Armories = {
			vector3(-1205.12, 294.97, 69.72)
		},

		Vehicles = {
			{
				Spawner = vector3(-1182.3886962891, 291.5871142578, 69.55155334473),
				SpawnPoints = {
					{ coords = vector3(-1184.889396972656, 287.58929260254, 69.53291931152), heading = 202.28, radius = 6.0 }
				}
			}
		},

		VehicleDeleters = {
			{ x = -1203.24, y = 268.33, z = 68.55 },
		},

		BossActions = {
			vector3(-1177.44, 304.73, 73.66)
		}

	}

}
