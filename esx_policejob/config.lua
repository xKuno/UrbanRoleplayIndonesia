	Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = true -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale = 'en'

Config.PoliceStations = {

	LSPD = {

		Blipa = {
			Coords  = vector3(433.16, -981.85, 86.5),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.0,
			Colour  = 29
		},

		Blip = {
			Coords  = vector3(-440.07, 6022.8, 31.49),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.7,
			Colour  = 29
		},


		Blips = {
			Coords  = vector3(1850.81, 3693.24, 34.27),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.7,
			Colour  = 29
		},
		
	    Blipcok = {
			Coords  = vector3(-1634.26, -1025.39, 13.15),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.7,
			Colour  = 29
		},
		
		Blipsfederal = {
			Coords  = vector3(1833.81, 2581.23, 45.89),
			Sprite  = 60,
			Display = 4,
			Scale   = 0.7,
			Colour  = 29
		},



		Cloakrooms = {
			vector3(457.34, -988.94, 30.69),
              vector3(-452.18, 6010.15, 31.84),
             vector3(-1624.39, -1033.67, 13.15),
		    vector3(1833.81, 2581.23, 45.89),
			vector3(1849.51, 3696.06, 34.26)
		},

		Armories = {
			vector3(452.66, -982.26, 30.69),
             vector3(-430.36, 6001.66, 31.72),
            vector3(-1617.93, -1029.81, 13.15),
            vector3(1834.79, 2587.57, 45.89),
			vector3(1842.15, 3690.02, 34.26)
		},

		Vehicles = {
				{
				Spawner = vector3(458.52, -1017.16, 28.21),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(451.46, -1018.82, 28.47), heading = 91.02, radius = 6.0 },
					{ coords = vector3(451.8, -1024.56, 28.54), heading = 85.26, radius = 6.0 },
		            { coords = vector3(440.64, -1018.72, 28.72), heading = 91.65, radius = 6.0 },


				}
			},
			
			{
				Spawner = vector3(473.13, -1019.53, 28.1),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(477.73, -1022.73, 28.04), heading = 275.42, radius = 6.0 },
				}
			},

			{
				Spawner = vector3(1870.48,3683.55,33.7),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(1872.77,3686.14,33.55), heading = 215.08, radius = 6.0 },
					{ coords = vector3(1866.71,3699.96,33.51), heading = 208.8, radius = 6.0 }
				}
			},

