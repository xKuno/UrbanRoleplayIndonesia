local spawnedOpiums = 0
local OpiumPlants = {}
local isPickingUp, isProcessing = false, false


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.OpiumField.coords, true) < 50 then
			SpawnOpiumPlants()
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

		if GetDistanceBetweenCoords(coords, Config.CircleZones.OpiumProcessing.coords, true) < 5 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('opium_pooch_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then

				if Config.LicenseEnable then
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasProcessingLicense)
						if hasProcessingLicense then
							ProcessOpium()
						else
							OpenBuyLicenseMenu('opium_pooch_processing')
						end
					end, GetPlayerServerId(PlayerId()), 'opium_pooch_processing') 
				else
					ProcessOpium()
				end

			end
		else
			Citizen.Wait(500)
		end
	end
end)

function ProcessOpium()
	isProcessing = true

	ESX.ShowNotification(_U('opium_processingstarted'))
	TriggerServerEvent('goi-drugs:processOpium')
	local timeLeft = 25000
	local playerPed = PlayerPedId()
	TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_COP_IDLES', 0, false)
	exports["progressBars"]:taskBar(25000, "Prosesing Opium")

	Citizen.Wait(25000)
	ClearPedTasks(playerPed)
	Citizen.Wait(18)

	while timeLeft > 0 do
		Citizen.Wait(18)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.OpiumProcessing.coords, false) > 5 then
			ESX.ShowNotification(_U('opium_processingtoofar'))
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

		for i=1, #OpiumPlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(OpiumPlants[i]), false) < 1 then
				nearbyObject, nearbyID = OpiumPlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowHelpNotification(_U('opium_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

				ESX.TriggerServerCallback('goi-drugs:canPickUp', function(canPickUp)

					if canPickUp then
						TriggerEvent("mythic_progbar:client:progress", {
							name = "world_human_gardener_plant",
							duration = 4000,
							label = 'Menyabut Opium',
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
								TriggerServerEvent('goi-drugs:pickedUpOpium')
								ESX.Game.DeleteObject(nearbyObject)
								table.remove(OpiumPlants, nearbyID)
						    spawnedOpiums = spawnedOpiums - 1
							end
						end)
					else
						exports['mythic_notify']:SendAlert('error', 'Melebihi Kapasitas', 10000)
					end

					isPickingUp = false

				end, 'opium')
			end

		else
			Citizen.Wait(500)
		end

	end

end)


AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(OpiumPlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnOpiumPlants()
	while spawnedOpiums < 15 do
		Citizen.Wait(0)
		local opiumCoords = GenerateOpiumCoords()

		ESX.Game.SpawnLocalObject('bkr_prop_meth_acetone', opiumCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(OpiumPlants, obj)
			spawnedOpiums = spawnedOpiums + 1
		end)
	end
end

function ValidateOpiumCoord(plantCoord)
	if spawnedOpiums > 0 then
		local validate = true

		for k, v in pairs(OpiumPlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.OpiumField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateOpiumCoords()
	while true do
		Citizen.Wait(1)

		local opiumCoordX, opiumCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-20, 20)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-20, 20)

		opiumCoordX = Config.CircleZones.OpiumField.coords.x + modX
		opiumCoordY = Config.CircleZones.OpiumField.coords.y + modY

		local coordZ = GetCoordZOpium(opiumCoordX, opiumCoordY)
		local coord = vector3(opiumCoordX, opiumCoordY, coordZ)

		if ValidateOpiumCoord(coord) then
			return coord
		end
	end
end

function GetCoordZOpium(x, y)
	local groundCheckHeights = { 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 12.64
end