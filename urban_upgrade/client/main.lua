ESX = nil
local Vehicles = {}
local PlayerData = {}
local lsMenuIsShowed = false
local isInLSMarker = false
local myCar = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer

	ESX.TriggerServerCallback('esx_lscustom:getVehiclesPrices', function(vehicles)
		Vehicles = vehicles
	end)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('esx_lscustom:installMod')
AddEventHandler('esx_lscustom:installMod', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	myCar = ESX.Game.GetVehicleProperties(vehicle)
	TriggerEvent("mythic_progbar:client:progress", {
        name = "ReapirLScustom",
        duration = 4000,
        label = 'Memasang Part Kendaraan',
        useWhileDead = true,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
	        disablewasd = true,
        },
    }, function(status)
        if not status then
        end
    end)
	TriggerServerEvent('esx_lscustom:refreshOwnedVehicle', myCar)
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 10, "car_repair", 0.5)
end)

RegisterNetEvent('esx_lscustom:cancelInstallMod')
AddEventHandler('esx_lscustom:cancelInstallMod', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	ESX.Game.SetVehicleProperties(vehicle, myCar)
end)

function OpenLSMenu(elems, menuName, menuTitle, parent)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), menuName,
	{
		title    = menuTitle,
		align    = 'right',
		elements = elems
	}, function(data, menu)
		local isRimMod, found = false, false
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

		if data.current.modType == "modFrontWheels" then
			isRimMod = true
		end

		for k,v in pairs(Config.Menus) do

			if k == data.current.modType or isRimMod then

				if data.current.label == _U('by_default') or string.match(data.current.label, _U('installed')) then
					ESX.ShowNotification(_U('already_own', data.current.label))
					TriggerEvent('esx_lscustom:installMod')
				else
					local vehiclePrice = 1000000

					for i=1, #Vehicles, 1 do
						if GetEntityModel(vehicle) == GetHashKey(Vehicles[i].model) then
							vehiclePrice = Vehicles[i].price
							break
						end
					end

					if isRimMod then
						price = math.floor(vehiclePrice * data.current.price / 100)
						TriggerServerEvent('esx_lscustom:buyMod', price)
					elseif v.modType == 11 or v.modType == 12 or v.modType == 13 or v.modType == 15 or v.modType == 16 then
						price = math.floor(vehiclePrice * v.price[data.current.modNum + 1] / 100)
						TriggerServerEvent('esx_lscustom:buyMod', price)
					elseif v.modType == 17 then
						price = math.floor(vehiclePrice * v.price[1] / 100)
						TriggerServerEvent('esx_lscustom:buyMod', price)
					else
						price = math.floor(vehiclePrice * v.price / 100)
						TriggerServerEvent('esx_lscustom:buyMod', price)
					end
				end

				menu.close()
				found = true
				break
			end

		end

		if not found then
			GetAction(data.current)
		end
	end, function(data, menu) -- on cancel
		menu.close()
		TriggerEvent('esx_lscustom:cancelInstallMod')

		local playerPed = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleDoorsShut(vehicle, false)

		if parent == nil then
			lsMenuIsShowed = false
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
			FreezeEntityPosition(vehicle, false)
			myCar = {}
		end
	end, function(data, menu) -- on change
		UpdateMods(data.current)
	end)
end

function UpdateMods(data)
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

	if data.modType then
		local props = {}
		
		if data.wheelType then
			props['wheels'] = data.wheelType
			ESX.Game.SetVehicleProperties(vehicle, props)
			props = {}
		elseif data.modType == 'neonColor' then
			if data.modNum[1] == 0 and data.modNum[2] == 0 and data.modNum[3] == 0 then
				props['neonEnabled'] = { false, false, false, false }
			else
				props['neonEnabled'] = { true, true, true, true }
			end
			ESX.Game.SetVehicleProperties(vehicle, props)
			props = {}
		elseif data.modType == 'tyreSmokeColor' then
			props['modSmokeEnabled'] = true
			ESX.Game.SetVehicleProperties(vehicle, props)
			props = {}
		end

			props[data.modType] = data.modNum
		if data.modType == 'modFrontWheels' then
			props['modBackWheels'] = data.modNum
		 end
		ESX.Game.SetVehicleProperties(vehicle, props)
	end
