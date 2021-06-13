--- TACKLE
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

--- END TACKLE NEMBAK


-- MINIMAP
------------------------

-- RADAR

-- Toggle this to enable the use of the big map (That doesn't work together with the LAMBDA ASI)
local UseBigMap = true
-- Change this to change the big map toggle key while in a vehicle (More Controls at http://docs.fivem.net/game-references/controls/)
local BigMapKeyInVehicle = 344
-- Change this to false to disable the big map in vehicles
local BigMapInVehicles = true
-- Change this to false to enable the radar for every passenger
local OnlyDriver = false




-- NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!!
-- NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!!
-- NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!!
-- NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!!

local Hide = false

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		BigMapHandle(IsPedInAnyVehicle(PlayerPedId(), true), OnlyDriver and (GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == PlayerPedId()))
		if IsPedInAnyVehicle(PlayerPedId(), true) then
			if (OnlyDriver and (GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == PlayerPedId())) or not OnlyDriver then
				DisplayRadar(true)
			end
		end
	end
end)

function BigMapHandle(InVehicle, IsDriver)
	if UseBigMap and (((IsDriver or not OnlyDriver) and BigMapInVehicles and InVehicle and IsControlPressed(1, BigMapKeyInVehicle))) then
		DisplayRadar(true)
		SetRadarBigmapEnabled(true, false)	
		Hide = true
	else
		if not InVehicle or (InVehicle and OnlyDriver and not IsDriver) then
			DisplayRadar(false)
		end
		SetRadarBigmapEnabled(false, false)
		Hide = false
	end
end

function _DrawRect(X, Y, W, H, R, G, B, A, L)
	SetUiLayer(L)
	DrawRect(X, Y, W, H, R, G, B, A)
end

function GetMinimapAnchor()
    -- Safezone goes from 1.0 (no gap) to 0.9 (5% gap (1/20))
    -- 0.05 * ((safezone - 0.9) * 10)
    local safezone = GetSafeZoneSize()
    local safezone_x = 1.0 / 20.0
    local safezone_y = 1.0 / 20.0
    local aspect_ratio = GetAspectRatio(0)
    local res_x, res_y = GetActiveScreenResolution()
    local xscale = 1.0 / res_x
    local yscale = 1.0 / res_y
    local Minimap = {}
    Minimap.width = xscale * (res_x / (4 * aspect_ratio))
    Minimap.height = yscale * (res_y / 5.674)
    Minimap.left_x = xscale * (res_x * (safezone_x * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.bottom_y = 1.0 - yscale * (res_y * (safezone_y * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.right_x = Minimap.left_x + Minimap.width
    Minimap.top_y = Minimap.bottom_y - Minimap.height
    Minimap.x = Minimap.left_x
    Minimap.y = Minimap.top_y
    Minimap.xunit = xscale
    Minimap.yunit = yscale
    return Minimap
end

Citizen.CreateThread(function()
    SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
		if IsPedOnFoot(GetPlayerPed(-1)) then 
			SetRadarZoom(1100)
		elseif IsPedInAnyVehicle(GetPlayerPed(-1), true) then
			SetRadarZoom(1100)
		end
    end
end)

Citizen.CreateThread(function()
    local minimap = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(true, false)
    Wait(0)
    SetRadarBigmapEnabled(false, false)
    while true do
        Wait(0)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
    end
end)


-----------------------
--- NO VDM
Citizen.CreateThread(function()
    while true do
        N_0x4757f00bc6323cfe(-1553120962, 0.0) 
        Wait(0)
    end
end)
----------------------------------------------------------------------------
--MELEE AND WEAPONS DAMAGE 
----------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.25) 
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.40) 
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNIFE"), 0.20) 
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BATTLEAXE"), 0.20) 
    Wait(0)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNUCKLE"), 0.20) 
    Wait(0)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HAMMER"), 0.20) 
    Wait(0)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_GOLFCLUB"), 0.20) 
    Wait(0)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BAT"), 0.20) 
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_WRENCH"), 0.20) 
    Wait(0)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CROWBAR"), 0.20) 
    Wait(0)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BOTTLE"), 0.20) 
    Wait(0)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_DAGGER"), 0.25) 
    Wait(0)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HATCHET"), 0.25) 
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_POOLCUE"), 0.20) 
    Wait(0)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MACHETE"), 0.20) 
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNIFE"), 0.25) 
    Wait(0)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_FLASHLIGHT"), 0.20) 
    Wait(0)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SWITCHBLADE"), 0.25) 
    Wait(0)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SMOKEGRENADE"), 0.00) 
    Wait(0)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_FIREEXTINGUISHER"), 0.00) 
    Wait(0)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PETROLCAN"), 0.00) 
    Wait(0)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_STUNGUN"), 0.00) 
    Wait(0)
    end
end)
----------------------------------------------------------------------------
--PISTOL WHIPPING
----------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
	local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
	   DisableControlAction(1, 140, true)
       	   DisableControlAction(1, 141, true)
           DisableControlAction(1, 142, true)
        end
    end
end)



-- MULAI CHAR BL MOBIL POLISI
CarsBL = {
    "polmav",
    "ambulance",
    "ems_bmwgs",
    "dodgesamu",
    "police",
    "polgs350",
    "vapidpolisi",
    "pol718",
    "riot",
    "tritonpolisi",
    "silveradopolisi",
    "hiluxpolisi",
    "fbi2",
    "wmfenyrcop",
    "polp1",
    "firetruk",
    "17raptorpd",
    "police_bmwgs",
    "fenyrcop",
    "18mustang",
    "police3",
    "menswat",
    "PBus",
    "code3bmw",
    "code3camero",
    "code3cap",
   "code3cvpi",
    "code3durango",
    "polmp4",
    "polf430",
    "pol718",
    "police2",
    "ambulancei",
    "ems_gs1200",
    "pd_dirtbike",
    "predator",
    "frogger2",
    "inem_vwcrafter",
    "l200_inem",
    "dodgeems",
    "emsnspeedo",
    "emsroamer",
    "pol_gs1200",
    "polalamop",
    "polbuffalop",
    "polstalkerp",
    "polroamerp",
	"sanchezems",
	"lcjendral",
	"bcat",
	"polcarap",
	"polfugitivep",
	"polgresleyp",
	"polroamerp",
	"polscoutp",
	"poltorencep",
	"polstanierp",
}



function isCarBlacklisted(model)
    for _, blacklistedCar in pairs(CarsBL) do
        if model == GetHashKey(blacklistedCar) then
            return true
        end
    end

    return false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if IsPedInAnyVehicle(GetPlayerPed(-1)) then
            v = GetVehiclePedIsIn(playerPed, false)
        end
        playerPed = GetPlayerPed(-1)
        
        if playerPed and v then
            if GetPedInVehicleSeat(v, -1) == playerPed then
                local car = GetVehiclePedIsIn(playerPed, false)
                carModel = GetEntityModel(car)
                carName = GetDisplayNameFromVehicleModel(carModel)
                if isCarBlacklisted(carModel) then
                    if PlayerData.job ~= nil and PlayerData.job.name == 'police' or PlayerData.job ~= nil and PlayerData.job.name == 'mechanic' or PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' or PlayerData.job ~= nil and PlayerData.job.name == 'polantas' then
                    else
                    ClearPedTasksImmediately(GetPlayerPed(-1))
                    TriggerEvent('notification', 'KAMU TIDAK MEMILIKI AKSES!', 2)
                    end
                end
            end
        end
    end
end)
--- SELESAI CARBL
-- JONGKOK
local crouched = false

