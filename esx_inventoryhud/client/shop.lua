local shopData = nil

Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local Licenses = {}

local PlayerData              = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        player = GetPlayerPed(-1)
        coords = GetEntityCoords(player)
        if IsInWaroengShopZone(coords) or IsInKantinShopZone(coords) or IsInBarShopZone(coords) or IsInPedagangShopZone(coords) or IsInWeaponShopZone(coords) or IsInWeaponShopZone2(coords) or IsInPoliceShopZone(coords) then
            if IsInWaroengShopZone(coords) then
                if IsControlJustReleased(0, Keys["E"]) then
                    OpenShopInv("waroeng")
                end
            end

            if IsInKantinShopZone(coords) then
                if IsControlJustReleased(0, Keys["E"]) then
                    OpenShopInv("kantin")
                end
            end

            if IsInBarShopZone(coords) then
                if IsControlJustReleased(0, Keys["E"]) then
                    OpenShopInv("bar")
                end
            end
			
			 if IsInPedagangShopZone(coords) then
              if PlayerData.job ~= nil and PlayerData.job.name == 'pedagang' then
                if IsControlJustReleased(0, Keys["E"]) then
                    OpenShopInv("pedagang")
                end
              end
            end

            if IsInWeaponShopZone(coords) then
                if IsControlJustReleased(0, Keys["E"]) then
                    ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
                        if hasWeaponLicense then
                            OpenShopInv("weapon")
                        else
                            OpenBuyLicenseMenu()
                        end
                    end, GetPlayerServerId(PlayerId()), 'weapon')
                end
            end

            if IsInWeaponShopZone2(coords) then
                if IsControlJustReleased(0, Keys["E"]) then
                    if (PlayerData.job ~= nil and PlayerData.job.name == 'biker' and PlayerData.job.grade > 1) or (PlayerData.job ~= nil and PlayerData.job.name == 'kompatriot' and PlayerData.job.grade > 1) or (PlayerData.job ~= nil and PlayerData.job.name == 'ackerman' and PlayerData.job.grade > 1) or (PlayerData.job ~= nil and PlayerData.job.name == 'gang' and PlayerData.job.grade > 1) or (PlayerData.job ~= nil and PlayerData.job.name == 'mafia' and PlayerData.job.grade > 1) or (PlayerData.job ~= nil and PlayerData.job.name == 'cartel' and PlayerData.job.grade > 2) or (PlayerData.job ~= nil and PlayerData.job.name == 'yakuza' and PlayerData.job.grade > 1) then
                        ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
                            if hasWeaponLicense then
                                OpenShopInv("weapon2")
                            else
                                OpenBuyLicenseMenu()
                            end
                        end, GetPlayerServerId(PlayerId()), 'weapon')
                    else
                          exports['mythic_notify']:DoHudText('error', 'Tidak memiliki Lisensi')
                    end
                end
            end
			
			
			if IsInPoliceShopZone(coords) then
                if IsControlJustReleased(0, Keys["E"]) then
                    if (PlayerData.job ~= nil and PlayerData.job.name == 'police' and PlayerData.job.grade > 12 ) then
                        ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
                            if hasWeaponLicense then
                                OpenShopInv("policeshop")
                            else
                                OpenBuyLicenseMenu()
                            end
                        end, GetPlayerServerId(PlayerId()), 'weapon')
                    else
                          exports['mythic_notify']:DoHudText('error', 'Tidak memiliki Lisensi')
                    end
                end
            end
        end
    end
end)


function OpenShopInv(shoptype)
    text = "shop"
    data = {text = text}
    inventory = {}

    ESX.TriggerServerCallback("suku:getShopItems", function(shopInv)
        for i = 1, #shopInv, 1 do
            table.insert(inventory, shopInv[i])
        end
    end, shoptype)

    Citizen.Wait(500)
    TriggerEvent("esx_inventoryhud:openShopInventory", data, inventory)
end

RegisterNetEvent("suku:OpenCustomShopInventory")
AddEventHandler("suku:OpenCustomShopInventory", function(type, shopinventory)
    text = "shop"
    data = {text = text}
    inventory = {}

    ESX.TriggerServerCallback("suku:getCustomShopItems", function(shopInv)
        for i = 1, #shopInv, 1 do
            table.insert(inventory, shopInv[i])
        end
    end, type, shopinventory)
    Citizen.Wait(500)

    TriggerEvent("esx_inventoryhud:openShopInventory", data, inventory)
end)

RegisterNetEvent("esx_inventoryhud:openShopInventory")
AddEventHandler("esx_inventoryhud:openShopInventory", function(data, inventory)
        setShopInventoryData(data, inventory, weapons)
        openShopInventory()
end)

