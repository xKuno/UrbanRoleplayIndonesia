local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

isInInventory = false
ESX = nil
local poid		 = 0

Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent("esx:getSharedObject",function(obj)
                    ESX = obj
                end
            )
            Citizen.Wait(0)
        end
    end
)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    print(xPlayer)
 TriggerServerEvent('esx_inventoryhud:FUpdate',xPlayer)
end)

RegisterNetEvent("esx_inventoryhud:change")
AddEventHandler("esx_inventoryhud:change", function(tpoid)
    poid = tpoid
	maxinv = tmaxinv
end)

local fastWeapons = {
	[1] = nil,
	[2] = nil,
	[3] = nil,
    [4] = nil,
    [5] = nil
}

local fastItemsHotbar = {}
local itemslist ={}
local isHotbar = false

function RefreshWeight()
    SendNUIMessage({
        action = "weight",
        inventory = poid / 1000,
        maxinventory = maxinv
    })
end

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(250)
        SendNUIMessage({
            show = IsPauseMenuActive(),
            inventory = poid / 1000
        })
    end
end)
--[[
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if IsControlJustReleased(0, Config.OpenControl) and IsInputDisabled(0) then
                openInventory()
            end
        end
    end
)--]]

RegisterCommand("inventoryhud", function()
    openInventory()
end)

function openInventory()
    loadPlayerInventory()
    isInInventory = true
	Citizen.Wait(500)
    SendNUIMessage(
        {
            action = "display",
            type = "normal"
        }
    )
    SetNuiFocus(true, true)
end

function closeInventory()
    isInInventory = false
    SendNUIMessage(
        {
            action = "hide"
        }
    )
    SetNuiFocus(false, false)
    trunkData = nil
end

function isWeapon(name)
    local oke = nil
    if string.find(name, 'WEAPON_') then 
        oke = true 
    elseif string.find(name, 'GADGET_') then
        oke = true 
    else
        oke = false
    end


    return oke
end

function showHotbar()
    if not isHotbar then
        isHotbar = true
		loadPlayerInventory()
        SendNUIMessage({
            action = "showhotbar",
            fastItems = fastItemsHotbar,
            itemList = itemslist
        })
        Citizen.Wait(1500)
        isHotbar = false
    end
end

RegisterNUICallback("NUIFocusOff",function()
        closeInventory()
    end
)

RegisterNUICallback("GetNearPlayers",function(data, cb)
        local playerPed = PlayerPedId()
        local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
        local foundPlayers = false
        local elements = {}
        for i = 1, #players, 1 do
            if players[i] ~= PlayerId() then
                foundPlayers = true

                table.insert(elements,
                    {
                        label = GetPlayerName(players[i]),
                        player = GetPlayerServerId(players[i])
                        
                    }
                )
            end
        end

        if not foundPlayers then
            TriggerEvent('notification', 'Tidak Ada Orang Disekitarmu!', 2)
        else
            SendNUIMessage(
                {
                    action = "nearPlayers",
                    foundAny = foundPlayers,
                    players = elements,
                    item = data.item
                }
            )
        
        end
        
        cb("ok")
    end
)

RegisterNUICallback(
    "UseItem",
    function(data, cb)
        TriggerServerEvent("esx:useItem", data.item.name)
        data.item.msg = "Removed (1)"
            TriggerEvent('esx_inventoryhud:showItemUse', {
            data.item
        })
        if shouldCloseInventory(data.item.name) then
            closeInventory()
        else
            Citizen.Wait(250)
            loadPlayerInventory()
        end

        cb("ok")
    end
)

RegisterNUICallback("DropItem",function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            TriggerServerEvent("esx:removeInventoryItem", data.item.type, data.item.name, data.number)
        end
        Wait(250)
        loadPlayerInventory()
        local dict = "pickup_object"		
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(0)
        end
        TaskPlayAnim(GetPlayerPed(-1), dict, "pickup_low", 8.0, 8.0, -1, 0, 1, false, false, false)
        cb("ok")
    end
)

RegisterNUICallback("GiveItem",function(data, cb)
        local playerPed = PlayerPedId()
        local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
        local foundPlayer = false
        for i = 1, #players, 1 do
            if players[i] ~= PlayerId() then
                if GetPlayerServerId(players[i]) == data.player then
                    foundPlayer = true 
                end
            end
        end
       if foundPlayer then
            local count = tonumber(data.number)
            local dict = "mp_common"		
            RequestAnimDict(dict)
            while not HasAnimDictLoaded(dict) do
                Citizen.Wait(0)
            end

            if data.item.type == "item_weapon" then
                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            end
    
           TriggerServerEvent("esx:giveInventoryItem", data.player, data.item.type, data.item.name, count)
		   data.item.msg = "Removed"
                TriggerEvent('esx_inventoryhud:showItemUse', {
                data.item
            })
            Wait(250)
            loadPlayerInventory()
            local playerPed = GetPlayerPed(-1)
            local coords    = GetEntityCoords(playerPed)
        
            local vehicle = nil
        
            if IsPedInAnyVehicle(playerPed,  false) then
                vehicle = GetVehiclePedIsIn(playerPed, false)
            else
                TaskPlayAnim(GetPlayerPed(-1), dict, "givetake1_a", 8.0, 8.0, -1, 48, 1, false, false, false)
            end
        else
            ESX.ShowNotification(('ERROR!'))
        end
        cb("ok")
    end
)