Citizen.CreateThread( function()
    while true do 
        Citizen.Wait( 1 )

        local ped = GetPlayerPed( -1 )

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
            DisableControlAction( 0, 36, true ) -- INPUT_DUCK  

            if ( not IsPauseMenuActive() ) then 
                if ( IsDisabledControlJustPressed( 0, 36 ) ) then 
                    RequestAnimSet( "move_ped_crouched" )

                    while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
                        Citizen.Wait( 100 )
                    end 

                    if ( crouched == true ) then 
                        ResetPedMovementClipset( ped, 0 )
                        crouched = false 
                    elseif ( crouched == false ) then
                        SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
                        crouched = true 
                    end 
                end
            end 
        end 
    end
end )
-- MULAI SemArmasReward

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		id = PlayerId()
		DisablePlayerVehicleRewards(id)	
	end
end)
-- SELESAI SemArmasReward
--- AFK ZONE
---- AFK
--------------------------------------------------------------------------------------------------------------
------------First off, many thanks to @anders for help with the majority of this script. ---------------------
------------Also shout out to @setro for helping understand pNotify better.              ---------------------
--------------------------------------------------------------------------------------------------------------
------------To configure: Add/replace your own coords in the sectiong directly below.    ---------------------
------------        Goto LINE 90 and change "50" to your desired SafeZone Radius.        ---------------------
------------        Goto LINE 130 to edit the Marker( Holographic circle.)               ---------------------
--------------------------------------------------------------------------------------------------------------
-- Place your own coords here!
local zones = {
	{ ['x'] = 1082.896015625, ['y'] = -687.5590917968, ['z'] = 57.637009735108}
}

local notifIn = false
local notifOut = false
local closestZone = 1