end

function GetAction(data)
	local elements  = {}
	local menuName  = ''
	local menuTitle = ''
	local parent    = nil

	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	local currentMods = ESX.Game.GetVehicleProperties(vehicle)

	if data.value == 'modSpeakers' or
		data.value == 'modTrunk' or
		data.value == 'modHydrolic' or
		data.value == 'modEngineBlock' or
		data.value == 'modAirFilter' or
		data.value == 'modStruts' or
		data.value == 'modTank' then
		SetVehicleDoorOpen(vehicle, 4, false)
		SetVehicleDoorOpen(vehicle, 5, false)
	elseif data.value == 'modDoorSpeaker' then
		SetVehicleDoorOpen(vehicle, 0, false)
		SetVehicleDoorOpen(vehicle, 1, false)
		SetVehicleDoorOpen(vehicle, 2, false)
		SetVehicleDoorOpen(vehicle, 3, false)
	else
		SetVehicleDoorsShut(vehicle, false)
	end

	local vehiclePrice = 1200000

	for i=1, #Vehicles, 1 do
		if GetEntityModel(vehicle) == GetHashKey(Vehicles[i].model) then
			vehiclePrice = Vehicles[i].price
			break
		end
	end

	for k,v in pairs(Config.Menus) do

		if data.value == k then

			menuName  = k
			menuTitle = v.label
			parent    = v.parent

			if v.modType then
				
				if v.modType == 22 then
					ColourList()
				elseif v.modType == 'neonColor' or v.modType == 'tyreSmokeColor' then -- disable neon
					table.insert(elements, {label = " " ..  _U('by_default'), modType = k, modNum = {0, 0, 0}})
				elseif v.modType == 'color1' or v.modType == 'color2' or v.modType == 'pearlescentColor' or v.modType == 'wheelColor' then
					local num = myCar[v.modType]
					table.insert(elements, {label = " " .. _U('by_default'), modType = k, modNum = num})
				elseif v.modType == 17 then
					table.insert(elements, {label = " " .. _U('no_turbo'), modType = k, modNum = false})
 				else
					table.insert(elements, {label = " " .. _U('by_default'), modType = k, modNum = -1})
				end

				if v.modType == 14 then -- HORNS
					for j = 0, 51, 1 do
						local _label = ''
						if j == currentMods.modHorns then
							_label = GetHornName(j) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
						else
							price = math.floor(vehiclePrice * v.price / 100)
							_label = GetHornName(j) .. ' - <span style="color:green;">$' .. price .. ' </span>'
						end
						table.insert(elements, {label = _label, modType = k, modNum = j})
					end
				elseif v.modType == 'plateIndex' then -- PLATES
					for j = 0, 4, 1 do
						local _label = ''
						if j == currentMods.plateIndex then
							_label = GetPlatesName(j) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
						else
							price = math.floor(vehiclePrice * v.price / 100)
							_label = GetPlatesName(j) .. ' - <span style="color:green;">$' .. price .. ' </span>'
						end
						table.insert(elements, {label = _label, modType = k, modNum = j})
					end
			elseif v.modType == 22 then -- NEON
					local _label = ''
					if currentMods.modXenon then
						_label = _U('Pasang') .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
						ColourList()
					else
						price = math.floor(vehiclePrice * v.price / 100)
						_label = _U('Pasang') .. ' - <span style="color:green;">$' .. price .. ' </span>'
					end
					table.insert(elements, {label = _label, modType = k, modNum = true})
				elseif v.modType == 'neonColor' or v.modType == 'tyreSmokeColor' then -- NEON & SMOKE COLOR
					local neons = GetNeons()
					price = math.floor(vehiclePrice * v.price / 100)
					for i=1, #neons, 1 do
						table.insert(elements, {
							label = '<span style="color:rgb(' .. neons[i].r .. ',' .. neons[i].g .. ',' .. neons[i].b .. ');">' .. neons[i].label .. ' - <span style="color:green;">$' .. price .. '</span>',
							modType = k,
							modNum = { neons[i].r, neons[i].g, neons[i].b }
						})
					end
				elseif v.modType == 'color1' or v.modType == 'color2' or v.modType == 'pearlescentColor' or v.modType == 'wheelColor' then -- RESPRAYS
					local colors = GetColors(data.color)
					for j = 1, #colors, 1 do
						local _label = ''
						price = math.floor(vehiclePrice * v.price / 100)
						_label = colors[j].label .. ' - <span style="color:green;">$' .. price .. ' </span>'
						table.insert(elements, {label = _label, modType = k, modNum = colors[j].index})
					end
				elseif v.modType == 'windowTint' then -- WINDOWS TINT
					for j = 1, 5, 1 do
						local _label = ''
						if j == currentMods.modHorns then
							_label = GetWindowName(j) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
						else
							price = math.floor(vehiclePrice * v.price / 100)
							_label = GetWindowName(j) .. ' - <span style="color:green;">$' .. price .. ' </span>'
						end
						table.insert(elements, {label = _label, modType = k, modNum = j})
					end
				elseif v.modType == 23 then -- WHEELS RIM & TYPE
					local props = {}

					props['wheels'] = v.wheelType
					ESX.Game.SetVehicleProperties(vehicle, props)

					local modCount = GetNumVehicleMods(vehicle, v.modType)
					for j = 0, modCount, 1 do
						local modName = GetModTextLabel(vehicle, v.modType, j)
						if modName then
							local _label = ''
							if j == currentMods.modFrontWheels then
								_label = GetLabelText(modName) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
							else
								price = math.floor(vehiclePrice * v.price / 100)
								_label = GetLabelText(modName) .. ' - <span style="color:green;">$' .. price .. ' </span>'
							end
							table.insert(elements, {label = _label, modType = 'modFrontWheels', modNum = j, wheelType = v.wheelType, price = v.price})
						end
					end
				elseif v.modType == 11 or v.modType == 12 or v.modType == 13 or v.modType == 15 or v.modType == 16 then
					local modCount = GetNumVehicleMods(vehicle, v.modType) -- UPGRADES
					for j = 0, modCount, 1 do
						local _label = ''
						if j == currentMods[k] then
							_label = _U('level', j+1) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
						else
							price = math.floor(vehiclePrice * v.price[j+1] / 100)
							_label = _U('level', j+1) .. ' - <span style="color:green;">$' .. price .. ' </span>'
						end
						table.insert(elements, {label = _label, modType = k, modNum = j})
						if j == modCount-1 then
							break
						end
					end
				elseif v.modType == 17 then -- TURBO
					local _label = ''
					if currentMods[k] then
						_label = 'Turbo - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
					else
						_label = 'Turbo - <span style="color:green;">$' .. math.floor(vehiclePrice * v.price[1] / 100) .. ' </span>'
					end
					table.insert(elements, {label = _label, modType = k, modNum = true})
				else
					local modCount = GetNumVehicleMods(vehicle, v.modType) -- BODYPARTS
					for j = 0, modCount, 1 do
						local modName = GetModTextLabel(vehicle, v.modType, j)
						if modName then
							local _label = ''
							if j == currentMods[k] then
								_label = GetLabelText(modName) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
							else
								price = math.floor(vehiclePrice * v.price / 100)
								_label = GetLabelText(modName) .. ' - <span style="color:green;">$' .. price .. ' </span>'
							end
							table.insert(elements, {label = _label, modType = k, modNum = j})
						end
					end
				end
			else
				if data.value == 'primaryRespray' or data.value == 'secondaryRespray' or data.value == 'pearlescentRespray' or data.value == 'modFrontWheelsColor' then
					for i=1, #Config.Colors, 1 do
						if data.value == 'primaryRespray' then
							table.insert(elements, {label = Config.Colors[i].label, value = 'color1', color = Config.Colors[i].value})
						elseif data.value == 'secondaryRespray' then
							table.insert(elements, {label = Config.Colors[i].label, value = 'color2', color = Config.Colors[i].value})
						elseif data.value == 'pearlescentRespray' then
							table.insert(elements, {label = Config.Colors[i].label, value = 'pearlescentColor', color = Config.Colors[i].value})
						elseif data.value == 'modFrontWheelsColor' then
							table.insert(elements, {label = Config.Colors[i].label, value = 'wheelColor', color = Config.Colors[i].value})
						end
					end
				else
					for l,w in pairs(v) do
						if l ~= 'label' and l ~= 'parent' then
							table.insert(elements, {label = w, value = l})
						end
					end
				end
			end
			break
		end
	end

	table.sort(elements, function(a, b)
		return a.label < b.label
	end)

	OpenLSMenu(elements, menuName, menuTitle, parent)
