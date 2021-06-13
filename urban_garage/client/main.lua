Keys = {
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

ESX = nil

local PlayerData = {}
local JobBlips = {}
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}
local userProperties = {}
local this_Garage = {}
local privateBlips = {}
local currentGarage
local vehiclesPrices = {}

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    if Config.UsePrivateCarGarages == true then
        ESX.TriggerServerCallback('urban_garage:getOwnedProperties', function(properties)
            userProperties = properties
            PrivateGarageBlips()
        end)
    end

    ESX.TriggerServerCallback('esx_lscustom:getVehiclesPrices', function(vehicles)
		vehiclesPrices = vehicles
	end)

    ESX.PlayerData = xPlayer
    refreshBlips()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
    deleteBlips()
    refreshBlips()
end)

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

-- Open Main Menu
function OpenMenuGarage(PointType)
    ESX.UI.Menu.CloseAll()

    local elements = {}

    if PointType == 'car_garage_point' then
        table.insert(elements, {
            label = _U('list_owned_cars'),
            value = 'list_owned_cars'
        })
    elseif PointType == 'boat_garage_point' then
        table.insert(elements, {
            label = _U('list_owned_boats'),
            value = 'list_owned_boats'
        })
    elseif PointType == 'aircraft_garage_point' then
        table.insert(elements, {
            label = _U('list_owned_aircrafts'),
            value = 'list_owned_aircrafts'
        })
    elseif PointType == 'car_store_point' then
        table.insert(elements, {
            label = _U('store_owned_cars'),
            value = 'store_owned_cars'
        })
    elseif PointType == 'boat_store_point' then
        table.insert(elements, {
            label = _U('store_owned_boats'),
            value = 'store_owned_boats'
        })
    elseif PointType == 'aircraft_store_point' then
        table.insert(elements, {
            label = _U('store_owned_aircrafts'),
            value = 'store_owned_aircrafts'
        })
    elseif PointType == 'car_pound_point' then
        table.insert(elements, {
            label = _U('return_owned_cars') .. "URBAN Impound Company",
            value = 'return_owned_cars'
        })
    elseif PointType == 'boat_pound_point' then
        table.insert(elements, {
            label = _U('return_owned_boats') .. " ($" .. Config.BoatPoundPrice .. ")",
            value = 'return_owned_boats'
        })
    elseif PointType == 'aircraft_pound_point' then
        table.insert(elements, {
            label = _U('return_owned_aircrafts') .. " ($" .. Config.AircraftPoundPrice .. ")",
            value = 'return_owned_aircrafts'
        })
    elseif PointType == 'policing_pound_point' then
        table.insert(elements, {
            label = _U('return_owned_policing') .. " ($" .. Config.PolicingPoundPrice .. ")",
            value = 'return_owned_policing'
        })
    elseif PointType == 'ambulance_pound_point' then
        table.insert(elements, {
            label = _U('return_owned_ambulance') .. " ($" .. Config.AmbulancePoundPrice .. ")",
            value = 'return_owned_ambulance'
        })
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'garage_menu', {
        title = _U('garage'),
        align = 'top-left',
        elements = elements
    }, function(data, menu)
        menu.close()
        local action = data.current.value

        if action == 'list_owned_cars' then
            ListOwnedCarsMenu(CurrentActionData.garage)
        elseif action == 'list_owned_boats' then
            ListOwnedBoatsMenu()
        elseif action == 'list_owned_aircrafts' then
            ListOwnedAircraftsMenu()
        elseif action == 'store_owned_cars' then
            StoreOwnedCarsMenu(CurrentActionData.garage)
        elseif action == 'store_owned_boats' then
            StoreOwnedBoatsMenu()
        elseif action == 'store_owned_aircrafts' then
            StoreOwnedAircraftsMenu()
        elseif action == 'return_owned_cars' then
            ReturnOwnedCarsMenu()
        elseif action == 'return_owned_boats' then
            ReturnOwnedBoatsMenu()
        elseif action == 'return_owned_aircrafts' then
            ReturnOwnedAircraftsMenu()
        elseif action == 'return_owned_policing' then
            ReturnOwnedPolicingMenu()
        elseif action == 'return_owned_ambulance' then
            ReturnOwnedAmbulanceMenu()
        end
    end, function(data, menu)
        menu.close()
    end)
end

-- List Owned Cars Menu
function ListOwnedCarsMenu(garage)
    local elements = {}

    if Config.ShowGarageSpacer1 then
        table.insert(elements, {
            label = _U('spacer1')
        })
    end

    if Config.ShowGarageSpacer2 then
        table.insert(elements, {
            label = _U('spacer2')
        })
    end

    if Config.ShowGarageSpacer3 then
        table.insert(elements, {
            label = _U('spacer3')
        })
    end

    ESX.TriggerServerCallback('urban_garage:getOwnedCars', function(ownedCars)
        if #ownedCars == 0 then
            ESX.ShowNotification(_U('garage_nocars'))
        else
            for _, v in pairs(ownedCars) do
                if Config.UseVehicleNamesLua then
                    local hashVehicule = v.vehicle.model
                    local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
                    local vehicleName = GetLabelText(aheadVehName)
                    local plate = v.plate
                    local labelvehicle

                    if Config.ShowVehicleLocation == true then
                        if v.stored then
                            labelvehicle = vehicleName .. ' - ' .. plate .. ''
                        else
                            labelvehicle = vehicleName .. ' (' .. plate .. ') ' .. _U('municipal_pound')
                        end
                    else
                        if v.stored then
                            labelvehicle = vehicleName .. ' - ' .. plate .. ''
                        else
                            labelvehicle = vehicleName .. ' - ' .. plate .. ''
                        end
                    end

                    table.insert(elements, {
                        label = labelvehicle,
                        value = v
                    })
                else
                    local hashVehicule = v.vehicle.model
                    local vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
                    local plate = v.plate
                    local labelvehicle

                    if Config.ShowVehicleLocation then
                        if v.stored then
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('loc_garage') .. ' |'
                        else
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('loc_pound') .. ' |'
                        end
                    else
                        if v.stored then
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' |'
                        else
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' |'
                        end
                    end

                    table.insert(elements, {
                        label = labelvehicle,
                        value = v
                    })
                end
            end
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_car', {
            title = _U('garage_cars'),
            align = 'top-left',
            elements = elements
        }, function(data, menu)
            if data.current.value.stored then
                menu.close()
                --print(dump(ownedCars))
                SpawnVehicle(data.current.value.vehicle, data.current.value.plate, data.current.value.damages)
            else
                ESX.ShowNotification(_U('car_is_impounded'))
            end
        end, function(data, menu)
            menu.close()
        end)
    end, garage)
end

-- List Owned Boats Menu
function ListOwnedBoatsMenu()
    local elements = {}

    if Config.ShowGarageSpacer1 then
        table.insert(elements, {
            label = _U('spacer1')
        })
    end

    if Config.ShowGarageSpacer2 then
        table.insert(elements, {
            label = _U('spacer2')
        })
    end

    if Config.ShowGarageSpacer3 then
        table.insert(elements, {
            label = _U('spacer3')
        })
    end

    ESX.TriggerServerCallback('urban_garage:getOwnedBoats', function(ownedBoats)
        if #ownedBoats == 0 then
            ESX.ShowNotification(_U('garage_noboats'))
        else
            for _, v in pairs(ownedBoats) do
                if Config.UseVehicleNamesLua then
                    local hashVehicule = v.vehicle.model
                    local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
                    local vehicleName = GetLabelText(aheadVehName)
                    local plate = v.plate
                    local labelvehicle

                    if Config.ShowVehicleLocation then
                        if v.stored then
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('loc_garage') .. ' |'
                        else
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('loc_pound') .. ' |'
                        end
                    else
                        if v.stored then
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' |'
                        else
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' |'
                        end
                    end

                    table.insert(elements, {
                        label = labelvehicle,
                        value = v
                    })
                else
                    local hashVehicule = v.vehicle.model
                    local vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
                    local plate = v.plate
                    local labelvehicle

                    if Config.ShowVehicleLocation then
                        if v.stored then
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('loc_garage') .. ' |'
                        else
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('loc_pound') .. ' |'
                        end
                    else
                        if v.stored then
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' |'
                        else
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' |'
                        end
                    end

                    table.insert(elements, {
                        label = labelvehicle,
                        value = v
                    })
                end
            end
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_boat', {
            title = _U('garage_boats'),
            align = 'top-left',
            elements = elements
        }, function(data, menu)
            if data.current.value.stored then
                menu.close()
                SpawnVehicle(data.current.value.vehicle, data.current.value.plate)
            else
                ESX.ShowNotification(_U('boat_is_impounded'))
            end
        end, function(data, menu)
            menu.close()
        end)
    end)
end

-- List Owned Aircrafts Menu
function ListOwnedAircraftsMenu()
    local elements = {}

    if Config.ShowGarageSpacer1 then
        table.insert(elements, {
            label = _U('spacer1')
        })
    end

    if Config.ShowGarageSpacer2 then
        table.insert(elements, {
            label = _U('spacer2')
        })
    end

    if Config.ShowGarageSpacer3 then
        table.insert(elements, {
            label = _U('spacer3')
        })
    end

    ESX.TriggerServerCallback('urban_garage:getOwnedAircrafts', function(ownedAircrafts)
        if #ownedAircrafts == 0 then
            ESX.ShowNotification(_U('garage_noaircrafts'))
        else
            for _, v in pairs(ownedAircrafts) do
                if Config.UseVehicleNamesLua then
                    local hashVehicule = v.vehicle.model
                    local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
                    local vehicleName = GetLabelText(aheadVehName)
                    local plate = v.plate
                    local labelvehicle

                    if Config.ShowVehicleLocation then
                        if v.stored then
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('loc_garage') .. ' |'
                        else
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('loc_pound') .. ' |'
                        end
                    else
                        if v.stored then
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' |'
                        else
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' |'
                        end
                    end

                    table.insert(elements, {
                        label = labelvehicle,
                        value = v
                    })
                else
                    local hashVehicule = v.vehicle.model
                    local vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
                    local plate = v.plate
                    local labelvehicle

                    if Config.ShowVehicleLocation then
                        if v.stored then
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('loc_garage') .. ' |'
                        else
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('loc_pound') .. ' |'
                        end
                    else
                        if v.stored then
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' |'
                        else
                            labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' |'
                        end
                    end

                    table.insert(elements, {
                        label = labelvehicle,
                        value = v
                    })
                end
            end
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_aircraft', {
            title = _U('garage_aircrafts'),
            align = 'top-left',
            elements = elements
        }, function(data, menu)
            if data.current.value.stored then
                menu.close()
                SpawnVehicle(data.current.value.vehicle, data.current.value.plate)
            else
                ESX.ShowNotification(_U('aircraft_is_impounded'))
            end
        end, function(data, menu)
            menu.close()
        end)
    end)
