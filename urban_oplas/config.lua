Config = {}
Config.Locale = 'en'

Config.MarkerType   = 1
Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 2.0, y = 2.0, z = 1.0}
Config.MarkerColor  = {r = 255, g = 255, b = 255}

Config.BlipPlasticSurgery = {
	Sprite = 403,
	Color = 0,
	Display = 2,
	Scale = 1.0
}

Config.Price = 500000 -- Edit to your liking.

Config.EnableUnemployedOnly = false -- If true it will only show Blips to Unemployed Players | false shows it to Everyone.
Config.EnableBlips = false -- If true then it will show blips | false does the Opposite.
Config.EnablePeds = false -- If true then it will add Peds on Markers | false does the Opposite.

Config.Locations = {
	--{ x = 402.85, y = -998.4, z = -100.0, heading = 180.0 }, -- Police Booking Room
	{ x = -793.45, y = -1214.46, z = 7.34, heading = 141.22 } -- Hospital Bottom Floor
}

Config.Zones = {}

for i=1, #Config.Locations, 1 do
	Config.Zones['Shop_' .. i] = {
		Pos   = Config.Locations[i],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType
	}
end
