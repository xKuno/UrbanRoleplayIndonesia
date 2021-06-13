Crafting = {}
-- You can configure locations here
Crafting.Locations = {
[1] = {x = 605.45, y = -3094.59, z = 6.07},
}
--[[
    You can add or remove if you want, be sure to use the right format like this:
    ["item_name"] = {
        label = "Item Label",
        needs = {
            ["item_to_use_name"] = {label = "Item Use Label", count = 1}, 
            ["item_to_use_name2"] = {label = "Item Use Label", count = 2},
        },
        threshold = 0,
    },

    #! 
        Threshold level is a level that gets saved (in the database) by crafting, if you craft succefully you gain points, if you fail you lose points.
        The threshold level can be changed to your liking.
    #!

    Also if you don't have the items below make sure to remove it and create your own version.
]]--
Crafting.Items = {
    --[[    ["WEAPON_PISTOL50"] = {
        label = "Pistol .50",
        needs = {
            ["opium_pooch"] = {label = "O", count = 7},
            ["iron"] = {label = "I", count = 20},
            ["copper"] = {label = "C", count = 20},
            ["packaged_plank"] = {label = "P W", count = 25},
            ["fish"] = {label = "F", count = 25},
			["blueprint_p50"] = {label = "B", count = 1},
        },
        threshold = 0,

    },   
    ["WEAPON_MACHINEPISTOL"] = {
        label = "Machine Pistol",
        needs = {
            ["meth_pooch"] = {label = "M", count = 7},
            ["iron"] = {label = "I", count = 25},
            ["copper"] = {label = "C", count = 20},
            ["packaged_chicken"] = {label = "C F", count = 25},
            ["fish"] = {label = "F", count = 25},
			["blueprint_mpistol"] = {label = "B", count = 1},
        },
        threshold = 0,

    },    ]]--
    ["WEAPON_CARBINERIFLE"] = {
        label = "Carbine Rifle",
        needs = {
            ["opium_pooch"] = {label = "Opium Pooch", count = 5},
            ["iron"] = {label = "Iron", count = 20},
            ["copper"] = {label = "Cooper", count = 30},
            ["packaged_plank"] = {label = "Packaged Plank", count = 20},
            ["packaged_chicken"] = {label = "Packaged Chicken", count = 30},
            ["fabric"] = {label = "Fabric", count = 15},
			["blueprint_senjata"] = {label = "Blueprint Senjata", count = 1},
        },
        threshold = 0,

    },   
 ["WEAPON_REVOLVER_MK2"] = {
        label = "Phyton Magnum",
        needs = {
		    ["meth_pooch"] = {label = "Meth Pooch", count = 5},
            ["iron"] = {label = "Iron", count = 20},
            ["copper"] = {label = "Cooper", count = 25},
            ["packaged_plank"] = {label = "Packaged Plank", count = 20},
            ["packaged_chicken"] = {label = "Packaged Chicken", count = 20},
            ["fabric"] = {label = "Fabric", count = 25},
			["fish"] = {label = "Fish", count = 20},
			["blueprint_senjata"] = {label = "Blueprint Senjata", count = 1},
        },
        threshold = 0,

    }, 
	
    ["MedArmor"] = {
        label = "Armor Level 2",
        needs = {
            ["weed_pooch"] = {label = "Weed Pooch", count = 5},
            ["iron"] = {label = "iron", count = 10},
            ["copper"] = {label = "Cooper", count = 10},
            ["packaged_plank"] = {label = "Packaged Plank", count = 30},
            ["packaged_chicken"] = {label = "Packaged Chicken", count = 30},
            ["fish"] = {label = "Fish", count = 20},
            ["blueprint_armor"] = {label = "Blueprint Armor", count = 1},
            ["fabric"] = {label = "Fabric", count = 20},
        },
        threshold = 0,
    },
	
	   ["clip"] = {
        label = "Clip Peluru",
        needs = {
            ["weed_pooch"] = {label = "Weed Pooch", count = 3},
            ["iron"] = {label = "Iron", count = 10},
            ["copper"] = {label = "Copper", count = 7},
            ["blueprint_clip"] = {label = "Blueprint Clip", count = 1},
            ["packaged_plank"] = {label = "Packaged Plank", count = 5},
        },
        threshold = 0,
    },
	
	  ["WEAPON_POOLCUE"] = {
        label = "Pool Cue/Katana",
        needs = {
            ["iron"] = {label = "Iron", count = 7},
            ["copper"] = {label = "Copper", count = 5},
            ["blueprint_katana"] = {label = "Blueprint Katana", count = 1},
            ["packaged_plank"] = {label = "Packaged Plank", count = 10},
        },
        threshold = 0,
    },

}