end

-- Blips
Citizen.CreateThread(function()
	for k,v in pairs(Config.Zones) do
		local blip = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

		SetBlipSprite(blip, 42)
		SetBlipScale(blip, 1.8)
		SetBlipDisplay(blip, 0)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(v.Name)
		EndTextCommandSetBlipName(blip)
	end
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if IsPedInAnyVehicle(playerPed, false) then
			local coords = GetEntityCoords(PlayerPedId())
			local currentZone, zone, lastZone

			if (PlayerData.job and PlayerData.job.name == 'mechanic')  then
				for k,v in pairs(Config.Zones) do
					if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x and not lsMenuIsShowed then
						isInLSMarker  = true
						ESX.ShowHelpNotification(v.Hint)
						break
					else
						isInLSMarker  = false
					end
				end
			end

			if IsControlJustReleased(0, 38) and not lsMenuIsShowed and isInLSMarker then
				if (PlayerData.job and PlayerData.job.name == 'mechanic')  then
					lsMenuIsShowed = true

					local vehicle = GetVehiclePedIsIn(playerPed, false)
					FreezeEntityPosition(vehicle, true)

					myCar = ESX.Game.GetVehicleProperties(vehicle)

					ESX.UI.Menu.CloseAll()
					GetAction({value = 'main'})
				end
			end

			if isInLSMarker and not hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = true
			end

			if not isInLSMarker and hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = false
			end

		end
	end
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if IsPedInAnyVehicle(playerPed, false) then
			local coords = GetEntityCoords(PlayerPedId())
			local currentZone, zone, lastZone

			if (PlayerData.job and PlayerData.job.name == 'pemerintah')  then
				for k,v in pairs(Config.Zones) do
					if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x and not lsMenuIsShowed then
						isInLSMarker  = true
						ESX.ShowHelpNotification(v.Hint)
						break
					else
						isInLSMarker  = false
					end
				end
			end

			if IsControlJustReleased(0, 38) and not lsMenuIsShowed and isInLSMarker then
				if (PlayerData.job and PlayerData.job.name == 'pemerintah')  then
					lsMenuIsShowed = true

					local vehicle = GetVehiclePedIsIn(playerPed, false)
					FreezeEntityPosition(vehicle, true)

					myCar = ESX.Game.GetVehicleProperties(vehicle)

					ESX.UI.Menu.CloseAll()
					GetAction({value = 'main'})
				end
			end

			if isInLSMarker and not hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = true
			end

			if not isInLSMarker and hasAlreadyEnteredMarker then
				hasAlreadyEnteredMarker = false
			end

		end
	end
end)

