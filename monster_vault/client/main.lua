local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX                           = nil


  Citizen.CreateThread(function()
	  while ESX == nil do
		  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		  Citizen.Wait(0)
	  end
  end)
  
  RegisterNetEvent('esx:playerLoaded')
  AddEventHandler('esx:playerLoaded', function(xPlayer)
	  ESX.PlayerData = xPlayer
  end)
  
  local vaultType = {}
  
  RegisterNetEvent('esx:setJob')
  AddEventHandler('esx:setJob', function(job)
	  ESX.PlayerData.job = job
  end)

function OpenVaultInventoryMenu(data)
	if data.job == ESX.PlayerData.job.name or data.job == 'vault' then
		print(data.needItemLicense)
		vaultType = data
		ESX.TriggerServerCallback(
			"monster_vault:getVaultInventory",
			function(inventory)
				if not inventory then
					exports['mythic_notify']:DoHudText('error', 'Anda TIdak memiliki kunci')
				else
					TriggerEvent("monster_inventoryhud:openVaultInventory", inventory)
				end
			end,
			data
		)
	else
		exports['mythic_notify']:DoHudText('error', "Tidak memiliki akses!", 5500)
		Citizen.Wait(8000)
	end
end

Citizen.CreateThread(function()
    while ESX == nil or ESX.PlayerData == nil or ESX.PlayerData.job == nil do
        Citizen.Wait(1000)
    end
    print('Object Vault Working')
    for k,v in pairs(Config.Vault) do
		ESX.Game.SpawnLocalObject(Config.VaultBox, v.coords, function(obj)
			SetEntityHeading(obj, v.heading)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)
		end)
	end
    
