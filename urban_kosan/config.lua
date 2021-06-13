Config = {}

Config.NewESX                 = false    -- true for ESX v1.2 above (weight)
Config.PriceRental            = 30000      -- How much rental of a Motel Room apartment is - 0 = Free.
Config.Locale                 = 'en'    -- Only defaultly supports English, feel free to add addtional language support.
Config.SwitchCharacterSup     = false    -- Optional Please ensure you have added xXFriendlysXx Switch Character fix aswell.

Config.rentTimer = 24 -- Time in hours, time between payments.
Config.autoRemoveMotel = 7 * Config.rentTimer -- This will remove the room after 7 missed payments.

Config.RoomMarker = {
    Owned = {r = 255, g = 0, b = 0},     -- Owned Motel Color
	x = 0.5, y = 0.5, z = 0.7  -- Standard Size Circle
}

Config.Zones = {

   PinkCage = {
        Name = "URI Heritage",
        Pos = {x = 324.55, y = -212.44, z = 54.15, color = 1, sprite = 475, size = 0.6},
        roomExit = {x = 0, y = 0, z = 0}, -- The Exit marker of the room, usually the only door hehe
        roomLoc = {x = 151.25, y = -1007.74, z = -99.00}, -- Where you will spawn IN the motel room
        BedStash = {x = 151.32, y = -1003.05, z = -99.0},  -- The Secret Stash Location of the Bed
        Inventory = {x = 151.83, y = -1001.32, z = -99.00},  -- The Inventory of the Room Main Storage
        Menu = {x = 151.25, y = -1007.74, z = -99.00}, -- Room Options Menu
        Boundries = 26.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
        Rooms = {
            Room1 = {
                number = 1,
                instancename = "pcm1",
                entry = {x = 312.83, y = -218.79, z = 54.22},
                    },

            Room2 = {
                number = 2,
                instancename = "pcm2",
                entry = {x = 310.9, y = -217.97, z = 54.22},
                    },

             Room3 = {
                number = 3,
                instancename = "pcm3",
                entry = {x = 307.24, y = -216.69, z = 54.22},
                    },

             Room4 = {
                number = 4,
                instancename = "pcm4",
                entry = {x = 307.58, y = -213.3, z = 54.22},
                     },

             Room5 = {
                number = 5,
                instancename = "pcm5",
                entry = {x = 309.51, y = -207.92, z = 54.22},
                    },

             Room5a = {
                number = "5a",
                instancename = "pcm5a",
                entry = {x = 311.27, y = -203.33, z = 54.22},
                    },

             Room6 = {
                number = 6,
                instancename = "pcm6",
                entry = {x = 313.36, y = -198.07, z = 54.22},
                    },

             Room7 = {
                number = 7,
                instancename = "pcm7",
                entry = {x = 315.77, y = -194.82, z = 54.22},
                    },

             Room8 = {
                number = 8,
                instancename = "pcm8",
                entry = {x = 319.4, y = -196.21, z = 54.22},
                    },

             Room9 = {
                number = 9,
                instancename = "pcm9",
                entry = {x = 321.44, y = -196.99, z = 54.22},
                    },

             Room11 = {
                number = 11,
                instancename = "pcm11",
                entry = {x = 312.83, y = -218.79, z = 58.02},
                    },

            Room12 = {
                number = 12,
                instancename = "pcm12",
                entry = {x = 310.9, y = -217.97, z = 58.02},
                    },

             Room13 = {
                number = 13,
                instancename = "pcm13",
                entry = {x = 307.24, y = -216.69, z = 58.02},
                    },

             Room14 = {
                number = 14,
                instancename = "pcm14",
                entry = {x = 307.58, y = -213.3, z = 58.02},
                    },

             Room15 = {
                number = 15,
                instancename = "pcm15",
                entry = {x = 309.51, y = -207.92, z = 58.02},
                    },

             Room16 = {
                number = 16,
                instancename = "pcm16",
                entry = {x = 311.27, y = -203.33, z = 58.02},
                    },

             Room17 = {
                number = 17,
                instancename = "pcm17",
                entry = {x = 313.36, y = -198.07, z = 58.02},
                    },

             Room18 = {
                number = 18,
                instancename = "pcm18",
                entry = {x = 315.77, y = -194.82, z = 58.02},
                    },

             Room19 = {
                number = 19,
                instancename = "pcm19",
                entry = {x = 319.4, y = -196.21, z = 58.02},
                    },

             Room20 = {
                number = 20,
                instancename = "pcm20",
                entry = {x = 321.44, y = -196.99, z = 58.02},
             },

             -- Left Side

             Room21 = {
                number = 21,
                instancename = "pcm21",
                entry = {x = 329.43, y = -225.02, z = 54.22},
             },
             Room22 = {
                number = 22,
                instancename = "pcm22",
                entry = {x = 331.44, y = -225.97, z = 54.22},
             },
             Room23 = {
                number = 23,
                instancename = "pcm23",
                entry = {x = 334.97, y = -227.36, z = 54.22},
             },
             Room24 = {
                number = 24,
                instancename = "pcm24",
                entry = {x = 337.09, y = -224.81, z = 54.22},
             },
             Room25 = {
                number = 25,
                instancename = "pcm25",
                entry = {x = 339.21, y = -219.45, z = 54.22},
             },
             Room26 = {
                number = 26,
                instancename = "pcm26",
                entry = {x = 340.8, y = -214.89, z = 54.22},
             },
             Room27 = {
                number = 27,
                instancename = "pcm27",
                entry = {x = 342.88, y = -209.6, z = 54.22},
             },
             Room28 = {
                number = 28,
                instancename = "pcm28",
                entry = {x = 344.59, y = -205.01, z = 54.22},
             },
             Room29 = {
                number = 29,
                instancename = "pcm29",
                entry = {x = 346.81, y = -199.73, z = 54.22},
             },

             --

             Room30 = {
                number = 30,
                instancename = "pcm30",
                entry = {x = 329.43, y = -225.02, z = 58.02},
             },
             Room31 = {
                number = 31,
                instancename = "pcm31",
                entry = {x = 331.44, y = -225.97, z = 58.02},
             },
             Room32 = {
                number = 32,
                instancename = "pcm32",
                entry = {x = 334.97, y = -227.36, z = 58.02},
             },
             Room33 = {
                number = 33,
                instancename = "pcm33",
                entry = {x = 337.09, y = -224.81, z = 58.02},
             },
             Room34 = {
                number = 34,
                instancename = "pcm34",
                entry = {x = 339.21, y = -219.45, z = 58.02},
             },
             Room35 = {
                number = 35,
                instancename = "pcm35",
                entry = {x = 340.8, y = -214.89, z = 58.02},
             },
             Room36 = {
                number = 36,
                instancename = "pcm36",
                entry = {x = 342.88, y = -209.6, z = 58.02},
             },
             Room37 = {
                number = 37,
                instancename = "pcm37",
                entry = {x = 344.59, y = -205.01, z = 58.02},
             },
             Room38 = {
                number = 38,
                instancename = "pcm38",
                entry = {x = 346.81, y = -199.73, z = 58.02},
             },
      }
   },
   SenoraDesertMotel = {
      Name = "URI Lagoy",
      Pos = {x = 1124.17, y = 2660.37, z = 37.47, color = 5, sprite = 475, size = 0.6},
      roomExit = {x = 0, y = 0, z = 0}, -- The Exit marker of the room, usually the only door hehe
      roomLoc = {x = 151.25, y = -1007.74, z = -99.00}, -- Where you will spawn IN the motel room
       BedStash = {x = 151.32, y = -1003.05, z = -99.0},  -- The Secret Stash Location of the Bed
      Inventory = {x = 151.83, y = -1001.32, z = -99.00},  -- The Inventory of the Room Main Storage
      Menu = {x = 151.25, y = -1007.74, z = -99.00}, -- Room Options Menu
      Boundries = 40.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
      Rooms = {
         Room1 = {
            number = 1,
            instancename= "sdm1",
            entry = {x = 1142.031, y = 2654.608, z = 38.15},
         },
         Room2 = {
            number = 2,
            instancename= "sdm2",
            entry = {x = 1142.134, y = 2651.093, z = 38.141},
         },
         Room3 = {
            number = 3,
            instancename= "sdm3",
            entry = {x = 1142.244, y = 2643.607, z = 38.144},
         },
         Room4 = {
            number = 4,
            instancename= "sdm4",
            entry = {x = 1141.252, y = 2641.781, z = 38.144},
         },
         Room5 = {
            number = 5,
            instancename= "sdm5",
            entry = {x = 1136.355, y = 2641.828, z = 38.144},
         },
         Room6 = {
            number = 6,
            instancename= "sdm6",
            entry = {x = 1132.951, y = 2641.933, z = 38.144},
         },
         Room7 = {
            number = 7,
            instancename= "sdm7",
            entry = {x = 1125.296, y = 2642.192, z = 38.144},
         },
         Room8 = {
            number = 8,
            instancename= "sdm8",
            entry = {x = 1121.677, y = 2641.938, z = 38.144},
         },
         Room9 = {
            number = 9,
            instancename= "sdm9",
            entry = {x = 1114.656, y = 2641.921, z = 38.144},
         },
         Room10 = {
            number = 10,
            instancename= "sdm10",
            entry = {x = 1107.428, y = 2641.939, z = 38.144},
         },
         Room11 = {
            number = 11,
            instancename= "sdm11",
            entry = {x = 1106.295, y = 2648.873, z = 38.141},
         },
         Room12 = {
            number = 12,
            instancename= "sdm12",
            entry = {x = 1106.503, y = 2652.566, z = 38.141},
         },
      }
   },
   WakStipeGanteng = {
      Name = "URI Nagoya",
      Pos = {x = -689.36, y = 5799.58, z = 22.06, color = 3, sprite = 475, size = 0.6},
      roomExit = {x = 0, y = 0, z = 0}, -- The Exit marker of the room, usually the only door hehe
      roomLoc = {x = 151.25, y = -1007.74, z = -99.00}, -- Where you will spawn IN the motel room
       BedStash = {x = 151.32, y = -1003.05, z = -99.0},  -- The Secret Stash Location of the Bed
      Inventory = {x = 151.83, y = -1001.32, z = -99.00},  -- The Inventory of the Room Main Storage
      Menu = {x = 151.25, y = -1007.74, z = -99.00}, -- Room Options Menu
      Boundries = 40.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
      Rooms = {
         Room1 = {
            number = 1,
            instancename= "wsg1",
            entry = {x = -681.93, y = 5770.73, z = 17.51},
         },
         Room2 = {
            number = 2,
            instancename= "wsg2",
            entry = {x = -683.74, y = 5766.74, z = 17.51},
         },
         Room3 = {
            number = 3,
            instancename= "wsg3",
            entry = {x = -685.59, y = 5762.73, z = 17.51},
         },
         Room4 = {
            number = 4,
            instancename= "wsg4",
            entry = {x = -687.43, y = 5758.96, z = 17.51},
         },
         Room5 = {
            number = 5,
            instancename= "wsg5",
            entry = {x = -694.23, y = 5761.31, z = 17.51},
         },
         Room6 = {
            number = 6,
            instancename= "wsg6",
            entry = {x = -681.93, y = 5770.73, z = 17.51},
         },
         Room7 = {
            number = 7,
            instancename= "wsg7",
            entry = {x = -698.17, y = 5763.12, z = 17.51},
         },
         Room8 = {
            number = 8,
            instancename= "wsg8",
            entry = {x = -702.1, y = 5764.96, z = 17.51},
         },
         Room9 = {
            number = 9,
            instancename= "wsg9",
            entry = {x = -706.01, y = 5766.77, z = 17.51},
         },
         Room10 = {
            number = 10,
            instancename= "wsg10",
            entry = {x = -709.94, y = 5768.59, z = 17.51},
         },
      }
   },
   WakGantengMotel = {
      Name = "URI Planet",
      Pos = {x = 502.35, y = 207.85, z = 104.74, color = 9, sprite = 475, size = 0.6},
      roomExit = {x = 0, y = 0, z = 0}, -- The Exit marker of the room, usually the only door hehe
      roomLoc = {x = 151.25, y = -1007.74, z = -99.00}, -- Where you will spawn IN the motel room
       BedStash = {x = 151.32, y = -1003.05, z = -99.0},  -- The Secret Stash Location of the Bed
      Inventory = {x = 151.83, y = -1001.32, z = -99.00},  -- The Inventory of the Room Main Storage
      Menu = {x = 151.25, y = -1007.74, z = -99.00}, -- Room Options Menu
      Boundries = 40.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
      Rooms = {
         Room1 = {
            number = 1,
            instancename= "wgm1",
            entry = {x = 484.2, y = 212.3, z = 104.74},
         },
         Room2 = {
            number = 2,
            instancename= "wgm2",
            entry = {x = 482.34, y = 207.18, z = 104.74},
         },
         Room3 = {
            number = 3,
            instancename= "wgm3",
            entry = {x = 486.67, y = 201.17, z = 104.74},
         },
         Room4 = {
            number = 4,
            instancename= "wgm4",
            entry = {x = 507.41, y = 193.61, z = 104.75},
         },
         Room5 = {
            number = 5,
            instancename= "wgm5",
            entry = {x = 513.81, y =  191.29, z = 38.144},
         },
         Room6 = {
            number = 6,
            instancename= "wgm6",
            entry = {x = 520.98, y = 192.95, z = 104.74},
         },
         Room7 = {
            number = 7,
            instancename= "wgm7",
            entry = {x = 522.87, y = 198.14, z = 104.74},
         },
         Room8 = {
            number = 8,
            instancename= "wgm8",
            entry = {x = 526.34, y = 207.7, z = 104.74},
         },
         Room9 = {
            number = 9,
            instancename= "wgm9",
            entry = {x = 528.67, y = 214.06, z = 104.74},
         },
         Room10 = {
            number = 10,
            instancename= "wgm10",
            entry = {x = 526.72, y = 226.56, z = 104.74},
         },
         Room11 = {
            number = 11,
            instancename= "wgm11",
            entry = {x = 520.16, y = 229.01, z = 104.74},
         },
         Room12 = {
            number = 12,
            instancename= "wgm12",
            entry = {x = 510.59, y = 232.5, z = 104.74},
         },
        Room13 = {
            number = 13,
            instancename= "wgm13",
            entry = {x = 504.2, y = 234.8, z = 104.74},
         },
        Room14 = {
            number = 14,
            instancename= "wgm14",
            entry = {x = 497.65, y = 237.19, z = 104.74},
         },
        Room15 = {
            number = 15,
            instancename= "wgm15",
            entry = {x = 489.99, y = 228.17, z = 104.74},
         },
         Room16 = {
            number = 16,
            instancename= "wgm16",
            entry = {x = 487.76, y = 221.79, z = 104.74},
         },
         Room17 = {
            number = 17,
            instancename= "wgm17",
            entry = {x = 484.29, y = 212.32, z = 108.31},
         },
         Room18 = {
            number = 18,
            instancename= "wgm18",
            entry = {x = 482.39, y = 207.08, z = 108.31},
         },
         Room19 = {
            number = 19,
            instancename= "wgm19",
            entry = {x = 486.61, y = 201.25, z = 108.31},
         },
         Room20 = {
            number = 20,
            instancename= "wgm20",
            entry = {x = 507.44, y = 193.63, z = 108.31},
         },
         Room21 = {
            number = 21,
            instancename= "wgm21",
            entry = {x = 513.8, y = 191.31, z = 108.31},
         },
        Room22 = {
            number = 22,
            instancename= "wgm22",
            entry = {x = 520.91, y = 193.0, z = 108.31},
         },
        Room23 = {
            number = 23,
            instancename= "wgm23",
             entry = {x = 522.88, y = 198.15, z = 108.31},
         },
      }
   },
   PaletoBayMotel = {
      Name = "URI Paragon",
      Pos = {x= -85.95, y = 6341.6, z = 31.49, color = 8, sprite = 475, size = 0.6},
      roomExit = {x = 0, y = 0, z = 0}, -- The Exit marker of the room, usually the only door hehe
      roomLoc = {x = 151.25, y = -1007.74, z = -99.00}, -- Where you will spawn IN the motel room
      BedStash = {x = 151.32, y = -1003.05, z = -99.0},  -- The Secret Stash Location of the Bed
      Inventory = {x = 151.83, y = -1001.32, z = -99.00},  -- The Inventory of the Room Main Storage
      Menu = {x = 151.25, y = -1007.74, z = -99.00}, -- Room Options Menu
      Boundries = 75.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
      Rooms = {
         Room7 = {
            number = 7,
            instancename= "pbm7",
            entry = {x = -102.864, y = 6330.715, z = 31.576},
         },
         Room8 = {
            number = 8,
            instancename= "pbm8",
            entry = {x = -106.175, y = 6334.335, z = 31.576}
         },
         Room9 = {
            number = 9,
            instancename= "pbm9",
            entry = {x = -107.333, y = 6339.298, z = 31.576}
         },
         Room12 = {
            number = 12,
            instancename= "pbm12",
            entry = {x = -93.463, y = 6353.657, z = 31.576}
         },
         Room13 = {
            number = 13,
            instancename= "pbm13",
            entry = {x = -89.829, y = 6356.904, z = 31.576}
         },
         Room14 = {
            number = 14,
            instancename= "pbm14",
            entry = {x = -84.228, y = 6362.288, z = 31.576}
         },
         Room22 = {
            number = 22,
            instancename= "pbm22",
            entry = {x = -84.571, y = 6362.393, z = 35.501}
         },
         Room21 = {
            number = 21,
            instancename= "pbm21",
            entry = {x = -89.858, y = 6356.887, z = 35.501}
         },
         Room20 = {
            number = 20,
            instancename= "pbm20",
            entry = {x = -92.799, y = 6353.803, z = 35.501}
         },
         Room19 = {
            number = 19,
            instancename= "pbm19",
            entry = {x = -98.552, y = 6348.277, z = 35.501}
         },
         Room18 = {
            number = 18,
            instancename= "pbm18",
            entry = {x = -101.513, y = 6345.277, z = 35.501}
         },
         Room17 = {
            number = 17,
            instancename= "pbm17",
            entry = {x = -107.355, y = 6339.715, z = 35.501}
         },
         Room16 = {
            number = 16,
            instancename= "pbm16",
            entry = {x = -106.364, y = 6334.481, z = 35.501}
         },
         Room15 = {
            number = 15,
            instancename= "pbm15",
            entry = {x = -103.448, y = 6331.38, z = 35.501}
         },
         Room3 = {
            number = 3,
            instancename= "pbm3",
            entry = {x = -119.945, y = 6327.066, z = 31.576}
         },
         Room2 = {
            number = 2,
            instancename= "pbm2",
            entry = {x = -114.608, y = 6325.564, z = 31.576}
         },
         Room1 = {
            number = 1,
            instancename= "pbm1",
            entry = {x = -111.559, y = 6322.68, z = 31.576}
         },
         Room6 = {
            number = 6,
            instancename= "pbm6",
            entry = {x = -120.365, y = 6326.762, z = 35.501}
         },
         Room5 = {
            number = 5,
            instancename= "pbm5",
            entry = {x = -114.919, y = 6325.547, z = 35.501}
         },
         Room4 = {
            number = 4,
            instancename= "pbm4",
            entry = {x = -111.486, y = 6322.974, z = 35.501}
         },
      }
   },
}