-- Prevent Free Tunning Bug
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if lsMenuIsShowed then
			DisableControlAction(2, 288, true)
			DisableControlAction(2, 289, true)
			DisableControlAction(2, 170, true)
			DisableControlAction(2, 167, true)
			DisableControlAction(2, 168, true)
			DisableControlAction(2, 23, true)
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
		else
			Citizen.Wait(500)
		end
	end
end)

-- HEADLIGHT
function OpenHeadlightMenu()
    local elems = {
        {label = 'Open list', value = 'open_list'},

}
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ColourMenu',{
        title = 'Headlight Colours',
        align = 'top-left',
        elements = elems
    },
    function(data, menu)
        if data.current.value == 'open_list' then 
            ColourList()
        end

    end,
    function(data, menu)
        menu.close()
    end)
end


function ColourList()
        local elems = {
            {label = 'Darkblue', value = '1'},
            {label = 'Lightblue', value = '2'},
            {label = 'Turquoise', value = '3'},
            {label = 'Green', value = '4'},
            {label = 'Yellow', value = '5'},
            {label = 'Gold', value = '6'},
            {label = 'Orange', value = '7'},
            {label = 'Red', value = '8'},
            {label = 'Pink', value = '9'},
            {label = 'Violet', value = '10'},
            {label = 'Purple', value = '11'},
            {label = 'Ultraviolet', value = '12'},

        }
    
        ESX.UI.Menu.CloseAll()
    
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ColourMenu',{
            title = 'Headlight Colours',
            align = 'top-left',
            elements = elems
        },
        function(data, menu)
            if data.current.value == '1' then
            local veh = GetVehiclePedIsUsing(PlayerPedId())
            ToggleVehicleMod(veh, 22, true) -- Xenon
            SetVehicleXenonLightsColour(veh, 1)
            end
            if data.current.value == '2' then
            local veh = GetVehiclePedIsUsing(PlayerPedId())
            ToggleVehicleMod(veh, 22, true) -- Xenon
            SetVehicleXenonLightsColour(veh, 2)
            end
            if data.current.value == '3' then
            local veh = GetVehiclePedIsUsing(PlayerPedId())
            ToggleVehicleMod(veh, 22, true) -- Xenon
            SetVehicleXenonLightsColour(veh, 3)
            end
            if data.current.value == '4' then
            local veh = GetVehiclePedIsUsing(PlayerPedId())
            ToggleVehicleMod(veh, 22, true) -- Xenon
            SetVehicleXenonLightsColour(veh, 4)
            end
            if data.current.value == '5' then
            local veh = GetVehiclePedIsUsing(PlayerPedId())
            ToggleVehicleMod(veh, 22, true) -- Xenon
            SetVehicleXenonLightsColour(veh, 5)
            end
            if data.current.value == '6' then
            local veh = GetVehiclePedIsUsing(PlayerPedId())
            ToggleVehicleMod(veh, 22, true) -- Xenon
            SetVehicleXenonLightsColour(veh, 6)
            end
            if data.current.value == '7' then
            local veh = GetVehiclePedIsUsing(PlayerPedId())
            ToggleVehicleMod(veh, 22, true) -- Xenon
            SetVehicleXenonLightsColour(veh, 7)
            end
            if data.current.value == '8' then
            local veh = GetVehiclePedIsUsing(PlayerPedId())
            ToggleVehicleMod(veh, 22, true) -- Xenon
            SetVehicleXenonLightsColour(veh, 8)
            end
            if data.current.value == '9' then
            local veh = GetVehiclePedIsUsing(PlayerPedId())
            ToggleVehicleMod(veh, 22, true) -- Xenon
            SetVehicleXenonLightsColour(veh, 9)
            end
            if data.current.value == '10' then
            local veh = GetVehiclePedIsUsing(PlayerPedId())
            ToggleVehicleMod(veh, 22, true) -- Xenon
            SetVehicleXenonLightsColour(veh, 10)
            end
            if data.current.value == '11' then
            local veh = GetVehiclePedIsUsing(PlayerPedId())
            ToggleVehicleMod(veh, 22, true) -- Xenon
            SetVehicleXenonLightsColour(veh, 11)
            end
            if data.current.value == '12' then
            local veh = GetVehiclePedIsUsing(PlayerPedId())
            ToggleVehicleMod(veh, 22, true) -- Xenon
            SetVehicleXenonLightsColour(veh, 12)
            end
    end,
    function(data, menu)
        menu.close()
		if parent == nil then
			lsMenuIsShowed = false
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
			FreezeEntityPosition(vehicle, false)
			myCar = {}
		end
	end)
end

