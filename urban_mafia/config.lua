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
  ['torso_1'] = 153, ['torso_2'] = 1,
  ['arms'] = 20, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 28, ['pants_2'] = 0,
  ['shoes_1'] = 42, ['shoes_2'] = 1,
  ['chain_1'] = 0, ['chain_2'] = 0,
  ['helmet_1'] = 116, ['helmet_2'] = 4,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0
		},
		female = {
            ['tshirt_1'] = 4, ['tshirt_2'] = 1,
            ['torso_1'] =240,  ['torso_2'] =13,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 31,
            ['pants_1'] = 54,  ['pants_2'] = 2,
            ['chain_1'] = 0,  ['chain_2'] = 0
		}
	},
  seragam_mafia = {
		male = {
			['tshirt_1'] = 74, ['tshirt_2'] = 3,
  ['torso_1'] = 76, ['torso_2'] = 1,
  ['arms'] = 20, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 28, ['pants_2'] = 0,
  ['shoes_1'] = 10, ['shoes_2'] = 0,
  ['chain_1'] = 0, ['chain_2'] = 0,
  ['helmet_1'] = 27, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0
			},
		female = {
			['glasses_1'] = 0,	['glasses_2'] = 0,
			['tshirt_1'] = 0,   ['tshirt_2'] = 0,
			['torso_1'] = 0,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 0,   ['pants_2'] = 0,
			['shoes_1'] = 0,   ['shoes_2'] = 0,
			['chain_1'] = 0,   ['chain_2'] = 0
		}	
	},
}


Config.mafiaStations = {

	mafia = {

		AuthorizedWeapons = {
			{ name = 'WEAPON_PISTOL50',       price = 10000000 },
			{ name = 'WEAPON_ASSAULTRIFLE',     price = 25500000 },
			{ name = 'WEAPON_SAWNOFFSHOTGUN',       price = 15000000 },
			{ name = 'WEAPON_MOLOTOV',     price = 1000000 },
			{ name = 'WEAPON_BAT',      price = 800000 },
		},
	  
		AuthorizedVehicles = {
	{ name = 'RUMPO3',  label = 'RUMPO3' },
		  { name = 'STAFFORD',       label = 'STAFFORD' },
		},
	  

		Cloakrooms = {
			vector3(-1527.67, 843.96, 181.59)
		},

		Armories = {
			vector3(-1522.34, 844, 181.59)
		},

		Vehicles = {
			{
				Spawner = vector3(-1520.21, 853.06, 181.59),
				SpawnPoints = {
					{ coords = vector3(-1520.23, 864.79, 181.69), heading = 339.54, radius = 6.0 }
				}
			}
		},

		VehicleDeleters = {
			      { x = -1526.94, y = 857.99, z = 180.62 },
		},

		BossActions = {
			vector3(-1493.46, 862.28, 181.59)
		}

	}

}
