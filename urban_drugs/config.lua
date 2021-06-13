Config = {}


Config.Locale = 'id'

Config.PoliceNumberRequired = 1

Config.Delays = {
	WeedProcessing = 1000 * 10
}
Config.DrugDealerItems = {
    opium_pooch = 91,
    weed_pooch = 91,
    meth_pooch = 91,
    coke_pooch = 91
}

Config.LicenseEnable = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. Requires esx_license

Config.LicensePrices = {
	weed_processing = {label = _U('license_weed'), price = 15000}
}

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	WeedField = {coords = vector3(314.21, 4310.04, 47.37)}, --name = _U('blip_weedfield'), color = 25, sprite = 496, radius = 100.0},
	WeedProcessing = {coords = vector3(-611.43, -5434.2, 708.02)}, -- name = _U('blip_weedprocessing'), color = 25, sprite = 496, radius = 100.0},

	MethField = {coords = vector3(2827.66, -662.4, 1.8)}, --name = _U('blip_methField'),color = 25, sprite = 496, radius = 20.0},
    MethProcessing = {coords = vector3(-611.43, -5434.2, 708.02)},-- name = _U('blip_methprocessing'), color = 25, sprite = 496, radius = 0.0},
		
	CokeField = {coords = vector3(2181.8, 5011.21, 42.94)}, --name = _U('blip_CokeFarm'), color = 25, sprite = 496, radius = 20.0},
	CokeProcessing = {coords = vector3(-611.43, -5434.2, 708.02)}, --name = _U('blip_Cokeprocessing'),color = 25, sprite = 496, radius = 20.0},
		
	OpiumField = {coords = vector3(-2200.69, 5122.13, 12.29)}, --name = _U('blip_OpiumField'), color = 25, sprite = 496, radius = 20},
	OpiumProcessing = {coords = vector3(-611.43, -5434.2, 708.02)}, --name = _U('blip_OpiumProcessing'), color = 25, sprite = 496, radius = 100.0},	
	
	DrugDealer = {coords = vector3(-611.43, -5434.2, 708.02)}, -- name = _U('blip_drugdealer'), color = 6, sprite = 378, radius = 25.0},
}
