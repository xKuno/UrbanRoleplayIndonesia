Config = {}
Config.Locale = 'en'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	

	-- To locker room & roof
	{
		objHash = GetHashKey('mrpd_door_04'),
		objHeading = 90.0,
		objCoords = vector3(436.45, -985.38, 34.19),
		textCoords = vector3(436.45, -985.38, 34.19),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},


	-- Captain Office
	{
		objHash = GetHashKey('v_ilev_ph_gendoor002'),
		objHeading = 270.0,
		objCoords = vector3(1835.74, 2589.64, 45.89),
		textCoords = vector3(1835.74, 2589.64, 46.1),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},

	-- To downstairs (double doors

	--
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 217.5,
		objCoords = vector3(-1073.2, -827.11, 5.48),
		textCoords = vector3(-1073.2, -827.11, 5.48),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 217.5,
		objCoords = vector3(-1087.25, -829.6, 5.48),
		textCoords = vector3(-1087.25, -829.6, 5.48),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 1
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 308.0,
		objCoords = vector3(-1086.41, -826.97, 5.48),
		textCoords = vector3(-1086.41, -826.97, 5.48),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 270.0,
		objCoords = vector3(1836.44, 2594.59, 45.89),
		textCoords = vector3(1836.44, 2594.59, 46.1),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(1778.93, 2569.0, 45.92),
		textCoords = vector3(1778.93, 2569.0, 46.15),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(1773.58, 2569.01, 45.92),
		textCoords = vector3(1773.58, 2569.01, 46.15),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	{
		objHash = GetHashKey('v_ilev_ph_door002'),
		objHeading = 0.0,
		objCoords = vector3(1686.67, 2573.32, 50.68),
		textCoords = vector3(1686.67, 2573.32, 50.90),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 180.0,
		objCoords = vector3(1691.03, 2581.68, 45.91),
		textCoords = vector3(1691.03, 2581.68, 46.15),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 270.0,
		objCoords = vector3(1826.35, 2594.59, 45.89),
		textCoords = vector3(1826.35, 2594.59, 46.1),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 308.0,
		objCoords = vector3(-1089.43, -829.48, 5.48),
		textCoords = vector3(-1089.43, -829.48, 5.48),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 308.0,
		objCoords = vector3(-1091.78, -826.22, 5.48),
		textCoords = vector3(-1091.78, -826.22, 5.48),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 308.0,
		objCoords = vector3(-1088.92, -824.03, 5.48),
		textCoords = vector3(-1088.92, -824.03, 5.48),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 308.0,
		objCoords = vector3(-1094.18, -823.02, 5.48),
		textCoords = vector3(-1094.18, -823.02, 5.48),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 308.0,
		objCoords = vector3(-1091.31, -820.82, 5.48),
		textCoords = vector3(-1091.31, -820.82, 5.48),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 308.0,
		objCoords = vector3(-1096.69, -819.96, 5.48),
		textCoords = vector3(-1096.69, -819.96, 5.48),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},

--KANTOR POLICE KOTA LSPD
-- Entrance Doors
	{
		textCoords = vector3(434.7, -982.0, 31.5),
		authorizedJobs = {'police' , 'polantas'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_door01'), objHeading = 270.0, objCoords = vector3(434.7, -980.6, 30.8)},
			{objHash = GetHashKey('v_ilev_ph_door002'), objHeading = 270.0, objCoords = vector3(434.7, -983.2, 30.8)}
		}
	},

	-- To locker room & roof
	{
		objHash = GetHashKey('v_ilev_ph_gendoor004'),
		objHeading = 90.0,
		objCoords = vector3(449.6, -986.4, 30.6),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},

	-- Rooftop
	{
		objHash = GetHashKey('v_ilev_gtdoor02'),
		objHeading = 90.0,
		objCoords = vector3(464.3, -984.6, 43.8),
		textCoords = vector3(464.3, -984.0, 44.8),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},

	-- Hallway to roof
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 90.0,
		objCoords = vector3(461.2, -985.3, 30.8),
		textCoords = vector3(461.5, -986.0, 31.5),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	-- Captain Office
	{
		objHash = GetHashKey('v_ilev_ph_gendoor002'),
		objHeading = 180.0,
		objCoords = vector3(447.2, -980.6, 30.6),
		textCoords = vector3(447.2, -980.0, 31.7),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	-- To downstairs (double doors)
	{
		textCoords = vector3(444.6, -989.4, 31.7),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 180.0, objCoords = vector3(443.9, -989.0, 30.6)},
			{objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 0.0, objCoords = vector3(445.3, -988.7, 30.6)}
		}
	},
		-- Cell 2
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(462.3, -998.1, 24.9),
		textCoords = vector3(461.8, -998.8, 25.0),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 3
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(462.7, -1001.9, 24.9),
		textCoords = vector3(461.8, -1002.4, 25.0),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = -90.0,
		objCoords = vector3(461.99, -993.35, 24.91),
		textCoords = vector3(461.99, -993.35, 24.91),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 0.0,
		objCoords = vector3(463.52, -992.63, 24.91),
		textCoords = vector3(463.52, -992.63, 24.91),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 179.90,
		objCoords = vector3(472.11, -999.43, 24.92),
		textCoords = vector3(472.11, -999.43, 24.92),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 179.90,
		objCoords = vector3(468.49, -999.28, 24.92),
		textCoords = vector3(468.49, -999.28, 24.92),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 180.90,
		objCoords = vector3(479.82, -1007.55, 24.27),
		textCoords = vector3(479.82, -1007.55, 24.27),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 180.90,
		objCoords = vector3(476.28, -1007.64, 24.27),
		textCoords = vector3(476.28, -1007.64, 24.27),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},

	-- To Back
	{
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords = vector3(463.4, -1003.5, 25.0),
		textCoords = vector3(464.0, -1003.5, 25.5),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	-- Back (double doors)
	{
		textCoords = vector3(468.6, -1014.4, 27.1),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 0.0, objCoords  = vector3(467.3, -1014.4, 26.5)},
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 180.0, objCoords  = vector3(469.9, -1014.4, 26.5)}
		}
	},
		-- KANPOL BAWAH
		{
		objHash = GetHashKey('v_ilev_ph_gendoor006'),
		objHeading = 179.90,
		objCoords = vector3(490.55, -995.84, 24.27),
		textCoords = vector3(490.55, -995.84, 24.27),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	-- Back Gate
	{
		objHash = GetHashKey('hei_prop_station_gate'),
		objHeading = 90.0,
		objCoords = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 14,
		size = 2
	},

	--
	-- Sandy Shores
	--
	-- dua pintu
		{
		objHash = GetHashKey('v_ilev_ph_gendoor002'),
		objCoords = vector3(1847.89, 3690.22, 34.27),
		textCoords = vector3(1847.89, 3690.22, 34.27),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},
			{
		objHash = GetHashKey('v_ilev_ph_gendoor002'),
		objCoords = vector3(1848.81, 3690.74, 34.27),
		textCoords = vector3(1848.81, 3690.74, 34.27),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},
	-- penjara bwh
		{
		objHash = GetHashKey('v_ilev_ph_gendoor002'),
		objCoords = vector3(1846.41, 3691.47, 30.47),
		textCoords = vector3(1846.41, 3691.47, 30.47),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},
		-- penjara bwh dlm
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objCoords = vector3(1844.75, 3688.61, 30.47),
		textCoords = vector3(1844.75, 3688.61, 30.47),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},
	-- Entrance
	{
		objHash = GetHashKey('v_ilev_shrfdoor'),
		objHeading = 30.0,
		objCoords = vector3(1855.1, 3683.5, 34.2),
		textCoords = vector3(1855.1, 3683.5, 35.0),
		authorizedJobs = {'police' , 'polantas'},
		locked = false,
		maxDistance = 1.25
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		textCoords = vector3(-443.5, 6016.3, 32.0),
		authorizedJobs = {'police' , 'polantas'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 315.0, objCoords  = vector3(-443.1, 6015.6, 31.7)},
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 135.0, objCoords  = vector3(-443.9, 6016.6, 31.7)}
		}
	},

	-- pintu penjara

	
	-- paleto blng
		{
		objHash = GetHashKey('v_ilev_rc_door2'),
		objCoords = vector3(-451.42, 6006.58, 31.72),
		textCoords = vector3(-451.42, 6006.58, 31.72),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},
	
	-- paleto bwh
		{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objCoords = vector3(-437.37, 6002.12, 27.99),
		textCoords = vector3(-437.37, 6002.12, 27.99),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},
	
	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},

	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},

	--
	--Pillbox Ambulance
	--
	-- loker
		{
		objHash = GetHashKey('gabz_pillbox_singledoor'),
		objHeading = 160.0,
		objCoords = vector3(-816.71, -1239.37, 7.34),
		textCoords = vector3(-816.71, -1239.37, 7.34),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 1.25
	},
	-- KOMA
			{
		objHash = GetHashKey('gabz_pillbox_singledoor'),
		objHeading = 323.93,
		objCoords = vector3(-775.8, -1240.44, 7.34),
		textCoords = vector3(-775.8, -1240.44, 7.34),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 1.25
	},

	-- WARD C
	{
		textCoords = vector3(348.45, -587.4, 43.28),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 2,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = -110.0, objCoords = vector3(348.45, -587.4, 43.28)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = -110.0, objCoords = vector3(348.45, -587.4, 43.28)}
		}
	},
	
	{
		textCoords = vector3(326.04, -579.32, 43.28),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 2,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = -110.0, objCoords = vector3(326.01, -579.1, 43.28)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = -110.0, objCoords = vector3(326.01, -579.1, 43.28)}
		}
	},
	
	{
		textCoords = vector3(325.25, -589.94, 43.28),
		authorizedJobs = {'ambulance'},
		locked = true,
		maxDistance = 2,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = 339.75, objCoords = vector3(325.19, -590.04, 43.28)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = 339.75, objCoords = vector3(325.19, -590.04, 43.28)}
		}
	},
	

	
	-- WEAPON GUN
	
	{
		objHash = GetHashKey('v_ilev_gc_door04'),
		objCoords = vector3(16.12787, -1114.606, 29.94694),
		textCoords = vector3(16.12787, -1114.606, 29.94694),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},
	
		{
		objHash = GetHashKey('v_ilev_gc_door03'),
		objCoords = vector3(18.572, -1115.495, 29.94685),
		textCoords = vector3(18.572, -1115.495, 29.94685),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},
	
		{
		objHash = GetHashKey('v_ilev_gc_door01'),
		objCoords = vector3(6.81789, -1098.209, 29.94685),
		textCoords = vector3(6.81789, -1098.209, 29.94685),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},