RegisterNetEvent('esx_license:getLicenses')
AddEventHandler('esx_license:getLicenses', function (licenses)
    for i = 1, #licenses, 1 do
        Licenses[licenses[i].type] = true
    end
end)

function setShopInventoryData(data, inventory)
    shopData = data

    SendNUIMessage(
        {
            action = "setInfoText",
            text = data.text
        }
    )

    items = {}

    SendNUIMessage(
        {
            action = "setShopInventoryItems",
            itemList = inventory
        }
    )
end

function openShopInventory()
    loadPlayerInventory()
    isInInventory = true

    SendNUIMessage(
        {
            action = "display",
            type = "shop"
        }
    )

    SetNuiFocus(true, true)
end

RegisterNUICallback("TakeFromShop", function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            local dict = "mp_common"
        
                RequestAnimDict(dict)
                while not HasAnimDictLoaded(dict) do
                    Citizen.Wait(0)
                end
            if data.item.illegal then
                TriggerServerEvent("suku:SellItemToPlayer", GetPlayerServerId(PlayerId()), data.item.type, data.item.name, tonumber(data.number), true)
            else
                TriggerServerEvent("suku:SellItemToPlayer", GetPlayerServerId(PlayerId()), data.item.type, data.item.name, tonumber(data.number), false)
            end
            TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'demo1', 0.3)
            TaskPlayAnim(GetPlayerPed(-1), dict, "givetake1_a", 8.0, 8.0, -1, 48, 1, false, false, false)
        end

        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)

RegisterNetEvent("suku:AddAmmoToWeapon")
AddEventHandler("suku:AddAmmoToWeapon", function(hash, amount)
    AddAmmoToPed(GetPlayerPed(-1), hash, amount)
end)


function IsInWaroengShopZone(coords)
    Waroeng = Config.Shops.Waroeng.Locations
    for i = 1, #Waroeng, 1 do
        if GetDistanceBetweenCoords(coords, Waroeng[i].x, Waroeng[i].y, Waroeng[i].z, true) < 1.5 then
            return true
        end
    end
    return false
end

function IsInKantinShopZone(coords)
    Kantin = Config.Shops.Kantin.Locations
    for i = 1, #Kantin, 1 do
        if GetDistanceBetweenCoords(coords, Kantin[i].x, Kantin[i].y, Kantin[i].z, true) < 1.5 then
            return true
        end
    end
    return false
end

function IsInPedagangShopZone(coords)
    Pedagang = Config.Shops.Pedagang.Locations
    for i = 1, #Pedagang, 1 do
        if GetDistanceBetweenCoords(coords, Pedagang[i].x, Pedagang[i].y, Pedagang[i].z, true) < 1.5 then
            return true
        end
    end
    return false
end

function IsInBarShopZone(coords)
    Bar = Config.Shops.Bar.Locations
    for i = 1, #Bar, 1 do
        if GetDistanceBetweenCoords(coords, Bar[i].x, Bar[i].y, Bar[i].z, true) < 1.5 then
            return true
        end
    end
    return false
end


function IsInWeaponShopZone(coords)
    WeaponShop = Config.Shops.WeaponShop.Locations
    for i = 1, #WeaponShop, 1 do
        if GetDistanceBetweenCoords(coords, WeaponShop[i].x, WeaponShop[i].y, WeaponShop[i].z, true) < 1.5 then
            return true
        end
    end
    return false
end

function IsInWeaponShopZone2(coords)
    WeaponShop2 = Config.Shops.WeaponShop2.Locations
    for i = 1, #WeaponShop2, 1 do
        if GetDistanceBetweenCoords(coords, WeaponShop2[i].x, WeaponShop2[i].y, WeaponShop2[i].z, true) < 1.5 then
            return true
        end
    end
    return false
end

