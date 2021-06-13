--[[
***** How to Setup a vehicle_names.lua for Custom Addon Vehicles *****
* Create a vehicle_names.lua & past the below Code
function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end]]

--[[Citizen.CreateThread(function()
	--Example 1: AddTextEntry('SPAWN_NAME_HERE', 'VEHICLE_NAME_HERE')
	AddTextEntry('pd_dirtbike', '2013 Ford F350')
	AddTextEntry('Elegy', 'Elegy Retro')
end)]]


Config = {}

Config.Locale = 'en'

Config.KickPossibleCheaters = true -- If true it will kick the player that tries store a vehicle that they changed the Hash or Plate.
Config.UseCustomKickMessage = true -- If KickPossibleCheaters is true you can set a Custom Kick Message in the locales.
Config.ParkVehicles = false -- true = Automatically Park all Vehicles in Garage on Server/Script Restart | false = Opposite of true but players will have to go to Pound to get their Vehicle Back.


Config.UseDamageMult = false -- If true it costs more to store a Broken Vehicle.
Config.DamageMult = 0.0 -- Higher Number = Higher Repair Price.

Config.CarPoundPrice      = 20000 -- Car Pound Price.
Config.BoatPoundPrice     = 15000 -- Boat Pound Price.
Config.AircraftPoundPrice = 15000 -- Aircraft Pound Price.

Config.PolicingPoundPrice  = 5000 -- Policing Pound Price.
Config.AmbulancePoundPrice = 5000 -- Ambulance Pound Price.

Config.UseCarGarages        = true -- Allows use of Car Garages.
Config.UseBoatGarages       = false -- Allows use of Boat Garages.
Config.UseAircraftGarages   = false -- Allows use of Aircraft Garages.
Config.UsePrivateCarGarages = true -- Allows use of Private Car Garages.
Config.UseJobCarGarages     = true -- Allows use of Job Garages.

Config.DontShowPoundCarsInGarage = true -- If set to true it won't show Cars at the Pound in the Garage.
Config.ShowVehicleLocation = false -- If set to true it will show the Location of the Vehicle in the Pound/Garage in the Garage menu.
Config.UseVehicleNamesLua = true -- Must setup a vehicle_names.lua for Custom Addon Vehicles.

Config.ShowSpacer1 = true -- If true it shows Spacer 1 in the List.
Config.ShowSpacer2 = false -- If true it shows Spacer 2 in the List | Don't use if spacer3 is set to true.
Config.ShowSpacer3 = true -- If true it shows Spacer 3 in the List | Don't use if Spacer2 is set to true.

Config.MarkerType   = 1
Config.DrawDistance = 10.0

Config.ImpoundPricePercent = 2 -- dalam persen (warga biasa)
Config.ImpoundPrimePercent = 1 -- (warga prime)

Config.BlipGarage = {
	Sprite = 290,
	Color = 38,
	Display = 2,
	Scale = 0.6
}

Config.BlipGaragePrivate = {
	Sprite = 290,
	Color = 53,
	Display = 2,
	Scale = 0.0
}

Config.BlipPound = {
	Sprite = 67,
	Color = 64,
	Display = 0,
	Scale = 0.6
}

Config.BlipJobPound = {
	Sprite = 67,
	Color = 49,
       Display = 2,
	Scale = 0.6
}

Config.PointMarker = {
	r = 0, g = 255, b = 0,     -- Red Color
	x = 2.0, y = 2.0, z = 1.0  -- Big Size Circle
}

Config.DeleteMarker = {
	r = 255, g = 0, b = 0,     -- Red Color
	x = 3.5, y = 3.5, z = 1.0  -- Big Size Circle
}

Config.PoundMarker = {
	r = 0, g = 0, b = 100,     -- Blue Color
	x = 1.5, y = 1.5, z = 1.0  -- Standard Size Circle
}

Config.JobPoundMarker = {
	r = 255, g = 0, b = 0,     -- Red Color
	x = 1.5, y = 1.5, z = 1.0  -- Standard Size Circle
}

-- Start of Jobs

Config.PolicePounds = {
--[[	Pound_LosSantos = {
		PoundPoint = { x = 374.42, y = -1620.68, z = 28.29 },
		SpawnPoint = { x = 391.74, y = -1619.0, z = 28.29, h = 318.34 }
	},]]--
	Pound_Sandy = {
		PoundPoint = { x = 1646.01, y = 3812.06, z = 37.65 },
		SpawnPoint = { x = 1627.84, y = 3788.45, z = 33.77, h = 308.53 }
	},
	Pound_Paleto = {
		PoundPoint = { x = -223.6, y = 6243.37, z = 30.49 },
		SpawnPoint = { x = -230.88, y = 6255.89, z = 30.49, h = 136.5 }
	}
}

Config.AmbulancePounds = {
--[[	Pound_LosSantos = {
		PoundPoint = { x = 374.42, y = -1620.68, z = 28.29 },
		SpawnPoint = { x = 391.74, y = -1619.0, z = 28.29, h = 318.34 }
	},]]--
	Pound_Sandy = {
		PoundPoint = { x = 1646.01, y = 3812.06, z = 37.65 },
		SpawnPoint = { x = 1627.84, y = 3788.45, z = 33.77, h = 308.53 }
	},
	Pound_Paleto = {
		PoundPoint = { x = -223.6, y = 6243.37, z = 30.49 },
		SpawnPoint = { x = -230.88, y = 6255.89, z = 30.49, h = 136.5 }
	}
}

-- End of Jobs
-- Start of Cars