-- bank
	{
		objHash = GetHashKey('hei_v_ilev_bk_gate2_pris'),
		objCoords = vector3(261.02, 221.81, 106.28),
		textCoords = vector3(262.02, 221.81, 106.28),
		authorizedJobs = {'cartel' , 'mafia' , 'biker' , 'gang' , 'yakuza' , 'police' , 'ackerman' , 'kompatriot'},
		locked = true,
		maxDistance = 5,
		size = 2
	},
	-- VESPUCCI
	
	{
		objHash = GetHashKey('prop_facgate_01'),
		objHeading = 210.91,
		objCoords = vector3(-1068.05, -8878.96, 4.9),
		textCoords = vector3(-1068.05, -8878.96, 4.9),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	
		{
		objHash = GetHashKey('prop_facgate_01b'),
		objHeading = 215.09,
		objCoords = vector3(-1052.79, -870.13, 5.16),
		textCoords = vector3(-1052.79, -870.13, 5.16),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
	
	-- Pintu vespuci
	-- pintu bawah 1
	
	
	{
		objHash = GetHashKey('v_ilev_rc_door2'),
		objCoords = vector3(-1058.15, -840.16, 5.11),
		textCoords = vector3(-1058.15, -840.16, 5.11),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},
	
	{
		objHash = GetHashKey('v_ilev_rc_door2'),
		objCoords = vector3(-1057.39, -839.65, 5.11),
		textCoords = vector3(-1057.39, -839.65, 5.11),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},
	
	-- dua
	
	{
		objHash = GetHashKey('v_ilev_rc_door2'),
		objCoords = vector3(-1090.55, -847.21, 4.88),
		textCoords = vector3(-1090.55, -847.21, 4.88),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},
	 
	{
		objHash = GetHashKey('v_ilev_rc_door2'),
		objCoords = vector3(-1089.85, -848.1, 4.88),
		textCoords = vector3(-1089.85, -848.1, 4.88),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},
	 	-- tiga
	{
		objHash = GetHashKey('v_ilev_rc_door2'),
		objCoords = vector3(-1065.06, -828.58, 5.48),
		textCoords = vector3(-1065.06, -828.58, 5.48),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},

	{
		objHash = GetHashKey('v_ilev_rc_door2'),
		objCoords = vector3(-1065.73, -827.59, 5.48),
		textCoords = vector3(-1065.73, -827.59, 5.48),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},
	
	-- empat	
	{
		objHash = GetHashKey('v_ilev_rc_door2'),
		objCoords = vector3(-1086.34, -811.21, 5.48),
		textCoords = vector3(-1086.34, -811.21, 5.48),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},
	
		{
		objHash = GetHashKey('v_ilev_rc_door2'),
		objCoords = vector3(-1085.71, -812.16, 5.48),
		textCoords = vector3(-1085.71, -812.16, 5.48),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5,
		size = 2
	},
	-- lima

		{
		objHash = GetHashKey('v_ilev_rc_door2'),
		objHeading = 307.05,
		objCoords = vector3(-1091.9, -834.36, 5.48),
		textCoords = vector3(-1091.72, -834.84, 5.48),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5
	},
	{
		objHash = GetHashKey('v_ilev_rc_door2'),
		objHeading = 128.0,
		objCoords = vector3(-1091.02, -835.54, 5.48),
		textCoords = vector3(-1091.32, -835.27, 5.48),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 5
	},
	
	-- enam
	{
        objHash = GetHashKey('v_ilev_rc_door2'),
        objCoords = vector3(-1094.9, -835.25, 14.28),
        textCoords = vector3(-1094.9, -835.25, 14.28),
        authorizedJobs = {'police' , 'polantas'},
        locked = true,
        maxDistance = 3,
        size = 2
    },
	{
        objHash = GetHashKey('v_ilev_rc_door2'),
        objCoords = vector3(-1094.09, -834.7, 14.28),
        textCoords = vector3(-1094.09, -834.7, 14.28),
        authorizedJobs = {'police' , 'polantas'},
        locked = true,
        maxDistance = 3,
        size = 2
    },
	
	--CELL FEDERAL---
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(1703.92, 2568.44, 45.59),
		textCoords = vector3(1703.92, 2568.44, 45.59),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(1700.61, 2568.48, 45.59),
		textCoords = vector3(1700.61, 2568.48, 45.59),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},


	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(1680.85, 2568.58, 45.59),
		textCoords = vector3(1680.85, 2568.58, 45.59),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('hei_v_ilev_bk_gate2_pris'),
		objHeading = 250.0,
		objCoords = vector3(261.95, 221.97, 106.28),
		textCoords = vector3(0.0, 0.0, -1000.0),
		authorizedJobs = {'cartel' , 'mafia' , 'biker' , 'gang' , 'yakuza' , 'police'},
		locked = true,
		maxDistance = 1.25
	},

	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(1677.27, 2568.49, 45.59),
		textCoords = vector3(1677.27, 2568.49, 45.59),
		authorizedJobs = {'police' , 'polantas'},
		locked = true,
		maxDistance = 1.25
	},
}