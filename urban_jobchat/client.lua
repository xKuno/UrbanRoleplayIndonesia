RegisterNetEvent('barchat:Ooc')
AddEventHandler('barchat:Ooc', function(source, Name, message)
	local target = GetPlayerFromServerId(source)
	local name = GetPlayerName(source) 

	
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
	
	if target == source then
        TriggerEvent('chatMessage', message, { 232, 232, 232 } , ("^*HRP |" .. Name.. ":" ) )
	elseif GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 120 then
		TriggerEvent('chatMessage', message, { 232, 232, 232 }, ("^*HRP |" .. Name.. ":" ) )
	end
end)