Config.CarGarages = {
	Garage_CentralLS = {
		GaragePoint = { x = -285.01, y = -906.43, z = 30.08 },
		SpawnPoint = { x = -285.01, y = -906.43, z = 30.08, h = 341.16 },
		DeletePoint = { x = -354.49, y = -955.98, z = 30.08 }
	},
	Garage_Sandy = {
		GaragePoint = { x = 1732.24, y = 3303.48, z = 40.22 },
		SpawnPoint = { x = 1732.24, y = 3303.48, z = 40.22, h = 197.18 },
		DeletePoint = { x = 1730.56, y = 3310.02, z = 40.22 }
	},
	Garage_Paleto = {
		GaragePoint = { x = 83.8, y = 6375.06, z = 30.23 },
		SpawnPoint = { x = 83.8, y = 6375.06, z = 30.23, h = 298.97 },
		DeletePoint = { x = 134.52, y = 6362.77, z = 29.97 }
	},
	--[[Garage_Prison = {
		GaragePoint = { x = 1864.53, y = 2565.15, z = 44.67 },
		SpawnPoint = { x = 1864.53, y = 2565.15, z = 44.67, h = 4.8 },
		DeletePoint = { x = 1855.21, y = 2615.3, z = 34.67 } -- z = 44.67
	},]]
	Garage_Perunas = {
		GaragePoint = { x = 1024.61, y = -762.4, z = 56.98 },
		SpawnPoint = { x = 1024.61, y = -762.4, z = 57.98 , h = 320.55 },
		DeletePoint = { x = 1044.41, y = -788.05, z = 56.99 } 
	},
	Garage_7148 = {
		GaragePoint = { x = -524.51, y = 51.19, z = 51.58 },
		SpawnPoint = { x = -524.51, y = 51.19, z = 51.58 , h = 354.39 },
		DeletePoint = { x = -526.56, y = 34.9, z = 51.58 } 
	},
	Garage_Walkot = {
		GaragePoint = { x = -413.28, y = 1204.33, z = 324.64 },
		SpawnPoint = { x = -413.28, y = 1204.33, z = 325.64 , h = 166.1 },
		DeletePoint = { x = -389.41, y = 1213.97, z = 324.64 } 
	},
	Garage_Stadion = {
		GaragePoint = { x = -185.82, y = -2021.54, z = 26.67 },
		SpawnPoint = { x = -185.82, y = -2021.54, z = 26.67 , h = 71.76 },
		DeletePoint = { x = -215.4, y = -2043.02, z = 26.62 } 
	},
	Garage_RS = {
		GaragePoint = { x = 653.59, y = 619.34, z = 127.91 },
		SpawnPoint = { x = 653.59, y = 619.34, z = 128.91, h = 338.3 },
		DeletePoint = { x = 642.69, y = 601.8, z = 127.56 }
	},
	Garage_RSBawah = {
		GaragePoint = { x = 407.81, y = -649.33, z = 27.5 },
		SpawnPoint = { x = 407.81, y = -649.33, z = 27.5 , h = 277.77 },
		DeletePoint = { x = 402.38, y = -633.17, z = 27.5 } 
	},
	Garage_Bandara = {
		GaragePoint = { x = -1574.19, y = -1007.7, z = 12.02 },
		SpawnPoint = { x = -1574.19, y = -1007.7, z = 12.02, h = 138.56 },
		DeletePoint = { x = -1560.16, y = -1020.51, z = 12.02 } 
	},
	Garage_Parkirankiri = {
		GaragePoint = { x = -1216.68, y = -668.44, z = 24.9 },
		SpawnPoint = { x = -1216.68, y = -668.44, z = 24.9, h = 39.22 },
		DeletePoint = { x = -1184.35, y = -694.39, z = 24.9 } 
	},
	Garage_Pantai = {
		GaragePoint = { x = -2030.54, y = -465.23, z = 10.6 },
		SpawnPoint = { x = -2015.57, y = -470.27, z = 11.51, h = 48.16 },
		DeletePoint = { x = -2049.09, y = -441.78, z = 10.53 } 
	}
}

Config.CarPounds = {
	--[[Pound_LosSantos = {
		PoundPoint = { x = 408.61, y = -1625.47, z = 28.29 },
		SpawnPoint = { x = 405.64, y = -1643.4, z = 27.61, h = 229.54 }
	},]]--
	Pound_Sandy = {
		PoundPoint = { x = 261.93, y = 2598.3, z = 43.73 },
		SpawnPoint = { x = 258.99, y = 2589.48, z = 43.95, h = 13.82 }
	},
	Pound_Paleto = {
		PoundPoint = { x = -234.82, y = 6198.65, z = 30.94 },
		SpawnPoint = { x = -230.08, y = 6190.24, z = 30.49, h = 140.24 }
	}
}

-- End of Cars
-- Start of Boats

Config.BoatGarages = {
	Garage_LSDock = {
		GaragePoint = { x = -719.78, y = -1326.42, z = 0.6 },
		SpawnPoint = { x = -712.74, y = -1335.64, z = -0.56477427124977, h = 135.4 },
		DeletePoint = { x = -726.52, y = -1327.36, z = -0.5 }
	},
	Garage_SandyDock = {
		GaragePoint = { x = -1604.42, y = 5256.47, z = 1.07 },
		SpawnPoint = { x = -1598.12, y = 5262.99, z = -0.47477427124977, h = 25.12 },
		DeletePoint = { x = -1596.33, y = 5258.51, z = -0.47 }
	},
	--[[Garage_PaletoDock = {
		GaragePoint = { 0 },
		SpawnPoint = { 0 },
		DeletePoint = { 0 }
	}]]--
}

Config.BoatPounds = {
	--[[Pound_LSDock = {
		PoundPoint = { x = -738.67, y = -1400.43, z = 4.0 },
		SpawnPoint = { x = -738.33, y = -1381.51, z = 0.12, h = 137.85 }
	},
	Pound_SandyDock = {
		PoundPoint = { 0 },
		SpawnPoint = { 0 }
	},
	Pound_PaletoDock = {
		PoundPoint = { 0 },
		SpawnPoint = { 0 }
	}]]--
}

-- End of Boats
-- Start of Aircrafts

