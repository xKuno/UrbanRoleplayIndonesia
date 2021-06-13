	Config = {}
	---------------------------------------------------------------
	--=====How long should it take for player to catch a fish=======--
	---------------------------------------------------------------
	--Time in miliseconds
	Config.FishTime = {a = 20000, b = 44000}
	
	--------------------------------------------------------
	--=====Prices of the items players can sell==========--
	--------------------------------------------------------
	--First amount minimum price second maximum amount (the amount player will get is random between those two numbers)
	Config.FishPrice = {a = 300, b = 1500} --Will get clean money THIS PRICE IS FOR EVERY 5 FISH ITEMS (5 kg)
	Config.TurtlePrice = {a = 3500, b = 5000} --Will get dirty money
	Config.SharkPrice = {a = 15000, b = 45000} --Will get dirty money
	
	
	--------------------------------------------------------
	--=====Locations where players can sell stuff========--
	--------------------------------------------------------

	Config.SellFish = {x = 53.26, y = -1479.29, z = 29.28} --Place where players can sell their fish
	Config.SellTurtle = {x = 3804.0, y = 4443.3, z = 3.0} --Place where players can sell their turtles 
	Config.SellShark = {x = 2517.6 , y = 4218.0, z = 38.8} --Place where players can sell their sharks

	Config.PangonDodol = {
	{x = 53.26, y = -1479.29, z = 29.28} ,
	{x = 3804.0, y = 4443.3, z = 3.0},
	{x = 2517.6 , y = 4218.0, z = 38.8},
	}
	--------------------------------------------------------
	--=====Locations where players can rent boats========--
	--------------------------------------------------------
	Config.MarkerZones = { 
	
    {x = -3426.7   ,y = 955.66 ,z = 7.35, xs = -3426.2  , ys = 942.4, zs = 1.1 },
	{x = -732.9     ,y = -1309.7 ,z = 4.0, xs = -725.7    , ys = -1351.5, zs = 0.5 },  
	{x = -1607.6      ,y =  5252.8 ,z = 3.0, xs = -1590.2      , ys = 5278.8, zs = 1.0 },
	{x = 3855.0        ,y =  4463.7 ,z = 1.6, xs = 3885.2       , ys =  4507.2, zs = 1.0 },
	{x = 1330.8        ,y =  4226.6 ,z = 32.9, xs = 1334.2         , ys =  4192.4, zs = 30.0 },
	}
	Config.hapuskapal = {
  {x = 1323.6577148438, y = 4211.8857421875, z = 29.839496612549, xs = 1324.087890625, ys = 4228.185546875, zs = 33.915523529053 },
  {x = 3869.5151367188, y = 4480.5830078125, z = 0.23424795269966, xs = 3855.0, ys = 4463.7, zs = 1.6 },
  {xs = -1607.6, ys = 5252.8, zs = 3.0, x = -1590.2, y = 5278.8, z = 1.0 },
  {xs = -3426.7, ys = 955.66, zs = 7.35, x = -3426.2, y = 942.4, z = 0.8 },
  {xs = -732.9, ys = -1309.7, zs = 4.0, x = -725.7, y = -1351.5, z = 0.5 },
	}
