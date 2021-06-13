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
            ['tshirt_1'] = 16,   ['tshirt_2'] = 0,
            ['torso_1'] = 249,    ['torso_2'] = 1,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 35,
            ['pants_1'] = 96, ['pants_2'] = 1,
			['shoes_1'] = 5, ['shoes_2'] = 0,
            ['chain_1'] = 0,   ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 0,   ['tshirt_2'] = 0,
			['torso_1'] = 0,    ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 0,   ['pants_2'] = 2,
			['shoes_1'] = 0,    ['shoes_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0
		}
	},
  seragam_gang = {
		male = {
            ['tshirt_1'] = 16,   ['tshirt_2'] = 0,
            ['torso_1'] = 126,    ['torso_2'] = 14,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 38,
            ['pants_1'] = 26, ['pants_2'] = 0,
			['shoes_1'] = 24, ['shoes_2'] = 0,
            ['chain_1'] = 0,   ['chain_2'] = 0
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


Config.gangStations = {

	gang = {

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
			vector3(-18.1, -1439.18, 31.1)
		},

		Armories = {
			vector3(-16.25, -1430.25, 31.1)
		},

		Vehicles = {
			{
				Spawner = vector3(-20.66, -1443.9, 30.64),
				SpawnPoints = {
					{ coords = vector3(-24.93, -1437.99, 30.65), heading = 179.95, radius = 6.0 }
				}
			}
		},

		VehicleDeleters = {
			   { x = -25.28, y = -1427.53, z = 30.66 },
		},

		BossActions = {
			vector3(-18.47, -1432.65, 31.1)
		}

	}

}