Config.AircraftGarages = {
	Garage_LSAirport = {
		GaragePoint = { x = -1617.14, y = -3145.52, z = 12.99 },
		SpawnPoint = { x = -1657.99, y = -3134.38, z = 12.99, h = 330.11 },
		DeletePoint = { x = -1642.12, y = -3144.25, z = 12.99 }
	},
	Garage_SandyAirport = {
		GaragePoint = { x = 1723.84, y = 3288.29, z = 40.16 },
		SpawnPoint = { x = 1710.85, y = 3259.06, z = 40.69, h = 104.66 },
		DeletePoint = { x = 1714.45, y = 3246.75, z = 40.07 }
	},
	Garage_GrapeseedAirport = {
		GaragePoint = { x = 2152.83, y = 4797.03, z = 40.19 },
		SpawnPoint = { x = 2122.72, y = 4804.85, z = 40.78, h = 115.04 },
		DeletePoint = { x = 2082.36, y = 4806.06, z = 40.07 }
	}
}

Config.AircraftPounds = {
	Pound_LSAirport = {
		PoundPoint = { x = -1243.0, y = -3391.92, z = 12.94 },
		SpawnPoint = { x = -1272.27, y = -3382.46, z = 12.94, h = 330.25 }
	}
}

-- End of Aircrafts
-- Start of Private Garages