--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
-------                              Creating Blips at the locations. 							--------------
-------You can comment out this section if you dont want any blips showing the zones on the map.--------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	for i = 1, #zones, 1 do
		local szBlip = AddBlipForCoord(zones[i].x, zones[i].y, zones[i].z)
		SetBlipAsShortRange(szBlip, true)
		SetBlipColour(szBlip, 1)  --Change the blip color: https://gtaforums.com/topic/864881-all-blip-color-ids-pictured/
		SetBlipSprite(szBlip, 205) -- Change the blip itself: https://marekkraus.sk/gtav/blips/list.html
		SetBlipScale(szBlip, 0.7)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("AFK ZONE") -- What it will say when you hover over the blip on your map.
		EndTextCommandSetBlipName(szBlip)

		playArea = AddBlipForRadius(zones[i].x, zones[i].y, zones[i].z, 30.0)

        SetBlipColour(playArea, 2)
        SetBlipAlpha (playArea, 128)
	end
end)
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
----------------   Getting your distance from any one of the locations  --------------------------------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do
		local playerPed = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
		local minDistance = 100000
		for i = 1, #zones, 1 do
			dist = Vdist(zones[i].x, zones[i].y, zones[i].z, x, y, z)
			if dist < minDistance then
				minDistance = dist
				closestZone = i
			end
		end
		Citizen.Wait(15000)
	end
end)

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
---------   Setting of friendly fire on and off, disabling your weapons, and sending pNoty   -----------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(100)
	end
	
	while true do
		Citizen.Wait(0)
		local player = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(player, true))
		local veh = GetVehiclePedIsUsing(ped)
		local dist = Vdist(zones[closestZone].x, zones[closestZone].y, zones[closestZone].z, x, y, z)
	
		if dist <= 30.0 then  ------------------------------------------------------------------------------ Here you can change the RADIUS of the Safe Zone. Remember, whatever you put here will DOUBLE because 
			if not notifIn then																			  -- it is a sphere. So 50 will actually result in a diameter of 100. I assume it is meters. No clue to be honest.
				--SetPlayerInvincible(GetPlayerIndex(),true)
				SetEntityCollision(veh,false,false)
				--SetEntityInvincible(veh,true)
				NetworkSetFriendlyFireOption(false)
				--SetVehicleDoorsLocked(veh,4)
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
				notifIn = true
				notifOut = false
				TriggerEvent('esx_basicneeds:afkZone', true)
			end
		else
			if not notifOut then
				NetworkSetFriendlyFireOption(true)
				notifOut = true
				notifIn = false
				TriggerEvent('esx_basicneeds:afkZone', false)
			end
		end
		if notifIn then
		ESX.UI.Menu.CloseAll()
		DisableControlAction(2, 37, true) -- disable weapon wheel (Tab)
		DisableControlAction(0, 140, true)
		DisableControlAction(1, 167, true)
		DisableControlAction(0, 21, true)
		DisableControlAction(1, 74, true)
		DisableControlAction(1, 245, true)
		DisableControlAction(0, 169, true)
		DisablePlayerFiring(player,true) -- Disables firing all together if they somehow bypass inzone Mouse Disable
		DisableControlAction(0, 106, true) -- Disable in-game mouse controls
		--[[TriggerEvent('esx_status:getStatus', 'hunger', function(status)
			if status.val < 950000  then
				TriggerEvent('esx_status:set', 'hunger', 1000000)
				TriggerEvent('esx_status:set', 'thirst', 1000000)
			end
		end)]]
			if IsDisabledControlJustPressed(2, 37) then --if Tab is pressed, send error message
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) -- if tab is pressed it will set them to unarmed (this is to cover the vehicle glitch until I sort that all out)
			end
			if IsDisabledControlJustPressed(0, 106) then --if LeftClick is pressed, send error message
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) -- If they click it will set them to unarmed
			end
		end
		-- Comment out lines 142 - 145 if you dont want a marker.
	 	--if DoesEntityExist(player) then	      --The -1.0001 will place it on the ground flush		-- SIZING CIRCLE |  x    y    z | R   G    B   alpha| *more alpha more transparent*
	 		--DrawMarker(1, zones[closestZone].x, zones[closestZone].y, zones[closestZone].z-1.0001, 0, 0, 0, 0, 0, 0, 100.0, 100.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0) -- heres what all these numbers are. Honestly you dont really need to mess with any other than what isnt 0.
	 		--DrawMarker(type, float posX, float posY, float posZ, float dirX, float dirY, float dirZ, float rotX, float rotY, float rotZ, float scaleX, float scaleY, float scaleZ, int red, int green, int blue, int alpha, BOOL bobUpAndDown, BOOL faceCamera, int p19(LEAVE AS 2), BOOL rotate, char* textureDict, char* textureName, BOOL drawOnEnts)
	 	--end
	end
end)
-- SELESAI AFK ZONE
---- MULAI POINT FINGER
local mp_pointing = false
local keyPressed = false

local function startPointing()
    local ped = GetPlayerPed(-1)
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(0)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

local function stopPointing()
    local ped = GetPlayerPed(-1)
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
end

local once = true
local oldval = false
local oldvalped = false