end

-------------------------AARON

-------------------------AARON

-- Store Owned Cars Menu
function StoreOwnedCarsMenu(garage)
    local playerPed = GetPlayerPed(-1)

    if IsPedInAnyVehicle(playerPed, false) then
        local playerPed = GetPlayerPed(-1)
        local coords = GetEntityCoords(playerPed)
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
        local current = GetPlayersLastVehicle(GetPlayerPed(-1), true)
        local engineHealth = GetVehicleEngineHealth(current)
        local plate = vehicleProps.plate
        local vehProps = ESX.Game.GetVehicleProperties(vehicle)
        local damages = {
            eng = GetVehicleEngineHealth(vehicle),
            bod = GetVehicleBodyHealth(vehicle),
            tnk = GetVehiclePetrolTankHealth(vehicle),
            drt = GetVehicleDirtLevel(vehicle),
            oil = GetVehicleOilLevel(vehicle),
            drvlyt = GetIsLeftVehicleHeadlightDamaged(vehicle),
            paslyt = GetIsRightVehicleHeadlightDamaged(vehicle),
            dor = {},
            win = {},
            tyr = {}
        }
        local vehPos = GetEntityCoords(vehicle)
        local vehHead = GetEntityHeading(vehicle)
        for i = 0, 5 do
            table.insert(damages.dor, i)
            damages.dor[i] = false
            --[[if not DoesVehicleHaveDoor(vehicle, i) then
                damages.dor[i] = true
            end--]]
            if IsVehicleDoorDamaged(vehicle, i) == 1 then
                damages.dor[i] = true
            end
        end

        for i = 0, 13 do
            table.insert(damages.win, i)
            damages.win[i] = false
            if not IsVehicleWindowIntact(vehicle, i) then
                damages.win[i] = true
            end
        end

        for i = 0, 7 do
            table.insert(damages.tyr, i)
            damages.tyr[i] = false
            if IsVehicleTyreBurst(vehicle, i, false) then
                damages.tyr[i] = 'popped'
            elseif IsVehicleTyreBurst(vehicle, i, true) then
                damages.tyr[i] = 'gone'
            end
        end

        ESX.TriggerServerCallback('urban_garage:storeVehicle', function(valid)
            if valid then
                StoreVehicle(vehicle, vehicleProps)
            else
                ESX.Game.DeleteVehicle(vehicle)
                -- exports['mythic_notify']:SendAlert('error', _U('cannot_store_vehicle'))
                -- TriggerEvent('notification', _U('cannot_store_vehicle'), 2)
            end
        end, vehicleProps, damages, garage)
    else
        TriggerEvent('notification', _U('no_vehicle_to_enter'), 2)
        -- exports['mythic_notify']:SendAlert('error', _U('no_vehicle_to_enter'))
    end
end

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

-- Store Owned Boats Menu
function StoreOwnedBoatsMenu()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed, false) then
        local playerPed = GetPlayerPed(-1)
        local coords = GetEntityCoords(playerPed)
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
        local current = GetPlayersLastVehicle(GetPlayerPed(-1), true)
        local engineHealth = GetVehicleEngineHealth(current)
        local plate = vehicleProps.plate

        ESX.TriggerServerCallback('urban_garage:storeVehicle', function(valid)
            if valid then
                if engineHealth < 990 then
                    if Config.UseDamageMult then
                        local apprasial = math.floor((1000 - engineHealth) / 1000 * Config.BoatPoundPrice *
                                                         Config.DamageMult)
                        RepairVehicle(apprasial, vehicle, vehicleProps)
                    else
                        local apprasial = math.floor((1000 - engineHealth) / 1000 * Config.BoatPoundPrice)
                        RepairVehicle(apprasial, vehicle, vehicleProps)
                    end
                else
                    StoreVehicle(vehicle, vehicleProps)
                end
            else
                ESX.ShowNotification(_U('cannot_store_vehicle'))
            end
        end, vehicleProps)
    else
        ESX.ShowNotification(_U('no_vehicle_to_enter'))
    end
end

-- Store Owned Aircrafts Menu
function StoreOwnedAircraftsMenu()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed, false) then
        local playerPed = GetPlayerPed(-1)
        local coords = GetEntityCoords(playerPed)
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
        local current = GetPlayersLastVehicle(GetPlayerPed(-1), true)
        local engineHealth = GetVehicleEngineHealth(current)
        local plate = vehicleProps.plate

        ESX.TriggerServerCallback('urban_garage:storeVehicle', function(valid)
            if valid then
                if engineHealth < 990 then
                    if Config.UseDamageMult then
                        local apprasial = math.floor((1000 - engineHealth) / 1000 * Config.AircraftPoundPrice *
                                                         Config.DamageMult)
                        RepairVehicle(apprasial, vehicle, vehicleProps)
                    else
                        local apprasial = math.floor((1000 - engineHealth) / 1000 * Config.AircraftPoundPrice)
                        RepairVehicle(apprasial, vehicle, vehicleProps)
                    end
                else
                    StoreVehicle(vehicle, vehicleProps)
                end
            else
                ESX.ShowNotification(_U('cannot_store_vehicle'))
            end
        end, vehicleProps)
    else
        ESX.ShowNotification(_U('no_vehicle_to_enter'))
    end
end

-- Pound Owned Cars Menu
function ReturnOwnedCarsMenu()
    ESX.TriggerServerCallback('urban_garage:getOutOwnedCars', function(ownedCars)
        local elements = {}

        ESX.TriggerServerCallback('urban_prime:isPrime', function(prime)
            if Config.ShowPoundSpacer2 then
                table.insert(elements, {
                    label = _U('spacer2')
                })
            end
    
            if Config.ShowPoundSpacer3 then
                table.insert(elements, {
                    label = _U('spacer3')
                })
            end
    
            for _, v in pairs(ownedCars) do
                local price
                local found = false
                for key,value in pairs(vehiclesPrices) do
                    if v.model == GetHashKey(value.model) then
                        if prime then
                            price = value.price * Config.ImpoundPrimePercent / 100
                        else
                            price = value.price * Config.ImpoundPricePercent / 100
                        end
                        found = true
                        break
                    end
                end
                local vehPrice = price or Config.CarPoundPrice
                if Config.UseVehicleNamesLua then
                    local hashVehicule = v.model
                    local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
                    local vehicleName = GetLabelText(aheadVehName)
                    local plate = v.plate
                    local labelvehicle
    
                    labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('return') .. ' | $'..vehPrice
    
                    table.insert(elements, {
                        label = labelvehicle,
                        value = v,
                        price = vehPrice 
                    })
                else
                    local hashVehicule = v.model
                    local vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
                    local plate = v.plate
    
                    local labelvehicle
    
                    labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('return') .. ' | $'.. vehPrice
                    table.insert(elements, {
                        label = labelvehicle,
                        value = v,
                        price = vehPrice
                    })
                end
            end
    
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'return_owned_car', {
                title = _U('pound_cars'),
                align = 'top-left',
                elements = elements
            }, function(data, menu)
                ESX.TriggerServerCallback('urban_garage:checkMoneyCars', function(hasEnoughMoney)
                    if hasEnoughMoney then
                        TriggerServerEvent('urban_garage:payCar', data.current.price)
                        SpawnPoundedVehicle(data.current.value, data.current.value.plate)     
                    else
                        ESX.ShowNotification(_U('not_enough_money'))
                    end
                end, data.current.price)
            end, function(data, menu)
                menu.close()
            end)
        end)
    end)
end

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end 

-- Pound Owned Boats Menu
function ReturnOwnedBoatsMenu()
    ESX.TriggerServerCallback('urban_garage:getOutOwnedBoats', function(ownedBoats)
        local elements = {}

        if Config.ShowPoundSpacer2 then
            table.insert(elements, {
                label = _U('spacer2')
            })
        end

        if Config.ShowPoundSpacer3 then
            table.insert(elements, {
                label = _U('spacer3')
            })
        end

        for _, v in pairs(ownedBoats) do
            if Config.UseVehicleNamesLua then
                local hashVehicule = v.model
                local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
                local vehicleName = GetLabelText(aheadVehName)
                local plate = v.plate
                local labelvehicle

                labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('return') .. ' |'

                table.insert(elements, {
                    label = labelvehicle,
                    value = v
                })
            else
                local hashVehicule = v.model
                local vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
                local plate = v.plate
                local labelvehicle

                labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('return') .. ' |'

                table.insert(elements, {
                    label = labelvehicle,
                    value = v
                })
            end
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'return_owned_boat', {
            title = _U('pound_boats'),
            align = 'top-left',
            elements = elements
        }, function(data, menu)
            ESX.TriggerServerCallback('urban_garage:checkMoneyBoats', function(hasEnoughMoney)
                if hasEnoughMoney then
                    TriggerServerEvent('urban_garage:payBoat')
                    SpawnPoundedVehicle(data.current.value, data.current.value.plate)
                else
                    ESX.ShowNotification(_U('not_enough_money'))
                end
            end)
        end, function(data, menu)
            menu.close()
        end)
    end)
end

