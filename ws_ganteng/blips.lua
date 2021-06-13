
	local blips = {
		-- Police Departments
 --   {title="Kapal Pesiar", colour=8, id=455, x=-2083.34, y=-1015.47, z=12.45},
 --   {title="Kapal Pesiar", colour=8, id=455, x=-1429.95, y=6756.8, z=15.54},
  --  {title="Job Center", colour=10, id=162, x=-116.98, y=-603.64, z=36.28},
 --   {title="Coffe Bean", colour=3, id=93, x=-628.46, y=226.08, z=91.86},
   -- {title=" Sirkuit", colour=0, id=611, x=1268.02, y=-3234.83, z=4.9},
    {title="HH Club", colour=3, id=93, x=-1391.6, y=-608.71, z=30.32},
    {title="Pacific Club", colour=3, id=93, x=126.75, y=-1282.77, z=29.28},
--    {title="Benny`s Repair", colour=5, id=446, x = 549.35, y = -176.78, z = 54.48},
	 {title="Kantor Walikota", colour=0, id=609, x = -550.89, y = -191.85, z = 38.22},
    {title="Mechanic Kota", colour=5, id=446, x = 550.29, y = -177.88, z = 54.49},
 --   {title=" KOS", colour=2, id=475, x = 1142.42, y = 2664.07, z = 38.16},
  --  {title=" KOS", colour=3, id=475, x = -96.63, y = 6324.05, z = 31.58},
    --{title="Ladang 3", colour=5, id=140, x = -1759.24, y = 2029.06, z = 120.8},
    --{title="Ladang 4", colour=5, id=140, x = 575.05, y = 6483.71, z = 30.61},
    --{title="Tempat Drag Race", colour=3, id=147, x = 1607.1, y = 3224.52, z = 40.41},
		}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.8)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)