Config.PrivateCarGarages = {
	-- Maze Bank Building Garages
	Garage_MazeBankBuilding = {
		Private = "MazeBankBuilding",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_OldSpiceWarm = {
		Private = "OldSpiceWarm",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_OldSpiceClassical = {
		Private = "OldSpiceClassical",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_OldSpiceVintage = {
		Private = "OldSpiceVintage",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_ExecutiveRich = {
		Private = "ExecutiveRich",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_ExecutiveCool = {
		Private = "ExecutiveCool",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_ExecutiveContrast = {
		Private = "ExecutiveContrast",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_PowerBrokerIce = {
		Private = "PowerBrokerIce",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_PowerBrokerConservative = {
		Private = "PowerBrokerConservative",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	Garage_PowerBrokerPolished = {
		Private = "PowerBrokerPolished",
		GaragePoint = { x = -60.38, y = -790.31, z = 43.23 },
		SpawnPoint = { x = -44.031, y = -787.363, z = 43.186, h = 254.322 },
		DeletePoint = { x = -58.88, y = -778.625, z = 43.175 }
	},
	-- End of Maze Bank Building Garages
	-- Start of Lom Bank Garages
	Garage_LomBank = {
		Private = "LomBank",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBOldSpiceWarm = {
		Private = "LBOldSpiceWarm",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBOldSpiceClassical = {
		Private = "LBOldSpiceClassical",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBOldSpiceVintage = {
		Private = "LBOldSpiceVintage",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBExecutiveRich = {
		Private = "LBExecutiveRich",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBExecutiveCool = {
		Private = "LBExecutiveCool",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBExecutiveContrast = {
		Private = "LBExecutiveContrast",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBPowerBrokerIce = {
		Private = "LBPowerBrokerIce",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBPowerBrokerConservative = {
		Private = "LBPowerBrokerConservative",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	Garage_LBPowerBrokerPolished = {
		Private = "LBPowerBrokerPolished",
		GaragePoint = { x = -1545.17, y = -566.24, z = 24.85 },
		SpawnPoint = { x = -1551.88, y = -581.383, z = 24.708, h = 331.176 },
		DeletePoint = { x = -1538.564, y = -576.049, z = 24.708 }
	},
	-- End of Lom Bank Garages
	-- Start of Maze Bank West Garages
	Garage_MazeBankWest = {
		Private = "MazeBankWest",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWOldSpiceWarm = {
		Private = "MBWOldSpiceWarm",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWOldSpiceClassical = {
		Private = "MBWOldSpiceClassical",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWOldSpiceVintage = {
		Private = "MBWOldSpiceVintage",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWExecutiveRich = {
		Private = "MBWExecutiveRich",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWExecutiveCool = {
		Private = "MBWExecutiveCool",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWExecutiveContrast = {
		Private = "MBWExecutiveContrast",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWPowerBrokerIce = {
		Private = "MBWPowerBrokerIce",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWPowerBrokerConvservative = {
		Private = "MBWPowerBrokerConvservative",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	Garage_MBWPowerBrokerPolished = {
		Private = "MBWPowerBrokerPolished",
		GaragePoint = { x = -1368.14, y = -468.01, z = 30.6 },
		SpawnPoint = { x = -1376.93, y = -474.32, z = 30.5, h = 97.95 },
		DeletePoint = { x = -1362.065, y = -471.982, z = 30.5 }
	},
	-- End of Maze Bank West Garages
	-- Start of Intergrity Way Garages
	Garage_IntegrityWay = {
		Private = "IntegrityWay",
		GaragePoint = { x = -14.1, y = -614.93, z = 34.86 },
		SpawnPoint = { x = -7.351, y = -635.1, z = 34.724, h = 66.632 },
		DeletePoint = { x = -37.575, y = -620.391, z = 34.073 }
	},
	--[[Garage_IntegrityWay28 = {
		Private = "IntegrityWay28",
		GaragePoint = { x = -14.1, y = -614.93, z = 34.86 },
		SpawnPoint = { x = -7.351, y = -635.1, z = 34.724, h = 66.632 },
		DeletePoint = { x = -37.575, y = -620.391, z = 34.073 }
	},]]--
	Garage_IntegrityWay30 = {
		Private = "IntegrityWay30",
		GaragePoint = { x = -14.1, y = -614.93, z = 34.96 },
		SpawnPoint = { x = -7.351, y = -635.1, z = 34.724, h = 66.632 },
		DeletePoint = { x = -37.575, y = -620.391, z = 34.173 }
	},
	-- End of Intergrity Way Garages
	-- Start of Dell Perro Heights Garages
	Garage_DellPerroHeights = {
		Private = "DellPerroHeights",
		GaragePoint = { x = -1477.15, y = -517.17, z = 33.74 },
		SpawnPoint = { x = -1483.16, y = -505.1, z = 31.81, h = 299.89 },
		DeletePoint = { x = -1472.55, y = -492.29, z = 31.782 }
	},
	--[[Garage_DellPerroHeightst4 = {
		Private = "DellPerroHeightst4",
		GaragePoint = { x = -1477.15, y = -517.17, z = 33.74 },
		SpawnPoint = { x = -1483.16, y = -505.1, z = 31.81, h = 299.89 },
		DeletePoint = { x = -1472.55, y = -492.29, z = 31.782 }
	},]]--
	Garage_DellPerroHeightst7 = {
		Private = "DellPerroHeightst7",
		GaragePoint = { x = -1477.15, y = -517.17, z = 33.74 },
		SpawnPoint = { x = -1483.16, y = -505.1, z = 31.81, h = 299.89 },
		DeletePoint = { x = -1472.55, y = -492.29, z = 31.782 }
	},
	-- End of Dell Perro Heights Garages
	-- Start of Milton Drive Garages
	Garage_MiltonDrive = {
		Private = "MiltonDrive",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},
	Garage_Modern1Apartment = { 
		Private = "Modern1Apartment",
		GaragePoint = { x = -1796.36, y = 348.88, z = 87.56 },
		SpawnPoint = { x = -1796.36, y = 348.88, z = 88.56 , h = 20.65 },
		DeletePoint = { x = -1790.05, y = 354.21, z = 87.57 }
	},
	Garage_Modern2Apartment = {
		Private = "Modern2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},
	Garage_Modern3Apartment = {
		Private = "Modern3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},
--[[	Garage_Mody1Apartment = {
		Private = "Mody1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},]]--
	Garage_Mody2Apartment = {
		Private = "Mody2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},
	Garage_Mody3Apartment = {
		Private = "Mody3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},
--[[	Garage_Vibrant1Apartment = {
		Private = "Vibrant1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},]]--
	Garage_Vibrant2Apartment = {
		Private = "Vibrant2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},
	Garage_Vibrant3Apartment = {
		Private = "Vibrant3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},
	--[[Garage_Sharp1Apartment = {
		Private = "Sharp1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},]]--
	Garage_Sharp2Apartment = {
		Private = "Sharp2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},
	Garage_Sharp3Apartment = {
		Private = "Sharp3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},
	--[[Garage_Monochrome1Apartment = {
		Private = "Monochrome1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},]]--
	Garage_Monochrome2Apartment = {
		Private = "Monochrome2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},
	Garage_Monochrome3Apartment = {
		Private = "Monochrome3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},
	--[[Garage_Seductive1Apartment = {
		Private = "Seductive1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},]]--
	Garage_Seductive2Apartment = {
		Private = "Seductive2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},
	Garage_Seductive3Apartment = {
		Private = "Seductive3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},
	--[[Garage_Regal1Apartment = {
		Private = "Regal1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},]]--
	Garage_Regal2Apartment = {
		Private = "Regal2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},
	Garage_Regal3Apartment = {
		Private = "Regal3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},
	--[[Garage_Aqua1Apartment = {
		Private = "Aqua1Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},]]--
	Garage_Aqua2Apartment = {
		Private = "Aqua2Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},
	Garage_Aqua3Apartment = {
		Private = "Aqua3Apartment",
		GaragePoint = { x = -795.96, y = 331.83, z = 84.85 },
		SpawnPoint = { x = -800.496, y = 333.468, z = 84.7, h = 180.494 },
		DeletePoint = { x = -791.755, y = 333.468, z = 84.7 }
	},
	-- End of Milton Drive Garages
	-- Start of Single Garages
	--[[Garage_RichardMajesticApt2 = {
		Private = "RichardMajesticApt2",
		GaragePoint = { x = -887.5, y = -349.58, z = 33.534 },
		SpawnPoint = { x = -886.03, y = -343.78, z = 33.534, h = 206.79 },
		DeletePoint = { x = -894.324, y = -349.326, z = 33.534 }
	},]]--
	--[[Garage_WildOatsDrive = {
		Private = "WildOatsDrive",
		GaragePoint = { x = -178.65, y = 503.45, z = 135.85 },
		SpawnPoint = { x = -189.98, y = 505.8, z = 133.48, h = 282.62 },
		DeletePoint = { x = -189.28, y = 500.56, z = 132.93 }
	},]]--
	--[[Garage_WhispymoundDrive = {
		Private = "WhispymoundDrive",
		GaragePoint = { x = 123.65, y = 565.75, z = 183.04 },
		SpawnPoint = { x = 130.11, y = 571.47, z = 182.42, h = 270.71 },
		DeletePoint = { x = 131.97, y = 566.77, z = 181.95 }
	},]]--
	Garage_NorthConkerAvenue2044 = {
		Private = "NorthConkerAvenue2044",
		GaragePoint = { x = 348.18, y = 443.01, z = 146.7 },
		SpawnPoint = { x = 358.397, y = 437.064, z = 144.277, h = 285.911 },
		DeletePoint = { x = 351.383, y = 438.865, z = 145.66 }
	},
	--[[Garage_NorthConkerAvenue2045 = {
		Private = "NorthConkerAvenue2045",
		GaragePoint = { x = -2590.52, y = 1927.21, z = 167.11 },
		SpawnPoint = { x = -2584.94, y = 1931.15, z = 167.31, h = 256.48 },
		DeletePoint = { x = -2599.89, y = 1929.79, z = 167.31 }
	},]]--
	Garage_HillcrestAvenue2862 = {
		Private = "HillcrestAvenue2862",
		GaragePoint = { x = -688.71, y = 597.57, z = 142.64 },
		SpawnPoint = { x = -683.72, y = 609.88, z = 143.28, h = 338.06 },
		DeletePoint = { x = -685.259, y = 601.083, z = 142.365 }
	},
	Garage_HillcrestAvenue2868 = {
		Private = "HillcrestAvenue2868",
		GaragePoint = { x = -752.753, y = 624.901, z = 141.2 },
		SpawnPoint = { x = -749.32, y = 628.61, z = 141.48, h = 197.14 },
		DeletePoint = { x = -754.286, y = 631.581, z = 141.2 }
	},--[[
	Garage_HillcrestAvenue2874 = {
		Private = "HillcrestAvenue2874",
		GaragePoint = { x = -859.01, y = 695.95, z = 147.93 },
		SpawnPoint = { x = -863.681, y = 698.72, z = 147.052, h = 341.77 },
		DeletePoint = { x = -855.66, y = 698.77, z = 147.81 }
	},]]--
	--[[Garage_MadWayneThunder = {
		Private = "MadWayneThunder",
		GaragePoint = { x = -1290.95, y = 454.52, z = 96.66 },
		SpawnPoint = { x = -1297.62, y = 459.28, z = 96.48, h = 285.652 },
		DeletePoint = { x = -1298.088, y = 468.952, z = 96.0 }
	},]]--
	--[[Garage_TinselTowersApt12 = {
		Private = "TinselTowersApt12",
		GaragePoint = { x = -616.74, y = 56.38, z = 42.736 },
		SpawnPoint = { x = -620.588, y = 60.102, z = 42.736, h = 109.316 },
		DeletePoint = { x = -621.128, y = 52.691, z = 42.735 }
	},]]--
	-- End of Single Garages
	-- Start of VENT Custom Garages
	--[[Garage_MedEndApartment1 = {
		Private = "MedEndApartment1",
		GaragePoint = { x = 240.23, y = 3102.84, z = 41.49 },
		SpawnPoint = { x = 233.58, y = 3094.29, z = 41.49, h = 93.91 },
		DeletePoint = { x = 237.52, y = 3112.63, z = 41.39 }
	},]]--
	--[[Garage_MedEndApartment2 = {
		Private = "MedEndApartment2",
		GaragePoint = { x = 246.08, y = 3174.63, z = 41.72 },
		SpawnPoint = { x = 234.15, y = 3164.37, z = 41.54, h = 102.03 },
		DeletePoint = { x = 240.72, y = 3165.53, z = 41.65 }
	},]]--
	--[[Garage_MedEndApartment3 = {
		Private = "MedEndApartment3",
		GaragePoint = { x = 984.92, y = 2668.95, z = 39.06 },
		SpawnPoint = { x = 993.96, y = 2672.68, z = 39.06, h = 0.61 },
		DeletePoint = { x = 994.04, y = 2662.1, z = 39.13 }
	},]]--
	--[[Garage_MedEndApartment4 = {
		Private = "MedEndApartment4",
		GaragePoint = { x = 196.49, y = 3027.48, z = 42.89 },
		SpawnPoint = { x = 203.1, y = 3039.47, z = 42.08, h = 271.3 },
		DeletePoint = { x = 192.24, y = 3037.95, z = 42.89 }
	},]]--
	--[[Garage_MedEndApartment5 = {
		Private = "MedEndApartment5",
		GaragePoint = { x = 1724.49, y = 4638.13, z = 42.31 },
		SpawnPoint = { x = 1723.98, y = 4630.19, z = 42.23, h = 117.88 },
		DeletePoint = { x = 1733.66, y = 4635.08, z = 42.24 }
	},]]--
	--[[Garage_MedEndApartment6 = {
		Private = "MedEndApartment6",
		GaragePoint = { x = 1670.76, y = 4740.99, z = 41.08 },
		SpawnPoint = { x = 1673.47, y = 4756.51, z = 40.91, h = 12.82 },
		DeletePoint = { x = 1668.46, y = 4750.83, z = 40.88 }
	},]]--
	Garage_MedEndApartment7 = {
		Private = "MedEndApartment7",
		GaragePoint = { x = 15.24, y = 6573.38, z = 31.72 },
		SpawnPoint = { x = 16.77, y = 6581.68, z = 31.42, h = 222.6 },
		DeletePoint = { x = 10.45, y = 6588.04, z = 31.47 }
	},
	Garage_MedEndApartment8 = {
		Private = "MedEndApartment8",
		GaragePoint = { x = -374.73, y = 6187.06, z = 30.54 },
		SpawnPoint = { x = -377.97, y = 6183.73, z = 30.49, h = 223.71 },
		DeletePoint = { x = -383.31, y = 6188.85, z = 30.49 }
	},
	--[[Garage_MedEndApartment9 = {
		Private = "MedEndApartment9",
		GaragePoint = { x = -24.6, y = 6605.99, z = 30.45 },
		SpawnPoint = { x = -16.0, y = 6607.74, z = 30.18, h = 35.31 },
		DeletePoint = { x = -9.36, y = 6598.86, z = 30.47 }
	},]]--
	--[[Garage_MedEndApartment10 = {
		Private = "MedEndApartment10",
		GaragePoint = { x = -365.18, y = 6323.95, z = 28.9 },
		SpawnPoint = { x = -359.49, y = 6327.41, z = 28.83, h = 218.58 },
		DeletePoint = { x = -353.47, y = 6334.57, z = 28.83 }
	},]]--
		Garage_WAKHouse = {
		Private = "WAKHouse",
		GaragePoint = { x = -156.15, y = 918.43, z = 234.66 },
		SpawnPoint = { x = -148.7, y = 922.95, z = 235.71, h = 222.39 },
		DeletePoint = { x = -155.11, y = 940.24, z = 234.66 }
	},
		Garage_Rumah6010 = {
		Private = "Rumah6010",
		GaragePoint = { x = -1944.52, y = 446.2, z = 101.7 },
		SpawnPoint = { x = -1956.33, y = 438.25, z = 100.19, h = 113.39 },
		DeletePoint = { x = -1943.09, y = 461.3, z = 101.20 }
	},
	         Garage_Rumah6070 = {
        Private = "Rumah6070",
        GaragePoint = { x = 1414.48, y = 1124.4, z = 113.84 },
        SpawnPoint = { x = 1406.41, y = 1118.88, z = 114.84, h = 91.18 },
        DeletePoint = { x = 1451.34, y = 1114.44, z = 113.33 }
	},
	   Garage_WAKKHouse = {
        Private = "WAKKHouse",
        GaragePoint = { x = -3027.22, y = 744.51, z = 26.59 },
        SpawnPoint = { x = -3041.44, y = 741.82, z = 22.13, h = 82.62 },
        DeletePoint = { x = -3018.21, y = 739.49, z = 26.63 }
	},
	       Garage_Rumah838 = {
        Private = "Rumah838",
        GaragePoint = { x = -1811.95, y = 450.34, z = 127.51 },
        SpawnPoint = { x = -1807.27, y = 456.86, z = 128.28, h = 78.68 },
        DeletePoint = { x = -1790.33, y = 461.44, z = 127.31 }
    },
	      Garage_Rumah606 = {
        Private = "Rumah606",
        GaragePoint = { x = -1870.01, y = 326.3, z = 87.65 },
        SpawnPoint = { x = -1870.01, y = 326.3, z = 87.65, h = 9.78 },
        DeletePoint = { x = -1857.37, y = 324.92, z = 87.7 }
    },
			Garage_Rumah6029 = {
        Private = "Rumah6029",
        GaragePoint = { x = -1753.78, y = 368.29, z = 88.66 },
        SpawnPoint = { x = -1761.33, y = 363.58, z = 89.17, h = 29.32 },
        DeletePoint = { x = -1748.2, y = 366.31, z = 88.73 }
    },
			Garage_Rumah6026 = {
        Private = "Rumah6026",
        GaragePoint = { x = -1857.66, y = 333.32, z = 87.59 },
        SpawnPoint = { x = -1857.66, y = 333.32, z = 87.59, h = 11.02 },
        DeletePoint = { x = -1857.66, y = 333.32, z = 87.59 }
    },
         Garage_RumahGON = {
        Private = "RumahGON",
        GaragePoint = { x = -1607.25, y = 35.83, z = 60.6 },
        SpawnPoint = { x = -1607.25, y = 35.83, z = 60.6, h = 331.08 },
        DeletePoint = { x = -1614.97, y = 18.04, z = 61.18 }
    },
	     Garage_Rumah7035 = {
        Private = "Rumah7035",
        GaragePoint = { x = -1556.08, y = -33.99, z = 277.24 },
        SpawnPoint = { x = -1556.08, y = -33.99, z = 273.54, h = 274.54 },
        DeletePoint = { x = -1587.1, y = -58.92, z = 56.48 }
    },
	   Garage_Rumah7062 = {
        Private = "Rumah7062",
        GaragePoint = { x = -952.8, y = 187.12, z = 65.59 },
        SpawnPoint = { x = -952.8, y = 187.12, z = 66.59, h = 86.9 },
        DeletePoint = { x = -932.93, y = 209.21, z = 66.49 }
    },
		Garage_RumahTAKPOR = {
		Private = "RumahTAKPOR",
		GaragePoint = { x = -812.49, y = 157.01, z = 70.29 },
		SpawnPoint = { x = -826.46, y = 157.49, z = 69.35, h = 80.87 },
		DeletePoint = { x = -812.06, y = 187.27, z = 71.47 }
	},
		Garage_RumahkUCING = {
		Private = "RumahkUCING",
		GaragePoint = { x = -1396.6, y = 49.9, z = 52.45 },
		SpawnPoint = { x = -1396.6, y = 49.9, z = 53.45, h = 185.97 },
		DeletePoint = { x = -1398.22, y = 81.24, z = 52.64 }
	},
		Garage_RumahELWS = {
		Private = "RumahELWS",
		GaragePoint = { x = -2584.88, y = 1931.01, z = 166.31 },
		SpawnPoint = { x = -2584.88, y = 1931.01, z = 166.31, h = 249.05 },
		DeletePoint = { x = -2584.88, y = 1931.01, z = 166.31 }
	},
		Garage_RumahGRAX = {
		Private = "RumahGRAX",
		GaragePoint = { x = -1542.94, y = 129.27, z = 55.78 },
		SpawnPoint = { x = -1543.75, y = 124.25, z = 56.78, h = 190.64 },
		DeletePoint = { x = -1552.95, y = 132.68, z = 55.81 }
	},
	-- RUMAHWAK28 luis vold
	Garage_RUMAHWAK28 = { 
		Private = "RUMAHWAK28",
		GaragePoint = { x = 860.45, y = -523.18, z = 56.26 },
		SpawnPoint = { x = 860.45, y = -523.18, z = 56.26 , h = 224.13 },
		DeletePoint = { x = 855.36, y = -518.52, z = 56.3 }
	},
	-- RUMAHWAK28 Ghama
	Garage_RUMAHWAK1 = { 
		Private = "RUMAHWAK1",
		GaragePoint = { x = 977.24, y = -617.01, z = 57.84 },
		SpawnPoint = { x = 977.24, y = -617.01, z = 57.84 , h = 126.37 },
		DeletePoint = { x = 977.24, y = -617.01, z = 57.84 }
	},
	Garage_RUMAHDINAS3 = { 
		Private = "RUMAHDINAS3",
		GaragePoint = { x = 1.28, y = 469.26, z = 144.79 },
		SpawnPoint = { x = 1.28, y = 469.26, z = 145.79 , h = 280.71 },
		DeletePoint = { x = 1.28, y = 469.26, z = 144.79 }
	},
	Garage_RUMAHDINAS2 = { 
		Private = "RUMAHDINAS2",
		GaragePoint = { x = -251.42, y = 493.42, z = 124.05 },
		SpawnPoint = { x = -251.42, y = 493.42, z = 124.05 , h = 320.5 },
		DeletePoint = { x = -251.42, y = 493.42, z = 124.05 }
	},
	Garage_RUMAHDINAS1 = { 
		Private = "RUMAHDINAS1",
		GaragePoint = { x = -188.34, y = 502.57, z = 133.48 },
		SpawnPoint = { x = -188.34, y = 502.57, z = 133.48 , h = 334.62 },
		DeletePoint = { x = -188.34, y = 502.57, z = 133.48 }
	},
	Garage_RUMAHDINAS4 = { 
		Private = "RUMAHDINAS4",
		GaragePoint = { x = -77.78, y = 497.77, z = 143.37 },
		SpawnPoint = { x = -77.78, y = 497.77, z = 143.37 , h = 294.05 },
		DeletePoint = { x = -77.78, y = 497.77, z = 143.37 }
	},
	Garage_RUMAHDINAS6 = { 
		Private = "RUMAHDINAS6",
		GaragePoint = { x = -1549.96, y = 427.56, z = 108.39 },
		SpawnPoint = { x = -1549.96, y = 427.56, z = 108.39 , h = 268.65 },
		DeletePoint = { x = -1549.96, y = 427.56, z = 108.39 }
	},
	-- pak RB WI
		Garage_RumahGERAL = {
		Private = "RumahGERAL",
		GaragePoint = { x = -676.22, y = 904.48, z = 229.13 },
		SpawnPoint = { x = -676.22, y = 904.48, z = 229.13, h = 318.79 },
		DeletePoint = { x = -676.22, y = 904.48, z = 229.13 }
	},
		-- gama
		Garage_Rumah659 = {
		Private = "Rumah659",
		GaragePoint = { x = -1089.65, y = -307.28, z = 36.52 },
		SpawnPoint = { x = -1089.65, y = -307.28, z = 36.82, h = 46.14 },
		DeletePoint = { x = -1089.65, y = -307.28, z = 36.52 }
	},
		-- LODANG
		Garage_RumahLODANG = {
		Private = "RumahLODANG",
		GaragePoint = { x = -112.72, y = 1005.38, z = 234.77 },
		SpawnPoint = { x = -112.72, y = 1005.38, z = 234.77, h = 109.19 },
		DeletePoint = { x = -112.72, y = 1005.38, z = 234.77 }
	},
	 -- You Know Jho ?
	Garage_RUMAHWAK64 = { 
		Private = "RUMAHWAK64",
		GaragePoint = { x = 1105.38, y = -399.05, z = 66.91 },
		SpawnPoint = { x = 1105.38, y = -399.05, z = 66.91 , h = 75.58 },
		DeletePoint = { x = 1105.38, y = -399.05, z = 66.91 }
	},
	 -- brar 01-05-21 ?
	Garage_RUMAHWAK30 = { 
		Private = "RUMAHWAK30",
		GaragePoint = { x = 914.59, y = -490.58, z = 57.99 },
		SpawnPoint = { x = 914.59, y = -490.58, z = 57.99 , h = 199.67 },
		DeletePoint = { x = 914.59, y = -490.58, z = 57.99 }
	},
	 -- bogieman 07-05-21 ?
	Garage_RUMAHWAK22 = { 
		Private = "RUMAHWAK22",
		GaragePoint = { x = 926.7, y = -629.37, z = 56.86 },
		SpawnPoint = { x = 926.7, y = -629.37, z = 56.86 , h = 317.2 },
		DeletePoint = { x = 926.7, y = -629.37, z = 56.86 }
	},
	 -- bogieman 07-05-21 ?
	Garage_RUMAHWAK22 = { 
		Private = "RUMAHWAK22",
		GaragePoint = { x = 926.7, y = -629.37, z = 56.86 },
		SpawnPoint = { x = 926.7, y = -629.37, z = 56.86 , h = 317.2 },
		DeletePoint = { x = 926.7, y = -629.37, z = 56.86 }
	},
	 -- 07-06-21 ?
	Garage_RUMAHWAK12 = { 
		Private = "RUMAHWAK12",
		GaragePoint = { x = 1063.07, y = -445.94, z = 64.84 },
		SpawnPoint = { x = 1063.07, y = -445.94, z = 64.84 , h =  256.59},
		DeletePoint = { x = 1063.07, y = -445.94, z = 64.84 }
	},
	 -- 07-06-21 ?
	Garage_RUMAHWAK10 = { 
		Private = "RUMAHWAK10",
		GaragePoint = { x = 1052.13, y = -488.63, z = 62.91 },
		SpawnPoint = { x = 1052.13, y = -488.63, z = 62.91 , h =  256.29},
		DeletePoint = { x = 1052.13, y = -488.63, z = 62.91 }
	},
	 -- legawa
	Garage_Rumah6067 = { 
		Private = "Rumah6067",
		GaragePoint = { x = -106.53, y = 833.96, z = 234.72 },
		SpawnPoint = { x = -106.53, y = 833.96, z = 234.72 , h =  357.94},
		DeletePoint = { x = -106.53, y = 833.96, z = 234.72 }
	},
	 -- Nyun 01-05-21 ?
	Garage_RUMAHWAK27 = { 
		Private = "RUMAHWAK27",
		GaragePoint = { x = 851.44, y = -542.39, z = 56.32 },
		SpawnPoint = { x = 851.44, y = -542.39, z = 56.32 , h = 264.31 },
		DeletePoint = { x = 851.44, y = -542.39, z = 56.32 }
	},
 -- rumah Far1za
    Garage_RUMAHWAK54 = { 
        Private = "RUMAHWAK54",
        GaragePoint = { x = 1246.23, y = -577.77, z = 68.27 },
        SpawnPoint = { x = 1246.23, y = -577.77, z = 68.27 , h = 273.21 },
        DeletePoint = { x = 1246.23, y = -577.77, z = 68.27 }
    },
	 -- rumah janudp
	Garage_RUMAHWAK26 = { 
		Private = "RUMAHWAK26",
		GaragePoint = { x = 851.44, y = -566.18, z = 56.52 },
		SpawnPoint = { x = 851.44, y = -566.18, z = 56.32 , h = 280.86 },
		DeletePoint = { x = 851.44, y = -566.18, z = 56.52 }
	},
	 -- rumah JUSTIN
	Garage_RUMAHWAK70 = { 
		Private = "RUMAHWAK70",
		GaragePoint = { x = 942.7, y = -468.78, z = 60.25 },
		SpawnPoint = { x = 942.7, y = -468.78, z = 60.25 , h = 215.59 },
		DeletePoint = { x = 942.7, y = -468.78, z = 60.25 }
	},
	 -- rumah 6203
	Garage_Rumah6203 = { 
		Private = "Rumah6203",
		GaragePoint = { x = -1061.35, y = 304.08, z = 64.97 },
		SpawnPoint = { x =  -1061.35, y = 304.08, z = 64.97 , h = 352.24 },
		DeletePoint = { x =  -1061.35, y = 304.08, z = 64.97 }
	},
	 -- rumah 7036
	Garage_Rumah7036 = { 
		Private = "Rumah7036",
		GaragePoint = { x = -1490.3, y = 24.83, z = 53.75 },
		SpawnPoint = { x =  -1490.3, y = 24.83, z = 53.75 , h = 348.3 },
		DeletePoint = { x =  -1490.3, y = 24.83, z = 53.75 }
	},
	 -- rumah beniarjaya
	Garage_RUMAHWAK4 = { 
		Private = "RUMAHWAK4",
		GaragePoint = { x = 985.14, y = -577.07, z = 58.28 },
		SpawnPoint = { x = 985.14, y = -577.07, z = 58.28 , h = 31.92 },
		DeletePoint = { x = 985.14, y = -577.07, z = 58.28 }
	},
	 -- rumah EnjoyYourself
	Garage_RUMAHWAK14 = { 
		Private = "RUMAHWAK14",
		GaragePoint = { x = 961.6, y = -500.48, z = 60.49 },
		SpawnPoint = { x = 961.6, y = -500.48, z = 60.49 , h = 37.78 },
		DeletePoint = { x = 961.6, y = -500.48, z = 60.49 }
	},
	 -- rumah ZACK
	Garage_RUMAHWAK56 = { 
		Private = "RUMAHWAK56",
		GaragePoint = { x = 1258.57, y = -493.02, z = 68.44 },
		SpawnPoint = { x = 1258.57, y = -493.02, z = 68.44 , h = 249.35 },
		DeletePoint = { x = 1258.57, y = -493.02, z = 68.44 }
	},
	 -- 
	Garage_RUMAHWAK23 = { 
		Private = "RUMAHWAK23",
		GaragePoint = { x = 914.24, y = -4624.32, z = 57.05 },
		SpawnPoint = { x = 914.24, y = -4624.32, z = 57.05 , h = 296.43 },
		DeletePoint = { x = 914.24, y = -4624.32, z = 57.05 }
	},
	 -- CHAMP19NS 11-05-21 ?
	Garage_RUMAHWAK20 = { 
		Private = "RUMAHWAK20",
		GaragePoint = { x = 947.21, y = -668.92, z = 57.05 },
		SpawnPoint = { x = 947.21, y = -668.92, z = 57.05 , h = 297.74 },
		DeletePoint = { x = 947.21, y = -668.92, z = 57.05 }
	},
	 -- mircel 26 -05
	Garage_RUMAHWAK9 = { 
		Private = "RUMAHWAK9",
		GaragePoint = { x = 1004.87, y = -517.88, z = 59.69 },
		SpawnPoint = { x = 1004.87, y = -517.88, z = 59.69, h = 208.37 },
		DeletePoint = { x = 1004.87, y = -517.88, z = 59.69 }
	},
	 -- mircel permanen
	Garage_Rumah6190 = { 
		Private = "Rumah6190",
		GaragePoint = { x = -824.31, y = 272.2, z = 85.27 },
		SpawnPoint = { x = -824.31, y = 272.2, z = 85.27, h = 331.71 },
		DeletePoint = { x = -824.31, y = 272.2, z = 85.27 }
	},
	 -- rumah event ramadhan permanen
	Garage_Rumah6130 = { 
		Private = "Rumah6130",
		GaragePoint = { x = -1270.01, y = 503.61, z = 96.18 },
		SpawnPoint = { x = -1270.01, y = 503.61, z = 96.18, h = 181.87 },
		DeletePoint = { x = -1270.01, y = 503.61, z = 96.18 }
	},
	 -- rumah bulnana 16 - 06
	Garage_Rumah6061 = { 
		Private = "Rumah6061",
		GaragePoint = { x = -342.47, y = 633.67, z = 171.34 },
		SpawnPoint = { x = -342.47, y = 633.67, z = 171.34, h = 56.36 },
		DeletePoint = { x = -342.47, y = 633.67, z = 171.34 }
	},
	 -- Noir 70 no 68 permanen
	Garage_RUMAHWAK68 = { 
		Private = "RUMAHWAK68",
		GaragePoint = { x = 997.52, y = -435.36, z = 63.04 },
		SpawnPoint = { x = 997.52, y = -435.36, z = 63.04, h = 236.79 },
		DeletePoint = { x = 997.52, y = -435.36, z = 63.04 }
	},
	Garage_RUMAHWAK39 = { 
		Private = "RUMAHWAK39",
		GaragePoint = { x = 1319.72, y = -573.99, z = 71.93 },
		SpawnPoint = { x = 1319.72, y = -573.99, z = 71.93 , h = 339.29 },
		DeletePoint = { x = 1312.01, y = -590.38, z = 71.85 }
	},
	Garage_FikiHouse = { 
		Private = "FikiHouse",
		GaragePoint = { x = -3202.19, y = 814.92, z = 7.93 },
		SpawnPoint = { x = -3202.19, y = 814.92, z = 8.93 , h = 211.04 },
		DeletePoint = { x = -3191.62, y = 820.89, z = 7.93 }
	},
	Garage_RUMAHWAK24 = {
		Private = "RUMAHWAK24",
		GaragePoint = { x = 879.83, y = -598.39, z = 57.20 },
		SpawnPoint = { x = 879.39, y = -592.38, z = 57.76, h = 321.12 },
		DeletePoint = { x = 872.49, y = -600.19, z = 57.25 }
	}
	-- End of VENT Custom Garages
}

-- End of Private Garages
