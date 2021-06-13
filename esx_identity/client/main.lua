local guiEnabled = false
local myIdentity = {}
local myIdentifiers = {}
local hasIdentity = false
local isDead = false

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
end)

function EnableGui(state)
	SetNuiFocus(state, state)
	guiEnabled = state

	SendNUIMessage({
		type = "enableui",
		enable = state
	})
end

RegisterNetEvent('esx_identity:showRegisterIdentity')
AddEventHandler('esx_identity:showRegisterIdentity', function()
	if not isDead then
		EnableGui(true)
	end
end)

RegisterNetEvent('esx_identity:identityCheck')
AddEventHandler('esx_identity:identityCheck', function(identityCheck)
	hasIdentity = identityCheck
end)

RegisterNetEvent('esx_identity:saveID')
AddEventHandler('esx_identity:saveID', function(data)
	myIdentifiers = data
end)

RegisterNUICallback('escape', function(data, cb)
	if hasIdentity then
		EnableGui(false)
	else
		TriggerEvent('chat:addMessage', { args = { '^1[IDENTITY]', '^1You must create your first character in order to play' } })
	end
end)

RegisterNUICallback('register', function(data, cb)
	local reason = ""
	myIdentity = data
	for theData, value in pairs(myIdentity) do
		if theData == "firstname" or theData == "lastname" then
			reason = verifyName(value)
			
			if reason ~= "" then
				break
			end
		elseif theData == "dateofbirth" then
			if value == "invalid" then
				reason = "Invalid date of birth!"
				break
			end
		elseif theData == "height" then
			local height = tonumber(value)
			if height then
				if height > 200 or height < 140 then
					reason = "Unacceptable player height!"
					break
				end
			else
				reason = "Unacceptable player height!"
				break
			end
		end
	end
	
	--- selamat datang
	if reason == "" then
		EnableGui(false)
		DoScreenFadeOut(1000)
		SetCamActive(cam,  false)
		RenderScriptCams(false,  false,  0,  true,  true)
		SetEntityCollision(PlayerPedId(),  true,  true)
		SetEntityVisible(PlayerPedId(),  true)
		FreezeEntityPosition(PlayerPedId(), false)
		-- SetEntityCoords(PlayerPedId(), 100.76865386963,-1713.3923339844,30.112564086914)
		DoScreenFadeIn(1000)
		Wait(1000)
		TriggerServerEvent('esx_identity:setIdentity', data, myIdentifiers)
		EnableGui(false)
		Citizen.Wait(500)
		TriggerEvent('esx_skin:openSaveableMenu', myIdentifiers.id)
		-- TriggerEvent("raid_clothes:register")
		-- TriggerEvent("raid_clothes:myFirstSpawn", true)
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 0.6vw; padding-left: 0.8vw; background-color: rgba(128, 128, 128, 0.601); border-radius: 6px;"><span style="width: 100%; font-weight: bold;">[BOT-URI]: </span>Selamat Datang di URBAN Roleplay Indonesia</div>',
			args = {}
		})   
		Wait(1000)
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 0.6vw; padding-left: 0.8vw; background-color: rgba(128, 128, 128, 0.601); border-radius: 6px;"><span style="width: 100%; font-weight: bold;">[BOT-URI]: </span>Mari kita junjung Respect & God Attitude sesama player</div>',
			args = {}
		}) 
		Wait(1000)
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 0.6vw; padding-left: 0.8vw; background-color: rgba(128, 128, 128, 0.601); border-radius: 6px;"><span style="width: 100%; font-weight: bold;">[BOT-URI]: </span>Jangan Lupa Join Discord di urbanroleplay.id/discord dan baca peraturan</div>',
			args = {}
		}) 
		Wait(1000)
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 0.6vw; padding-left: 0.8vw; background-color: rgba(128, 128, 128, 0.601); border-radius: 6px;"><span style="width: 100%; font-weight: bold;">[BOT-URI]: </span>Happy Roleplay ^_^</div>',
			args = {}
		}) 
		-- TriggerEvent('phone:addnotification','Newbie', 'Welcome to Kalxie RP. We sent you a starting items. Enjoy!')
		-- TriggerEvent('player:receiveItem', 'idcard', 1)
		-- TriggerEvent('player:receiveItem', 'mobilephone', 1)
		-- TriggerEvent('player:receiveItem', 'water', 2)
		-- TriggerEvent('player:receiveItem', 'sandwich', 2) 
	else
		ESX.ShowNotification(reason)
	end
end)

Citizen.CreateThread(function()
	while true do
		if guiEnabled then
			DisableControlAction(0, 1,   true) -- LookLeftRight
			DisableControlAction(0, 2,   true) -- LookUpDown
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 30,  true) -- MoveLeftRight
			DisableControlAction(0, 31,  true) -- MoveUpDown
			DisableControlAction(0, 21,  true) -- disable sprint
			DisableControlAction(0, 24,  true) -- disable attack
			DisableControlAction(0, 25,  true) -- disable aim
			DisableControlAction(0, 47,  true) -- disable weapon
			DisableControlAction(0, 58,  true) -- disable weapon
			DisableControlAction(0, 263, true) -- disable melee
			DisableControlAction(0, 264, true) -- disable melee
			DisableControlAction(0, 257, true) -- disable melee
			DisableControlAction(0, 140, true) -- disable melee
			DisableControlAction(0, 141, true) -- disable melee
			DisableControlAction(0, 143, true) -- disable melee
			DisableControlAction(0, 75,  true) -- disable exit vehicle
			DisableControlAction(27, 75, true) -- disable exit vehicle
		end
		Citizen.Wait(10)
	end
end)

function verifyName(name)
	-- Don't allow short user names
	local nameLength = string.len(name)
	if nameLength > 25 or nameLength < 2 then
		return 'Your player name is either too short or too long.'
	end
	
	-- Don't allow special characters (doesn't always work)
	local count = 0
	for i in name:gmatch('[abcdefghijklmnopqrstuvwxyzåäöABCDEFGHIJKLMNOPQRSTUVWXYZÅÄÖ0123456789 -]') do
		count = count + 1
	end
	if count ~= nameLength then
		return 'Your player name contains special characters that are not allowed on this server.'
	end
	
	-- Does the player carry a first and last name?
	-- 
	-- Example:
	-- Allowed:     'Bob Joe'
	-- Not allowed: 'Bob'
	-- Not allowed: 'Bob joe'
	local spacesInName    = 0
	local spacesWithUpper = 0
	for word in string.gmatch(name, '%S+') do

		if string.match(word, '%u') then
			spacesWithUpper = spacesWithUpper + 1
		end

		spacesInName = spacesInName + 1
	end

	if spacesInName > 2 then
		return 'Your name contains more than two spaces'
	end
	
	if spacesWithUpper ~= spacesInName then
		return 'your name must start with a capital letter.'
	end

	return ''
end
