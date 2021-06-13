Config              = {}
Config.MarkerType   = 1
Config.DrawDistance = 100.0
Config.ZoneSize     = {x = 10.0, y = 10.0, z = 5.0}
Config.MarkerColor  = {r = 100, g = 204, b = 100}
Config.RequiredCopsCoke = 3
Config.RequiredCopsMeth = 3
Config.RequiredCopsWeed = 3
Config.RequiredCopsOpium = 3
Config.Locale = 'en'

Config.Zones = {
--	CokeFarm =			{x = 2181.8,	y = 5011.21,	z=42.94},
	CokeTreatment =		{x = -290.48,	y=2544.39,		z=75.42},
	CokeResell =		{x = -52.81,	y=-2522.8,		z=7.4},
--	MethFarm =			{x = 1580.45,	y=2169.83,		z=79.21},
	MethTreatment =		{x = 750.92,	y=1273.98,		z=360.3},
	MethResell =		{x = -95.17,	y=1887.57,		z=197.33},
--	WeedFarm =			{x = 311.01,	y=4275.71,		z=43.01},
	WeedTreatment =		{x = 1443.07,	y=6332.63,		z=23.98},
	WeedResell =		{x = 1390.62,	y=3606.89,		z=38.94},
--	OpiumFarm =			{x = 177.26,	y=2230.07,		z=90.01},
	OpiumTreatment =	{x = -1148.63,	y=4939.95,		z=222.27},
	OpiumResell =		{x = 1272.18,	y = -1711.87,	z=54.77}
}

Config.CircleZones = {
	WeedField = {coords = vector3(311.01, 4275.71, 43.01), name = 'Weed Field', color = 25, sprite = 496, radius = 100.0},
	WeedProcessing = {coords = vector3(1443.07, 6332.63, 23.98), name = 'Weed Processing', color = 25, sprite = 496, radius = 100.0},

}