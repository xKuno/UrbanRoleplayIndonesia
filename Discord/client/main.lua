ESX                           = nil
local PlayerData       = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
	TriggerServerEvent("esx:playerconnected")


end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

--[[
local isJacking = true
local isStolen = true
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if(IsPedInAnyVehicle(GetPlayerPed(-1)))then
			local playerPed = GetPlayerPed(-1)
			local coords    = GetEntityCoords(playerPed)
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 70)
			if(IsVehicleStolen(vehicle) and isStolen )then
				Wait(1000)
				TriggerServerEvent("esx:jackingcar",GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
				isStolen = false
			end
		else
			isStolen = true
			vehicle = nil
		end

		if(IsPedJacking(GetPlayerPed(-1))) then
				if(settings.LogPedJacking == true and isJacking) then
					local playerPed = GetPlayerPed(-1)
					local coords    = GetEntityCoords(playerPed)

					local vehicle = nil

					if IsPedInAnyVehicle(playerPed) then
						vehicle = GetVehiclePedIsIn(playerPed)

					else
						vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 70)

					end
					Wait(1000)
					TriggerServerEvent("esx:jackingcar",GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))

					isJacking = false
					vehicle = nil

				end
		else
			isJacking = true
		end




	end
end)





local isIncarPolice = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if(IsPedInAnyPoliceVehicle(GetPlayerPed(-1))) then
				if(settings.LogEnterPoliceVehicle == true and not isIncarPolice and PlayerData.job.name ~= "police") then
					TriggerServerEvent("esx:enterpolicecar",GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), 0))))
					isIncarPolice = true
				end

		else
			isIncarPolice = false
		end

	end
end)




local isIncar = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)


		if(IsPedInAnyVehicle(GetPlayerPed(-1)) and not IsPedInAnyPoliceVehicle(GetPlayerPed(-1))) then

				if(settings.LogEnterPoliceVehicle == true and not isIncar) then

					for i=1, #blacklistedModels, 1 do

						if(blacklistedModels[i] == GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), 0))))then
							TriggerServerEvent("esx:enterblacklistedcar",GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), 0))))
							isIncar = true
						end
					end
				end
		else
			isIncar = false
		end

	end
end)




local base = 0
Citizen.CreateThread(function()
    local isDead = false
    local hasBeenDead = false
	local diedAt

    while true do
        Wait(0)

        local player = PlayerId()

        if NetworkIsPlayerActive(player) then
            local ped = PlayerPedId()

            if IsPedFatallyInjured(ped) and not isDead then
                isDead = true
                if not diedAt then
                	diedAt = GetGameTimer()
                end

                local killer, killerweapon = NetworkGetEntityKillerOfPlayer(player)
				local killerentitytype = GetEntityType(killer)
				local killertype = -1
				local killerinvehicle = false
				local killervehiclename = ''
                local killervehicleseat = 0
				if killerentitytype == 1 then
					killertype = GetPedType(killer)
					if IsPedInAnyVehicle(killer, false) == 1 then
						killerinvehicle = true
						killervehiclename = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(killer)))
                        killervehicleseat = GetPedVehicleSeat(killer)
					else killerinvehicle = false
					end
				end

				local killerid = GetPlayerByEntityID(killer)
				if killer ~= ped and killerid ~= nil and NetworkIsPlayerActive(killerid) then killerid = GetPlayerServerId(killerid)
				else killerid = -1
				end

                if killer == ped or killer == -1 then
                    TriggerEvent('esx:killerlog',0, killertype, { table.unpack(GetEntityCoords(ped)) })
                    TriggerServerEvent('esx:killerlog',0, killertype, { table.unpack(GetEntityCoords(ped)) })
                    hasBeenDead = true
                else
                    TriggerEvent('esx:killerlog', 1,killerid, {killertype=killertype, weaponhash = killerweapon, killerinveh=killerinvehicle, killervehseat=killervehicleseat, killervehname=killervehiclename, killerpos=table.unpack(GetEntityCoords(ped))})
                    TriggerServerEvent('esx:killerlog',1, killerid, {killertype=killertype, weaponhash = killerweapon, killerinveh=killerinvehicle, killervehseat=killervehicleseat, killervehname=killervehiclename, killerpos=table.unpack(GetEntityCoords(ped))})
                    hasBeenDead = true
                end
            elseif not IsPedFatallyInjured(ped) then
                isDead = false
                diedAt = nil
            end
        end
    end
end)






RegisterNetEvent('murtaza:fix')
AddEventHandler('murtaza:fix', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleEngineHealth(vehicle, 1000)
		SetVehicleEngineOn( vehicle, true, true )
		SetVehicleFixed(vehicle)
		notification("~g~Bror vi admin abusade")
	else
		notification("~o~Bror du sitter inte i en bil")
	end
end)

RegisterNetEvent('murtaza:clean')
AddEventHandler('murtaza:clean', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleDirtLevel(vehicle, 0)
		notification("~b~Bror den är ren nu")
	else
		notification("~o~Du inte bil")
	end
end)

RegisterNetEvent('murtaza:noPerms')
AddEventHandler('murtaza:noPerms', function()
	notification("~r~Borttaget Command")
end)

function notification(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end



]]--

function GetPlayerByEntityID(id)
	for i=0,255 do
		if(NetworkIsPlayerActive(i) and GetPlayerPed(i) == id) then return i end
	end
	return nil
end
--- LOGO FIVEM
--[[
Citizen.CreateThread(function()
    while true do
		SetDiscordAppId(803575206790692895)
		SetDiscordRichPresenceAsset('logo_asset')
       SetDiscordRichPresenceAssetText('\nJoin! www.urban.id/discord!\n')
        local playerCount = #GetActivePlayers()
        local playerName = GetPlayerName(PlayerId())
        local maxPlayerSlots = "128"
        SetRichPresence(string.format("%s players", playerCount, maxPlayerSlots))
		Citizen.Wait(60000)
	end
end)
]]--
--- END LOGO FIVEM
-- LOGO FIVEM NEW
Citizen.CreateThread(function()
	while true do
        -- This is the Application ID (Replace this with you own)
		SetDiscordAppId(803575206790692895)

        -- Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('logo_asset')
        
        -- (11-11-2018) New Natives:

        -- Here you can add hover text for the "large" icon.
       SetDiscordRichPresenceAssetText('#DIGNITY & SOLIDARITY')
       
        -- Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('logo_asset')

        -- Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('\nJoin! www.urbanroleplay.id/discord!\n')


        -- (26-02-2021) New Native:

        --[[ 
            Here you can add buttons that will display in your Discord Status,
            First paramater is the button index (0 or 1), second is the title and 
            last is the url (this has to start with "fivem://connect/" or "https://") 
        ]]--
        SetDiscordRichPresenceAction(0, "Join Discord!", "https://urbanroleplay.id/discord")
        SetDiscordRichPresenceAction(1, "Website!", "https://urbanroleplay.id/")
        local playerCount = #GetActivePlayers()
        local playerName = GetPlayerName(PlayerId())
        local maxPlayerSlots = "128"
        SetRichPresence(string.format("%s players", playerCount, maxPlayerSlots))
        -- It updates every minute just in case.
		Citizen.Wait(60000)
	end
end)
---

