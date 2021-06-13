ESX = nil

local currentActionData = {}
local lastZone, currentAction, currentActionMsg

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function OpenLockerInventoryMenu(locker)
	ESX.TriggerServerCallback("mb_locker:getLockerInventory", function(inventory)
		TriggerEvent("esx_inventoryhud:openLockerInventory", inventory, locker)
	end, locker)
end

function OpenLockerMenu()
    ESX.TriggerServerCallback('mb_locker:check', function(owned)
        if owned then
			ESX.TriggerServerCallback('mb_locker:checkExpired', function(expired)
				local elements = {
					{label = _U("inventory"), value = "locker_inventory"},
					{label = _U('rent_stop'), value = 'stop_rent'}
				}

				if expired then
					table.insert(elements, {label = _U('extend'), value = 'extend'})
				end
				
				Citizen.Wait(200)

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'sewa_loker', {
					title = _U('locker'),
					align = 'top-left',
					elements = elements
				}, function(data, menu)
						menu.close()
						if data.current.value == "locker_inventory" then
							menu.close()
							OpenLockerInventoryMenu(currentLocker)
						elseif data.current.value == "stop_rent" then
							menu.close()
							TriggerServerEvent('mb_locker:stop', currentLocker)
						elseif data.current.value == 'extend' then
							menu.close()
							TriggerServerEvent('mb_locker:extend', currentLocker)
						end
					end, function(data, menu)
					menu.close()
				end)
			end, currentLocker)
            
        else
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'sewa_loker', {
                title = _U('locker'),
                align = 'top-left',
                elements = {
                    {label = _U("rent", Config.rentPrice), value = "locker_rent"}
                }}, function(data, menu)
                    menu.close()
                    if data.current.value == "locker_rent" then
                        menu.close()
                        TriggerServerEvent('mb_locker:rent', currentLocker)
                        Citizen.Wait(500)
                        OpenLockerMenu()
                    end
                end, function(data, menu)
                menu.close()
            end)
        end
    end, currentLocker)
end

-- Create blips
Citizen.CreateThread(function()
    for k,v in pairs(Config.Lockers) do
        local blip = AddBlipForCoord(v.coords)
        SetBlipSprite(blip, 587)
        SetBlipColour(blip, 18)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.name)
        EndTextCommandSetBlipName(blip)
    end
end)

AddEventHandler('esx_locker:hasEnteredMarker', function(zone)
	if zone == 'Locker' then
		currentAction     = 'locker_menu'
		currentActionMsg  = ('Tekan ~INPUT_CONTEXT~ untuk mengakses menu')
		currentActionData = {}
	end
end)

AddEventHandler('esx_locker:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	currentAction = nil
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords, isInMarker, currentZone, letSleep = GetEntityCoords(PlayerPedId()), false, nil, true

		for k,v in pairs(Config.Lockers) do
			local distance = #(playerCoords - v.coords)

			if distance < Config.DrawDistance then
				letSleep = false
				DrawMarker(Config.MarkerType, v.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)

				if distance < Config.MarkerSize.x then
					isInMarker, currentZone, currentLocker = true, "Locker", k
				end
			end
		end

		if (isInMarker and not hasAlreadyEnteredMarker) or (isInMarker and lastZone ~= currentZone) then
			hasAlreadyEnteredMarker, lastZone = true, currentZone
			TriggerEvent('esx_locker:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_locker:hasExitedMarker', lastZone)
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if currentAction then
			DisplayHelpText(currentActionMsg)

			if IsControlJustReleased(0, 38) then
				if currentAction == 'locker_menu' then
					OpenLockerMenu()
				end

				currentAction = nil
			end
		else
			Citizen.Wait(500)
		end
	end
end)