function shouldCloseInventory(itemName)
    for index, value in ipairs(Config.CloseUiItems) do
        if value == itemName then
            return true
        end
    end

    return false
end

function shouldSkipAccount(accountName)
    for index, value in ipairs(Config.ExcludeAccountsList) do
        if value == accountName then
            return true
        end
    end

    return false
end

RegisterNetEvent('esx_inventoryhud:refreshInventory')
AddEventHandler('esx_inventoryhud:refreshInventory', function()
    if isInInventory then
        loadPlayerInventory()
    end
end)

function loadPlayerInventory()
    ESX.TriggerServerCallback("esx_inventoryhud:getPlayerInventory",function(data)
            items = {}
			fastItems = {}
            inventory = data.inventory
            accounts = data.accounts
            money = data.money
            weapons = data.weapons

            if Config.IncludeCash and money ~= nil and money > 0 then
                moneyData = {
                    label = ("UANG"),
                    name = "cash",
                    type = "item_money",
                    count = money,
                    usable = false,
                    rare = false,
                    limit = -1,
                    canRemove = true
                }

                table.insert(items, moneyData)
            end

            if Config.IncludeAccounts and accounts ~= nil then
                for key, value in pairs(accounts) do
                    if not shouldSkipAccount(accounts[key].name) then
                        local canDrop = accounts[key].name ~= "bank"

                        if accounts[key].money > 0 then
                            accountData = {
                                label = accounts[key].label,
                                count = accounts[key].money,
                                type = "item_account",
                                name = accounts[key].name,
                                usable = false,
                                rare = false,
                                limit = -1,
                                canRemove = canDrop
                            }
                            table.insert(items, accountData)
                        end
                    end
                end
            end

             if inventory ~= nil then
                for key, value in pairs(inventory) do
                    if inventory[key].count <= 0 then
                        inventory[key] = nil
                    else
                        local found = false
                        for slot, item in pairs(fastWeapons) do
                            if item == inventory[key].name then
                                table.insert(fastItems, {
                                    label = inventory[key].label,
                                    count = inventory[key].count,
                                    limit = -1,
                                    type = "item_standard",
                                    name = inventory[key].name,
                                    usable = inventory[key].usable,
                                    rare = inventory[key].rare,
                                    canRemove = true,
                                    slot = slot
                                })

                                found = true
                                break
                            end
                        end

                        if found == false then
                            inventory[key].type = "item_standard"
                            table.insert(items, inventory[key])
                        end
                    end
                end
            end

   if Config.IncludeWeapons and weapons ~= nil then
                for key, value in pairs(weapons) do
                    local weaponHash = GetHashKey(weapons[key].name)
                    local playerPed = PlayerPedId()
                    if HasPedGotWeapon(playerPed, weaponHash, false) and weapons[key].name ~= "WEAPON_UNARMED" then
                            local found = false
                            for slot, weapon in pairs(fastWeapons) do
                                if weapon == weapons[key].name then
                                    local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
                                    table.insert(
                                        fastItems,
                                        {
                                            label = weapons[key].label,
                                            count = ammo,
                                            limit = -1,
                                            type = "item_weapon",
                                            name = weapons[key].name,
                                            usable = false,
                                            rare = false,
                                            canRemove = true,
                                            slot = slot
                                        }
                                    )
                                    found = true
                                    break
                                end
                            end
                            if found == false then
                                local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
                                table.insert(
                                    items,
                                    {
                                        label = weapons[key].label,
                                        count = ammo,
                                        limit = -1,
                                        type = "item_weapon",
                                        name = weapons[key].name,
                                        usable = false,
                                        rare = false,
                                        canRemove = true
                                    }
                                )
                            end
                    end
                end
            end
           fastItemsHotbar =  fastItems
            SendNUIMessage(
                {
                    action = "setItems",
                    itemList = items,
                    fastItems = fastItems,
                    text = texts
                }
            )
           ItemsLoaded = true
        end,
        GetPlayerServerId(PlayerId())
    )
end