-- Pound Owned Aircrafts Menu
function ReturnOwnedAircraftsMenu()
    ESX.TriggerServerCallback('urban_garage:getOutOwnedAircrafts', function(ownedAircrafts)
        local elements = {}

        if Config.ShowPoundSpacer2 then
            table.insert(elements, {
                label = _U('spacer2')
            })
        end

        if Config.ShowPoundSpacer3 then
            table.insert(elements, {
                label = _U('spacer3')
            })
        end

        for _, v in pairs(ownedAircrafts) do
            if Config.UseVehicleNamesLua then
                local hashVehicule = v.model
                local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
                local vehicleName = GetLabelText(aheadVehName)
                local plate = v.plate
                local labelvehicle

                labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('return') .. ' |'

                table.insert(elements, {
                    label = labelvehicle,
                    value = v
                })
            else
                local hashVehicule = v.model
                local vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
                local plate = v.plate
                local labelvehicle

                labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('return') .. ' |'

                table.insert(elements, {
                    label = labelvehicle,
                    value = v
                })
            end
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'return_owned_aircraft', {
            title = _U('pound_aircrafts'),
            align = 'top-left',
            elements = elements
        }, function(data, menu)
            ESX.TriggerServerCallback('urban_garage:checkMoneyAircrafts', function(hasEnoughMoney)
                if hasEnoughMoney then
                    TriggerServerEvent('urban_garage:payAircraft')
                    SpawnPoundedVehicle(data.current.value, data.current.value.plate)
                else
                    ESX.ShowNotification(_U('not_enough_money'))
                end
            end)
        end, function(data, menu)
            menu.close()
        end)
    end)
end

-- Pound Owned Policing Menu
function ReturnOwnedPolicingMenu()
    ESX.TriggerServerCallback('urban_garage:getOutOwnedPolicingCars', function(ownedPolicingCars)
        local elements = {}

        if Config.ShowPoundSpacer2 then
            table.insert(elements, {
                label = _U('spacer2')
            })
        end

        if Config.ShowPoundSpacer3 then
            table.insert(elements, {
                label = _U('spacer3')
            })
        end

        for _, v in pairs(ownedPolicingCars) do
            if Config.UseVehicleNamesLua then
                local hashVehicule = v.model
                local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
                local vehicleName = GetLabelText(aheadVehName)
                local plate = v.plate
                local labelvehicle

                labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('return') .. ' |'

                table.insert(elements, {
                    label = labelvehicle,
                    value = v
                })
            else
                local hashVehicule = v.model
                local vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
                local plate = v.plate
                local labelvehicle

                labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('return') .. ' |'

                table.insert(elements, {
                    label = labelvehicle,
                    value = v
                })
            end
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'return_owned_policing', {
            title = _U('pound_police'),
            align = 'top-left',
            elements = elements
        }, function(data, menu)
            ESX.TriggerServerCallback('urban_garage:checkMoneyPolicing', function(hasEnoughMoney)
                if hasEnoughMoney then
                    TriggerServerEvent('urban_garage:payPolicing')
                    SpawnPoundedVehicle(data.current.value, data.current.value.plate)
                else
                    ESX.ShowNotification(_U('not_enough_money'))
                end
            end)
        end, function(data, menu)
            menu.close()
        end)
    end)
end

-- Pound Owned Ambulance Menu
function ReturnOwnedAmbulanceMenu()
    ESX.TriggerServerCallback('urban_garage:getOutOwnedAmbulanceCars', function(ownedAmbulanceCars)
        local elements = {}

        if Config.ShowPoundSpacer2 then
            table.insert(elements, {
                label = _U('spacer2')
            })
        end

        if Config.ShowPoundSpacer3 then
            table.insert(elements, {
                label = _U('spacer3')
            })
        end

        for _, v in pairs(ownedAmbulanceCars) do
            if Config.UseVehicleNamesLua then
                local hashVehicule = v.model
                local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
                local vehicleName = GetLabelText(aheadVehName)
                local plate = v.plate
                local labelvehicle

                labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('return') .. ' |'

                table.insert(elements, {
                    label = labelvehicle,
                    value = v
                })
            else
                local hashVehicule = v.model
                local vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
                local plate = v.plate
                local labelvehicle

                labelvehicle = '| ' .. plate .. ' | ' .. vehicleName .. ' | ' .. _U('return') .. ' |'

                table.insert(elements, {
                    label = labelvehicle,
                    value = v
                })
            end
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'return_owned_ambulance', {
            title = _U('pound_ambulance'),
            align = 'top-left',
            elements = elements
        }, function(data, menu)
            ESX.TriggerServerCallback('urban_garage:checkMoneyAmbulance', function(hasEnoughMoney)
                if hasEnoughMoney then
                    TriggerServerEvent('urban_garage:payAmbulance')
                    SpawnPoundedVehicle(data.current.value, data.current.value.plate)
                else
                    ESX.ShowNotification(_U('not_enough_money'))
                end
            end)
        end, function(data, menu)
            menu.close()
        end)
    end)
end

-- Repair Vehicles
function RepairVehicle(apprasial, vehicle, vehicleProps)
    ESX.UI.Menu.CloseAll()

    local elements = {{
        label = _U('return_vehicle') .. " ($" .. apprasial .. ")",
        value = 'yes'
    }, {
        label = _U('see_mechanic'),
        value = 'no'
    }}

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'delete_menu', {
        title = _U('damaged_vehicle'),
        align = 'top-left',
        elements = elements
    }, function(data, menu)
        menu.close()

        if data.current.value == 'yes' then
            TriggerServerEvent('urban_garage:payhealth', apprasial)
            vehicleProps.bodyHealth = 1000.0 -- must be a decimal value!!!
            vehicleProps.engineHealth = 1000
            StoreVehicle(vehicle, vehicleProps)
        elseif data.current.value == 'no' then
            ESX.ShowNotification(_U('visit_mechanic'))
        end
    end, function(data, menu)
        menu.close()
    end)
end

-- Store Vehicles
function StoreVehicle(vehicle, vehicleProps)
    ESX.Game.DeleteVehicle(vehicle)
    TriggerServerEvent('urban_garage:setVehicleState', vehicleProps.plate, true)
    ESX.ShowNotification(_U('vehicle_in_garage'))
end

