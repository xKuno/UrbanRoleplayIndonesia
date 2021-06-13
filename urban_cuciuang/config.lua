Config              = {}
Config.DrawDistance = 10.0
Config.Locale = 'en'
Config.Jobs         = {
	mafia = {

		BlipInfos = {
			Sprite = 68,
			Color = 38
		},
	
		Zones = {
	
			Delivery = {
				Pos   = {x = 1198.67, y = -3118.99, z = 5.54},
				Color = {r = 204, g = 0, b = 0},
				Size  = {x = 0.5, y = 0.5, z = 0.5},
				Color = {r = 204, g =0, b = 0},
				Marker= 29,
				Blip  = false,
				Name  = _U('delivery_point'),
				Type  = "delivery",
				Spawner = 2,
				Hint  = _U('fm_deliver_fish'),
				GPS   = {x = 3867.44, y = 4463.62, z = 1.72},
				Item = {
					{
					name   = _U('delivery'),
					time   = 0,
					remove = 100,
					max    = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price  = 95,
					requires = "black_money",
					requires_name = 'Uang Kotor',
					drop   = 100
					}
				}
			}
	
		}
	},

	biker = {

		BlipInfos = {
			Sprite = 68,
			Color = 38
		},
	
		Zones = {
	
			Delivery = { 
				Pos   = {x = 1198.67, y = -3118.99, z = 5.54},
				Color = {r = 204, g = 0, b = 0},
				Size  = {x = 0.5, y = 0.5, z = 0.5},
				Color = {r = 204, g =0, b = 0},
				Marker= 29,
				Blip  = false,
				Name  = _U('delivery_point'),
				Type  = "delivery",
				Spawner = 2,
				Hint  = _U('fm_deliver_fish'),
				GPS   = {x = 3867.44, y = 4463.62, z = 1.72},
				Item = {
					{
					name   = _U('delivery'),
					time   = 0,
					remove = 100,
					max    = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price  = 95,
					requires = "black_money",
					requires_name = 'Uang Kotor',
					drop   = 100
					}
				}
			}
	
		}
	},

kompatriot = {

		BlipInfos = {
			Sprite = 68,
			Color = 38
		},
	
		Zones = {
	
			Delivery = { 
				Pos   = {x = 1198.67, y = -3118.99, z = 5.54},
				Color = {r = 204, g = 0, b = 0},
				Size  = {x = 0.5, y = 0.5, z = 0.5},
				Color = {r = 204, g =0, b = 0},
				Marker= 29,
				Blip  = false,
				Name  = _U('delivery_point'),
				Type  = "delivery",
				Spawner = 2,
				Hint  = _U('fm_deliver_fish'),
				GPS   = {x = 3867.44, y = 4463.62, z = 1.72},
				Item = {
					{
					name   = _U('delivery'),
					time   = 0,
					remove = 100,
					max    = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price  = 95,
					requires = "black_money",
					requires_name = 'Uang Kotor',
					drop   = 100
					}
				}
			}
	
		}
	},
	
	gang = {

		BlipInfos = {
			Sprite = 68,
			Color = 38
		},
	
		Zones = {
	
			Delivery = { 
				Pos   = {x = 1198.67, y = -3118.99, z = 5.54},
				Color = {r = 204, g = 0, b = 0},
				Size  = {x = 0.5, y = 0.5, z = 0.5},
				Color = {r = 204, g =0, b = 0},
				Marker= 29,
				Blip  = false,
				Name  = _U('delivery_point'),
				Type  = "delivery",
				Spawner = 2,
				Hint  = _U('fm_deliver_fish'),
				GPS   = {x = 3867.44, y = 4463.62, z = 1.72},
				Item = {
					{
					name   = _U('delivery'),
					time   = 0,
					remove = 100,
					max    = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price  = 95,
					requires = "black_money",
					requires_name = 'Uang Kotor',
					drop   = 100
					}
				}
			}
	
		}
	},

	yakuza = {

		BlipInfos = {
			Sprite = 68,
			Color = 38
		},
	
		Zones = {
	
			Delivery = { 
				Pos   = {x = 1198.67, y = -3118.99, z = 5.54},
				Color = {r = 204, g = 0, b = 0},
				Size  = {x = 0.5, y = 0.5, z = 0.5},
				Color = {r = 204, g =0, b = 0},
				Marker= 29,
				Blip  = false,
				Name  = _U('delivery_point'),
				Type  = "delivery",
				Spawner = 2,
				Hint  = _U('fm_deliver_fish'),
				GPS   = {x = 3867.44, y = 4463.62, z = 1.72},
				Item = {
					{
					name   = _U('delivery'),
					time   = 0,
					remove = 100,
					max    = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price  = 95,
					requires = "black_money",
					requires_name = 'Uang Kotor',
					drop   = 100
					}
				}
			}
	
		}
	},
	
	ackerman = {

		BlipInfos = {
			Sprite = 68,
			Color = 38
		},
	
		Zones = {
	
			Delivery = { 
				Pos   = {x = 1198.67, y = -3118.99, z = 5.54},
				Color = {r = 204, g = 0, b = 0},
				Size  = {x = 0.5, y = 0.5, z = 0.5},
				Color = {r = 204, g =0, b = 0},
				Marker= 29,
				Blip  = false,
				Name  = _U('delivery_point'),
				Type  = "delivery",
				Spawner = 2,
				Hint  = _U('fm_deliver_fish'),
				GPS   = {x = 3867.44, y = 4463.62, z = 1.72},
				Item = {
					{
					name   = _U('delivery'),
					time   = 0,
					remove = 100,
					max    = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price  = 95,
					requires = "black_money",
					requires_name = 'Uang Kotor',
					drop   = 100
					}
				}
			}
	
		}
	},

	cartel = {

		BlipInfos = {
			Sprite = 68,
			Color = 38
		},
	
		Zones = {
	
			Delivery = { 
				Pos   = {x = 1198.67, y = -3118.99, z = 5.54},
				Color = {r = 204, g = 0, b = 0},
				Size  = {x = 0.5, y = 0.5, z = 0.5},
				Color = {r = 204, g =0, b = 0},
				Marker= 29,
				Blip  = false,
				Name  = _U('delivery_point'),
				Type  = "delivery",
				Spawner = 2,
				Hint  = _U('fm_deliver_fish'),
				GPS   = {x = 3867.44, y = 4463.62, z = 1.72},
				Item = {
					{
					name   = _U('delivery'),
					time   = 0,
					remove = 100,
					max    = 100, -- if not present, probably an error at itemQtty >= item.max in esx_jobs_sv.lua
					price  = 95,
					requires = "black_money",
					requires_name = 'Uang Kotor',
					drop   = 100
					}
				}
			}
	
		}
	}

}