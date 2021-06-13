local spawnedCoke = 0
local CokePlants = {}
local isPickingUp, isProcessing, isSell = false, false, false


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.CokeField.coords, true) < 50 then
			SpawnCokePlants()
			Citizen.Wait(500)
		else
			Citizen.Wait(500)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.CokeProcessing.coords, true) < 5 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('coke_pooch_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then

				if Config.LicenseEnable then
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasProcessingLicense)
						if hasProcessingLicense then
							ProcessWeed()
						else
							OpenBuyLicenseMenu('coke_pooch_processing')
						end
					end, GetPlayerServerId(PlayerId()), 'coke_pooch_processing')
				else
					ProcessCoke()
				end

			end 
		else
			Citizen.Wait(500)
		end
	end
end)


function ProcessCoke()
	isProcessing = true

	ESX.ShowNotification(_U('coke_processingstarted'))
	TriggerServerEvent('goi-drugs:processCoke')
	local timeLeft = Config.Delays.CokeProcessing / 1000
	local playerPed = PlayerPedId()
	TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_COP_IDLES', 0, false)
	exports["progressBars"]:taskBar(25000, "Prosesing Coke")

	Citizen.Wait(25000)
	ClearPedTasks(playerPed)
	Citizen.Wait(18)

	while timeLeft > 0 do
		Citizen.Wait(18)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.CokeProcessing.coords, false) > 5 then
			ESX.ShowNotification(_U('coke_processingtoofar'))
			TriggerServerEvent('goi-drugs:cancelProcessing')
			break
		end
	end

	isProcessing = false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID

		for i=1, #CokePlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(CokePlants[i]), false) < 1 then
				nearbyObject, nearbyID = CokePlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowHelpNotification(_U('coke_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

				ESX.TriggerServerCallback('goi-drugs:canPickUp', function(canPickUp)

					if canPickUp then
						TriggerEvent("mythic_progbar:client:progress", {
							name = "WORLD_HUMAN_COP_IDLES",
							duration = 4000,
							label = 'Menyabut Coke',
							useWhileDead = true,
							canCancel = false,
							controlDisables = {
								disableMovement = true,
								disableCarMovement = true,
								disableMouse = false,
								disableCombat = true,
							},
	
							animation = {
								animDict = "creatures@rottweiler@tricks@",
								anim = "petting_franklin",
								flags = 49,
							},
	
							prop = {
							},
	
							propTwo = {
							},
						}, function(status)
							if not status then
								TriggerServerEvent('goi-drugs:pickedUpCoke')
								ESX.Game.DeleteObject(nearbyObject)
								table.remove(CokePlants, nearbyID)
					   	spawnedCoke = spawnedCoke - 1
							end
						end)
					else
						exports['mythic_notify']:SendAlert('error', 'Melebihi Kapasitas', 10000)
					end

					isPickingUp = false

				end, 'coke')
			end

		else
			Citizen.Wait(500)
		end

	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(CokePlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnCokePlants()
	while spawnedCoke < 15 do
		Citizen.Wait(0)
		local weedCoords = GenerateCokeCoords()

		ESX.Game.SpawnLocalObject('bkr_prop_coke_tablepowder', weedCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(CokePlants, obj)
			spawnedCoke = spawnedCoke + 1
		end)
	end
end

function ValidateCokeCoord(plantCoord)
	if spawnedCoke > 0 then
		local validate = true

		for k, v in pairs(CokePlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.CokeField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateCokeCoords()
	while true do
		Citizen.Wait(1)

		local weedCoordX, weedCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-20, 20)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-20, 20)

		weedCoordX = Config.CircleZones.CokeField.coords.x + modX
		weedCoordY = Config.CircleZones.CokeField.coords.y + modY

		local coordZ = GetCoordZCoke(weedCoordX, weedCoordY)
		local coord = vector3(weedCoordX, weedCoordY, coordZ)

		if ValidateCokeCoord(coord) then
			return coord
		end
	end
end

function GetCoordZCoke(x, y)
	local groundCheckHeights = { 70.0, 71.0, 72.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0, 80.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 77
end