-- Spawn Vehicles
function SpawnVehicle(vehicle, plate, damages)
    ESX.Game.SpawnVehicle(vehicle.model, {
        x = this_Garage.SpawnPoint.x,
        y = this_Garage.SpawnPoint.y,
        z = this_Garage.SpawnPoint.z + 1
    }, this_Garage.SpawnPoint.h, function(callback_vehicle)
		SetVehicleFuelLevel(callback_vehicle, vehicle['fuelLevel'] + 0.0)
		DecorSetFloat(callback_vehicle, "_FUEL_LEVEL", GetVehicleFuelLevel(callback_vehicle))

        ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
        SetVehRadioStation(callback_vehicle, "OFF")
        -- SetEntityAsMissionEntity(callback_vehicle, true, false)
        if damages ~= nil then
            for i = 0, (#damages) do
                for i = 0, (5) do
                    if (damages.dor[tostring(i)]) == true then
                        SetVehicleDoorBroken(callback_vehicle, i)
                    end
                end

                for i = 0, (13) do
                    if (damages.win[tostring(i)]) == true then
                        SmashVehicleWindow(callback_vehicle, i)
                    end
                end

                for i = 0,(7) do
                    if (damages.tyr[tostring(i)]) == "popped" then
                        SetVehicleTyreBurst(callback_vehicle, i, true, 1000)
                    end
                end
            end
        end

        TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
        --print(dump(damages))
    end)

    TriggerServerEvent('urban_garage:setVehicleState', plate, false)
end

-- Spawn Pound Vehicles
function SpawnPoundedVehicle(vehicle, plate)
    ESX.Game.SpawnVehicle(vehicle.model, {
        x = this_Garage.SpawnPoint.x,
        y = this_Garage.SpawnPoint.y,
        z = this_Garage.SpawnPoint.z + 1
    }, this_Garage.SpawnPoint.h, function(callback_vehicle)
        ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
        SetVehRadioStation(callback_vehicle, "OFF")
        -- SetEntityAsMissionEntity(callback_vehicle, true, false)
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
    end)

    TriggerServerEvent('urban_garage:setVehicleState', plate, false)
end

-- Entered Marker
AddEventHandler('urban_garage:hasEnteredMarker', function(zone)
    if zone == 'car_garage_point' then
        CurrentAction = 'car_garage_point'
        CurrentActionMsg = _U('press_to_enter')
        CurrentActionData = {garage = currentGarage}
    elseif zone == 'boat_garage_point' then
        CurrentAction = 'boat_garage_point'
        CurrentActionMsg = _U('press_to_enter')
        CurrentActionData = {}
    elseif zone == 'aircraft_garage_point' then
        CurrentAction = 'aircraft_garage_point'
        CurrentActionMsg = _U('press_to_enter')
        CurrentActionData = {}
    elseif zone == 'car_store_point' then
        CurrentAction = 'car_store_point'
        CurrentActionMsg = _U('press_to_delete')
        CurrentActionData = {garage = currentGarage}
    elseif zone == 'boat_store_point' then
        CurrentAction = 'boat_store_point'
        CurrentActionMsg = _U('press_to_delete')
        CurrentActionData = {}
    elseif zone == 'aircraft_store_point' then
        CurrentAction = 'aircraft_store_point'
        CurrentActionMsg = _U('press_to_delete')
        CurrentActionData = {}
    elseif zone == 'car_pound_point' then
        CurrentAction = 'car_pound_point'
        CurrentActionMsg = _U('press_to_impound')
        CurrentActionData = {}
    elseif zone == 'boat_pound_point' then
        CurrentAction = 'boat_pound_point'
        CurrentActionMsg = _U('press_to_impound')
        CurrentActionData = {}
    elseif zone == 'aircraft_pound_point' then
        CurrentAction = 'aircraft_pound_point'
        CurrentActionMsg = _U('press_to_impound')
        CurrentActionData = {}
    elseif zone == 'policing_pound_point' then
        CurrentAction = 'policing_pound_point'
        CurrentActionMsg = _U('press_to_impound')
        CurrentActionData = {}
    elseif zone == 'ambulance_pound_point' then
        CurrentAction = 'ambulance_pound_point'
        CurrentActionMsg = _U('press_to_impound')
        CurrentActionData = {}
    end
end)

-- Exited Marker
AddEventHandler('urban_garage:hasExitedMarker', function()
    ESX.UI.Menu.CloseAll()
    CurrentAction = nil
end)

-- Draw Markers
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local canSleep = true

        if Config.UseCarGarages == true then
            -- Car Garages
            for k, v in pairs(Config.CarGarages) do
                if IsPedInAnyVehicle(PlayerPedId()) then

                else
                    if (GetDistanceBetweenCoords(coords, v.GaragePoint.x, v.GaragePoint.y, v.GaragePoint.z, true) <
                        Config.DrawDistance) then
                        canSleep = false
                        DrawMarker(Config.MarkerType, v.GaragePoint.x, v.GaragePoint.y, v.GaragePoint.z, 0.0, 0.0, 0.0,
                            0, 0.0, 0.0, Config.PointMarker.x, Config.PointMarker.y, Config.PointMarker.z,
                            Config.PointMarker.r, Config.PointMarker.g, Config.PointMarker.b, 100, false, true, 2,
                            false, false, false, false)
                    end
                end
            end

            for k, v in pairs(Config.CarGarages) do
                if IsPedInAnyVehicle(PlayerPedId()) then
                    if (GetDistanceBetweenCoords(coords, v.DeletePoint.x, v.DeletePoint.y, v.DeletePoint.z, true) <
                        Config.DrawDistance) then
                        canSleep = false
                        DrawMarker(Config.MarkerType, v.DeletePoint.x, v.DeletePoint.y, v.DeletePoint.z, 0.0, 0.0, 0.0,
                            0, 0.0, 0.0, Config.DeleteMarker.x, Config.DeleteMarker.y, Config.DeleteMarker.z,
                            Config.DeleteMarker.r, Config.DeleteMarker.g, Config.DeleteMarker.b, 100, false, true, 2,
                            false, false, false, false)
                    end
                end
            end

            -- Car Pounds
            for k, v in pairs(Config.CarPounds) do
                if (GetDistanceBetweenCoords(coords, v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z, true) <
                    Config.DrawDistance) then
                    canSleep = false
                    DrawMarker(Config.MarkerType, v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z, 0.0, 0.0, 0.0, 0, 0.0,
                        0.0, Config.PoundMarker.x, Config.PoundMarker.y, Config.PoundMarker.z, Config.PoundMarker.r,
                        Config.PoundMarker.g, Config.PoundMarker.b, 100, false, true, 2, false, false, false, false)
                end
            end
        end

        if Config.UseBoatGarages == true then
            -- Boat Garages
            for k, v in pairs(Config.BoatGarages) do
                if (GetDistanceBetweenCoords(coords, v.GaragePoint.x, v.GaragePoint.y, v.GaragePoint.z, true) <
                    Config.DrawDistance) then
                    canSleep = false
                    DrawMarker(Config.MarkerType, v.GaragePoint.x, v.GaragePoint.y, v.GaragePoint.z, 0.0, 0.0, 0.0, 0,
                        0.0, 0.0, Config.PointMarker.x, Config.PointMarker.y, Config.PointMarker.z,
                        Config.PointMarker.r, Config.PointMarker.g, Config.PointMarker.b, 100, false, true, 2, false,
                        false, false, false)
                    DrawMarker(Config.MarkerType, v.DeletePoint.x, v.DeletePoint.y, v.DeletePoint.z, 0.0, 0.0, 0.0, 0,
                        0.0, 0.0, Config.DeleteMarker.x, Config.DeleteMarker.y, Config.DeleteMarker.z,
                        Config.DeleteMarker.r, Config.DeleteMarker.g, Config.DeleteMarker.b, 100, false, true, 2, false,
                        false, false, false)
                end
            end

            for k, v in pairs(Config.BoatPounds) do
                if (GetDistanceBetweenCoords(coords, v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z, true) <
                    Config.DrawDistance) then
                    canSleep = false
                    DrawMarker(Config.MarkerType, v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z, 0.0, 0.0, 0.0, 0, 0.0,
                        0.0, Config.PoundMarker.x, Config.PoundMarker.y, Config.PoundMarker.z, Config.PoundMarker.r,
                        Config.PoundMarker.g, Config.PoundMarker.b, 100, false, true, 2, false, false, false, false)
                end
            end
        end

        if Config.UseAircraftGarages then
            for k, v in pairs(Config.AircraftGarages) do
                if (GetDistanceBetweenCoords(coords, v.GaragePoint.x, v.GaragePoint.y, v.GaragePoint.z, true) <
                    Config.DrawDistance) then
                    canSleep = false
                    DrawMarker(Config.MarkerType, v.GaragePoint.x, v.GaragePoint.y, v.GaragePoint.z, 0.0, 0.0, 0.0, 0,
                        0.0, 0.0, Config.PointMarker.x, Config.PointMarker.y, Config.PointMarker.z,
                        Config.PointMarker.r, Config.PointMarker.g, Config.PointMarker.b, 100, false, true, 2, false,
                        false, false, false)
                    DrawMarker(Config.MarkerType, v.DeletePoint.x, v.DeletePoint.y, v.DeletePoint.z, 0.0, 0.0, 0.0, 0,
                        0.0, 0.0, Config.DeleteMarker.x, Config.DeleteMarker.y, Config.DeleteMarker.z,
                        Config.DeleteMarker.r, Config.DeleteMarker.g, Config.DeleteMarker.b, 100, false, true, 2, false,
                        false, false, false)
                end
            end

            for k, v in pairs(Config.AircraftPounds) do
                if (GetDistanceBetweenCoords(coords, v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z, true) <
                    Config.DrawDistance) then
                    canSleep = false
                    DrawMarker(Config.MarkerType, v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z, 0.0, 0.0, 0.0, 0, 0.0,
                        0.0, Config.PoundMarker.x, Config.PoundMarker.y, Config.PoundMarker.z, Config.PoundMarker.r,
                        Config.PoundMarker.g, Config.PoundMarker.b, 100, false, true, 2, false, false, false, false)
                end
            end
        end

        if Config.UsePrivateCarGarages == true then
            -- Private Garages
            for k, v in pairs(Config.PrivateCarGarages) do
                if not v.Private or has_value(userProperties, v.Private) then
                    if IsPedInAnyVehicle(PlayerPedId()) then

                    else
                        if (GetDistanceBetweenCoords(coords, v.GaragePoint.x, v.GaragePoint.y, v.GaragePoint.z, true) <
                            Config.DrawDistance) then
                            canSleep = false
                            DrawMarker(Config.MarkerType, v.GaragePoint.x, v.GaragePoint.y, v.GaragePoint.z, 0.0, 0.0,
                                0.0, 0, 0.0, 0.0, Config.PointMarker.x, Config.PointMarker.y, Config.PointMarker.z,
                                Config.PointMarker.r, Config.PointMarker.g, Config.PointMarker.b, 100, false, true, 2,
                                false, false, false, false)
                            -- DrawMarker(Config.MarkerType, v.DeletePoint.x, v.DeletePoint.y, v.DeletePoint.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.DeleteMarker.x, Config.DeleteMarker.y, Config.DeleteMarker.z, Config.DeleteMarker.r, Config.DeleteMarker.g, Config.DeleteMarker.b, 100, false, true, 2, false, false, false, false)	
                        end
                    end
                end
            end

            for k, v in pairs(Config.PrivateCarGarages) do
                if not v.Private or has_value(userProperties, v.Private) then
                    if IsPedInAnyVehicle(PlayerPedId()) then
                        if (GetDistanceBetweenCoords(coords, v.DeletePoint.x, v.DeletePoint.y, v.DeletePoint.z, true) <
                            Config.DrawDistance) then
                            canSleep = false
                            -- DrawMarker(Config.MarkerType, v.GaragePoint.x, v.GaragePoint.y, v.GaragePoint.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.PointMarker.x, Config.PointMarker.y, Config.PointMarker.z, Config.PointMarker.r, Config.PointMarker.g, Config.PointMarker.b, 100, false, true, 2, false, false, false, false)	
                            DrawMarker(Config.MarkerType, v.DeletePoint.x, v.DeletePoint.y, v.DeletePoint.z, 0.0, 0.0,
                                0.0, 0, 0.0, 0.0, Config.DeleteMarker.x, Config.DeleteMarker.y, Config.DeleteMarker.z,
                                Config.DeleteMarker.r, Config.DeleteMarker.g, Config.DeleteMarker.b, 100, false, true,
                                2, false, false, false, false)
                        end
                    end
                end
            end

        end

        if Config.UseJobCarGarages then
            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' then
                for k, v in pairs(Config.PolicePounds) do
                    if (GetDistanceBetweenCoords(coords, v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z, true) <
                        Config.DrawDistance) then
                        canSleep = false
                        DrawMarker(Config.MarkerType, v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z, 0.0, 0.0, 0.0, 0,
                            0.0, 0.0, Config.JobPoundMarker.x, Config.JobPoundMarker.y, Config.JobPoundMarker.z,
                            Config.JobPoundMarker.r, Config.JobPoundMarker.g, Config.JobPoundMarker.b, 100, false, true,
                            2, false, false, false, false)
                    end
                end
            end

            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'ambulance' then
                for k, v in pairs(Config.AmbulancePounds) do
                    if (GetDistanceBetweenCoords(coords, v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z, true) <
                        Config.DrawDistance) then
                        canSleep = false
                        DrawMarker(Config.MarkerType, v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z, 0.0, 0.0, 0.0, 0,
                            0.0, 0.0, Config.JobPoundMarker.x, Config.JobPoundMarker.y, Config.JobPoundMarker.z,
                            Config.JobPoundMarker.r, Config.JobPoundMarker.g, Config.JobPoundMarker.b, 100, false, true,
                            2, false, false, false, false)
                    end
                end
            end
        end

        if canSleep then
            Citizen.Wait(500)
        end
    end
end)

