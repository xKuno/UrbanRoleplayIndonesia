local currentTags = {}
local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('timeplay:set_tags')
AddEventHandler('timeplay:set_tags', function (newPlayers)
    currentTags = newPlayers
end)

 Citizen.CreateThread(function ()

    while true do
        Citizen.Wait(0)

        local currentPed = PlayerPedId()
        local currentPos = GetEntityCoords(currentPed)

        local cx,cy,cz = table.unpack(currentPos)
        cz = cz + 1.2
        
        for k, v in pairs(currentTags) do
            local label = Config.label
            local newPlayer = GetPlayerPed(GetPlayerFromServerId(v.source))
            local newPlayerCoords = GetEntityCoords(newPlayer)
            local x,y,z = table.unpack(newPlayerCoords)
            z = z + 1.2

            local distance = GetDistanceBetweenCoords(vector3(cx,cy,cz), vector3(x,y,z), true)
            
            if label then
                if distance < 5 and GetPlayerServerId(PlayerId()) ~= v.source and HasEntityClearLosToEntity(currentPed, newPlayer, 17) then
                    ESX.Game.Utils.DrawText3D(vector3(x,y,z), string.format(label, GetPlayerName(GetPlayerFromServerId(v.source))), 1.5)
                end
            end
        end
    end

end)
---MULAI TACKEL
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedSprinting(PlayerPedId()) and IsControlJustReleased(0, 74) then --Change the key for tackling here.
			if IsPedInAnyVehicle(PlayerPedId()) then
			else
				local ForwardVector = GetEntityForwardVector(PlayerPedId())
				local Tackled = {}

				SetPedToRagdollWithFall(PlayerPedId(), 1000, 1500, 0, ForwardVector, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) --how long the tackler will remain down.

				while IsPedRagdoll(PlayerPedId()) do
					Citizen.Wait(0)
					for Key, Value in ipairs(getTouchedPlayers()) do
						if not Tackled[Value] then
							Tackled[Value] = true
							TriggerServerEvent('Tackle:Server:TacklePlayer', GetPlayerServerId(Value), ForwardVector, GetPlayerName(PlayerId()))
						end
					end
				end
			end
		end
	end
end)

RegisterNetEvent('Tackle:Client:TacklePlayer')
AddEventHandler('Tackle:Client:TacklePlayer',function(ForwardVector)
	SetPedToRagdollWithFall(PlayerPedId(), 3000, 3000, 0, ForwardVector, 10.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) --how long the person being tackled will remain down.
end)

function getPlayers()
    local players = {}

    for i = 0, 255 do
       if NetworkIsPlayerActive(i) then
            table.insert(players, i)
       end
    end

    return players
end

function getTouchedPlayers()
    local touchedPlayer = {}
    for Key, Value in ipairs(getPlayers()) do
		if IsEntityTouchingEntity(PlayerPedId(), GetPlayerPed(Value)) then
			table.insert(touchedPlayer, Value)
		end
    end
    return touchedPlayer
end


local ragdoll_chance = 0.8 -- edit this decimal value for chance of falling (e.g. 80% = 0.8    75% = 0.75    32% = 0.32)

-- code, not recommended to edit below this point
--print('chance of falling set to: ' .. ragdoll_chance)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100) -- check every 100 ticks, performance matters
		local ped = PlayerPedId()
		if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then
			local chance_result = math.random()
			---print('lose grip result: ' .. chance_result)
			if chance_result < ragdoll_chance then 
				Citizen.Wait(600) -- roughly when the ped loses grip
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08) -- change this float to increase/decrease camera shake
				SetPedToRagdoll(ped, 5000, 1, 2)
				--print('falling!')
			else
				Citizen.Wait(2000) -- cooldown before continuing
			end
		end
	end
end)

-- CONFIG NEMBAK DALEM MOBIL--

-- Allow passengers to shoot
local passengerDriveBy = true

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		car = GetVehiclePedIsIn(playerPed, false)
		if car then
			if GetPedInVehicleSeat(car, -1) == playerPed then
				SetPlayerCanDoDriveBy(PlayerId(), false)
			elseif passengerDriveBy then
				SetPlayerCanDoDriveBy(PlayerId(), true)
			else
				SetPlayerCanDoDriveBy(PlayerId(), false)
			end
		end
	end
end)
-- SELESAI TACKEL