Citizen.CreateThread(function()
    while true do
        Wait(0)

        if once then
            once = false
        end

        if not keyPressed then
            if IsControlPressed(0, 29) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then
                Wait(200)
                if not IsControlPressed(0, 29) then
                    keyPressed = true
                    startPointing()
                    mp_pointing = true
                else
                    keyPressed = true
                    while IsControlPressed(0, 29) do
                        Wait(50)
                    end
                end
            elseif (IsControlPressed(0, 29) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
                keyPressed = true
                mp_pointing = false
                stopPointing()
            end
        end

        if keyPressed then
            if not IsControlPressed(0, 29) then
                keyPressed = false
            end
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
            stopPointing()
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
            if not IsPedOnFoot(PlayerPedId()) then
                stopPointing()
            else
                local ped = GetPlayerPed(-1)
                local camPitch = GetGameplayCamRelativePitch()
                if camPitch < -70.0 then
                    camPitch = -70.0
                elseif camPitch > 42.0 then
                    camPitch = 42.0
                end
                camPitch = (camPitch + 70.0) / 112.0

                local camHeading = GetGameplayCamRelativeHeading()
                local cosCamHeading = Cos(camHeading)
                local sinCamHeading = Sin(camHeading)
                if camHeading < -180.0 then
                    camHeading = -180.0
                elseif camHeading > 180.0 then
                    camHeading = 180.0
                end
                camHeading = (camHeading + 180.0) / 360.0

                local blocked = 0
                local nn = 0

                local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                nn,blocked,coords,coords = GetRaycastResult(ray)

                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)

            end
        end
    end
end)
-- SELESAI POINT FINGER

-- MULAI HANDSUP
Citizen.CreateThread(function()
    local dict = "missminuteman_1ig_2"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, 323) then --Start holding X
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "handsup_enter", 8.0, 8.0, -1, 50, 50, false, false, false)
                handsup = true
            else
                handsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        end
    end
end)
-- SELESAI HANDSUP
-- MULAI SHUFF
--[[ SEAT SHUFFLE ]]--
--[[ BY JAF ]]--

local disableShuffle = true
function disableSeatShuffle(flag)
	disableShuffle = flag
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) and disableShuffle then
			if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
				if GetIsTaskActive(GetPlayerPed(-1), 165) then
					SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
				end
			end
		end
	end
end)

RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		disableSeatShuffle(false)
		Citizen.Wait(5000)
		disableSeatShuffle(true)
	else
		CancelEvent()
	end
end)

RegisterCommand("shuff", function(source, args, raw) --change command here
    TriggerEvent("SeatShuffle")
end, false) --False, allow everyone to run it
-- SELESAI SHUFF
-- MULAI AFK --

--[[ AFK Kick Time Limit (in seconds)
secondsUntilKick = 2000

-- Warn players if 3/4 of the Time Limit ran up
kickWarning = true

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(2000)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if time > 0 then
					if kickWarning and time == math.ceil(secondsUntilKick / 4) then
						TriggerEvent("chatMessage", "WARNING", {255, 0, 0}, "^1You'll be kicked in " .. time .. " seconds for being AFK!")
					end

					time = time - 1
				else
					TriggerServerEvent("kickForBeingAnAFKDouchebag")
				end
			else
				time = secondsUntilKick
			end

			prevPos = currentPos
		end
	end
end)

]]-- SELESAI AFK

-- MULAI HELP
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
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000)
		PlayerData = ESX.GetPlayerData()
	end
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/911', '', {
    { name="Pesan", help="Tulis Pesan Anda di sini!" }
})
end)

msg = nil
RegisterCommand('911', function(source, args, rawCommand)
	TriggerEvent("chatMessage"," [System] ", {255,0,0},   "Pesan telah dikirim ke EMS" )

	msg = table.concat(args, " ")

	PedPosition		= GetEntityCoords(GetPlayerPed(-1))
	
    local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }
    local playerCoords = GetEntityCoords(PlayerPedId())
		streetName,_ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
		streetName = GetStreetNameFromHashKey(streetName)
	local msg = rawCommand:sub(5)
	local emergency = '311'
    TriggerServerEvent('goi:Help',{
        x = ESX.Math.Round(playerCoords.x, 1),
        y = ESX.Math.Round(playerCoords.y, 1),
        z = ESX.Math.Round(playerCoords.z, 1)
	}, msg, streetName, emergency)
end, false)

RegisterNetEvent('goi:HelpEmergencySend')
AddEventHandler('goi:HelpEmergencySend', function(messageFull)
	PlayerData = ESX.GetPlayerData()
	if PlayerData.job.name == 'ambulance' then
		TriggerEvent('chat:addMessage', messageFull)
	end
end)

