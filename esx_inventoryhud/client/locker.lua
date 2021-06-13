RegisterNetEvent("esx_inventoryhud:openLockerInventory")
AddEventHandler(
    "esx_inventoryhud:openLockerInventory",
    function(data, locker)
        setLockerInventoryData(data)
        openLockerInventory(locker)
    end
)

RegisterNetEvent('esx_inventoryhud:refreshLockerInventory')
AddEventHandler('esx_inventoryhud:refreshLockerInventory', function(locker)
    refreshLockerInventory(locker)
end)

function refreshLockerInventory(locker)
    ESX.TriggerServerCallback(
        "mb_locker:getLockerInventory",
        function(inventory)
            setLockerInventoryData(inventory)
        end,
        locker
    )
end

function setLockerInventoryData(data)
    items = {}

    SendNUIMessage(
        {
            action = "setInfoText",
            text = data.text
        }
    )

    local blackMoney = data.blackMoney
    local lockerItems = data.items
    local lockerWeapons = data.weapons

    if blackMoney > 0 then
        accountData = {
            label = _U("black_money"),
            count = blackMoney,
            type = "item_account",
            name = "black_money",
            usable = false,
            rare = false,
            weight = -1,
            canRemove = false
        }
        table.insert(items, accountData)
    end

    for i = 1, #lockerItems, 1 do
        local item = lockerItems[i]

        if item.count > 0 then
            item.type = "item_standard"
            item.usable = false
            item.rare = false
            item.weight = -1
            item.canRemove = false

            table.insert(items, item)
        end
    end

    for i = 1, #lockerWeapons, 1 do
        local weapon = lockerWeapons[i]

        if lockerWeapons[i].name ~= "WEAPON_UNARMED" then
            table.insert(
                items,
                {
                    label = ESX.GetWeaponLabel(weapon.name),
                    count = weapon.ammo,
                    weight = -1,
                    type = "item_weapon",
                    name = weapon.name,
                    usable = false,
                    rare = false,
                    canRemove = false
                }
            )
        end
    end

    SendNUIMessage(
        {
            action = "setSecondInventoryItems",
            itemList = items
        }
    )
end

function openLockerInventory(locker)
    loadPlayerInventory()
    isInInventory = true

    SendNUIMessage(
        {
            action = "display",
            type = "locker",
            locker = locker
        }
    )

    SetNuiFocus(true, true)
end

RegisterNUICallback(
    "PutIntoLocker",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            local count = tonumber(data.number)

            if data.item.type == "item_weapon" then
                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            end

            local invType = "Locker"
            local action = 'Deposit'
            local message = 'Inventory Type: **'..invType..'**\nAction: **'..action..'**\nItem: **'..data.item.name..'**\nJumlah: **'..count..'**\nSteamHex: **'..ESX.GetPlayerData().identifier..'**'
            TriggerServerEvent('esx_inventoryhud:logToDiscord', message)
            TriggerServerEvent("esx_locker:putItem", data.locker, data.item.type, data.item.name, count)
			TriggerServerEvent("esx:lokerputitem",ESX.GetPlayerData().identifier, data.item.name, count)
        end

        Wait(150)
        refreshLockerInventory(data.locker)
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)

RegisterNUICallback(
    "TakeFromLocker",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            local invType = "Locker"
            local action = 'Withdraw'
            local message = 'Inventory Type: **'..invType..'**\nAction: **'..action..'**\nItem: **'..data.item.name..'**\nJumlah: **'..data.number..'**\nSteamHex: **'..ESX.GetPlayerData().identifier..'**'
            TriggerServerEvent('esx_inventoryhud:logToDiscord', message)
            TriggerServerEvent("esx_locker:getItem", data.locker, data.item.type, data.item.name, tonumber(data.number))
			TriggerServerEvent("esx:lokertgetitem",ESX.GetPlayerData().identifier, data.item.name, count, tonumber(data.number))
            openLockerInventory(data.locker) --Apparently switches INSTANTLY to your own locker inventory when you try to drop/take items from an other one's. You can't duplicate anymore.
        end

        Wait(150)
        refreshLockerInventory(data.locker)
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)