{
				Spawner = vector3(-1620.6,-1012.91,13.15),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(-1616.99,-1008.39,13.06), heading = 50.12, radius = 6.0 },
					{ coords = vector3(-1613.7,-1005.45,13.02), heading = 48.91, radius = 6.0 }
				}
			},
			
			{
				Spawner = vector3(-440.07, 6022.8, 31.49),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(-441.89, 6026.89, 31.34), heading = 39.52, radius = 6.0 },
					{ coords = vector3(-439.11, 6029.89, 31.34), heading = 26.06, radius = 6.0 },
					{ coords = vector3(-435.56, 6032.28, 31.34), heading = 37.53, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(1852.87, 2582.32, 45.67),
				InsideShop = vector3(1855.36, 2578.94, 45.32),
				SpawnPoints = {
					{ coords = vector3(1855.36, 2578.94, 45.32), heading = 89.38, radius = 6.0 },
					{ coords = vector3(1855.43, 2575.27, 45.32), heading = 89.11, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(463.01, -982.46, 43.69),
				InsideShop = vector3(446.7, -1355.6, 43.5),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 255, g = 0, b = 255, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(449.36, -981.31, 43.69), heading = 94.65, radius = 10.0 }
				}
			},

			{
				Spawner = vector3(-456.66, 5988.57, 31.28),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(-475.6, 5988.03, 31.34), heading = 317.18, radius = 10.0 }
				}
			},
	{
					Spawner = vector3(-1605.88,-1028.33,13.08),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(-1590.07,-1029.13,13.02), heading = 278.37, radius = 10.0 }
				}
			},
			{
					Spawner = vector3(1841.03,3678.56,40.59),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(1832.79,3681.56,40.54), heading = 208.02, radius = 10.0 }
				}
			},
			{
				Spawner = vector3(1680.74, 2576.31, 50.62),
				InsideShop = vector3(1690.03, 2582.46, 50.78),
				SpawnPoints = {
					{ coords = vector3(1690.03, 2582.46, 50.78), heading = 1.88, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(448.11, -973.36, 30.69),
            vector3(-437.67,6003.82,36.69),
            vector3(-1617.31,-1017.96,13.15),
            vector3(1841.73, 2569.98, 45.89),
			vector3(1862.32,3690.86,34.26)

		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	officer = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 20000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 40000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	srofficer = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 20000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 40000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	corporall = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 20000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 40000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	sergeant = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 20000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 40000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 30000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	intendent = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 20000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 40000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 30000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 20000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 40000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 30000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	chef = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 20000 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 40000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 30000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	boss = {
		{ weapon = 'WEAPON_APPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 15000 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 35000 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 25000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
	},

	tamtama = {
		{ model = 'polcarap', label = 'Police 4x4', price = 10000 },
		{ model = 'polfugitivep', label = 'Sedan Police', price = 10000 },
		{ model = 'polgresleyp', label = 'SUV Traffic Patrol', price = 10000 },
		{ model = 'polroamerp', label = 'SUV Sherrif', price = 15000 },
		{ model = 'polscoutp', label = 'SUV Police City', price = 10000 },
		{ model = 'poltorencep', label = 'Sedan Traffic Patrol', price = 10000 },
		{ model = 'polstanierp', label = 'Sedan Sherrif', price = 10000 },
		{ model = 'menswat', label = 'SWAT', price = 10000 },
		{ model = 'bcat', label = 'RIOT BARU', price = 10000 },
		{ model = 'riot', label = 'RIOT', price = 10000 },
		{ model = 'PBus', label = 'BUS Police', price = 15000 },
		{ model = 'pd_dirtbike', label = 'Sanchez Police', price = 10000 },
		{ model = 'pol_gs1200', label = 'BMW GS', price = 10000 },
		{ model = 'code3cap', label = 'Cap', price = 10000 },
		{ model = 'code3durango', label = 'Durango', price = 10000 },
		{ model = 'vapidpolisi', label = 'SUV Police', price = 10000 },
	},

	bripda = {
		{ model = 'polcarap', label = 'Police 4x4', price = 10000 },
		{ model = 'polfugitivep', label = 'Sedan Police', price = 10000 },
		{ model = 'polgresleyp', label = 'SUV Traffic Patrol', price = 10000 },
		{ model = 'polroamerp', label = 'SUV Sherrif', price = 15000 },
		{ model = 'polscoutp', label = 'SUV Police City', price = 10000 },
		{ model = 'poltorencep', label = 'Sedan Traffic Patrol', price = 10000 },
		{ model = 'polstanierp', label = 'Sedan Sherrif', price = 10000 },
		{ model = 'menswat', label = 'SWAT', price = 10000 },
		{ model = 'bcat', label = 'RIOT BARU', price = 10000 },
		{ model = 'riot', label = 'RIOT', price = 10000 },
		{ model = 'PBus', label = 'BUS Police', price = 15000 },
		{ model = 'pd_dirtbike', label = 'Sanchez Police', price = 10000 },
		{ model = 'pol_gs1200', label = 'BMW GS', price = 10000 },
		{ model = 'code3cap', label = 'Cap', price = 10000 },
		{ model = 'code3durango', label = 'Durango', price = 10000 },
		{ model = 'vapidpolisi', label = 'SUV Police', price = 10000 },
	},

	briptu = {
		{ model = 'polcarap', label = 'Police 4x4', price = 10000 },
		{ model = 'polfugitivep', label = 'Sedan Police', price = 10000 },
		{ model = 'polgresleyp', label = 'SUV Traffic Patrol', price = 10000 },
		{ model = 'polroamerp', label = 'SUV Sherrif', price = 15000 },
		{ model = 'polscoutp', label = 'SUV Police City', price = 10000 },
		{ model = 'poltorencep', label = 'Sedan Traffic Patrol', price = 10000 },
		{ model = 'polstanierp', label = 'Sedan Sherrif', price = 10000 },
		{ model = 'menswat', label = 'SWAT', price = 10000 },
		{ model = 'bcat', label = 'RIOT BARU', price = 10000 },
		{ model = 'riot', label = 'RIOT', price = 10000 },
		{ model = 'PBus', label = 'BUS Police', price = 15000 },
		{ model = 'pd_dirtbike', label = 'Sanchez Police', price = 10000 },
		{ model = 'pol_gs1200', label = 'BMW GS', price = 10000 },
		{ model = 'code3cap', label = 'Cap', price = 10000 },
		{ model = 'code3durango', label = 'Durango', price = 10000 },
		{ model = 'vapidpolisi', label = 'SUV Police', price = 10000 },
	},

	brigadir = {
		{ model = 'polcarap', label = 'Police 4x4', price = 10000 },
		{ model = 'polfugitivep', label = 'Sedan Police', price = 10000 },
		{ model = 'polgresleyp', label = 'SUV Traffic Patrol', price = 10000 },
		{ model = 'polroamerp', label = 'SUV Sherrif', price = 15000 },
		{ model = 'polscoutp', label = 'SUV Police City', price = 10000 },
		{ model = 'poltorencep', label = 'Sedan Traffic Patrol', price = 10000 },
		{ model = 'polstanierp', label = 'Sedan Sherrif', price = 10000 },
		{ model = 'menswat', label = 'SWAT', price = 10000 },
		{ model = 'bcat', label = 'RIOT BARU', price = 10000 },
		{ model = 'riot', label = 'RIOT', price = 10000 },
		{ model = 'PBus', label = 'BUS Police', price = 15000 },
		{ model = 'pd_dirtbike', label = 'Sanchez Police', price = 10000 },
		{ model = 'pol_gs1200', label = 'BMW GS', price = 10000 },
		{ model = 'code3cap', label = 'Cap', price = 10000 },
		{ model = 'code3durango', label = 'Durango', price = 10000 },
		{ model = 'vapidpolisi', label = 'SUV Police', price = 10000 },
	},
	
	bripka = {
		{ model = 'polcarap', label = 'Police 4x4', price = 10000 },
		{ model = 'polfugitivep', label = 'Sedan Police', price = 10000 },
		{ model = 'polgresleyp', label = 'SUV Traffic Patrol', price = 10000 },
		{ model = 'polroamerp', label = 'SUV Sherrif', price = 15000 },
		{ model = 'polscoutp', label = 'SUV Police City', price = 10000 },
		{ model = 'poltorencep', label = 'Sedan Traffic Patrol', price = 10000 },
		{ model = 'polstanierp', label = 'Sedan Sherrif', price = 10000 },
		{ model = 'menswat', label = 'SWAT', price = 10000 },
		{ model = 'bcat', label = 'RIOT BARU', price = 10000 },
		{ model = 'riot', label = 'RIOT', price = 10000 },
		{ model = 'PBus', label = 'BUS Police', price = 15000 },
		{ model = 'pd_dirtbike', label = 'Sanchez Police', price = 10000 },
		{ model = 'pol_gs1200', label = 'BMW GS', price = 10000 },
		{ model = 'code3cap', label = 'Cap', price = 10000 },
		{ model = 'code3durango', label = 'Durango', price = 10000 },
		{ model = 'vapidpolisi', label = 'SUV Police', price = 10000 },
	},

	aipda = {
		{ model = 'polcarap', label = 'Police 4x4', price = 10000 },
		{ model = 'polfugitivep', label = 'Sedan Police', price = 10000 },
		{ model = 'polgresleyp', label = 'SUV Traffic Patrol', price = 10000 },
		{ model = 'polroamerp', label = 'SUV Sherrif', price = 15000 },
		{ model = 'polscoutp', label = 'SUV Police City', price = 10000 },
		{ model = 'poltorencep', label = 'Sedan Traffic Patrol', price = 10000 },
		{ model = 'polstanierp', label = 'Sedan Sherrif', price = 10000 },
		{ model = 'menswat', label = 'SWAT', price = 10000 },
		{ model = 'bcat', label = 'RIOT BARU', price = 10000 },
		{ model = 'riot', label = 'RIOT', price = 10000 },
		{ model = 'PBus', label = 'BUS Police', price = 15000 },
		{ model = 'pd_dirtbike', label = 'Sanchez Police', price = 10000 },
		{ model = 'pol_gs1200', label = 'BMW GS', price = 10000 },
		{ model = 'code3cap', label = 'Cap', price = 10000 },
		{ model = 'code3durango', label = 'Durango', price = 10000 },
		{ model = 'vapidpolisi', label = 'SUV Police', price = 10000 },
	},
	
	aiptu = {
		{ model = 'polcarap', label = 'Police 4x4', price = 10000 },
		{ model = 'polfugitivep', label = 'Sedan Police', price = 10000 },
		{ model = 'polgresleyp', label = 'SUV Traffic Patrol', price = 10000 },
		{ model = 'polroamerp', label = 'SUV Sherrif', price = 15000 },
		{ model = 'polscoutp', label = 'SUV Police City', price = 10000 },
		{ model = 'poltorencep', label = 'Sedan Traffic Patrol', price = 10000 },
		{ model = 'polstanierp', label = 'Sedan Sherrif', price = 10000 },
		{ model = 'menswat', label = 'SWAT', price = 10000 },
		{ model = 'bcat', label = 'RIOT BARU', price = 10000 },
		{ model = 'riot', label = 'RIOT', price = 10000 },
		{ model = 'PBus', label = 'BUS Police', price = 15000 },
		{ model = 'pd_dirtbike', label = 'Sanchez Police', price = 10000 },
		{ model = 'pol_gs1200', label = 'BMW GS', price = 10000 },
		{ model = 'code3cap', label = 'Cap', price = 10000 },
		{ model = 'code3durango', label = 'Durango', price = 10000 },
		{ model = 'vapidpolisi', label = 'SUV Police', price = 10000 },
	},
	
	ipda = {
		{ model = 'polcarap', label = 'Police 4x4', price = 10000 },
		{ model = 'polfugitivep', label = 'Sedan Police', price = 10000 },
		{ model = 'polgresleyp', label = 'SUV Traffic Patrol', price = 10000 },
		{ model = 'polroamerp', label = 'SUV Sherrif', price = 15000 },
		{ model = 'polscoutp', label = 'SUV Police City', price = 10000 },
		{ model = 'poltorencep', label = 'Sedan Traffic Patrol', price = 10000 },
		{ model = 'polstanierp', label = 'Sedan Sherrif', price = 10000 },
		{ model = 'menswat', label = 'SWAT', price = 10000 },
		{ model = 'bcat', label = 'RIOT BARU', price = 10000 },
		{ model = 'riot', label = 'RIOT', price = 10000 },
		{ model = 'PBus', label = 'BUS Police', price = 15000 },
		{ model = 'pd_dirtbike', label = 'Sanchez Police', price = 10000 },
		{ model = 'pol_gs1200', label = 'BMW GS', price = 10000 },
        { model = 'polalamop', label = 'Police 1', price = 10000 },
        { model = 'polbuffalop', label = 'Police 2', price = 10000 },
        { model = 'polroamerp', label = 'Police 3', price = 10000 },
        { model = 'polstalkerp', label = 'Police 4', price = 10000 },
		{ model = 'code3cap', label = 'Cap', price = 10000 },
		{ model = 'code3durango', label = 'Durango', price = 10000 },
		{ model = 'vapidpolisi', label = 'SUV Police', price = 10000 },
		{ model = 'code3cvpi', label = 'Cvpi', price = 10000 },
	},
	
	iptu = {
		{ model = 'polcarap', label = 'Police 4x4', price = 10000 },
		{ model = 'polfugitivep', label = 'Sedan Police', price = 10000 },
		{ model = 'polgresleyp', label = 'SUV Traffic Patrol', price = 10000 },
		{ model = 'polroamerp', label = 'SUV Sherrif', price = 15000 },
		{ model = 'polscoutp', label = 'SUV Police City', price = 10000 },
		{ model = 'poltorencep', label = 'Sedan Traffic Patrol', price = 10000 },
		{ model = 'polstanierp', label = 'Sedan Sherrif', price = 10000 },
		{ model = 'menswat', label = 'SWAT', price = 10000 },
		{ model = 'bcat', label = 'RIOT BARU', price = 10000 },
		{ model = 'riot', label = 'RIOT', price = 10000 },
		{ model = 'PBus', label = 'BUS Police', price = 15000 },
		{ model = 'pd_dirtbike', label = 'Sanchez Police', price = 10000 },
		{ model = 'pol_gs1200', label = 'BMW GS', price = 10000 },
		{ model = 'code3cap', label = 'Cap', price = 10000 },
        { model = 'polalamop', label = 'Police 1', price = 10000 },
        { model = 'polbuffalop', label = 'Police 2', price = 10000 },
        { model = 'polroamerp', label = 'Police 3', price = 10000 },
        { model = 'polstalkerp', label = 'Police 4', price = 10000 },
		{ model = 'code3durango', label = 'Durango', price = 10000 },
		{ model = 'vapidpolisi', label = 'SUV Police', price = 10000 },
		{ model = 'code3cvpi', label = 'Cvpi', price = 10000 },
	},
	
	akp = {
		{ model = 'polcarap', label = 'Police 4x4', price = 10000 },
		{ model = 'polfugitivep', label = 'Sedan Police', price = 10000 },
		{ model = 'polgresleyp', label = 'SUV Traffic Patrol', price = 10000 },
		{ model = 'polroamerp', label = 'SUV Sherrif', price = 15000 },
		{ model = 'polscoutp', label = 'SUV Police City', price = 10000 },
		{ model = 'poltorencep', label = 'Sedan Traffic Patrol', price = 10000 },
		{ model = 'polstanierp', label = 'Sedan Sherrif', price = 10000 },
		{ model = 'menswat', label = 'SWAT', price = 10000 },
		{ model = 'bcat', label = 'RIOT BARU', price = 10000 },
		{ model = 'riot', label = 'RIOT', price = 10000 },
		{ model = 'PBus', label = 'BUS Police', price = 15000 },
		{ model = 'pd_dirtbike', label = 'Sanchez Police', price = 10000 },
		{ model = 'pol_gs1200', label = 'BMW GS', price = 10000 },
		{ model = 'code3cap', label = 'Cap', price = 10000 },
        { model = 'polalamop', label = 'Police 1', price = 10000 },
        { model = 'polbuffalop', label = 'Police 2', price = 10000 },
        { model = 'polroamerp', label = 'Police 3', price = 10000 },
        { model = 'polstalkerp', label = 'Police 4', price = 10000 },
		{ model = 'code3durango', label = 'Durango', price = 10000 },
		{ model = 'vapidpolisi', label = 'SUV Police', price = 10000 },
		{ model = 'code3cvpi', label = 'Cvpi', price = 10000 },
	},
	
	kompol = {
		{ model = 'polcarap', label = 'Police 4x4', price = 10000 },
		{ model = 'polfugitivep', label = 'Sedan Police', price = 10000 },
		{ model = 'polgresleyp', label = 'SUV Traffic Patrol', price = 10000 },
		{ model = 'polroamerp', label = 'SUV Sherrif', price = 15000 },
		{ model = 'polscoutp', label = 'SUV Police City', price = 10000 },
		{ model = 'poltorencep', label = 'Sedan Traffic Patrol', price = 10000 },
		{ model = 'polstanierp', label = 'Sedan Sherrif', price = 10000 },
		{ model = 'menswat', label = 'SWAT', price = 10000 },
		{ model = 'bcat', label = 'RIOT BARU', price = 10000 },
		{ model = 'riot', label = 'RIOT', price = 10000 },
		{ model = 'PBus', label = 'BUS Police', price = 15000 },
		{ model = 'pd_dirtbike', label = 'Sanchez Police', price = 10000 },
		{ model = 'pol_gs1200', label = 'BMW GS', price = 10000 },
		{ model = 'code3cap', label = 'Cap', price = 10000 },
        { model = 'polalamop', label = 'Police 1', price = 10000 },
        { model = 'polbuffalop', label = 'Police 2', price = 10000 },
        { model = 'polroamerp', label = 'Police 3', price = 10000 },
        { model = 'polstalkerp', label = 'Police 4', price = 10000 },
		{ model = 'code3durango', label = 'Durango', price = 10000 },
		{ model = 'vapidpolisi', label = 'SUV Police', price = 10000 },
		{ model = 'code3cvpi', label = 'Cvpi', price = 10000 },
		{ model = 'code3camero', label = 'Camaro', price = 10000 },


	},
	
	akbp = {
		{ model = 'polcarap', label = 'Police 4x4', price = 10000 },
		{ model = 'polfugitivep', label = 'Sedan Police', price = 10000 },
		{ model = 'polgresleyp', label = 'SUV Traffic Patrol', price = 10000 },
		{ model = 'polroamerp', label = 'SUV Sherrif', price = 15000 },
		{ model = 'polscoutp', label = 'SUV Police City', price = 10000 },
		{ model = 'poltorencep', label = 'Sedan Traffic Patrol', price = 10000 },
		{ model = 'polstanierp', label = 'Sedan Sherrif', price = 10000 },
		{ model = 'menswat', label = 'SWAT', price = 10000 },
		{ model = 'bcat', label = 'RIOT BARU', price = 10000 },
		{ model = 'riot', label = 'RIOT', price = 10000 },
		{ model = 'PBus', label = 'BUS Police', price = 15000 },
		{ model = 'pd_dirtbike', label = 'Sanchez Police', price = 10000 },
		{ model = 'pol_gs1200', label = 'BMW GS', price = 10000 },
        { model = 'polalamop', label = 'Police 1', price = 10000 },
        { model = 'polbuffalop', label = 'Police 2', price = 10000 },
        { model = 'polroamerp', label = 'Police 3', price = 10000 },
        { model = 'polstalkerp', label = 'Police 4', price = 10000 },
		{ model = 'code3cap', label = 'Cap', price = 10000 },
		{ model = 'code3durango', label = 'Durango', price = 10000 },
		{ model = 'vapidpolisi', label = 'SUV Police', price = 10000 },
		{ model = 'code3cvpi', label = 'Cvpi', price = 10000 },
	},
	
	kombespol = {
		{ model = 'polcarap', label = 'Police 4x4', price = 10000 },
		{ model = 'polfugitivep', label = 'Sedan Police', price = 10000 },
		{ model = 'polgresleyp', label = 'SUV Traffic Patrol', price = 10000 },
		{ model = 'polroamerp', label = 'SUV Sherrif', price = 15000 },
		{ model = 'polscoutp', label = 'SUV Police City', price = 10000 },
		{ model = 'poltorencep', label = 'Sedan Traffic Patrol', price = 10000 },
		{ model = 'polstanierp', label = 'Sedan Sherrif', price = 10000 },
		{ model = 'menswat', label = 'SWAT', price = 10000 },
		{ model = 'bcat', label = 'RIOT BARU', price = 10000 },
		{ model = 'riot', label = 'RIOT', price = 10000 },
		{ model = 'PBus', label = 'BUS Police', price = 15000 },
		{ model = 'pd_dirtbike', label = 'Sanchez Police', price = 10000 },
		{ model = 'pol_gs1200', label = 'BMW GS', price = 10000 },
		{ model = 'code3cap', label = 'Cap', price = 10000 },
		{ model = 'barracks', label = 'TRUCK', price = 10000 },
        { model = 'polalamop', label = 'Police 1', price = 10000 },
        { model = 'polbuffalop', label = 'Police 2', price = 10000 },
        { model = 'polroamerp', label = 'Police 3', price = 10000 },
        { model = 'polstalkerp', label = 'Police 4', price = 10000 },
		{ model = 'code3durango', label = 'Durango', price = 10000 },
		{ model = 'vapidpolisi', label = 'SUV Police', price = 10000 },
		{ model = 'code3cvpi', label = 'Cvpi', price = 10000 },
		{ model = 'code3camero', label = 'Camaro', price = 10000 },
		{ model = 'polmp4', label = 'Police', price = 10000 },
		{ model = 'pol718', label = 'Policer', price = 10000 },	
		{ model = 'hiluxpolisi', label = 'Hilux Police', price = 10000 },
		{ model = 'silveradopolisi', label = 'Silverado Police', price = 10000 },
		{ model = 'tritonpolisi', label = 'Triton Police', price = 10000 },		
	},

	boss3 = {
		{ model = 'polcarap', label = 'Police 4x4', price = 10000 },
		{ model = 'polfugitivep', label = 'Sedan Police', price = 10000 },
		{ model = 'polgresleyp', label = 'SUV Traffic Patrol', price = 10000 },
		{ model = 'polroamerp', label = 'SUV Sherrif', price = 15000 },
		{ model = 'polscoutp', label = 'SUV Police City', price = 10000 },
		{ model = 'poltorencep', label = 'Sedan Traffic Patrol', price = 10000 },
		{ model = 'polstanierp', label = 'Sedan Sherrif', price = 10000 },
		{ model = 'menswat', label = 'SWAT', price = 10000 },
		{ model = 'bcat', label = 'RIOT BARU', price = 10000 },
		{ model = 'lcjendral', label = 'Mobil Jendral', price = 10000 },
		{ model = 'riot', label = 'RIOT', price = 10000 },
		{ model = 'PBus', label = 'BUS Police', price = 15000 },
		{ model = 'pd_dirtbike', label = 'Sanchez Police', price = 10000 },
		{ model = 'pol_gs1200', label = 'BMW GS', price = 10000 },
		{ model = 'code3cap', label = 'Cap', price = 10000 },
		{ model = 'code3durango', label = 'Durango', price = 10000 },
		{ model = 'vapidpolisi', label = 'SUV Police', price = 10000 },
		{ model = 'code3cvpi', label = 'Cvpi', price = 10000 },
		{ model = 'barracks', label = 'TRUCK', price = 10000 },
        { model = 'polalamop', label = 'Police 1', price = 10000 },
        { model = 'polbuffalop', label = 'Police 2', price = 10000 },
        { model = 'polroamerp', label = 'Police 3', price = 10000 },
        { model = 'polstalkerp', label = 'Police 4', price = 10000 },
		{ model = 'code3camero', label = 'Camaro', price = 10000 },
		{ model = 'polmp4', label = 'Police', price = 10000 },
		{ model = 'pol718', label = 'Policer', price = 10000 },	
		{ model = 'hiluxpolisi', label = 'Hilux Police', price = 10000 },
		{ model = 'silveradopolisi', label = 'Silverado Police', price = 10000 },
		{ model = 'tritonpolisi', label = 'Triton Police', price = 10000 },	
	},
	
	
	boss2 = {
		{ model = 'polcarap', label = 'Police 4x4', price = 10000 },
		{ model = 'polfugitivep', label = 'Sedan Police', price = 10000 },
		{ model = 'polgresleyp', label = 'SUV Traffic Patrol', price = 10000 },
		{ model = 'polroamerp', label = 'SUV Sherrif', price = 15000 },
		{ model = 'polscoutp', label = 'SUV Police City', price = 10000 },
		{ model = 'poltorencep', label = 'Sedan Traffic Patrol', price = 10000 },
		{ model = 'polstanierp', label = 'Sedan Sherrif', price = 10000 },
		{ model = 'menswat', label = 'SWAT', price = 10000 },
		{ model = 'bcat', label = 'RIOT BARU', price = 10000 },
		{ model = 'lcjendral', label = 'Mobil Jendral', price = 10000 },
		{ model = 'riot', label = 'RIOT', price = 10000 },
		{ model = 'PBus', label = 'BUS Police', price = 15000 },
		{ model = 'pd_dirtbike', label = 'Sanchez Police', price = 10000 },
		{ model = 'pol_gs1200', label = 'BMW GS', price = 10000 },
		{ model = 'code3cap', label = 'Cap', price = 10000 },
		{ model = 'code3durango', label = 'Durango', price = 10000 },
		{ model = 'vapidpolisi', label = 'SUV Police', price = 10000 },
		{ model = 'code3cvpi', label = 'Cvpi', price = 10000 },
        { model = 'polalamop', label = 'Police 1', price = 10000 },
        { model = 'polbuffalop', label = 'Police 2', price = 10000 },
        { model = 'polroamerp', label = 'Police 3', price = 10000 },
        { model = 'polstalkerp', label = 'Police 4', price = 10000 },
		{ model = 'barracks', label = 'TRUCK', price = 10000 },
		{ model = 'code3camero', label = 'Camaro', price = 10000 },
		{ model = 'polmp4', label = 'Police', price = 10000 },
		{ model = 'pol718', label = 'Policer', price = 10000 },	
		{ model = 'hiluxpolisi', label = 'Hilux Police', price = 10000 },
		{ model = 'silveradopolisi', label = 'Silverado Police', price = 10000 },
		{ model = 'tritonpolisi', label = 'Triton Police', price = 10000 },		
	},
	
	boss = {
		{ model = 'polcarap', label = 'Police 4x4', price = 10000 },
		{ model = 'polfugitivep', label = 'Sedan Police', price = 10000 },
		{ model = 'polgresleyp', label = 'SUV Traffic Patrol', price = 10000 },
		{ model = 'polroamerp', label = 'SUV Sherrif', price = 15000 },
		{ model = 'polscoutp', label = 'SUV Police City', price = 10000 },
		{ model = 'poltorencep', label = 'Sedan Traffic Patrol', price = 10000 },
		{ model = 'polstanierp', label = 'Sedan Sherrif', price = 10000 },
		{ model = 'menswat', label = 'SWAT', price = 10000 },
		{ model = 'bcat', label = 'RIOT BARU', price = 10000 },
		{ model = 'lcjendral', label = 'Mobil Jendral', price = 10000 },
		{ model = 'riot', label = 'RIOT', price = 10000 },
		{ model = 'PBus', label = 'BUS Police', price = 15000 },
		{ model = 'pd_dirtbike', label = 'Sanchez Police', price = 10000 },
		{ model = 'pol_gs1200', label = 'BMW GS', price = 10000 },
		{ model = 'code3cap', label = 'Cap', price = 10000 },
		{ model = 'code3durango', label = 'Durango', price = 10000 },
		{ model = 'vapidpolisi', label = 'SUV Police', price = 10000 },
		{ model = 'code3cvpi', label = 'Cvpi', price = 10000 },
		{ model = 'barracks', label = 'TRUCK', price = 10000 },
		{ model = 'code3camero', label = 'Camaro', price = 10000 },
        { model = 'polalamop', label = 'Police 1', price = 10000 },
        { model = 'polbuffalop', label = 'Police 2', price = 10000 },
        { model = 'polroamerp', label = 'Police 3', price = 10000 },
        { model = 'polstalkerp', label = 'Police 4', price = 10000 },
		{ model = 'polmp4', label = 'Police', price = 10000 },
		{ model = 'pol718', label = 'Policer', price = 10000 },	
		{ model = 'hiluxpolisi', label = 'Hilux Police', price = 10000 },
		{ model = 'silveradopolisi', label = 'Silverado Police', price = 10000 },
		{ model = 'tritonpolisi', label = 'Triton Police', price = 10000 },	
	}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	boss3 = {
	{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 50000 }
	},
	boss2 = {
	{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 50000 }
	},
	boss = {
	{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 50000 }
	}
}

Config.Uniforms = {
tamtama_wear = {
        male = {
['tshirt_1'] = 58, ['tshirt_2'] = 0,
  ['torso_1'] = 200, ['torso_2'] = 0,
  ['arms'] = 27, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 202, ['torso_2'] = 0,
  ['arms'] = 23, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = -1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0

        }
    },
	bripda_wear = {
        male = {
['tshirt_1'] = 58, ['tshirt_2'] = 0,
  ['torso_1'] = 200, ['torso_2'] = 1,
  ['arms'] = 27, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 202, ['torso_2'] = 2,
  ['arms'] = 23, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = -1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0
        }
    },
	briptu_wear = {
        male = {
['tshirt_1'] = 58, ['tshirt_2'] = 0,
  ['torso_1'] = 200, ['torso_2'] = 2,
  ['arms'] = 27, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 202, ['torso_2'] = 2,
  ['arms'] = 23, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 0, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0
        }
    },
	brigadir_wear = {
        male = {
['tshirt_1'] = 58, ['tshirt_2'] = 0,
  ['torso_1'] = 200, ['torso_2'] = 3,
  ['arms'] = 27, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 202, ['torso_2'] = 3,
  ['arms'] = 23, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = -1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0
        }
    },
	bripka_wear = {
        male = {
['tshirt_1'] = 58, ['tshirt_2'] = 0,
  ['torso_1'] = 200, ['torso_2'] = 1,
  ['arms'] = 27, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 202, ['torso_2'] = 1,
  ['arms'] = 23, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = -1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0
        }
    },
	aipda_wear = {
        male = {
['tshirt_1'] = 58, ['tshirt_2'] = 0,
  ['torso_1'] = 200, ['torso_2'] = 2,
  ['arms'] = 27, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 202, ['torso_2'] = 2,
  ['arms'] = 23, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = -1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0
        }
    },
	aiptu_wear = {
        male = {
['tshirt_1'] = 58, ['tshirt_2'] = 0,
  ['torso_1'] = 200, ['torso_2'] = 3,
  ['arms'] = 27, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 202, ['torso_2'] = 3,
  ['arms'] = 23, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = -1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0
        }
    },
	ipda_wear = {
        male = {
['tshirt_1'] = 58, ['tshirt_2'] = 0,
  ['torso_1'] = 200, ['torso_2'] = 4,
  ['arms'] = 27, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 202, ['torso_2'] = 4,
  ['arms'] = 23, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = -1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0
        }
    },
	iptu_wear = {
        male = {
['tshirt_1'] = 58, ['tshirt_2'] = 0,
  ['torso_1'] = 200, ['torso_2'] = 5,
  ['arms'] = 27, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 202, ['torso_2'] = 5,
  ['arms'] = 23, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = -1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0
        }
    },
	akp_wear = {
        male = {
['tshirt_1'] = 58, ['tshirt_2'] = 0,
  ['torso_1'] = 200, ['torso_2'] = 6,
  ['arms'] = 27, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 202, ['torso_2'] = 6,
  ['arms'] = 23, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = -1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0
        }
    },
	kompol_wear = {
        male = {
['tshirt_1'] = 58, ['tshirt_2'] = 0,
  ['torso_1'] = 200, ['torso_2'] = 7,
  ['arms'] = 27, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 202, ['torso_2'] = 7,
  ['arms'] = 23, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = -1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0
        }
    },
	akbp_wear = {
        male = {
['tshirt_1'] = 58, ['tshirt_2'] = 0,
  ['torso_1'] = 200, ['torso_2'] = 8,
  ['arms'] = 27, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 202, ['torso_2'] = 8,
  ['arms'] = 23, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = -1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 65, ['bag_2'] = 0
        }
    },
	kombespol_wear = {
        male = {
['tshirt_1'] = 58, ['tshirt_2'] = 0,
  ['torso_1'] = 200, ['torso_2'] = 9,
  ['arms'] = 27, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 45, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 202, ['torso_2'] = 9,
  ['arms'] = 23, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = -1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0
        }
    },
	boss3_wear = {
	male = {
['tshirt_1'] = 58, ['tshirt_2'] = 0,
  ['torso_1'] = 200, ['torso_2'] = 10,
  ['arms'] = 27, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 45, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 202, ['torso_2'] = 10,
  ['arms'] = 23, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = -1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0

        }
    },
	boss2_wear = { -- currently the same as intendent_wear
        male = {
['tshirt_1'] = 58, ['tshirt_2'] = 0,
  ['torso_1'] = 200, ['torso_2'] = 11,
  ['arms'] = 27, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 45, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 202, ['torso_2'] = 12,
  ['arms'] = 23, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = -1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0
        }
    },
	boss_wear = { -- currently the same as chef_wear
        male = {
['tshirt_1'] = 58, ['tshirt_2'] = 0,
  ['torso_1'] = 200, ['torso_2'] = 12,
  ['arms'] = 27, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 45, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 202, ['torso_2'] = 13,
  ['arms'] = 23, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = -1, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0
        }
    },
	latihan_wear = {
		male = {
['tshirt_1'] = 15, ['tshirt_2'] = 0,
  ['torso_1'] = 225, ['torso_2'] = 0,
  ['arms'] = 25, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 45, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 54, ['tshirt_2'] = 0,
  ['torso_1'] = 235, ['torso_2'] = 0,
  ['arms'] = 34, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 43, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0
        }
	},
	latihan_wear2 = {
		male = {
['tshirt_1'] = 1, ['tshirt_2'] = 0,
  ['torso_1'] = 93, ['torso_2'] = 1,
  ['arms'] = 30, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 49, ['pants_2'] = 1,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 45, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 163, ['tshirt_2'] = 0,
  ['torso_1'] = 99, ['torso_2'] = 4,
  ['arms'] = 31, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 11, ['pants_2'] = 7,
  ['shoes_1'] = 36, ['shoes_2'] = 0,
  ['chain_1'] = 0, ['chain_2'] = 0,
  ['helmet_1'] = 43, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0
        }
	},
	latihan_wear3 = {
		male = {
['tshirt_1'] = 1, ['tshirt_2'] = 1,
  ['torso_1'] = 93, ['torso_2'] = 0,
  ['arms'] = 30, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 49, ['pants_2'] = 1,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 0, ['chain_2'] = 0,
  ['helmet_1'] = 45, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 99, ['torso_2'] = 4,
  ['arms'] = 31, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 43, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0
        }
	},
	latihan_wear4 = {
		male = {
['tshirt_1'] = 15, ['tshirt_2'] = 0,
  ['torso_1'] = 225, ['torso_2'] = 1,
  ['arms'] = 25, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 45, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 54, ['tshirt_2'] = 0,
  ['torso_1'] = 235, ['torso_2'] = 1,
  ['arms'] = 34, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 43, ['helmet_2'] = 0,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0
        }
	},
	swat_wear = {
		male = {
['tshirt_1'] = 1, ['tshirt_2'] = 0,
  ['torso_1'] = 220, ['torso_2'] = 0,
  ['arms'] = 38, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 47, ['pants_2'] = 0,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 0, ['chain_2'] = 0,
  ['helmet_1'] = 45, ['helmet_2'] = 1,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 230, ['torso_2'] = 0,
  ['arms'] = 28, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 0, ['chain_2'] = 0,
  ['helmet_1'] = 43, ['helmet_2'] = 1,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0
        }
	},
	swat_wear2 = {
		male = {
['tshirt_1'] = 1, ['tshirt_2'] = 0,
  ['torso_1'] = 93, ['torso_2'] = 1,
  ['arms'] = 30, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 49, ['pants_2'] = 1,
  ['shoes_1'] = 27, ['shoes_2'] = 0,
  ['chain_1'] = 0, ['chain_2'] = 0,
  ['helmet_1'] = 45, ['helmet_2'] = 1,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0,
        },
        female = {
['tshirt_1'] = 37, ['tshirt_2'] = 0,
  ['torso_1'] = 14, ['torso_2'] = 3,
  ['arms'] = 31, ['arms_2'] = 0,
  ['decals_1'] = 0, ['decals_2'] = 0,
  ['pants_1'] = 54, ['pants_2'] = 1,
  ['shoes_1'] = 26, ['shoes_2'] = 0,
  ['chain_1'] = 1, ['chain_2'] = 0,
  ['helmet_1'] = 43, ['helmet_2'] = 1,
  ['glasses_1'] = 0, ['glasses_2'] = 0,
  ['bag_1'] = 0, ['bag_2'] = 0
        }
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 4,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 4,  ['bproof_2'] = 0
		}
	},
	bullet_wear2 = {
		male = {
			['bproof_1'] = 6,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 19,  ['bproof_2'] = 0
		}
	},
	bullet_wear3 = {
		male = {
			['bproof_1'] = 6,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 4,  ['bproof_2'] = 0
		}
	},
	bullet_wear4 = {
		male = {
			['bproof_1'] = 8,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 4,  ['bproof_2'] = 0
		}
	},
	bullet_wear5 = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 4,  ['bproof_2'] = 0
		}
	},
	gilet_wear = {
		male = {
			['bproof_1'] = 11,  ['bproof_2'] = 4
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}