RegisterNetEvent('goi:HelpEmergencySend')
AddEventHandler('goi:HelpEmergencySend', function(messageFull)
	PlayerData = ESX.GetPlayerData()
	if PlayerData.job.name == 'ambulance' then
		SetNotificationTextEntry("STRINGS");
		AddTextComponentString(normalString);
		SetNotificationMessage("CHAR_CHAT_CALL", "CHAR_CHAT_CALL", true, 8, "~y~EMS Notice~s~", "GPS location sent");
		DrawNotification(false, true);
	end
end)

RegisterNetEvent('goi:HelpMarker')
AddEventHandler('goi:HelpMarker', function(targetCoords, type)
    PlayerData = ESX.GetPlayerData()
    if PlayerData.job.name == 'ambulance' then
		local alpha = 250
		local call = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)
		
		SetBlipSprite (call, 480)
		SetBlipDisplay(call, 4)
		SetBlipScale  (call, 1.6)
        SetBlipAsShortRange(call, true)
        SetBlipAlpha(call, alpha)

        SetBlipHighDetail(call, true)
		SetBlipAsShortRange(call, true)

		if type == '311' then
			SetBlipColour (call, 1)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString('Lokasi Korban')
			EndTextCommandSetBlipName(call)
		end

		while alpha ~= 0 do
			Citizen.Wait(100 * 4)
			alpha = alpha - 1
			SetBlipAlpha(call, alpha)

			if alpha == 0 then
				RemoveBlip(call)
				return
			end
		end
	end
end)
-- SELESAI HELP
-- mulai sles K
--	  AresstAnims - Aresst animations for FiveM
--    Copyright (C) 2017  Cosharek
--
--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--   (at your option) any later version.
--
--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with this program.  If not, see <http://www.gnu.org/licenses/>.

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

RegisterNetEvent( 'KneelHU' )
AddEventHandler( 'KneelHU', function()
    local player = GetPlayerPed( -1 )
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
        loadAnimDict( "random@arrests" )
		loadAnimDict( "random@arrests@busted" )
		if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then 
			TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (3000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
        else
            TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (4000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (500)
			TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (1000)
			TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
        end     
    end
end )

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "idle_a", 3) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(0,21,true)
		end
	end
end)
-- SELESAI SLES K 
-- MULAI MENU MOBIL
-- C O N F I G --
interactionDistance = 3.5 --The radius you have to be in to interact with the vehicle.
lockDistance = 25 --The radius you have to be in to lock your vehicle.

--  V A R I A B L E S --
engineoff = false
saved = false
controlsave_bool = false

-- E N G I N E --
IsEngineOn = true
RegisterNetEvent('wak-ganteng:mesin')
AddEventHandler('wak-ganteng:mesin',function() 
	local player = GetPlayerPed(-1)
	
	if (IsPedSittingInAnyVehicle(player)) then 
		local vehicle = GetVehiclePedIsIn(player,false)
		
		if IsEngineOn == true then
			IsEngineOn = false
			SetVehicleEngineOn(vehicle,false,false,false)
		else
			IsEngineOn = true
			SetVehicleUndriveable(vehicle,false)
			SetVehicleEngineOn(vehicle,true,false,false)
		end
		
		while (IsEngineOn == false) do
			SetVehicleUndriveable(vehicle,true)
			Citizen.Wait(0)
		end
	end
end)

RegisterNetEvent('engineoff')
AddEventHandler('engineoff',function() 
		local player = GetPlayerPed(-1)

        if (IsPedSittingInAnyVehicle(player)) then 
            local vehicle = GetVehiclePedIsIn(player,false)
			engineoff = true
			ShowNotification("Engine ~r~off~s~.")
			while (engineoff) do
			SetVehicleEngineOn(vehicle,false,false,false)
			SetVehicleUndriveable(vehicle,true)
			Citizen.Wait(0)
			end
		end
end)
RegisterNetEvent('engineon')
AddEventHandler('engineon',function() 
    local player = GetPlayerPed(-1)

        if (IsPedSittingInAnyVehicle(player)) then 
            local vehicle = GetVehiclePedIsIn(player,false)
			engineoff = false
			SetVehicleUndriveable(vehicle,false)
			SetVehicleEngineOn(vehicle,true,false,false)
			ShowNotification("Engine ~g~on~s~.")
	end
end)
-- T R U N K --
RegisterNetEvent('wak-ganteng:bukatrunk')
AddEventHandler('wak-ganteng:bukatrunk',function() 
	local player = GetPlayerPed(-1)
			if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			
			local isopen = GetVehicleDoorAngleRatio(vehicle,5)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,5,0,0)
				else
				SetVehicleDoorShut(vehicle,5,0)
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
end)
-- R E A R  D O O R S --
RegisterNetEvent('rdoors')
AddEventHandler('rdoors',function() 
	local player = GetPlayerPed(-1)
    		if controlsave_bool == true then
				vehicle = saveVehicle
			else
				vehicle = GetVehiclePedIsIn(player,true)
			end
			local isopen = GetVehicleDoorAngleRatio(vehicle,2) and GetVehicleDoorAngleRatio(vehicle,3)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,2,0,0)
				SetVehicleDoorOpen(vehicle,3,0,0)
				else
				SetVehicleDoorShut(vehicle,2,0)
				SetVehicleDoorShut(vehicle,3,0)
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
end)		