function IsInPoliceShopZone(coords)
    PoliceShop = Config.Shops.PoliceShop.Locations
    for i = 1, #PoliceShop, 1 do
        if GetDistanceBetweenCoords(coords, PoliceShop[i].x, PoliceShop[i].y, PoliceShop[i].z, true) < 1.5 then
            return true
        end
    end
    return false
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        player = GetPlayerPed(-1)
        coords = GetEntityCoords(player)

        for k, v in pairs(Config.Shops.Waroeng.Locations) do
            if GetDistanceBetweenCoords(coords, Config.Shops.Waroeng.Locations[k].x, Config.Shops.Waroeng.Locations[k].y, Config.Shops.Waroeng.Locations[k].z, true) < 2.0 then
                DrawText3DTest(Config.Shops.Waroeng.Locations[k].x, Config.Shops.Waroeng.Locations[k].y, Config.Shops.Waroeng.Locations[k].z + 1.0, "Tekan [E] melihat menu" )
            end
        end

        for k, v in pairs(Config.Shops.Kantin.Locations) do
            if GetDistanceBetweenCoords(coords, Config.Shops.Kantin.Locations[k].x, Config.Shops.Kantin.Locations[k].y, Config.Shops.Kantin.Locations[k].z, true) < 2.0 then
                DrawText3DTest(Config.Shops.Kantin.Locations[k].x, Config.Shops.Kantin.Locations[k].y, Config.Shops.Kantin.Locations[k].z + 0.5, "Tekan [E] melihat menu" )
            end
        end
		
		  for k, v in pairs(Config.Shops.Pedagang.Locations) do
            if GetDistanceBetweenCoords(coords, Config.Shops.Pedagang.Locations[k].x, Config.Shops.Pedagang.Locations[k].y, Config.Shops.Pedagang.Locations[k].z, true) < 2.0 then
                DrawText3DTest(Config.Shops.Pedagang.Locations[k].x, Config.Shops.Pedagang.Locations[k].y, Config.Shops.Pedagang.Locations[k].z + 0.5, "Tekan [E] melihat menu" )
            end
        end

        for k, v in pairs(Config.Shops.Bar.Locations) do
            if GetDistanceBetweenCoords(coords, Config.Shops.Bar.Locations[k].x, Config.Shops.Bar.Locations[k].y, Config.Shops.Bar.Locations[k].z, true) < 2.0 then
                DrawText3DTest(Config.Shops.Bar.Locations[k].x, Config.Shops.Bar.Locations[k].y, Config.Shops.Bar.Locations[k].z + 1.0, "Tekan [E] melihat menu" )
            end
        end


        for k, v in pairs(Config.Shops.WeaponShop.Locations) do
            if GetDistanceBetweenCoords(coords, Config.Shops.WeaponShop.Locations[k].x, Config.Shops.WeaponShop.Locations[k].y, Config.Shops.WeaponShop.Locations[k].z, true) < 2.0 then
                DrawText3DTest(Config.Shops.WeaponShop.Locations[k].x, Config.Shops.WeaponShop.Locations[k].y, Config.Shops.WeaponShop.Locations[k].z + 0.5, "Tekan [E] melihat menu" )
            end
        end

        for k, v in pairs(Config.Shops.WeaponShop2.Locations) do
            if GetDistanceBetweenCoords(coords, Config.Shops.WeaponShop2.Locations[k].x, Config.Shops.WeaponShop2.Locations[k].y, Config.Shops.WeaponShop2.Locations[k].z, true) < 2.0 then
                DrawText3DTest(Config.Shops.WeaponShop2.Locations[k].x, Config.Shops.WeaponShop2.Locations[k].y, Config.Shops.WeaponShop2.Locations[k].z + 0.5, "Tekan [E] melihat menu" )
            end
        end
		
		 for k, v in pairs(Config.Shops.PoliceShop.Locations) do
            if GetDistanceBetweenCoords(coords, Config.Shops.PoliceShop.Locations[k].x, Config.Shops.PoliceShop.Locations[k].y, Config.Shops.PoliceShop.Locations[k].z, true) < 2.0 then
                DrawText3DTest(Config.Shops.PoliceShop.Locations[k].x, Config.Shops.PoliceShop.Locations[k].y, Config.Shops.PoliceShop.Locations[k].z + 0.5, "Tekan [E] melihat menu" )
            end
        end
    end
end)

function DrawText3DTest(x,y,z, text)

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

function OpenBuyLicenseMenu()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_license',{
        title = 'Beli Lisensi Senjata?',
        align = 'left',
        elements = {
          { label = 'yes' ..' ($ID' .. Config.LicensePrice ..')', value = 'yes' },
          { label = 'no', value = 'no' },
        }
      },
      function (data, menu)
        if data.current.value == 'yes' then
            TriggerServerEvent('suku:buyLicense')
        end
        menu.close()
    end,
    function (data, menu)
        menu.close()
    end)
end

Citizen.CreateThread(function()
    for k, v in pairs(Config.Shops.Waroeng.Locations) do
        CreateBlip(vector3(Config.Shops.Waroeng.Locations[k].x, Config.Shops.Waroeng.Locations[k].y, Config.Shops.Waroeng.Locations[k].z ), "WAROENG", 3.0, 2, 52)
    end

    for k, v in pairs(Config.Shops.WeaponShop.Locations) do
        CreateBlip(vector3(Config.Shops.WeaponShop.Locations[k].x, Config.Shops.WeaponShop.Locations[k].y, Config.Shops.WeaponShop.Locations[k].z ), "Toko Senjata", 3.0, 81, 110)
    end
end)

function CreateBlip(coords, text, radius, color, sprite)
    local blip = AddBlipForCoord(coords)

    SetBlipSprite (blip, sprite)
    SetBlipScale  (blip, 0.7)
    SetBlipDisplay(blip, 4)
    SetBlipColour (blip, color)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
end