-- Activate Menu when in Markers
Citizen.CreateThread(function()
    local currentZone = 'garage'
    while true do
        Citizen.Wait(1)

        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local isInMarker = false

        if Config.UseCarGarages then
            for k, v in pairs(Config.CarGarages) do
                if (GetDistanceBetweenCoords(coords, v.GaragePoint.x, v.GaragePoint.y, v.GaragePoint.z, true) <
                    Config.PointMarker.x) then
                    isInMarker = true
                    this_Garage = v
                    currentZone = 'car_garage_point'
                    currentGarage = k
                end

                if (GetDistanceBetweenCoords(coords, v.DeletePoint.x, v.DeletePoint.y, v.DeletePoint.z, true) <
                    Config.DeleteMarker.x) then
                    isInMarker = true
                    this_Garage = v
                    currentZone = 'car_store_point'
                    currentGarage = k
                end
            end

            for k, v in pairs(Config.CarPounds) do
                if (GetDistanceBetweenCoords(coords, v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z, true) <
                    Config.PoundMarker.x) then
                    isInMarker = true
                    this_Garage = v
                    currentZone = 'car_pound_point'
                end
            end
        end

        if Config.UseBoatGarages then
            for k, v in pairs(Config.BoatGarages) do
                if (GetDistanceBetweenCoords(coords, v.GaragePoint.x, v.GaragePoint.y, v.GaragePoint.z, true) <
                    Config.PointMarker.x) then
                    isInMarker = true
                    this_Garage = v
                    currentZone = 'boat_garage_point'
                end

                if (GetDistanceBetweenCoords(coords, v.DeletePoint.x, v.DeletePoint.y, v.DeletePoint.z, true) <
                    Config.DeleteMarker.x) then
                    isInMarker = true
                    this_Garage = v
                    currentZone = 'boat_store_point'
                end
            end

            for k, v in pairs(Config.BoatPounds) do
                if (GetDistanceBetweenCoords(coords, v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z, true) <
                    Config.PoundMarker.x) then
                    isInMarker = true
                    this_Garage = v
                    currentZone = 'boat_pound_point'
                end
            end
        end

        if Config.UseAircraftGarages then
            for k, v in pairs(Config.AircraftGarages) do
                if (GetDistanceBetweenCoords(coords, v.GaragePoint.x, v.GaragePoint.y, v.GaragePoint.z, true) <
                    Config.PointMarker.x) then
                    isInMarker = true
                    this_Garage = v
                    currentZone = 'aircraft_garage_point'
                end

                if (GetDistanceBetweenCoords(coords, v.DeletePoint.x, v.DeletePoint.y, v.DeletePoint.z, true) <
                    Config.DeleteMarker.x) then
                    isInMarker = true
                    this_Garage = v
                    currentZone = 'aircraft_store_point'
                end
            end

            for k, v in pairs(Config.AircraftPounds) do
                if (GetDistanceBetweenCoords(coords, v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z, true) <
                    Config.PoundMarker.x) then
                    isInMarker = true
                    this_Garage = v
                    currentZone = 'aircraft_pound_point'
                end
            end
        end

        if Config.UsePrivateCarGarages == true then
            -- Private Garages
            for k, v in pairs(Config.PrivateCarGarages) do
                if not v.Private or has_value(userProperties, v.Private) then
                    if IsPedInAnyVehicle(PlayerPedId()) then
                    else
                        if (GetDistanceBetweenCoords(coords, v.GaragePoint.x, v.GaragePoint.y, v.GaragePoint.z, true) <
                            Config.PointMarker.x) then
                            isInMarker = true
                            this_Garage = v
                            currentZone = 'car_garage_point'
                            currentGarage = k
                        end
                    end

                    if IsPedInAnyVehicle(PlayerPedId()) then
                        if (GetDistanceBetweenCoords(coords, v.DeletePoint.x, v.DeletePoint.y, v.DeletePoint.z, true) <
                            Config.DeleteMarker.x) then
                            isInMarker = true
                            this_Garage = v
                            currentZone = 'car_store_point'
                            currentGarage = k
                        end
                    end
                end
            end
        end

        if Config.UseJobCarGarages then
            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' then
                for k, v in pairs(Config.PolicePounds) do
                    if (GetDistanceBetweenCoords(coords, v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z, true) <
                        Config.JobPoundMarker.x) then
                        isInMarker = true
                        this_Garage = v
                        currentZone = 'policing_pound_point'
                    end
                end
            end

            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'ambulance' then
                for k, v in pairs(Config.AmbulancePounds) do
                    if (GetDistanceBetweenCoords(coords, v.PoundPoint.x, v.PoundPoint.y, v.PoundPoint.z, true) <
                        Config.JobPoundMarker.x) then
                        isInMarker = true
                        this_Garage = v
                        currentZone = 'ambulance_pound_point'
                    end
                end
            end
        end

        if isInMarker and not hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = true
            LastZone = currentZone
            TriggerEvent('urban_garage:hasEnteredMarker', currentZone)
        end

        if not isInMarker and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            TriggerEvent('urban_garage:hasExitedMarker', LastZone)
        end

        if not isInMarker then
            Citizen.Wait(500)
        end
    end
end)

-- Key Controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if CurrentAction ~= nil then
            ESX.ShowHelpNotification(CurrentActionMsg)

            if IsControlJustReleased(0, Keys['E']) then
                if CurrentAction == 'car_garage_point' then
                    OpenMenuGarage('car_garage_point')
                elseif CurrentAction == 'boat_garage_point' then
                    OpenMenuGarage('boat_garage_point')
                elseif CurrentAction == 'aircraft_garage_point' then
                    OpenMenuGarage('aircraft_garage_point')
                elseif CurrentAction == 'car_store_point' then
                    OpenMenuGarage('car_store_point')
                elseif CurrentAction == 'boat_store_point' then
                    OpenMenuGarage('boat_store_point')
                elseif CurrentAction == 'aircraft_store_point' then
                    OpenMenuGarage('aircraft_store_point')
                elseif CurrentAction == 'car_pound_point' then
                    OpenMenuGarage('car_pound_point')
                elseif CurrentAction == 'boat_pound_point' then
                    OpenMenuGarage('boat_pound_point')
                elseif CurrentAction == 'aircraft_pound_point' then
                    OpenMenuGarage('aircraft_pound_point')
                elseif CurrentAction == 'policing_pound_point' then
                    OpenMenuGarage('policing_pound_point')
                elseif CurrentAction == 'ambulance_pound_point' then
                    OpenMenuGarage('ambulance_pound_point')
                end

                CurrentAction = nil
            end
        else
            Citizen.Wait(500)
        end
    end
end)

