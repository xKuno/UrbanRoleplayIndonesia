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

local PlayerData = {}
local menuIsShowed = false
local hintIsShowed = false
local hasAlreadyEnteredMarker = false
local Blips = {}
local JobBlips = {}
local isInMarker = false
local isInPublicMarker = false

local hintToDisplay = "no hint to display"
local onDuty = true


ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
	refreshBlips()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	refreshBlips()
end)


AddEventHandler('esx_cuciuang:action', function(job, zone)
	menuIsShowed = true
	if zone.Type == "work" then
		hintToDisplay = "no hint to display"
		hintIsShowed = false
		local playerPed = PlayerPedId()

		if IsPedInAnyVehicle(playerPed, false) then
			ESX.ShowNotification(_U('foot_work'))
		else
			TriggerServerEvent('esx_cuciuang:startWork', zone.Item)
		end

	elseif zone.Type == "delivery" then
		if Blips['delivery'] ~= nil then
			RemoveBlip(Blips['delivery'])
			Blips['delivery'] = nil
		end

		hintToDisplay = "no hint to display"
		hintIsShowed = false
		TriggerServerEvent('esx_cuciuang:startWork', zone.Item)
		TriggerEvent("mythic_progbar:client:progress", {
			name = "work",
			duration = 25000,
			label = "Sedang Mencuci Uang",
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = true,
			},
			animation = {
				animDict = "missheistdockssetup1clipboard@idle_a",
				anim = "idle_a",
			},
			prop = {
				model = "prop_notepad_01"	
			}
	}, function(status)
			if not status then
	
			end
	end)
	end
	--nextStep(zone.GPS)
end)

function nextStep(gps)
	if gps ~= 0 then
		if Blips['delivery'] ~= nil then
			RemoveBlip(Blips['delivery'])
			Blips['delivery'] = nil
		end

		Blips['delivery'] = AddBlipForCoord(gps.x, gps.y, gps.z)
		SetBlipRoute(Blips['delivery'], true)
		ESX.ShowNotification(_U('next_point'))
	end
end

AddEventHandler('esx_cuciuang:hasExitedMarker', function(zone)
	TriggerServerEvent('esx_cuciuang:stopWork')
	hintToDisplay = "no hint to display"
	menuIsShowed = false
	hintIsShowed = false
	isInMarker = false
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	onDuty = false
	deleteBlips()
	refreshBlips()
end)

function deleteBlips()
	if JobBlips[1] ~= nil then
		for i=1, #JobBlips, 1 do
			RemoveBlip(JobBlips[i])
			JobBlips[i] = nil
		end
	end
end

function refreshBlips()
	local zones = {}
	local blipInfo = {}

	if PlayerData.job ~= nil then
		for jobKey,jobValues in pairs(Config.Jobs) do

			if jobKey == PlayerData.job.name then
				for zoneKey,zoneValues in pairs(jobValues.Zones) do

					if zoneValues.Blip then
						local blip = AddBlipForCoord(zoneValues.Pos.x, zoneValues.Pos.y, zoneValues.Pos.z)
						SetBlipSprite  (blip, jobValues.BlipInfos.Sprite)
						SetBlipDisplay (blip, 4)
						SetBlipScale   (blip, 1.2)
						SetBlipCategory(blip, 3)
						SetBlipColour  (blip, jobValues.BlipInfos.Color)
						SetBlipAsShortRange(blip, true)

						BeginTextCommandSetBlipName("STRING")
						AddTextComponentString(zoneValues.Name)
						EndTextCommandSetBlipName(blip)
						table.insert(JobBlips, blip)
					end
				end
			end
		end
	end
end





-- Show top left hint
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if hintIsShowed then
			ESX.ShowHelpNotification(hintToDisplay)
		else
			Citizen.Wait(500)
		end
	end
end)

-- Display markers (only if on duty and the player's job ones)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local zones = {}

		if PlayerData.job ~= nil then
			for k,v in pairs(Config.Jobs) do
				if PlayerData.job.name == k then
					zones = v.Zones
				end
			end

			local coords = GetEntityCoords(PlayerPedId())
			for k,v in pairs(zones) do
				--if PlayerData.job.name == "mafia" or PlayerData.job.name == "biker" then
				if(PlayerData.job ~= nil and PlayerData.job.name == 'mafia' and PlayerData.job.grade > 1) or (PlayerData.job ~= nil and PlayerData.job.name == 'kompatriot' and PlayerData.job.grade > 1) or (PlayerData.job ~= nil and PlayerData.job.name == 'biker' and PlayerData.job.grade > 1) or (PlayerData.job ~= nil and PlayerData.job.name == 'yakuza' and PlayerData.job.grade > 1) or (PlayerData.job ~= nil and PlayerData.job.name == 'cartel' and PlayerData.job.grade > 2)  or (PlayerData.job ~= nil and PlayerData.job.name == 'ackerman' and PlayerData.job.grade > 1) or (PlayerData.job ~= nil and PlayerData.job.name == 'gang' and PlayerData.job.grade > 1) then
						if(v.Marker ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
						DrawMarker(v.Marker, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
					end
				end
			end
		end
	end
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(1)

		if PlayerData.job ~= nil and PlayerData.job.name ~= 'unemployed' then
			local zones = nil
			local job = nil

			for k,v in pairs(Config.Jobs) do
				if PlayerData.job.name == k then
					job = v
					zones = v.Zones
				end
			end

			if zones ~= nil then
				local coords      = GetEntityCoords(PlayerPedId())
				local currentZone = nil
				local zone        = nil
				local lastZone    = nil

				for k,v in pairs(zones) do
					if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 0.2 then
						isInMarker  = true
						currentZone = k
						zone        = v
						break
					else
						isInMarker  = false
					end
				end

				if IsControlJustReleased(0, Keys['E']) and not menuIsShowed and isInMarker then
					--if PlayerData.job.name == "mafia" or PlayerData.job.name == "biker" then
					if(PlayerData.job ~= nil and PlayerData.job.name == 'mafia' and PlayerData.job.grade > 1) or (PlayerData.job ~= nil and PlayerData.job.name == 'kompatriot' and PlayerData.job.grade > 1) or (PlayerData.job ~= nil and PlayerData.job.name == 'biker' and PlayerData.job.grade > 1) or (PlayerData.job ~= nil and PlayerData.job.name == 'yakuza' and PlayerData.job.grade > 1) or (PlayerData.job ~= nil and PlayerData.job.name == 'cartel' and PlayerData.job.grade > 2)  or (PlayerData.job ~= nil and PlayerData.job.name == 'ackerman' and PlayerData.job.grade > 1) or (PlayerData.job ~= nil and PlayerData.job.name == 'gang' and PlayerData.job.grade > 1) then
						TriggerEvent('esx_cuciuang:action', job, zone)
					end
				end

				-- hide or show top left zone hints

				if isInMarker and not hasAlreadyEnteredMarker then
					hasAlreadyEnteredMarker = true
				end

				if not isInMarker and hasAlreadyEnteredMarker then
					hasAlreadyEnteredMarker = false
					TriggerEvent('esx_cuciuang:hasExitedMarker', zone)
				end
			end
		end
	end
end)