-- H O O D --
RegisterNetEvent('wak-ganteng:bukahood')
AddEventHandler('wak-ganteng:bukahood',function() 
	local player = GetPlayerPed(-1)
    	if controlsave_bool == true then
			vehicle = saveVehicle
		else
			vehicle = GetVehiclePedIsIn(player,true)
		end
			
			local isopen = GetVehicleDoorAngleRatio(vehicle,4)
			local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
			
			if distanceToVeh <= interactionDistance then
				if (isopen == 0) then
				SetVehicleDoorOpen(vehicle,4,0,0)
				else
				SetVehicleDoorShut(vehicle,4,0)
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
end)
-- L O C K --
RegisterNetEvent('lockLights')
AddEventHandler('lockLights',function()
local vehicle = saveVehicle
	StartVehicleHorn(vehicle, 100, 1, false)
	SetVehicleLights(vehicle, 2)
	Wait (200)
	SetVehicleLights(vehicle, 0)
	StartVehicleHorn(vehicle, 100, 1, false)
	Wait (200)
	SetVehicleLights(vehicle, 2)
	Wait (400)
	SetVehicleLights(vehicle, 0)
end)

RegisterNetEvent('lock')
AddEventHandler('lock',function()
	local player = GetPlayerPed(-1)
    local vehicle = saveVehicle
	local islocked = GetVehicleDoorLockStatus(vehicle)
	local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
		if DoesEntityExist(vehicle) then
			if distanceToVeh <= lockDistance then
				if (islocked == 1)then
				SetVehicleDoorsLocked(vehicle, 2)
				ShowNotification("You have locked your ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~.")
				TriggerEvent('lockLights')
				else
				SetVehicleDoorsLocked(vehicle,1)
				ShowNotification("You have unlocked your ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~.")
				TriggerEvent('lockLights')
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
		else
			ShowNotification("~r~No saved vehicle.")
		end
	end)

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end
-- S A V E --
RegisterNetEvent('save')
AddEventHandler('save',function() 
	local player = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(player)) then 
		if  saved == true then
			--remove from saved.
			saveVehicle = nil
			RemoveBlip(targetBlip)
			ShowNotification("Saved vehicle ~r~removed~w~.")
			saved = false
		else
			RemoveBlip(targetBlip)
			saveVehicle = GetVehiclePedIsIn(player,true)
			local vehicle = saveVehicle
			targetBlip = AddBlipForEntity(vehicle)
			SetBlipSprite(targetBlip,225)
			ShowNotification("This ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~ is now your~g~ saved ~w~vehicle.")
			saved = true
		end
	end