-- Private Blips
function PrivateGarageBlips()
    for _, blip in pairs(privateBlips) do
        RemoveBlip(blip)
    end

    privateBlips = {}

    for zoneKey, zoneValues in pairs(Config.PrivateCarGarages) do
        if zoneValues.Private and has_value(userProperties, zoneValues.Private) then
            local blip = AddBlipForCoord(zoneValues.GaragePoint.x, zoneValues.GaragePoint.y, zoneValues.GaragePoint.z)
            SetBlipSprite(blip, Config.BlipGaragePrivate.Sprite)
            SetBlipDisplay(blip, Config.BlipGaragePrivate.Display)
            SetBlipScale(blip, Config.BlipGaragePrivate.Scale)
            SetBlipColour(blip, Config.BlipGaragePrivate.Color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(_U('blip_garage_private'))
            EndTextCommandSetBlipName(blip)
        end
    end
end

function deleteBlips()
    if JobBlips[1] ~= nil then
        for i = 1, #JobBlips, 1 do
            RemoveBlip(JobBlips[i])
            JobBlips[i] = nil
        end
    end
end

function refreshBlips()
    local blipList = {}
    local JobBlips = {}

    if Config.UseCarGarages then
        for k, v in pairs(Config.CarGarages) do
            table.insert(blipList, {
                coords = {v.GaragePoint.x, v.GaragePoint.y},
                text = _U('blip_garage'),
                sprite = Config.BlipGarage.Sprite,
                color = Config.BlipGarage.Color,
                scale = Config.BlipGarage.Scale
            })
        end

        for k, v in pairs(Config.CarPounds) do
            table.insert(blipList, {
                coords = {v.PoundPoint.x, v.PoundPoint.y},
                text = _U('blip_pound'),
                sprite = Config.BlipPound.Sprite,
                color = Config.BlipPound.Color,
                scale = Config.BlipPound.Scale
            })
        end
    end

    if Config.UseBoatGarages then
        for k, v in pairs(Config.BoatGarages) do
            table.insert(blipList, {
                coords = {v.GaragePoint.x, v.GaragePoint.y},
                text = _U('blip_garage'),
                sprite = Config.BlipGarage.Sprite,
                color = Config.BlipGarage.Color,
                scale = Config.BlipGarage.Scale
            })
        end

        for k, v in pairs(Config.BoatPounds) do
            table.insert(blipList, {
                coords = {v.PoundPoint.x, v.PoundPoint.y},
                text = _U('blip_pound'),
                sprite = Config.BlipPound.Sprite,
                color = Config.BlipPound.Color,
                scale = Config.BlipPound.Scale
            })
        end
    end

    if Config.UseAircraftGarages then
        for k, v in pairs(Config.AircraftGarages) do
            table.insert(blipList, {
                coords = {v.GaragePoint.x, v.GaragePoint.y},
                text = _U('blip_garage'),
                sprite = Config.BlipGarage.Sprite,
                color = Config.BlipGarage.Color,
                scale = Config.BlipGarage.Scale
            })
        end

        for k, v in pairs(Config.AircraftPounds) do
            table.insert(blipList, {
                coords = {v.PoundPoint.x, v.PoundPoint.y},
                text = _U('blip_pound'),
                sprite = Config.BlipPound.Sprite,
                color = Config.BlipPound.Color,
                scale = Config.BlipPound.Scale
            })
        end
    end

    if Config.UseJobCarGarages then
        if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' then
            for k, v in pairs(Config.PolicePounds) do
                table.insert(JobBlips, {
                    coords = {v.PoundPoint.x, v.PoundPoint.y},
                    text = _U('blip_police_pound'),
                    sprite = Config.BlipJobPound.Sprite,
                    color = Config.BlipJobPound.Color,
                    scale = Config.BlipJobPound.Scale
                })
            end
        end

        if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'ambulance' then
            for k, v in pairs(Config.AmbulancePounds) do
                table.insert(JobBlips, {
                    coords = {v.PoundPoint.x, v.PoundPoint.y},
                    text = _U('blip_ambulance_pound'),
                    sprite = Config.BlipJobPound.Sprite,
                    color = Config.BlipJobPound.Color,
                    scale = Config.BlipJobPound.Scale
                })
            end
        end
    end

    for i = 1, #blipList, 1 do
        CreateBlip(blipList[i].coords, blipList[i].text, blipList[i].sprite, blipList[i].color, blipList[i].scale)
    end

    for i = 1, #JobBlips, 1 do
        CreateBlip(JobBlips[i].coords, JobBlips[i].text, JobBlips[i].sprite, JobBlips[i].color, JobBlips[i].scale)
    end
end

function CreateBlip(coords, text, sprite, color, scale)
    local blip = AddBlipForCoord(table.unpack(coords))

    SetBlipSprite(blip, sprite)
    SetBlipScale(blip, scale)
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandSetBlipName(blip)
    table.insert(JobBlips, blip)
end

--- nama label
Citizen.CreateThread(function()
      AddTextEntry('nh2r', 'Ninja H2R')
    AddTextEntry('corvetteZR1', 'corvette ZR1')
    AddTextEntry('750li', 'BMW 750li')
    AddTextEntry('r6', 'Yamaha R6')
    AddTextEntry('viper', 'Dodge Ram')
    AddTextEntry('m4lb', 'M4 LibertyWalk')
    AddTextEntry('subwrx', 'Subaru WRX STI 2004')
    AddTextEntry('velociraptor', 'Velociraptor 6x6')
    AddTextEntry('gs1', 'BMW 1200gs')
    AddTextEntry('scrap', 'Truk Cabe')
    AddTextEntry('benson', 'Truk Kayu')
    AddTextEntry('nissantitan', 'Nissan Titan Warrior 2017')
    AddTextEntry('gtr', 'Nissan GTR')
    AddTextEntry('czr2', 'Chevrolet ZR2')
    AddTextEntry('cbrrr', 'CBR 1000RR')
    AddTextEntry('r8ppiS', 'Audi R8')
    AddTextEntry('evo9mr', 'EVO IX MR')
    AddTextEntry('pd dirtbike', 'Sanchez Polisi')
    AddTextEntry('amggts2016', 'AMG GTS')
    AddTextEntry('zl12017', 'Camaro ZL1')
    AddTextEntry('ursa', 'Porsche Macan')
    AddTextEntry('16challenger', 'Dodge Challenger')
    AddTextEntry('policet', 'Ambulance Van')
    AddTextEntry('tritonpolisi', 'Mitsubishi Triton')
    AddTextEntry('vapidpolisi', 'SUV Polisi')
    AddTextEntry('silveradopolisi', 'Silverado Police')
    AddTextEntry('hiluxpolisi', 'Toyota Hilux')
    AddTextEntry('pol_gs1200', 'BMW GS Police')
    AddTextEntry('menswat', 'SWAT Police')
    AddTextEntry('riot', 'RIOT Police')
    AddTextEntry('PBus', 'BUS Police')
    AddTextEntry('code3bmw', 'Bike Police')
    AddTextEntry('code3cap', 'Cap')
    AddTextEntry('code3durango', 'Durango Police')
    AddTextEntry('code3cvpi', 'Cvpi Police')
    AddTextEntry('code3camero', 'Camaro Police')
    AddTextEntry('polmp4', 'Police')
    AddTextEntry('pol718', 'Porce Police')
    AddTextEntry('fib2', 'Mobil Jendral')
    AddTextEntry('x6m', 'BMW X6M F16')
    AddTextEntry('m3f80', 'BMW M3 F80')
    AddTextEntry('m939', 'Truk Tahanan')
    AddTextEntry('firetruk', 'Water Cannon')
    AddTextEntry('policeold1', 'Mobil Jendral')
    AddTextEntry('rmodveneno', 'Lambo Veneno')
    AddTextEntry('skyline', 'Nissan Skyline')
    AddTextEntry('stelvio', 'Alfaromeo')
    AddTextEntry('subwrx', 'Subaru WRX STI')
    AddTextEntry('yzfr6', 'Yamaha R6')
    AddTextEntry('warframe', 'Warmachine')
    AddTextEntry('m3gtr', 'BMW M3 GTR')
    AddTextEntry('ems_dirtbike', 'Sanchez EMS')
    AddTextEntry('feltzer2', 'Toyota Supra')
    AddTextEntry('triton', 'Triton')
    AddTextEntry('manchez', 'BMW R1200GS')
    AddTextEntry('AFRICAT', 'Africa Twin')
    AddTextEntry('sheriff', 'Evo Sabhara')
    AddTextEntry('pranger', 'Ford Ranger')
    AddTextEntry('police2', 'Police SUV')
    AddTextEntry('cavalcade', 'Pajero')
    AddTextEntry('NMAX155', 'Nmax')
    AddTextEntry('ram16', 'Dodge Ram')
    AddTextEntry('fnfmk4', '1995 Toyota Supra MK IV')
    AddTextEntry('2f2fmk4', '1995 Toyota Supra MK IV')
    AddTextEntry('4c', 'Alfaromeo')
    AddTextEntry('i8', 'BMW I8')
    AddTextEntry('bme6tun', 'BMW M5')
    AddTextEntry('rmodmi8', 'BMW I8 Roadster')
    AddTextEntry('m3e46', 'BMW M3 Mostwanted')
    AddTextEntry('rmodm4', 'BMW M4 Rajiin')
    AddTextEntry('mansm8', 'BMW M8')
    AddTextEntry('divo', 'Bugatti Divo')
    AddTextEntry('develsix', 'Devel Six Sportcar')
    AddTextEntry('chargerf8', 'Dodge Charge FF8')
    AddTextEntry('monza', 'Ferrari Monza')
    AddTextEntry('pistas', 'Ferrari Pistas')
    AddTextEntry('rmodmustang', 'Ford Mustang GT')
    AddTextEntry('raptor2017', 'Ford Velociraptor 6x6')
    AddTextEntry('f248', 'Formula 1')
    AddTextEntry('fk8', 'Honda Civic Type R')
    AddTextEntry('nc1', 'Honda NSX (NC1)')
    AddTextEntry('jeep2012', 'Jeep Wrangler')
    AddTextEntry('acsr', 'Koenigsegg')
    AddTextEntry('caracarase', 'CHIRON OFFROAD PRZEMO')
    AddTextEntry('defenderoffp', 'Land Rover PRZEMO')
    AddTextEntry('m135iwb', 'PRZEMO M315i M2')
    AddTextEntry('zentenario', 'Lamborghini Centenario')
    AddTextEntry('18performante', 'Lamborghini Huracan')
    AddTextEntry('lwhuracan', 'Lamborghini Huracan Libertywalk')
    AddTextEntry('lamtmc', 'Lamborghini Terzo Millenio')
    AddTextEntry('lwhuracan', 'Lamborghini Huracan Libertywalk')
    AddTextEntry('a80', 'Toyota Supra')
    AddTextEntry('mxpan', 'Mazda MX5')
    AddTextEntry('rmodmi8lb', 'BMW I8 Roadster LB')
    AddTextEntry('650s', 'McLarren 650s')
    AddTextEntry('fnf4r34', 'Nissan skyline GTR R34')
    AddTextEntry('p1', 'McLarren P1')
    AddTextEntry('p1gtr', 'McLarren P1 GTR')
    AddTextEntry('senna', 'McLarren Senna')
    AddTextEntry('xxxxx', 'Mercedes-Benz 6x6')
    AddTextEntry('ie', 'Apollo Intenza')
    AddTextEntry('rmodgt63', 'Mercedes-Benz AMG Coupe')
    AddTextEntry('amggts2016', 'Mercedes-Benz AMG GTS')
    AddTextEntry('amggtc', 'Mercedes-Benz AMG Roasted')
    AddTextEntry('c63', 'Mercedes-Benz C63')
    AddTextEntry('mvisiongt', 'Mercedes-Benz Vision GT')
    AddTextEntry('r35', 'Nissan GTR R35')
    AddTextEntry('pgt3', 'Porsche 911')
    AddTextEntry('911rwb', 'Porsche 911 RWB')
    AddTextEntry('silvia3', 'Silvia')
    AddTextEntry('slingshot', 'Slingshot Roda 3')
    AddTextEntry('polaventa', 'Lamborghini Aventador')
    AddTextEntry('supraa90', 'Supra 2019 ')
    AddTextEntry('teslax', 'Tesla')
    AddTextEntry('hilux1', 'Toyota Hilux')
    AddTextEntry('cara', 'Vapid Cara')
    AddTextEntry('ts1', 'Zenvo TS1')
    AddTextEntry('rninemc', 'BMW R9')
    AddTextEntry('rnine', 'BMW R nine')
    AddTextEntry('s1000rr', 'BMW S1000RR')
    AddTextEntry('dragbike', 'Dragbike')
    AddTextEntry('dm1200', 'Ducati')
    AddTextEntry('f131', 'Harley Hellcat')
    AddTextEntry('hvrod', 'Harley V Rod')
    AddTextEntry('h2carb', 'Kawasaki Ninja H2R')
    AddTextEntry('r1', 'Yamaha R1')
    AddTextEntry('r1m', 'Yamaha R1M')
    AddTextEntry('rxking', 'Yamaha RxKing')
    AddTextEntry('warframe', 'Warmachine Esskey')
    AddTextEntry('1500dj', 'Chevrolet Silverado')
    AddTextEntry('450crf', 'Honda CRF 450')
    AddTextEntry('720s', 'Mclaren 720S')
    AddTextEntry('Akuma', 'Akuma')
    AddTextEntry('Wraith', 'Rolls Royce wraith')
    AddTextEntry('rrst', 'Range Rover')
    AddTextEntry('a8lw12', 'Audi A8L W12')
    AddTextEntry('aaq4', 'Audi A4')
    AddTextEntry('adder', 'Adder')
    AddTextEntry('africat', 'Africa Twin')
    AddTextEntry('asea', 'Asea')
    AddTextEntry('autarch', 'Autarch')
    AddTextEntry('avarus', 'Avarus')
    AddTextEntry('bagger', 'Bagger')
    AddTextEntry('baller', 'Baller')
    AddTextEntry('baller3', 'Baller Sport')
    AddTextEntry('banshee2', 'Banshee')
    AddTextEntry('r8v10abt', 'Audi R8 V10')
    AddTextEntry('bati', 'Bati 801')
    AddTextEntry('bati2', 'Batti 801RR')
    AddTextEntry('bbentayga', 'Bently Bentayaga')
    AddTextEntry('bf400', 'BF400')
    AddTextEntry('bifta', 'Bifta')
    AddTextEntry('blade', 'Blade')
    AddTextEntry('blis2gpr', 'Rally')
    AddTextEntry('blista', 'CIVICEG6')
    AddTextEntry('bmci', 'BMW M5F90')
    AddTextEntry('bmws', 'BMW S1000')
    AddTextEntry('brera', 'Alfa Romeo Brera')
    AddTextEntry('bs17', 'BMW R1000')
    AddTextEntry('bmx', 'BMX (velo)')
    AddTextEntry('brioso', 'Brioso R/A')
    AddTextEntry('btype', 'Btype')
    AddTextEntry('btype2', 'Btype Hotroad')
    AddTextEntry('btype3', 'Btype Luxe')
    AddTextEntry('buccaneer', 'Buccaneer')
    AddTextEntry('buccaneer2', 'Buccaneer Rider')
    AddTextEntry('bullet', 'Bullet')
    AddTextEntry('burrito', 'Burrito')
    AddTextEntry('cam8tun', 'Toyota Camry XSE')
    AddTextEntry('dodgesamu', 'Samu EMS')
    AddTextEntry('carbonrs', 'Carbon RS')
    AddTextEntry('casco', 'casco')
    AddTextEntry('cbb', 'Honda CB1000R')
    AddTextEntry('cbrrr', 'CBR 1000RR')
    AddTextEntry('hcbr17', 'Honda CBR 1000RR')
    AddTextEntry('lp770r', 'Lamborghini Centenario')
    AddTextEntry('checol17', 'Chevrolet col17')
    AddTextEntry('chimera', 'Chimera')
    AddTextEntry('chino', 'Chino')
    AddTextEntry('chino2', 'Chino Luxe')
    AddTextEntry('cliffhanger', 'Cliffhanger')
    AddTextEntry('cognoscenti', 'Cognoscenti')
    AddTextEntry('cooperworks', 'Mini Copper')
    AddTextEntry('coquette2', 'Velside')
    AddTextEntry('cruiser', 'Cruiser (velo)')
    AddTextEntry('czl1', 'Camaro')
    AddTextEntry('czr1', 'Corvet ZR1')
    AddTextEntry('giulia', 'Alfa Romeo Guilia')
    AddTextEntry('daemon', 'Daemon')
    AddTextEntry('defiler', 'Defiler')
    AddTextEntry('demonhawk', 'Demon Hawk')
    AddTextEntry('hdwrecker', 'Mobil Derek')
    AddTextEntry('dominator', 'Dominator')
    AddTextEntry('dominator3', 'Dominator GTX')
    AddTextEntry('double', 'Double T')
    AddTextEntry('dubsta2', 'Dubsta Luxuary')
    AddTextEntry('dubsta3', 'Dubsta 6x6')
    AddTextEntry('dukes', 'Dukes')
    AddTextEntry('e89', 'BMW Z4')
    AddTextEntry('e92lb', 'BMW M3 Libertywalk')
    AddTextEntry('emperor', 'Emperor')
    AddTextEntry('enduro', 'Enduro')
    AddTextEntry('esskey', 'Esskey')
    AddTextEntry('evo9', 'Mitsubishi Lancer EVO 9')
    AddTextEntry('f131', 'Harley Hellcat')
    AddTextEntry('faction2', 'Faction Rider')
    AddTextEntry('faggio', 'Faggio')
    AddTextEntry('faggio2', 'Vespa')
    AddTextEntry('faggio3', 'Vespa Super')
    AddTextEntry('fc3s', 'RX7 FC3S')
    AddTextEntry('focusrs', 'Ford Focus RS')
    AddTextEntry('ferrari812', 'Ferrari 812')
    AddTextEntry('flhxs_streetglide_special18', 'Harley Davidson')
    AddTextEntry('fmgt', 'Mustang GT')
    AddTextEntry('fxxk16', 'Ferrari XXK16')
    AddTextEntry('18mustang', '2014 Dodge Charger')
    AddTextEntry('g63amg6x6', 'Mercedes AMG 6x6')
    AddTextEntry('g63amg6x6cop', 'Mercedes AMG 6x6 POLISI')
    AddTextEntry('g65amg', 'Mercedes AMG G65')
    AddTextEntry('gargoyle', 'Gargoyle')
    AddTextEntry('goldwing', 'Honda Goldwing')
    AddTextEntry('granlb', 'Maserati Libertywalk')
    AddTextEntry('gresley', 'Gresley')
    AddTextEntry('guardian', 'Guardian')
    AddTextEntry('hayabusa', 'Suzuki Hayabuss')
    AddTextEntry('hakuchou', 'Hakuchou')
    AddTextEntry('hermes', 'Hermes')
    AddTextEntry('hexer', 'Hexer')
    AddTextEntry('hfc250', 'Bull 250cc Motocross')
    AddTextEntry('hiluxarctic', 'Hilux Xartic')
    AddTextEntry('hotknife', 'Hotknife')
    AddTextEntry('hustler', 'Husttler')
    AddTextEntry('hvrod', 'Harley Vrod')
    AddTextEntry('innovation', 'Innovation')
    AddTextEntry('issi', 'Issi')
    AddTextEntry('issi3', 'Mini Classik')
    AddTextEntry('italia458', 'Ferrari Italia 458')
    AddTextEntry('italigtb2', 'Itali GTB')
    AddTextEntry('jester', 'Jester')
    AddTextEntry('kamacho', 'Kamacho')
    AddTextEntry('ktmtrr', 'KTM Trail')
    AddTextEntry('kx450f', 'Kawazaki Trail')
    AddTextEntry('laferrari15', 'Ferrari Laferrari15')
    AddTextEntry('lancerevox', 'Mitsubishi Lancer EVO X')
    AddTextEntry('lp700r', 'Lamborghini Aventador')
    AddTextEntry('lw458s', 'Italia 458 LibertyWalk')
    AddTextEntry('lykan', 'Lykan HyperSport')
    AddTextEntry('m4f82', 'BMW M4 F82')
    AddTextEntry('m6f13', 'BMW M6 F13')
    AddTextEntry('e34', 'BMW E34')
    AddTextEntry('rm3e36', 'BMW E36')
    AddTextEntry('maj350', 'Nissan 350Z')
    AddTextEntry('manchez', 'Triumph Tiger')
    AddTextEntry('mesa', 'Mesa')
    AddTextEntry('mesa3', 'Mesa Trail')
    AddTextEntry('mlbrabus', 'Mercy SUV')
    AddTextEntry('mlmansory', 'Maserati Mansory')
    AddTextEntry('mlnovitec', 'Maserati Novitec')
    AddTextEntry('neon', 'Neon')
    AddTextEntry('nightblade', 'Nightblade')
    AddTextEntry('nissantitan17', 'Nissan Titan Warrior 2017')
    AddTextEntry('panto', 'Panto')
    AddTextEntry('patriot', 'Patriot')
    AddTextEntry('pcj', 'PCJ 600')
    AddTextEntry('pentrogpr', 'Pentro')
    AddTextEntry('pentro', 'Pentro')
    AddTextEntry('primo2', 'Primo Custom')
    AddTextEntry('prototipo', 'X80 Proto')
    AddTextEntry('r8ppi', 'Audi R8')
    AddTextEntry('rapidgt3', 'Rapid GT')
    AddTextEntry('reaper', 'Reaper')
    AddTextEntry('rebel2', 'Rebel')
    AddTextEntry('regina', 'Regina')
    AddTextEntry('riata', 'Rianata')
    AddTextEntry('rmodm4gts', 'BMW M4 GTS')
    AddTextEntry('rs318', 'Audi RS 3')
    AddTextEntry('rs5', 'Audi RS 5')
    AddTextEntry('rs62', 'Audi RS6')
    AddTextEntry('rs7', 'Audi RS7')
    AddTextEntry('rubi3d', 'Rubicon')
    AddTextEntry('rumpo3', 'Rumpo Trail')
    AddTextEntry('sabregt2', 'Sabre GT')
    AddTextEntry('sanchez', 'Sanchez')
    AddTextEntry('sanchez2', 'Sanchez Sport')
    AddTextEntry('sanctus', 'Sanctus')
    AddTextEntry('sandking', 'Sandking')
    AddTextEntry('schafter2', 'Schafter')
    AddTextEntry('sel600', 'Mercedes Benz W140')
    AddTextEntry('shotaro', 'Shotaro Concept')
    AddTextEntry('slamvan3', 'Slamvan')
    AddTextEntry('sovereign', 'Sovereign')
    AddTextEntry('srmz2', 'Suzuki Trail')
    AddTextEntry('stretch', 'Stretch')
    AddTextEntry('sultanrs', 'Sultan RS')
    AddTextEntry('superd', 'Super Diamond')
    AddTextEntry('surano', 'Surano')
    AddTextEntry('t20', 'T20')
    AddTextEntry('taco', 'Taco Van')
    AddTextEntry('tahoe', 'Chevy Tahoe')
    AddTextEntry('tampa', 'Tampa')
    AddTextEntry('techart17', 'Porsche 4 sit')
    AddTextEntry('tmax', 'Yamaha Nmax')
    AddTextEntry('trophytruck', 'Trpohy Truck')
    AddTextEntry('trophytruck2', 'Trophy Truck limited')
    AddTextEntry('tyrus', 'Tyrus')
    AddTextEntry('urus', 'Lamborghini Urus')
    AddTextEntry('v250', 'Mercy fan v250')
    AddTextEntry('veneno', 'Lamborghini Veneno')
    AddTextEntry('vigero', 'Vigero')
    AddTextEntry('vip8', 'Dodge Viper')
    AddTextEntry('visione', 'Visione')
    AddTextEntry('voodoo', 'Voodoo')
    AddTextEntry('vortex', 'Vortex')
    AddTextEntry('windsor2', 'Windsor Drop')
    AddTextEntry('wolfsbane', 'Woflsbane')
    AddTextEntry('x6m', 'BMW X6')
    AddTextEntry('xls', 'XLS')
    AddTextEntry('yosemite', 'Yosemite')
    AddTextEntry('yosemite6str', 'Yosemite')
    AddTextEntry('filthynsx', 'Libertywalk Akura NSX')
    AddTextEntry('yoseking', 'Yosemite King Offroad')
    AddTextEntry('hbros', 'Honda Croos')
    AddTextEntry('blazer', ' Blazer ATV')
    AddTextEntry('polmav', ' Helicopter Dinas')
    AddTextEntry('yzfr6', 'Yamaha R6')
    AddTextEntry('zenterno', 'Zenterno')
    AddTextEntry('zentorno', 'Zentorno')
    AddTextEntry('zombiea', 'Zombie')
    AddTextEntry('zombieb', 'Zombie Luxuary')
    AddTextEntry('ztype', 'Z-Type')
    AddTextEntry('zx10r', 'Kawazaki Ninja ZX10 R')
    AddTextEntry('pm19', 'Porche Macan 2019')
    AddTextEntry('macan', 'Porsche Macan 2016')
    AddTextEntry('bmwsr', 'BMW Sr Motorcyle')
    AddTextEntry('f150', 'Raptor 4X4')
    AddTextEntry('ldsv', 'Lamborghini Diabo SV')
    AddTextEntry('supra2', 'Toyota Supra')
    AddTextEntry('rmodsian', 'Lamborghini Sian FKP37')
    AddTextEntry('tulenis', 'Nissan Patrol')
    AddTextEntry('zach375', 'Mobil Kapsul')
    AddTextEntry('rmodskyline34', 'Skyline Premium')
    AddTextEntry('aperta', 'Ferrari Aperta')
    AddTextEntry('lp610', 'Lamborghini Huracan')
    AddTextEntry('2f2fgts', 'Mitsubishi Eclipse Spyder GTS')
    AddTextEntry('fnflan', 'Mitsubishi Lancer Evolution IX')
    AddTextEntry('ff4wrx', 'Subaru Impreza WRX STi GH')
    AddTextEntry('2f2fmle7', '2006 Mitsubishi Lancer Evolution IX')
    AddTextEntry('2f2fgtr34', '1999 Nissan Skyline GT-R 34')
    AddTextEntry('fnfrx7', '1997 Mazda RX-7')
    AddTextEntry('fnfmits', '1995 Mitsubishi Eclipse')
	AddTextEntry('mercxclass', 'Mercedes 4x4 Tooson')
    AddTextEntry('polalamop', 'Mobil Dinas 1')
    AddTextEntry('polbuffalop', 'Mobil Dinas 2')
    AddTextEntry('polroamerp', 'Mobil Dinas 3')
	AddTextEntry('polstalkerp', 'Mobil Dinas 4')
    AddTextEntry('rmoddarki82', 'BMW EVO I8 DarkKnight')
    AddTextEntry('rmodsianr', 'Lamborghini Sian Roadster')
    AddTextEntry('rmodc63amg', 'Mercedes-AMG C63S Coupe ')
    AddTextEntry('amggt63cage', 'Mercedes-GT63S-PoliceUnit')
    AddTextEntry('rmod240sx', 'Nissan 240sx Rocket Bunny')
    AddTextEntry('rmodg65', 'Mercedes-Benz G65 AMG')
    AddTextEntry('rmodlfa', 'Lexus LFA')
    AddTextEntry('rmodsuprapandem', 'ToyotaGR Supra Rocket Bunny')
    AddTextEntry('rmodmonsterr34', 'Nissan SkylineR34 Monster')
    AddTextEntry('rmodz350pandem', 'Nissan 350Z Pandem Rocket Bunny')
    AddTextEntry('rmodi8ks', 'BMW i8 Coupe K.S Edition')
    AddTextEntry('rmodlp670', 'Lamborghini Murciélago')
    AddTextEntry('rmodtracktor', 'Top Gear Track-Tor')
    AddTextEntry('rmodbolide', 'Bugatti Bolide')
    AddTextEntry('rmodlego3', 'LEGO Mini Cooper')
    AddTextEntry('rmodjeep', 'Jeep Grand Cherokee')
    AddTextEntry('rmodgtr50', 'Nissan GT-R50 Premium')
    AddTextEntry('hog', 'AMG Transport M12S Warthog CST')
    AddTextEntry('pgt3', 'Porsche 911 GT3 RS')
    AddTextEntry('models', 'Tesla Model S')
    AddTextEntry('pgt3', 'Porsche 911 GT3 RS')
    AddTextEntry('gtam21', 'Alfaromero Urban')
    AddTextEntry('buffalo2', 'WRX URBAN')
    AddTextEntry('bmwm8', 'BMW M8')
    AddTextEntry('hugoc8', 'Corvette C8 Roadster')
	AddTextEntry('nlargo', 'Ferrari F12 N-Largo')
    AddTextEntry('600lt', 'Mclaren 600 LT')
    AddTextEntry('r35kream', 'Nissan R35 Fuki')
    AddTextEntry('rrst', 'Range Rover Vogue Startech')
    AddTextEntry('rmod918spyder', 'Porsche 918 Spyder')
    AddTextEntry('camry18', 'Toyota Camry XSE')
	AddTextEntry('cls2015', 'Mercedes-Benz CLS 6.3 AMG')
    AddTextEntry('rmodcamaro', 'Camaro ZL1')
    AddTextEntry('rmodcharger69', 'Dodge Charger RT69')
    AddTextEntry('19raptor', 'FORD RAPTOR F190 PREMIUM')
    AddTextEntry('2019chiron', 'Chiron')
    AddTextEntry('440i', 'BMW 440i')
    AddTextEntry('raptor150', 'RAPTOR 150')
    AddTextEntry('m4lb', 'M4 LibertyWalk')
    AddTextEntry('rs6avant20', 'AUDI RS6 C8')
    AddTextEntry('lp770', 'LAMBORGHINI CENTENARIO')
    AddTextEntry('m8gte', 'BMW M8 GTE')
    AddTextEntry('brz13lbwalk', 'Liberty Walk BRZ')
    AddTextEntry('4runner', 'Toyota 4Runner')
    AddTextEntry('rx450h', 'Lexus rx450h')
    AddTextEntry('nismo20', 'Nissan Gtr Nismo')
    AddTextEntry('jeepg', 'Jeep Rubicon')
    AddTextEntry('jes', 'Jessco')
    AddTextEntry('2017chiron', 'Chiron')
    AddTextEntry('rrwald', 'Rolls Royce')
    AddTextEntry('terzo', 'Lamborghini Terzo Millennio')
    AddTextEntry('modena', 'Ferrari modena')
    AddTextEntry('z4bmw', 'BMW Z4')
    AddTextEntry('zx10', 'Kawasaki Ninja ZX10 R 2014')
    AddTextEntry('modena', 'Ferrari modena')
    AddTextEntry('daytona', 'Triumph Daytona 675')
    AddTextEntry('cls2015', 'Mercedes-Benz CLS 6.3 AMG')
    AddTextEntry('mi8', 'BMW I8 Coupe MANSAUG')
    AddTextEntry('rmodsuprapandem', 'BMW Supra GR')
    AddTextEntry('czr2', 'Chevrolet Colorado ZR2')
	AddTextEntry('foxct', 'Tesla Cyber Truck')
	AddTextEntry('foxcq', 'Tesla Cyber ATV')
	AddTextEntry('rx7veilside', 'Mazda RX7 Veilside Fortune')
	AddTextEntry('osirisr', 'Pegassi Osiris Roadster')
	AddTextEntry('mercxclass', 'Mercedes 4x4 TimSar')
    AddTextEntry('rx7rb', 'Rx7 Rocketbunny')
    AddTextEntry('centuria', 'Bugati Centuria')
    AddTextEntry('19ramoffroad', '19 RAM Offroad')
    AddTextEntry('mcjcw20', 'Mini John Cooper GP')
    AddTextEntry('modena', 'Ferrari Modena')
    AddTextEntry('cbr500r', 'CBR 500R')
    AddTextEntry('p7', 'Jaguar Project-7')
    AddTextEntry('a6tfsi', 'AUDI A6')
    AddTextEntry('na1', 'Honda NSX-R')
    AddTextEntry('fd', 'Mazda RX7 Spirit R')
    AddTextEntry('sunrise1', 'Maibatzu Sunrises')
    AddTextEntry('amgbs', 'AMG GT Black Series')
    AddTextEntry('m6f06', 'BMW M6 Gran Coupe')
    AddTextEntry('code3durango', 'Durango Police')
    AddTextEntry('pol_gs1200', 'BMW Gs Police')
    AddTextEntry('gxg63', 'G63 AMG')
    AddTextEntry('rmodf40', 'Ferrari F40')
    AddTextEntry('gxg63', 'G63 AMG')
    AddTextEntry('rmodf40', 'Ferrari F40')
    AddTextEntry('jazz', 'Honda Jazz')
    AddTextEntry('wildtrak', 'Ford Bronco Wildtrak')
    AddTextEntry('deberti ', 'Ford Raptor Deberti')
    AddTextEntry('amggtr2', 'Amg Gtr')
    AddTextEntry('crownbp ', 'Toyota Crown Athelete')
    AddTextEntry('wrx', 'Subaru WRX STi HR v1')
    AddTextEntry('gt86', 'Toyota 86')
    AddTextEntry('czr2', 'Chevrolet Colorado ZR2')
    AddTextEntry('458', 'Ferrari 458 Italia')
    AddTextEntry('RC350S', 'Rexus 350')
	AddTextEntry('scijo', 'Volkswagen')
   AddTextEntry('a8lw12 ', 'Audi A8 Quattro')
    AddTextEntry('bmwm8', 'BMW M8')
    AddTextEntry('fpacehm', 'Jaguar F-pace')
    AddTextEntry('mlnovitec', 'Maserati Levante Novitec')
    AddTextEntry('saltflat', 'Maxwell Saltflat 600')
    AddTextEntry('kampfer', 'Ubermacht Kampfer')
	AddTextEntry('btsupra94', 'Supra Fast and Furious')
	AddTextEntry('polcarap', 'Police 4x4')
	AddTextEntry('polfugitivep', 'Sedan Police')
	AddTextEntry('polgresleyp', 'SUV Traffic Patrol')
	AddTextEntry('polroamerp', 'SUV Sherrif')
	AddTextEntry('polscoutp', 'SUV Police City')
	AddTextEntry('poltorencep', 'Sedan Traffic Patrol')
	AddTextEntry('polstanierp', 'Sedan Sherrif')
end)
