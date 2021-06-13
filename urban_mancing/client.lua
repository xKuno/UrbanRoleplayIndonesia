ESX = nil
Citizen.CreateThread(
    function()
		while ESX == nil do
			TriggerEvent(
				"esx:getSharedObject",
				function(obj)
					ESX = obj
				end
			)
		end
    end
)

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

local fishing = false
local lastInput = 0
local pause = false
local pausetimer = 0
local correct = 0

local bait = "none"

local blip = AddBlipForCoord(Config.SellFish.x, Config.SellFish.y, Config.SellFish.z)

SetBlipSprite(blip, 356)
SetBlipDisplay(blip, 4)
SetBlipScale(blip, 1.1)
SetBlipColour(blip, 17)
SetBlipAsShortRange(blip, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Penjualan Ikan Umum")
EndTextCommandSetBlipName(blip)

local blip2 = AddBlipForCoord(Config.SellTurtle.x, Config.SellTurtle.y, Config.SellTurtle.z)

SetBlipSprite(blip2, 68)
SetBlipDisplay(blip2, 4)
SetBlipScale(blip2, 0.9)
SetBlipColour(blip2, 49)
SetBlipAsShortRange(blip2, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Penjualan Daging Penyu")
EndTextCommandSetBlipName(blip2)

local blip3 = AddBlipForCoord(Config.SellShark.x, Config.SellShark.y, Config.SellShark.z)

SetBlipSprite(blip3, 68)
SetBlipDisplay(blip3, 4)
SetBlipScale(blip3, 0.9)
SetBlipColour(blip3, 49)
SetBlipAsShortRange(blip3, true)
BeginTextCommandSetBlipName("STRING")
AddTextComponentString("Penjualan Daging Hiu")
EndTextCommandSetBlipName(blip3)

for _, info in pairs(Config.MarkerZones) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, 455)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 1.0)
    SetBlipColour(info.blip, 20)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Penyewaan Kapal")
    EndTextCommandSetBlipName(info.blip)
end

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            for k in pairs(Config.MarkerZones) do
                DrawMarker(
                    1,
                    Config.MarkerZones[k].x,
                    Config.MarkerZones[k].y,
                    Config.MarkerZones[k].z,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    3.0,
                    3.0,
                    1.0,
                    0,
                    150,
                    150,
                    100,
                    0,
                    0,
                    0,
                    0
                )
            end
        end
    end
)

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(5)
            local playerCoords = GetEntityCoords(PlayerPedId())
            local letSleep = true
            for k in pairs(Config.hapuskapal) do
                local distance =
                    GetDistanceBetweenCoords(
                    playerCoords,
                    Config.hapuskapal[k].x,
                    Config.hapuskapal[k].y,
                    Config.hapuskapal[k].z,
                    true
                )
                if distance <= 10 then
                    DrawMarker(
                        1,
                        Config.hapuskapal[k].x,
                        Config.hapuskapal[k].y,
                        Config.hapuskapal[k].z,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        0.0,
                        20.0,
                        20.0,
                        3.0,
                        255,
                        0,
                        0,
                        100,
                        0,
                        0,
                        0,
                        0
                    )
                    letSleep = false
                end
            end
            if letSleep then
                Citizen.Wait(1000)
            end
        end
    end
)

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
Citizen.CreateThread(
    function()
        while true do
            Wait(600)
            if pause and fishing then
                pausetimer = pausetimer + 1
            end
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            Wait(5)
            if fishing then
                if IsControlJustReleased(0, Keys["1"]) then
                    input = 1
                end
                if IsControlJustReleased(0, Keys["2"]) then
                    input = 2
                end
                if IsControlJustReleased(0, Keys["3"]) then
                    input = 3
                end
                if IsControlJustReleased(0, Keys["4"]) then
                    input = 4
                end
                if IsControlJustReleased(0, Keys["5"]) then
                    input = 5
                end
                if IsControlJustReleased(0, Keys["6"]) then
                    input = 6
                end
                if IsControlJustReleased(0, Keys["7"]) then
                    input = 7
                end
                if IsControlJustReleased(0, Keys["8"]) then
                    input = 8
                end

                if IsControlJustReleased(0, Keys["X"]) then
                    fishing = false
                    ESX.ShowNotification("~r~Berhenti Memancing")
                end
                if fishing then
                    playerPed = PlayerPedId()
                    local pos = GetEntityCoords(PlayerPedId())
                    if
                        pos.y >= 7700 or pos.y <= -4000 or pos.x <= -3700 or pos.x >= 4300 or
                            IsPedInAnyVehicle(PlayerPedId())
                     then
                    else
                        fishing = false
                        ESX.ShowNotification("~r~Berhenti Memancing")
                    end
                    if IsEntityDead(playerPed) or IsEntityInWater(playerPed) then
                        ESX.ShowNotification("~r~Berhenti Memancing")
                    end
                end

                if pausetimer > 3 then
                    input = 99
                end

                if pause and input ~= 0 then
                    pause = false
                    if input == correct then
                        TriggerServerEvent("fishing:catch", bait)
                    else
                        TriggerServerEvent("fishing:catch", bait)
                    end
                end
            end

            if
                GetDistanceBetweenCoords(
                    GetEntityCoords(PlayerPedId()),
                    Config.SellFish.x,
                    Config.SellFish.y,
                    Config.SellFish.z,
                    true
                ) <= 3
             then
                TriggerServerEvent("fishing:startSelling", "fish")
                Citizen.Wait(2000)
            end
            if
                GetDistanceBetweenCoords(
                    GetEntityCoords(PlayerPedId()),
                    Config.SellShark.x,
                    Config.SellShark.y,
                    Config.SellShark.z,
                    true
                ) <= 3
             then
                TriggerServerEvent("fishing:startSelling", "shark")
                Citizen.Wait(4000)
            end
            if
                GetDistanceBetweenCoords(
                    GetEntityCoords(PlayerPedId()),
                    Config.SellTurtle.x,
                    Config.SellTurtle.y,
                    Config.SellTurtle.z,
                    true
                ) <= 3
             then
                TriggerServerEvent("fishing:startSelling", "turtle")
                Citizen.Wait(4000)
            end
        end
    end
)

