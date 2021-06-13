RegisterCommand('roll', function(source, args, rawCommand)
    -- Interpret the number of sides
    local die = 6
    if args[1] ~= nil and tonumber(args[1]) then
        die = tonumber(args[1])
    end

    -- Interpret the number of rolls
    rolls = 1
    if args[2] ~= nil and tonumber(args[2]) then
        rolls = tonumber(args[2])
    end

    -- Roll and add up rolls
    local number = 0
    for i = rolls,1,-1
    do
        number = number + math.random(1,die)
    end

    loadAnimDict("anim@mp_player_intcelebrationmale@wank")
    TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@wank", "wank", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Citizen.Wait(1500)
    ClearPedTasks(GetPlayerPed(-1))
    TriggerServerEvent('3dme:shareDisplay', 'Hasil Acak Angka : ' .. number)
end)

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict( dict )
        Citizen.Wait(5)
    end
end

--Written by ZacFierce and MrFunBeard
--Any alteration and addition can be made and posted as long as credits are given :)

--- CHECK ID DI ATAS KEPALA
local disPlayerNames = 5
local playerDistances = {}
local id = false

local function DrawText3D(x,y,z, text, r,g,b) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(px,py,pz)-vector3(x,y,z))
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        if not useCustomScale then
            SetTextScale(0.0*scale, 0.55*scale)
        else 
            SetTextScale(0.0*scale, customScale)
        end
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

Citizen.CreateThread(function()
	Wait(500)
    while true do
        for _, id in ipairs(GetActivePlayers()) do
				if GetPlayerPed(id) ~= GetPlayerPed(-1) then
                    if playerDistances[id] then
                        if IsControlPressed(0, 82) then
						    if (playerDistances[id] < disPlayerNames) then
						 	    x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
							    if NetworkIsPlayerTalking(id) then
                                   DrawText3D(x2, y2, z2+1.2, GetPlayerServerId(id), 119,238,225)
                                   DrawMarker(2, x2, y2, z2+0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.08, 0.2, 0.08, 0, 255, 0, 155, false, false, false, true, false, false, false)
							    else
							 	   DrawText3D(x2, y2, z2+1, GetPlayerServerId(id), 186,186,186)
							    end
						    elseif (playerDistances[id] < 25) then
							    x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))						
							    if NetworkIsPlayerTalking(id) then
                                    DrawMarker(2, x2, y2, z2+0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.08, 0.2, 0.08, 0, 255, 0, 155, false, false, false, true, false, false, false)
							    end
                            end
                        end
					end
				end
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        for _, id in ipairs(GetActivePlayers()) do
            if GetPlayerPed(id) ~= GetPlayerPed(-1) then
                x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                distance = math.floor(#(vector3(x1,  y1,  z1)-vector3(x2,  y2,  z2)))
				playerDistances[id] = distance
            end
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
	Wait(500)
    while true do
        for _, id in ipairs(GetActivePlayers()) do
				if GetPlayerPed(id) ~= GetPlayerPed(-1) and not IsControlPressed(0, 82) then
                    if playerDistances[id] then
						    if (playerDistances[id] < disPlayerNames) then
						 	    x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
							    if NetworkIsPlayerTalking(id) then
                                DrawMarker(2, x2, y2, z2+0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.08, 0.2, 0.08, 0, 255, 0, 155, false, false, false, true, false, false, false)
							    end
						    elseif (playerDistances[id] < 25) then
							    x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))						
							    if NetworkIsPlayerTalking(id) then
                                    DrawMarker(2, x2, y2, z2+0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.08, 0.2, 0.08, 0, 255, 0, 155, false, false, false, true, false, false, false)
							    end
                            end
					end
				end
        end
        Citizen.Wait(0)
    end
end)