end)
-- R E M O T E --
RegisterNetEvent('controlsave')
AddEventHandler('controlsave',function() 
		if controlsave_bool == false then
			controlsave_bool = true
			if saveVehicle == nil then
			ShowNotification("~r~No saved vehicle.")
			else
			ShowNotification("You are no longer controlling your ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(saveVehicle))))
			end
		else
			controlsave_bool = false
			if saveVehicle == nil then
			ShowNotification("~r~No saved vehicle.")
			else
			ShowNotification("You are no longer controlling your ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(saveVehicle))))
			end
		end
end)

-- REGISTER 
RegisterCommand("hood", function()
    TriggerEvent('wak-ganteng:bukahood')
end)

RegisterCommand("trunk", function()
    TriggerEvent('wak-ganteng:bukatrunk')
end)


RegisterCommand("engine", function()
    TriggerEvent('wak-ganteng:mesin')
end)

-- SELESAI MENU MOBIL

-- MULAI WAKTP / EVALATOR
--[[

    Elevators for FiveM
    By DoJoMan18 (DoJoMan18.com).

    You can change the keys here, if you change them you have to also change them in the notifications on line 78. For more information see: (https://docs.fivem.net/docs/game-references/controls/)

--]]

key_floor_up = 188 -- ARROW UP
key_floor_down = 187 -- ARROW DOWN

--[[

The numbers in the elevators array (line 29) should always count up. Do not leave a gap like this:

    [1] = {
        (coords here)
    },
    [4] = {
        (coords here)
    },
    [10] = {
        (coords here)
    },

]]--


elevators = {
    [1] = { -- kanpol vespucci
        -- -1
        {-1095.97, -850.46, 4.88, "Lantai -1"},
        -- -2
        {-1095.93, -850.54, 10.28, "Lantai -2"},
        -- -3
        {-1095.93, -850.53, 13.68, "Lantai -3"},
        -- 1
        {-1095.91, -850.72, 19, "Lobby"},
        -- 2
        {-1095.92, -850.51, 23.04, "Lantai 2"},
        -- 3
        {-1095.92, -850.5, 26.83, "Lantai 3"},
        -- 4
        {-1095.91, -850.5, 30.76, "Lantai 4"},
        -- 5 
        {-1095.91, -850.51, 34.36, "Lantai 5"},
        -- 6
        {-1095.91, -850.52, 38.24, "Lantai 6"}
    },
    [2] = { -- 1002 Army Base
        {-2361.00, 3249.20, 31.80},{-2361.00, 3249.20, 91.80},{-2361.00, 3249.20, 31.80}
    },
    [3] = { -- 140 Morgue
        {246.43, -1372.55, 24.54},{248.68, -1369.94, 29.65},{246.43, -1372.55, 24.54}
    },
    [4] = { -- 963 Humane Labs and Research
        {3540.75, 3676.64, 21.00},{3540.75, 3676.64, 28.12},{3540.75, 3676.64, 21.00}
	},
    [4] = { -- RS Pilbox
		{-793.92, -1245.99, 7.34, "Helipad"},
		--
        {-774.06, -1207.39, 51.15, "Lantai 1"},
    },
	 [5] = { -- Bahamas
        {-1388.49, -586.72, 30.22, "Keluar"},
		--
		{-1389.19, -592.07, 30.32, "Masuk"},
    },
	 [6] = { -- RUMAH 656 AKSES KOLAM
        {-1098.27, -325.47, 37.82, "Turun"},
		--
		{-1112.58, -335.45, 50.02, "Naik Ke Kolam"},
    },
	 [7] = { -- JOB CENTER BARU
        {-118.21, -607.14, 35.28, "Turun"},
		--
		{-141.75, -621.07, 168.82, "Naik Ke Job Center"},
    },
    [8] = { -- RS Moon Zonah
        -- -1
        {-418.69, -344.67, 23.33, "Parking"},
        -- -2
        {-452.43, -288.46, 33.89, "Lobby"},
        -- -3
       {-452.58, -288.41, 68.60, "Private Room"},
        -- 1
       --[[  {-1095.91, -850.72, 19, "Lobby"},
        -- 2
        {-1095.92, -850.51, 23.04, "Lantai 2"},
        -- 3
        {-1095.92, -850.5, 26.83, "Lantai 3"},
        -- 4
        {-1095.91, -850.5, 30.76, "Lantai 4"},
        -- 5 
        {-1095.91, -850.51, 34.36, "Lantai 5"},
        -- 6
        {-1095.91, -850.52, 38.24, "Lantai 6"}]]--
    },
}

Citizen.CreateThread(function()
    -- turn positions into vectors for faster calculations
    for i = 1, #elevators do
        for k,floor in ipairs(elevators[i]) do
            elevators[i][k] = {vector3(floor[1], floor[2], floor[3]), floor[4]}
        end
    end
    while true do
        Citizen.Wait(5)
        local player = PlayerPedId()
        local PlayerLocation = GetEntityCoords(player)

        for i = 1, #elevators do
            for k,floor in ipairs(elevators[i]) do
                -- New floor
                local Level = floor[1]
                local distance = #(PlayerLocation - Level)
                if distance < 2.0 then
                    -- Get the total amount of floors
                    local numFloors = #elevators[i]

                    -- Check if there are floors above and below our current floor
                    local floorUp = nil
                    if k < numFloors then
                        floorUp = elevators[i][k + 1]
                    end
                    local floorDown = nil
                    if k > 1 then
                        floorDown = elevators[i][k - 1]
                    end

                    -- Text to show
                    -- Show current floor
                    local message = "Lift (" .. (floor[2] or "Floor " .. k) .. ")"
                    if floorUp then
                        -- Show prompt to go up
                        message = message .. "~n~" .. "~INPUT_FRONTEND_UP~ " .. (floorUp[2] or "Floor " .. k + 1)
                    end
                    if floorDown then
                        -- Show prompt to go down
                        message = message .. "~n~" .. "~INPUT_FRONTEND_DOWN~ " .. (floorDown[2] or "Floor " .. k - 1)
                    end

                    -- Sent information how to use
                    MessageUpLeftCorner(message)

                    if floorUp ~= nil then
                        if IsControlJustReleased(1, key_floor_up) then
                            Citizen.Wait(10)
                            -- Lets freeze the user so he can't get away..
                            FreezeEntityPosition(player, true)
                            Citizen.Wait(50)
                            -- Play some sounds the make the elevator extra cool! :D
                            PlaySoundFrontend(-1, "CLOSED", "MP_PROPERTIES_ELEVATOR_DOORS", 1);
                            Citizen.Wait(10)
                            PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                            Citizen.Wait(50)
                            PlaySoundFrontend(-1, "OPENED", "MP_PROPERTIES_ELEVATOR_DOORS", 1);

                            -- Is elevator a vehicle elevator?
                            if IsPedInAnyVehicle(player, true) then
                                -- Lets teleport the user / vehicle and unfreeze the user.
                                SetEntityCoords(GetVehiclePedIsUsing(player), floorUp[1])
                                FreezeEntityPosition(player, false)
                            else
                                -- Lets teleport the user / vehicle and unfreeze the user.
                                SetEntityCoords(player, floorUp[1])
                                FreezeEntityPosition(player, false)
                            end
                        end
                    end

                    if floorDown ~= nil then
                        if IsControlJustReleased(1, key_floor_down) then
                            Citizen.Wait(10)
                            -- Lets freeze the user so he can't get away..
                            FreezeEntityPosition(player, true)
                            Citizen.Wait(50)
                            -- Play some sounds the make the elevator extra cool! :D
                            PlaySoundFrontend(-1, "CLOSED", "MP_PROPERTIES_ELEVATOR_DOORS", 1);
                            Citizen.Wait(10)
                            PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                            Citizen.Wait(50)
                            PlaySoundFrontend(-1, "OPENED", "MP_PROPERTIES_ELEVATOR_DOORS", 1);

                            -- Is elevator a vehicle elevator?
                            if IsPedInAnyVehicle(player, true) then
                                -- Lets teleport the user / vehicle and unfreeze the user.
                                SetEntityCoords(GetVehiclePedIsUsing(player), floorDown[1])
                                FreezeEntityPosition(player, false)
                            else
                                -- Lets teleport the user / vehicle and unfreeze the user.
                                SetEntityCoords(player, floorDown[1])
                                FreezeEntityPosition(player, false)
                            end
                        end
                    end
                    -- Get to here but you haven't been teleported? You are not close to an elevator ingame.
                end
            end
            -- New building
        end
    end
end)

-- Message in left up corner.
function MessageUpLeftCorner(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


-- Message above radar.
function MessageAboveRadar(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
end
-- SELESAI WAKTP / EVALATOR
-- MULAI clothesmerfik
ESX                     = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('smerfikubrania:koszulka')
AddEventHandler('smerfikubrania:koszulka', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
	

		local clothesSkin = {
		['tshirt_1'] = 15, ['tshirt_2'] = 0,
		['torso_1'] = 15, ['torso_2'] = 0,
		['arms'] = 15, ['arms_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)
end)
RegisterNetEvent('smerfikubrania:spodnie')
AddEventHandler('smerfikubrania:spodnie', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
	

		local clothesSkin = {
		['pants_1'] = 21, ['pants_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)
end)


RegisterNetEvent('smerfikubrania:buty')
AddEventHandler('smerfikubrania:buty', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
	

		local clothesSkin = {
		['shoes_1'] = 34, ['shoes_2'] = 0
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
	end)
end)

function OpenActionMenuInteraction(target)

	local elements = {}

	table.insert(elements, {label = ('Pakai Baju'), value = 'ubie'})
	table.insert(elements, {label = ('Lepaskan Baju'), value = 'tul'})
	table.insert(elements, {label = ('Lepaskan Celana'), value = 'spo'})
	table.insert(elements, {label = ('Lepaskan Sepatu'), value = 'but'})
  		ESX.UI.Menu.CloseAll()	


	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'action_menu',
		{
			title    = ('Clothes'),
			align    = 'bottom-right',
			elements = elements
		},
    function(data, menu)



		
		if data.current.value == 'ubie' then			
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
		end)
		ESX.UI.Menu.CloseAll()	
		elseif data.current.value == 'tul' then
		TriggerEvent('smerfikubrania:koszulka')
		ESX.UI.Menu.CloseAll()	
		elseif data.current.value == 'spo' then
		TriggerEvent('smerfikubrania:spodnie')
		ESX.UI.Menu.CloseAll()	
		elseif data.current.value == 'but' then
		TriggerEvent('smerfikubrania:buty')
		ESX.UI.Menu.CloseAll()	
	  end
	end)


end
			
--[[Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsControlJustReleased(0, Keys['L']) and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'action_menu') then
		OpenActionMenuInteraction()
    end
  end
end)]]--

RegisterCommand("baju", function(source, args, rawCommand)
	-- Wait for next frame just to be safe
	Citizen.Wait(0)
	if not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'action_menu') then       
		OpenActionMenuInteraction()     
	end      
  end, false)

  RegisterCommand("fixvest", function()
    TriggerEvent('skinchanger:getSkin', function(skin)


        local clothesSkin = {
        ['bproof_1'] = 0, ['bproof_2'] = 0
        }
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    end)
end)

RegisterCommand("vest1", function()
    TriggerEvent('skinchanger:getSkin', function(skin)


        local clothesSkin = {
        ['bproof_1'] = 0, ['bproof_2'] = 0
        }
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    end)
end)
-- SELESAI clothesmerfik