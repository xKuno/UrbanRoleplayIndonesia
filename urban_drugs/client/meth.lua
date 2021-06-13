local spawnedMeths = 0
local Meths = {}
local isPickingUp, isProcessing = false, false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.MethField.coords, true) < 50 then
			SpawnMeths()
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

		if GetDistanceBetweenCoords(coords, Config.CircleZones.MethProcessing.coords, true) < 5 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('meth_pooch_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then

				if Config.LicenseEnable then
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasProcessingLicense)
						if hasProcessingLicense then
							ProcessMeth()
						else
							OpenBuyLicenseMenu('meth_pooch_processing')
						end
					end, GetPlayerServerId(PlayerId()), 'meth_pooch_processing')
				else
					ProcessMeth()
				end

			end
		else
			Citizen.Wait(500)
		end
	end
end)

function ProcessMeth()
	isProcessing = true

	ESX.ShowNotification(_U('meth_processingstarted'))
	TriggerServerEvent('goi-drugs:processMeth')
	local timeLeft = 15000
	local playerPed = PlayerPedId()
	TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_COP_IDLES', 0, false)
	exports["progressBars"]:taskBar(25000, "Prosesing Coke")

	Citizen.Wait(25000)
	ClearPedTasks(playerPed)
	Citizen.Wait(18)

	while timeLeft > 0 do
		Citizen.Wait(18)
		timeLeft = timeLeft - 1

		if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.MethProcessing.coords, false) > 5 then
			ESX.ShowNotification(_U('meth_processingtoofar'))
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

		for i=1, #Meths, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(Meths[i]), false) < 1 then
				nearbyObject, nearbyID = Meths[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowHelpNotification(_U('meth_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

				ESX.TriggerServerCallback('goi-drugs:canPickUp', function(canPickUp)

					if canPickUp then
						TriggerEvent("mythic_progbar:client:progress", {
							name = "world_human_gardener_plant",
							duration = 4000,
							label = 'Menyabut Meth',
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
								TriggerServerEvent('goi-drugs:pickedUpMeth')
								ESX.Game.DeleteObject(nearbyObject)
							table.remove(Meths, nearbyID)
						   spawnedMeths = spawnedMeths - 1
							end
						end)
					else
						exports['mythic_notify']:SendAlert('error', 'Melebihi Kapasitas', 10000)
					end

					isPickingUp = false

				end, 'meth')
			end

		else
			Citizen.Wait(500)
		end

	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(Meths) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnMeths() 
	while spawnedMeths < 15 do
		Citizen.Wait(0)
		local methCoords = GenerateMethCoords()

		ESX.Game.SpawnLocalObject('bkr_prop_meth_smashedtray_02', methCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(Meths, obj)
			spawnedMeths = spawnedMeths + 1
		end)
	end
end

function ValidateMethCoord(plantCoord)
	if spawnedMeths > 0 then
		local validate = true

		for k, v in pairs(Meths) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.MethField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateMethCoords()
	while true do
		Citizen.Wait(1)

		local methCoordX, methCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-7, 7)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-7, 7)

		methCoordX = Config.CircleZones.MethField.coords.x + modX
		methCoordY = Config.CircleZones.MethField.coords.y + modY

		local coordZ = GetCoordZMeth(methCoordX, methCoordY)
		local coord = vector3(methCoordX, methCoordY, coordZ)

		if ValidateMethCoord(coord) then
			return coord
		end
	end
end

function GetCoordZMeth(x, y)
	local groundCheckHeights = { 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 79.3
end