Citizen.CreateThread(
    function()
        while true do
            Wait(5)
            local playerCoords = GetEntityCoords(PlayerPedId())
            local letSleep = true
            for k in pairs(Config.PangonDodol) do
                local distance =
                    GetDistanceBetweenCoords(
                    playerCoords,
                    Config.PangonDodol[k].x,
                    Config.PangonDodol[k].y,
                    Config.PangonDodol[k].z,
                    true
                )
                if distance <= 10 then
                    letSleep = false
                    DrawMarker(
                        1,
                        Config.PangonDodol[k].x,
                        Config.PangonDodol[k].y,
                        Config.PangonDodol[k].z,
                        0.0,
                        0.0,
                        0.0,
                        0,
                        0.0,
                        0.0,
                        3.0,
                        3.0,
                        2.0,
                        0,
                        70,
                        250,
                        30,
                        false,
                        true,
                        2,
                        false,
                        false,
                        false,
                        false
                    )
                end
            end
            if letSleep then
                Citizen.Wait(2000)
            end
        end
    end
)

Citizen.CreateThread(
    function()
        while true do
            local wait = math.random(Config.FishTime.a, Config.FishTime.b)
            Wait(wait)
            if fishing then
                pause = true
                correct = math.random(1, 8)
                ESX.ShowNotification("~g~Ikan mengambil umpan \n ~h~Tekan " .. correct .. " untuk menangkapnya")
                input = 0
                pausetimer = 0
            end
        end
    end
)

RegisterNetEvent("fishing:message")
AddEventHandler(
    "fishing:message",
    function(message)
        ESX.ShowNotification(message)
    end
)
RegisterNetEvent("fishing:break")
AddEventHandler(
    "fishing:break",
    function()
        fishing = false
        ClearPedTasks(PlayerPedId())
    end
)