end)

 -- Key controls
  Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())
		local coords2 = GetEntityCoords(PlayerPedId())
		local coords3 = GetEntityCoords(PlayerPedId())
		local coords4 = GetEntityCoords(PlayerPedId())
		local coords5 = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.Vault) do
			local dist = GetDistanceBetweenCoords(coords, v.coords, true)
			local dist2 = GetDistanceBetweenCoords(coords2, v.coords2, true)
			local dist3 = GetDistanceBetweenCoords(coords3, v.coords3, true)
			local dist4 = GetDistanceBetweenCoords(coords3, v.coords4, true)
			local dist5 = GetDistanceBetweenCoords(coords5, v.coords5, true)
			if dist < 2 then
				ESX.ShowHelpNotification("Tekan E Untuk Membuka Berangkas "..k)
				
				  if IsControlJustReleased(0, Keys['E']) then
					   if ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'boss2' or ESX.PlayerData.job.grade_name == 'boss3' or ESX.PlayerData.job.grade_name == 'kombespol' or ESX.PlayerData.job.grade_name == 'akbp' or ESX.PlayerData.job.grade_name == 'kompol' or ESX.PlayerData.job.grade_name == 'akp' or ESX.PlayerData.job.grade_name == 'iptu' or ESX.PlayerData.job.grade_name == 'ipda' or ESX.PlayerData.job.grade_name == 'aiptu' or ESX.PlayerData.job.grade_name == 'aipda' or ESX.PlayerData.job.grade_name == 'bripka' or ESX.PlayerData.job.grade_name == 'brigadir' or ESX.PlayerData.job.grade_name == 'briptu' or ESX.PlayerData.job.grade_name == 'bripda' or ESX.PlayerData.job.grade_name == 'tamtama'  or ESX.PlayerData.job.grade_name == 'righthand' or ESX.PlayerData.job.grade_name == 'soldato' or ESX.PlayerData.job.grade_name == 'consigliere' or ESX.PlayerData.job.grade_name == 'capo' or ESX.PlayerData.job.grade_name == 'wakil' or ESX.PlayerData.job.grade_name == 'walikota' or ESX.PlayerData.job.grade_name == 'recrue' or ESX.PlayerData.job.grade_name == 'novice' or ESX.PlayerData.job.grade_name == 'experimente' or ESX.PlayerData.job.grade_name == 'uber' or ESX.PlayerData.job.grade_name == 'chief' or ESX.PlayerData.job.grade_name == 'magang' or ESX.PlayerData.job.grade_name == 'perawat' or ESX.PlayerData.job.grade_name == 'doktor' or ESX.PlayerData.job.grade_name == 'drspecial' or ESX.PlayerData.job.grade_name == 'sekertaris' or ESX.PlayerData.job.grade_name == 'wakdir' or ESX.PlayerData.job.grade_name == 'bripdaWAKWAK' then
						  OpenVaultInventoryMenu({job = k, needItemLicense = v.needItemLicense, InfiniteLicense = v.InfiniteLicense})
					  else
						  break
					  end	
				  end
			end
			if dist2 < 2 then
				ESX.ShowHelpNotification("Tekan E Untuk Membuka Berangkas "..k)
				
				  if IsControlJustReleased(0, Keys['E']) then
					   if ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'boss2' or ESX.PlayerData.job.grade_name == 'boss3' or ESX.PlayerData.job.grade_name == 'kombespol' or ESX.PlayerData.job.grade_name == 'akbp' or ESX.PlayerData.job.grade_name == 'kompol' or ESX.PlayerData.job.grade_name == 'akp' or ESX.PlayerData.job.grade_name == 'iptu' or ESX.PlayerData.job.grade_name == 'ipda' or ESX.PlayerData.job.grade_name == 'aiptu' or ESX.PlayerData.job.grade_name == 'aipda' or ESX.PlayerData.job.grade_name == 'bripka' or ESX.PlayerData.job.grade_name == 'brigadir' or ESX.PlayerData.job.grade_name == 'briptu' or ESX.PlayerData.job.grade_name == 'bripda' or ESX.PlayerData.job.grade_name == 'tamtama'  or ESX.PlayerData.job.grade_name == 'righthand' or ESX.PlayerData.job.grade_name == 'soldato' or ESX.PlayerData.job.grade_name == 'consigliere' or ESX.PlayerData.job.grade_name == 'capo' or ESX.PlayerData.job.grade_name == 'wakil' or ESX.PlayerData.job.grade_name == 'walikota' or ESX.PlayerData.job.grade_name == 'recrue' or ESX.PlayerData.job.grade_name == 'novice' or ESX.PlayerData.job.grade_name == 'experimente' or ESX.PlayerData.job.grade_name == 'uber' or ESX.PlayerData.job.grade_name == 'chief' or ESX.PlayerData.job.grade_name == 'magang' or ESX.PlayerData.job.grade_name == 'perawat' or ESX.PlayerData.job.grade_name == 'doktor' or ESX.PlayerData.job.grade_name == 'drspecial' or ESX.PlayerData.job.grade_name == 'sekertaris' or ESX.PlayerData.job.grade_name == 'wakdir' or ESX.PlayerData.job.grade_name == 'bripdaWAKWAK' then
						  OpenVaultInventoryMenu({job = k, needItemLicense = v.needItemLicense, InfiniteLicense = v.InfiniteLicense})
					  else
						  break
					  end	
				  end
			end
			if dist3 < 2 then
				ESX.ShowHelpNotification("Tekan E Untuk Membuka Berangkas "..k)
				
				  if IsControlJustReleased(0, Keys['E']) then
					 if ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'boss2' or ESX.PlayerData.job.grade_name == 'boss3' or ESX.PlayerData.job.grade_name == 'kombespol' or ESX.PlayerData.job.grade_name == 'akbp' or ESX.PlayerData.job.grade_name == 'kompol' or ESX.PlayerData.job.grade_name == 'akp' or ESX.PlayerData.job.grade_name == 'iptu' or ESX.PlayerData.job.grade_name == 'ipda' or ESX.PlayerData.job.grade_name == 'aiptu' or ESX.PlayerData.job.grade_name == 'aipda' or ESX.PlayerData.job.grade_name == 'bripka' or ESX.PlayerData.job.grade_name == 'brigadir' or ESX.PlayerData.job.grade_name == 'briptu' or ESX.PlayerData.job.grade_name == 'bripda' or ESX.PlayerData.job.grade_name == 'tamtama'  or ESX.PlayerData.job.grade_name == 'righthand' or ESX.PlayerData.job.grade_name == 'soldato' or ESX.PlayerData.job.grade_name == 'consigliere' or ESX.PlayerData.job.grade_name == 'capo' or ESX.PlayerData.job.grade_name == 'wakil' or ESX.PlayerData.job.grade_name == 'walikota' or ESX.PlayerData.job.grade_name == 'recrue' or ESX.PlayerData.job.grade_name == 'novice' or ESX.PlayerData.job.grade_name == 'experimente' or ESX.PlayerData.job.grade_name == 'uber' or ESX.PlayerData.job.grade_name == 'chief' or ESX.PlayerData.job.grade_name == 'magang' or ESX.PlayerData.job.grade_name == 'perawat' or ESX.PlayerData.job.grade_name == 'doktor' or ESX.PlayerData.job.grade_name == 'drspecial' or ESX.PlayerData.job.grade_name == 'sekertaris' or ESX.PlayerData.job.grade_name == 'wakdir' or ESX.PlayerData.job.grade_name == 'bripdaWAKWAK' then
						  OpenVaultInventoryMenu({job = k, needItemLicense = v.needItemLicense, InfiniteLicense = v.InfiniteLicense})
					  else
						  break
					  end	
				  end
			end
			if dist4 < 2 then
				ESX.ShowHelpNotification("Tekan E Untuk Membuka Berangkas "..k)
				
				  if IsControlJustReleased(0, Keys['E']) then
					   if ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'boss2' or ESX.PlayerData.job.grade_name == 'boss3' or ESX.PlayerData.job.grade_name == 'kombespol' or ESX.PlayerData.job.grade_name == 'akbp' or ESX.PlayerData.job.grade_name == 'kompol' or ESX.PlayerData.job.grade_name == 'akp' or ESX.PlayerData.job.grade_name == 'iptu' or ESX.PlayerData.job.grade_name == 'ipda' or ESX.PlayerData.job.grade_name == 'aiptu' or ESX.PlayerData.job.grade_name == 'aipda' or ESX.PlayerData.job.grade_name == 'bripka' or ESX.PlayerData.job.grade_name == 'brigadir' or ESX.PlayerData.job.grade_name == 'briptu' or ESX.PlayerData.job.grade_name == 'bripda' or ESX.PlayerData.job.grade_name == 'tamtama'  or ESX.PlayerData.job.grade_name == 'righthand' or ESX.PlayerData.job.grade_name == 'soldato' or ESX.PlayerData.job.grade_name == 'consigliere' or ESX.PlayerData.job.grade_name == 'capo' or ESX.PlayerData.job.grade_name == 'wakil' or ESX.PlayerData.job.grade_name == 'walikota' or ESX.PlayerData.job.grade_name == 'recrue' or ESX.PlayerData.job.grade_name == 'novice' or ESX.PlayerData.job.grade_name == 'experimente' or ESX.PlayerData.job.grade_name == 'uber' or ESX.PlayerData.job.grade_name == 'chief' or ESX.PlayerData.job.grade_name == 'magang' or ESX.PlayerData.job.grade_name == 'perawat' or ESX.PlayerData.job.grade_name == 'doktor' or ESX.PlayerData.job.grade_name == 'drspecial' or ESX.PlayerData.job.grade_name == 'sekertaris' or ESX.PlayerData.job.grade_name == 'wakdir' or ESX.PlayerData.job.grade_name == 'bripdaWAKWAK' then
						  OpenVaultInventoryMenu({job = k, needItemLicense = v.needItemLicense, InfiniteLicense = v.InfiniteLicense})
					  else
						  break
					  end	
				  end
			end
		 if dist5 < 2 then
				ESX.ShowHelpNotification("Tekan E Untuk Membuka Berangkas "..k)
				
				  if IsControlJustReleased(0, Keys['E']) then
				    if ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'boss2' or ESX.PlayerData.job.grade_name == 'boss3' or ESX.PlayerData.job.grade_name == 'kombespol' or ESX.PlayerData.job.grade_name == 'akbp' or ESX.PlayerData.job.grade_name == 'kompol' or ESX.PlayerData.job.grade_name == 'akp' or ESX.PlayerData.job.grade_name == 'iptu' or ESX.PlayerData.job.grade_name == 'ipda' or ESX.PlayerData.job.grade_name == 'aiptu' or ESX.PlayerData.job.grade_name == 'aipda' or ESX.PlayerData.job.grade_name == 'bripka' or ESX.PlayerData.job.grade_name == 'brigadir' or ESX.PlayerData.job.grade_name == 'briptu' or ESX.PlayerData.job.grade_name == 'bripda' or ESX.PlayerData.job.grade_name == 'tamtama'  or ESX.PlayerData.job.grade_name == 'righthand' or ESX.PlayerData.job.grade_name == 'soldato' or ESX.PlayerData.job.grade_name == 'consigliere' or ESX.PlayerData.job.grade_name == 'capo' or ESX.PlayerData.job.grade_name == 'wakil' or ESX.PlayerData.job.grade_name == 'walikota' or ESX.PlayerData.job.grade_name == 'recrue' or ESX.PlayerData.job.grade_name == 'novice' or ESX.PlayerData.job.grade_name == 'experimente' or ESX.PlayerData.job.grade_name == 'uber' or ESX.PlayerData.job.grade_name == 'chief' or ESX.PlayerData.job.grade_name == 'magang' or ESX.PlayerData.job.grade_name == 'perawat' or ESX.PlayerData.job.grade_name == 'doktor' or ESX.PlayerData.job.grade_name == 'drspecial' or ESX.PlayerData.job.grade_name == 'sekertaris' or ESX.PlayerData.job.grade_name == 'wakdir' or ESX.PlayerData.job.grade_name == 'bripdaWAKWAK' then
						  OpenVaultInventoryMenu({job = k, needItemLicense = v.needItemLicense, InfiniteLicense = v.InfiniteLicense})
					  else
						  break
					  end	
				  end
			end
		end
		
	end
end)

function getMonsterVaultLicense()
	return vaultType
end