RegisterNetEvent('esx_inventoryhud:showItemUse')
AddEventHandler('esx_inventoryhud:showItemUse', function(items)
    local data = {}
    for k, v in pairs(items) do
        table.insert(data, {
            item = {
                label = v.label,
                name = v.name,
                itemId = v.id
            },
            message = v.msg
        })
    end
    SendNUIMessage({
        action = 'itemUsed',
        alerts = data
    })
end)

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1)
            if isInInventory then
                local playerPed = PlayerPedId()
                DisableControlAction(0, 1, true) -- Disable pan
                DisableControlAction(0, 2, true) -- Disable tilt
                DisableControlAction(0, 24, true) -- Attack
                DisableControlAction(0, 257, true) -- Attack 2
                DisableControlAction(0, 25, true) -- Aim
                DisableControlAction(0, 263, true) -- Melee Attack 1
                DisableControlAction(0, Keys["W"], true) -- W
                DisableControlAction(0, Keys["A"], true) -- A
                DisableControlAction(0, 31, true) -- S (fault in Keys table!)
                DisableControlAction(0, 30, true) -- D (fault in Keys table!)

                DisableControlAction(0, Keys["R"], true) -- Reload
                DisableControlAction(0, Keys["SPACE"], true) -- Jump
                DisableControlAction(0, Keys["Q"], true) -- Cover
                DisableControlAction(0, Keys["TAB"], true) -- Select Weapon
                DisableControlAction(0, Keys["F"], true) -- Also 'enter'?

                DisableControlAction(0, Keys["F1"], true) -- Disable phone
                DisableControlAction(0, Keys["F2"], true) -- Inventory
                DisableControlAction(0, Keys["F3"], true) -- Animations
                DisableControlAction(0, Keys["F6"], true) -- Job

                DisableControlAction(0, Keys["V"], true) -- Disable changing view
                DisableControlAction(0, Keys["C"], true) -- Disable looking behind
                DisableControlAction(0, Keys["X"], true) -- Disable clearing animation
                DisableControlAction(2, Keys["P"], true) -- Disable pause screen

                DisableControlAction(0, 59, true) -- Disable steering in vehicle
                DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
                DisableControlAction(0, 72, true) -- Disable reversing in vehicle

                DisableControlAction(2, Keys["LEFTCTRL"], true) -- Disable going stealth

                DisableControlAction(0, 47, true) -- Disable weapon
                DisableControlAction(0, 264, true) -- Disable melee
                DisableControlAction(0, 257, true) -- Disable melee
                DisableControlAction(0, 140, true) -- Disable melee
                DisableControlAction(0, 141, true) -- Disable melee
                DisableControlAction(0, 142, true) -- Disable melee
                DisableControlAction(0, 143, true) -- Disable melee
                DisableControlAction(0, 75, true) -- Disable exit vehicle
                DisableControlAction(27, 75, true) -- Disable exit vehicle
            end
        end
    end
)

-- HIDE WEAPON WHEEL
Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		HideHudComponentThisFrame(19)
		HideHudComponentThisFrame(20)
		BlockWeaponWheelThisFrame()
		DisableControlAction(0,Keys["TAB"],true)
	end
end)
--FAST ITEMS
RegisterNUICallback(
    "PutIntoFast",
    function(data, cb)
		if data.item.slot ~= nil then
			fastWeapons[data.item.slot] = nil
		end
		fastWeapons[data.slot] = data.item.name
		--TriggerServerEvent("esx_inventoryhud:changeFastItem",data.slot,data.item.name)
		loadPlayerInventory()
		cb("ok")
	end
)
RegisterNUICallback(
    "TakeFromFast",
    function(data, cb)
		fastWeapons[data.item.slot] = nil
		TriggerServerEvent("esx_inventoryhud:changeFastItem",0,data.item.name)
		loadPlayerInventory()
		cb("ok")
	end
)

local keys = {
    157, 158, 160, 164, 165
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k, v in pairs(keys) do
            if IsDisabledControlPressed(0, 19) and IsDisabledControlJustReleased(1, v) then
                if fastWeapons[k] then
                    if isWeapon(fastWeapons[k]) then 
                        if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey(fastWeapons[k]) then
                            SetCurrentPedWeapon(PlayerPedId(), "WEAPON_UNARMED", true)
                            TriggerEvent('ip-inventory:refreshWeapon')
                        else
                            SetCurrentPedWeapon(PlayerPedId(), fastWeapons[k], true)
                            TriggerEvent('ip-inventory:refreshWeapon')
                        end
                    else
                           TriggerServerEvent("esx:useItem", fastWeapons[k])
                        Citizen.Wait(250)
                        loadPlayerInventory()
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('esx_inventoryhud:client:addItem')
AddEventHandler('esx_inventoryhud:client:addItem', function(itemname, itemlabel)
    local data = { name = itemname, label = itemlabel }
    SendNUIMessage({type = "addInventoryItem", addItemData = data})
end)