RegisterNetEvent("fishing:spawnPed")
AddEventHandler(
    "fishing:spawnPed",
    function()
        RequestModel(GetHashKey("A_C_SharkTiger"))
        while (not HasModelLoaded(GetHashKey("A_C_SharkTiger"))) do
            Citizen.Wait(1)
        end
        local pos = GetEntityCoords(PlayerPedId())

        local ped = CreatePed(29, 0x06C3F072, pos.x, pos.y, pos.z, 90.0, true, false)
        SetEntityHealth(ped, 0)
    end
)

RegisterNetEvent("fishing:setbait")
AddEventHandler(
    "fishing:setbait",
    function(bool)
        bait = bool
        print(bait)
    end
)

RegisterNetEvent("fishing:fishstart")
AddEventHandler(
    "fishing:fishstart",
    function()
        playerPed = PlayerPedId()
        local pos = GetEntityCoords(PlayerPedId())
        print("started fishing" .. pos)
        if IsPedInAnyVehicle(playerPed) then
            ESX.ShowNotification("~y~You can not fish from a vehicle")
        else
            if pos.y >= 7700 or pos.y <= -4000 or pos.x <= -3700 or pos.x >= 4300 then
                ESX.ShowNotification("~g~Fishing started")
                TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_FISHING", 0, true)
                fishing = true
            else
                ESX.ShowNotification("~y~Anda harus pergi lebih jauh dari pantai")
            end
        end
    end,
    false
)

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(5)
            local playerCoords = GetEntityCoords(PlayerPedId())
            local letSleep = true
            for k in pairs(Config.MarkerZones) do
                local distance =
                    GetDistanceBetweenCoords(
                    playerCoords,
                    Config.MarkerZones[k].x,
                    Config.MarkerZones[k].y,
                    Config.MarkerZones[k].z,
                    true
                )
                if distance <= 2 then
                    letSleep = false
                    DisplayHelpText("Tekan E Untuk menyewa Perahu")
                    if IsControlJustPressed(0, Keys["E"]) and IsPedOnFoot(PlayerPedId()) then
                        OpenBoatsMenu(Config.MarkerZones[k].xs, Config.MarkerZones[k].ys, Config.MarkerZones[k].zs)
                    end
                elseif distance < 3 then
                    ESX.UI.Menu.CloseAll()
                end
            end
            if letSleep then
                Citizen.Wait(2000)
            end
        end
    end
)

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(5)
            local playerCoords = GetEntityCoords(PlayerPedId())
            local letSleep = true
            for k in pairs(Config.hapuskapal) do
                local distance =
                    GetDistanceBetweenCoords(
                    playerCoords,
                    Config.hapuskapal[k].x,
                    Config.hapuskapal[k].y,
                    Config.hapuskapal[k].z,
                    true
                )
                if distance <= 20.0 and IsPedInAnyVehicle(PlayerPedId()) then
                    letSleep = false
                    DisplayHelpText("Tekan E Untuk mengembalikan Perahu")
                    if IsControlJustPressed(0, Keys["E"]) and IsPedInAnyVehicle(PlayerPedId()) then
                        hapustrstp(Config.hapuskapal[k].xs, Config.hapuskapal[k].ys, Config.hapuskapal[k].zs)
                    end
                end
            end
            if letSleep then
                Citizen.Wait(2000)
            end
        end
    end
)

function hapustrstp(x, y, z)
    local playerPed = PlayerPedId()
    ESX.Game.DeleteVehicle(GetVehiclePedIsIn(playerPed, false))
    ESX.Game.Teleport(playerPed, {x = x, y = y, z = z})
end

