Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = {type = 21, x = 0.5, y = 0.5, z = 0.5, r = 0, g = 0, b = 240, a = 100, rotate = false}

Config.ReviveReward               = 2000  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale = 'en'


local detik = 1000
local menit = 60 * detik

Config.EarlyRespawnTimer          = 15 * menit  -- time til respawn is available
Config.BleedoutTimer              = 20 * menit -- time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = false
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 8000

Config.RespawnPoint = {coords = vector3(-770.48, -1234.86, 7.34), heading = 131.86}

Config.Uniforms = {
	baju_pasien = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 144,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 6,
			['pants_1'] = 65,   ['pants_2'] = 2,
			['shoes_1'] = 68,   ['shoes_2'] = 5,
			['chain_1'] = 0,  ['chain_2'] = 0
		},
		female = {
			['tshirt_1'] = 7,   ['tshirt_2'] = 0,
			['torso_1'] = 142,    ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 67,   ['pants_2'] = 2,
			['shoes_1'] = 71,    ['shoes_2'] = 5,
			['chain_1'] = 0,    ['chain_2'] = 0
		}
	},
  baju_dokter = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 67,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 88,
			['pants_1'] = 40,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['chain_1'] = 126,  ['chain_2'] = 0
		},
		female = {
			['glasses_1'] = 5,	['glasses_2'] = 0,
			['tshirt_1'] = 7,   ['tshirt_2'] = 0,
			['torso_1'] = 61,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 101,
			['pants_1'] = 40,   ['pants_2'] = 0,
			['shoes_1'] = 24,   ['shoes_2'] = 0,
			['chain_1'] = 96,   ['chain_2'] = 0
		}	
	},
}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(-840.6779174805, -1235.74332275391, 6.933451538086), -- pilbox
            coords2 = vector3(307.7, -1433.4, 28.9),
            coords3 = vector3(1830.7633056641, 3676.4401855469, 10.685400009155), -- sandy
            coords4 = vector3(-248.332, 6332.41, 32.4262), -- paleto
			sprite = 61,
			scale  = 0.7,
			color  = 2
		},

		AmbulanceActions = {
			--vector3(310.52, -598.99, 42.29),]]--
			vector3(-824.42,-1238.75,7.34), -- kota
			vector3(1839.8416992188, 3686.9851464844, 34.320622253418) -- ss
		},

		Pharmacies = {
			--vector3(316.61, -589.19, 42.29),]]--
			vector3(-803.54805541992,-1206.01721191406,7.34), -- kota
			vector3(1833.7418066406, 3692.2837695313, 34.291053314209), -- ss
			vector3(-252.27411437988,6319.5952929688,32.416189422607) -- paleto
		},

		Cloakroom2 = { -- Cloakroom
		    vector3(-804.8,-1214.93,7.34),
			Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
        },

		Vehicles = {
			{
				Spawner = vector3(-840.6, -1235.74, 6.93),
				InsideShop = vector3(228.5, -993.5, -99.5),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(-840.03, -1231.15, 6.93), heading = 45.52, radius = 4.0 }
				}
			},
			{
				Spawner = vector3(1810.9482421875, 3679.4084472656, 34.27689743042),
				InsideShop = vector3(228.5, -993.5, -99.5),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(1809.2625732422, 3683.248046875, 34.224277496338), heading = 120.4, radius = 4.0 }
				}
			},
			{
				Spawner = vector3(-250.84037780762,6339.041015625,32.489318847656),
				InsideShop = vector3(228.5, -993.5, -99.5),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(-253.50727844238,6345.994140625,31.970624923706), heading = 157.25, radius = 4.0 }
				}
			},
			{
				Spawner = vector3(357.87240600586,-590.62963867188,28.791198730469),
				InsideShop = vector3(228.5, -993.5, -99.5),
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(363.41152954102,-595.11712646484,28.250310897827), heading = 160.0, radius = 4.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-786.17, -1199.02, 53.2),
				InsideShop = vector3(228.5, -993.5, -99.5),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(-790.61, -1191.79, 53.03), heading = 51.15, radius = 10.0 }
				}
			}
		},
		


		FastTravels = {


			-- {
			-- 	From = vector3(339.44, -584.09, 74.17),
			-- 	To = { coords = vector3(327.3, -594.53, 43.29), heading = 0.0 },
			-- 	Marker = { type = 21, x = 1.0, y = 1.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			-- },

			-- {
			-- 	From = vector3(298.65, -598.99, 43.29),
			-- 	To = { coords = vector3(358.17, -596.95, 28.63), heading = 138.6 },
			-- 	Marker = { type = 21, x = 1.0, y = 1.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			-- },

			-- {
			-- 	From = vector3(361.51, -585.85, 28.68),
			-- 	To = { coords = vector3(309.07, -602.64, 43.29), heading = 0.0 },
			-- 	Marker = { type = 21, x = 1.0, y = 1.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false }
			-- },

			-- {
			-- 	From = vector3(234.5, -1373.7, 20.9),
			-- 	To = { coords = vector3(320.9, -1478.6, 28.8), heading = 0.0 },
			-- 	Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			-- },

			-- {
			-- 	From = vector3(317.9, -1476.1, 28.9),
			-- 	To = { coords = vector3(238.6, -1368.4, 23.5), heading = 0.0 },
			-- 	Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false }
			-- }
		},

		FastTravelsPrompt = {

 {
 	From = vector3(0, 0, 0),
 	To = { coords = vector3(0, 0, 0), heading = 0.0 },
	Marker = { type = 21, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
	Prompt = _U('fast_travel')
 },


 {
 	From = vector3(0, 0, 0),
 	To = { coords = vector3(0, 0, 0), heading = 0.0 },
	Marker = { type = 21, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
	Prompt = _U('fast_travel')
 }


			-- {
			-- 	From = vector3(237.4, -1373.8, 26.0),
			-- 	To = { coords = vector3(251.9, -1363.3, 38.5), heading = 0.0 },
			-- 	Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
			-- 	Prompt = _U('fast_travel')
			-- },

			-- {
			-- 	From = vector3(256.5, -1357.7, 36.0),
			-- 	To = { coords = vector3(235.4, -1372.8, 26.3), heading = 0.0 },
			-- 	Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
			-- 	Prompt = _U('fast_travel')
			-- }
		}

	}
}

Config.AuthorizedVehicles = {

	magang = {
		{ model = 'ambulancei', label = 'Ambulance city', price = 1000 },
		{ model = 'sanchezems', label = 'Sanchez Nih Dek', price = 1000 },
		{ model = 'dodgeems', label = 'Dodge Ems', price = 1000 },
		{ model = 'emsnspeedo', label = 'Ems Speedo', price = 1000 },
		{ model = 'emsroamer', label = 'Ems Roamer', price = 1000 },
		{ model = 'ems_gs1200', label = 'Moto', price = 1000 },
		{ model = 'inem_vwcrafter', label = 'Ambulance', price = 1000 },
		{ model = 'l200_inem', label = 'Ambulance offcity', price = 1000 }
	},

	perawat = {
		{ model = 'ambulancei', label = 'Ambulance city', price = 1000 },
		{ model = 'sanchezems', label = 'Sanchez Nih Dek', price = 1000 },
		{ model = 'dodgeems', label = 'Dodge Ems', price = 1000 },
		{ model = 'emsnspeedo', label = 'Ems Speedo', price = 1000 },
		{ model = 'emsroamer', label = 'Ems Roamer', price = 1000 },
		{ model = 'ems_gs1200', label = 'Moto', price = 1000 },
		{ model = 'inem_vwcrafter', label = 'Ambulance', price = 1000 },
		{ model = 'l200_inem', label = 'Ambulance offcity', price = 1000 }
	},

	doktor = {
		{ model = 'ambulancei', label = 'Ambulance city', price = 1000 },
		{ model = 'sanchezems', label = 'Sanchez Nih Dek', price = 1000 },
		{ model = 'dodgeems', label = 'Dodge Ems', price = 1000 },
		{ model = 'emsnspeedo', label = 'Ems Speedo', price = 1000 },
		{ model = 'emsroamer', label = 'Ems Roamer', price = 1000 },
		{ model = 'ems_gs1200', label = 'Moto', price = 1000 },
		{ model = 'inem_vwcrafter', label = 'Ambulance', price = 1000 },
		{ model = 'l200_inem', label = 'Ambulance offcity', price = 1000 }
	},
	
	drspecial = {
		{ model = 'ambulancei', label = 'Ambulance city', price = 1000 },
		{ model = 'sanchezems', label = 'Sanchez Nih Dek', price = 1000 },
		{ model = 'dodgeems', label = 'Dodge Ems', price = 1000 },
		{ model = 'emsnspeedo', label = 'Ems Speedo', price = 1000 },
		{ model = 'emsroamer', label = 'Ems Roamer', price = 1000 },
		{ model = 'ems_gs1200', label = 'Moto', price = 1000 },
		{ model = 'inem_vwcrafter', label = 'Ambulance', price = 1000 },
		{ model = 'l200_inem', label = 'Ambulance offcity', price = 1000 }
	},
	
	sekertaris = {
		{ model = 'ambulancei', label = 'Ambulance city', price = 1000 },
		{ model = 'sanchezems', label = 'Sanchez Nih Dek', price = 1000 },
		{ model = 'dodgeems', label = 'Dodge Ems', price = 1000 },
		{ model = 'emsnspeedo', label = 'Ems Speedo', price = 1000 },
		{ model = 'emsroamer', label = 'Ems Roamer', price = 1000 },
		{ model = 'ems_gs1200', label = 'Moto', price = 1000 },
		{ model = 'inem_vwcrafter', label = 'Ambulance', price = 1000 },
		{ model = 'l200_inem', label = 'Ambulance offcity', price = 1000 }
	},
	
	wakdir = {
		{ model = 'ambulancei', label = 'Ambulance city', price = 1000 },
		{ model = 'sanchezems', label = 'Sanchez Nih Dek', price = 1000 },
		{ model = 'dodgeems', label = 'Dodge Ems', price = 1000 },
		{ model = 'emsnspeedo', label = 'Ems Speedo', price = 1000 },
		{ model = 'emsroamer', label = 'Ems Roamer', price = 1000 },
		{ model = 'ems_gs1200', label = 'Moto', price = 1000 },
		{ model = 'inem_vwcrafter', label = 'Ambulance', price = 1000 },
		{ model = 'l200_inem', label = 'Ambulance offcity', price = 1000 }
	},

	boss = {
		{ model = 'ambulancei', label = 'Ambulance city', price = 1000 },
		{ model = 'sanchezems', label = 'Sanchez Nih Dek', price = 1000 },
		{ model = 'dodgeems', label = 'Dodge Ems', price = 1000 },
		{ model = 'emsnspeedo', label = 'Ems Speedo', price = 1000 },
		{ model = 'emsroamer', label = 'Ems Roamer', price = 1000 },
		{ model = 'ems_gs1200', label = 'Moto', price = 1000 },
		{ model = 'inem_vwcrafter', label = 'Ambulance', price = 1000 },
		{ model = 'l200_inem', label = 'Ambulance offcity', price = 1000 }
	}

}

Config.AuthorizedHelicopters = {

	ambulance = {},

	doctor = {},

	sekertaris = {
 	{ model = 'frogger2', label = 'Heli EMS', price = 10000 }
},

	wakdir = {
 	{ model = 'frogger2', label = 'Heli EMS', price = 10000 }
},

	boss = {
 	{ model = 'frogger2', label = 'Heli EMS', price = 10000 }
	}

}

