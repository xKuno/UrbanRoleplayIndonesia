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
            ['tshirt_1'] = 34,   ['tshirt_2'] = 0,
            ['torso_1'] = 215,    ['torso_2'] = 5,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 75,
            ['pants_1'] = 28, ['pants_2'] = 14,
			['shoes_1'] = 48, ['shoes_2'] = 14,
            ['chain_1'] = 0,   ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 41,   ['tshirt_2'] = 14,
			['torso_1'] = 219,    ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 32,
			['pants_1'] = 27,   ['pants_2'] = 3,
			['shoes_1'] = 49,    ['shoes_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0
		}
	},
  seragam_kompatriot = {
		male = {
            ['tshirt_1'] = 34,   ['tshirt_2'] = 0,
            ['torso_1'] = 253,    ['torso_2'] = 20,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] =75,
            ['pants_1'] = 28, ['pants_2'] = 14,
			['shoes_1'] = 48, ['shoes_2'] = 0,
            ['chain_1'] = 0,   ['chain_2'] = 0
		},
		female = {
		['glasses_1'] = 0,	['glasses_2'] = 0,
			['tshirt_1'] = 6,   ['tshirt_2'] = 0,
			['torso_1'] = 215,   ['torso_2'] = 5,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 31,
			['pants_1'] = 27,   ['pants_2'] = 3,
			['shoes_1'] = 49,   ['shoes_2'] = 0,
			['chain_1'] = 0,   ['chain_2'] = 0
		}	
	},
}


Config.kompatriotStations = {

	kompatriot = {

		AuthorizedWeapons = {
			{ name = 'WEAPON_PISTOL50',       price = 10000000 },
			{ name = 'WEAPON_ASSAULTRIFLE',     price = 25500000 },
			{ name = 'WEAPON_SAWNOFFSHOTGUN',       price = 15000000 },
			{ name = 'WEAPON_MOLOTOV',     price = 1000000 },
			{ name = 'WEAPON_BAT',      price = 800000 },
		},
	  
		AuthorizedVehicles = {
		  { name = 'guardian',  label = 'GUARDIAN' },
      { name = 'sanchez',   label = 'SANCHEZ' },
		},
	  

		Cloakrooms = {
			vector3(1399.82, 1139.88, 114.34)
		},

		Armories = {
			vector3(1394.5, 1144.57, 114.34)
		},

		Vehicles = {
			{
				Spawner = vector3(1397.17, 1114.31, 114.84),
				SpawnPoints = {
					{ coords = vector3(1396.18, 1118.14, 114.84), heading = 87.34, radius = 1.0 }
				}
			}
		},

		VehicleDeleters = {
			   { x = 1412.71, y = 1118.97, z = 114.84 },
		},

		BossActions = {
			vector3(1393.1, 1159.67, 114.34)
		}

	}

}