function OpenBoatsMenu(x, y, z)
    local ped = PlayerPedId()
    PlayerData = ESX.GetPlayerData()
    local elements = {}

    table.insert(
        elements,
        {label = '<span style="color:green;">Dinghy</span> <span style="color:red;">7000$</span>', value = "boat"}
    )
    table.insert(
        elements,
        {label = '<span style="color:green;">Suntrap</span> <span style="color:red;">10000$</span>', value = "boat6"}
    )
    table.insert(
        elements,
        {label = '<span style="color:green;">Jetmax</span> <span style="color:red;">15000$</span>', value = "boat5"}
    )
    table.insert(
        elements,
        {label = '<span style="color:green;">Toro</span> <span style="color:red;">17000$</span>', value = "boat2"}
    )
    table.insert(
        elements,
        {label = '<span style="color:green;">Marquis</span> <span style="color:red;">12000$</span>', value = "boat3"}
    )
    table.insert(
        elements,
        {
            label = '<span style="color:green;">Police Predator</span> <span style="color:red;">10000$</span>',
            value = "predator"
        }
    )
    table.insert(
        elements,
        {label = '<span style="color:green;">Dinghy 2</span> <span style="color:red;">2500$</span>', value = "boat4"}
    )

    --If user has police job they will be able to get free Police Predator boat
    if PlayerData.job.name == "police" then
    --table.insert(elements, {label = '<span style="color:green;">Police Predator</span>', value = 'police'})
    end

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        "default",
        GetCurrentResourceName(),
        "client",
        {
            title = "Rent a boat",
            align = "bottom-right",
            elements = elements
        },
        function(data, menu)
            if data.current.value == "boat" then
                ESX.UI.Menu.CloseAll()

                TriggerServerEvent("fishing:lowmoney", 7000)
                TriggerEvent("chatMessage", "You rented a boat for", {255, 0, 255}, "$" .. 7000)
                SetPedCoordsKeepVehicle(ped, x, y, z)
                TriggerEvent("esx:spawnVehicle", "dinghy4")
            end

            if data.current.value == "boat2" then
                ESX.UI.Menu.CloseAll()

                TriggerServerEvent("fishing:lowmoney", 17000)
                TriggerEvent("chatMessage", "You rented a boat for", {255, 0, 255}, "$" .. 17000)
                SetPedCoordsKeepVehicle(ped, x, y, z)
                TriggerEvent("esx:spawnVehicle", "TORO")
            end

            if data.current.value == "boat3" then
                ESX.UI.Menu.CloseAll()

                TriggerServerEvent("fishing:lowmoney", 12000)
                TriggerEvent("chatMessage", "You rented a boat for", {255, 0, 255}, "$" .. 12000)
                SetPedCoordsKeepVehicle(ped, x, y, z)
                TriggerEvent("esx:spawnVehicle", "MARQUIS")
            end

            if data.current.value == "boat4" then
                ESX.UI.Menu.CloseAll()

                TriggerServerEvent("fishing:lowmoney", 7000)
                TriggerEvent("chatMessage", "You rented a boat for", {255, 0, 255}, "$" .. 7000)
                SetPedCoordsKeepVehicle(ped, x, y, z)
                TriggerEvent("esx:spawnVehicle", "dinghy2")
            end

            if data.current.value == "boat5" then
                ESX.UI.Menu.CloseAll()

                TriggerServerEvent("fishing:lowmoney", 15000)
                TriggerEvent("chatMessage", "You rented a boat for", {255, 0, 255}, "$" .. 15000)
                SetPedCoordsKeepVehicle(ped, x, y, z)
                TriggerEvent("esx:spawnVehicle", "jetmax")
            end

            if data.current.value == "boat6" then
                ESX.UI.Menu.CloseAll()

                TriggerServerEvent("fishing:lowmoney", 10000)
                TriggerEvent("chatMessage", "You rented a boat for", {255, 0, 255}, "$" .. 10000)
                SetPedCoordsKeepVehicle(ped, x, y, z)
                TriggerEvent("esx:spawnVehicle", "suntrap")
            end

            if data.current.value == "predator" then
                ESX.UI.Menu.CloseAll()

                TriggerServerEvent("fishing:lowmoney", 10000)
                TriggerEvent("chatMessage", "You rented a boat for", {255, 0, 255}, "$" .. 10000)
                SetPedCoordsKeepVehicle(ped, x, y, z)
                TriggerEvent("esx:spawnVehicle", "predator")
            end

            if data.current.value == "police" then
                ESX.UI.Menu.CloseAll()

                TriggerEvent("chatMessage", "You took out a boat")
                SetPedCoordsKeepVehicle(ped, x, y, z)
                TriggerEvent("esx:spawnVehicle", "predator")
            end
            ESX.UI.Menu.CloseAll()
        end,
        function(data, menu)
            menu.close()
        end
    )
end
