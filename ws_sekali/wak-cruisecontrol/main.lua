-- CRUISECONTROL
local enableCruise = false
Citizen.CreateThread( function()
	while true do 
		Citizen.Wait( 0 )   
		local ped = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(ped, false)
		local vehicleModel = GetEntityModel(vehicle)
		local speed = GetEntitySpeed(vehicle)
		local float Max = GetVehicleMaxSpeed(vehicleModel)
			if ( ped ) then
				if IsControlJustPressed(1, 137) then
					local inVehicle = IsPedSittingInAnyVehicle(ped)
					if (inVehicle) then
						if (GetPedInVehicleSeat(vehicle, -1) == ped) then
						--vehicle = GetVehiclePedIsIn(ped, false)
						--speed = GetEntitySpeed(vehicle)
							if enableCruise == false then
								SetEntityMaxSpeed(vehicle, speed)
							--SetVehicleForwardSpeed(vehicle, speed)
								exports['mythic_notify']:SendAlert('success','Cruise Active at - '.. math.floor(speed*3.6)..'/kmh', 10000)
								enableCruise = true
							else
							
								SetEntityMaxSpeed(vehicle, Max)
								exports['mythic_notify']:SendAlert('error', 'Cruise Inactive', 10000)
								--TriggerEvent("chatMessage", "[Cruise Control: ]", {255, 255, 255}, "Cruise control DISABLED")
								enableCruise = false
							end
						else
							--TriggerEvent("ChatMessage", "[Cruise Control: ]", {255, 255, 255}, "You need to be driving to preform this action" )
						end
					end
				end
			end
		end
end)
-- STOP
