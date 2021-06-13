AddEventHandler("playerSpawned", function(spawn)
	SetCanAttackFriendly(PlayerPedId(), true, false)
	NetworkSetFriendlyFireOption(true)
end)