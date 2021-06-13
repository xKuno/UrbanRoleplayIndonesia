local Keys = {
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

ESX             				 = nil

local cardOpen 					= false
local playerData 				= {}
local windowavg					= false
local windowavd					= false
local windowarg					= false
local windoward					= false
local window 					= false
local engineOn 					= true
local speedkm 					= 0
local lagiblindfold     = false


-- Servern callback
RegisterNetEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function(playerData)
	cardOpen = true
	SendNUIMessage({
		action = "open",
		array = playerData
	})
end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

-- Giving ID Animation
function OpenGivingID()
  local pP = PlayerPedId()

  Citizen.CreateThread(function()

    local pP = PlayerPedId()
    TaskPlayAnim(pP, "mp_common", "givetake1_a", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
    Citizen.CreateThread(function()
      Citizen.Wait(10000)
      TriggerServerEvent('esx_personmeny:give_id')
      ClearPedTasksImmediately(pP)
      end)
    end)
end

-- No one Near Animation
function OpenNoOneNear()
  local pP = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    local pP = GetPlayerPed(-1)
    TaskPlayAnim(pP, "anim@mp_player_intcelebrationmale@face_palm", "face_palm", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
    Citizen.CreateThread(function()
      Citizen.Wait(10000)
      TriggerServerEvent('esx_personmeny:idnoonenear')
      ClearPedTasksImmediately(pP)
      end)
    end)
end

function OpenTrashCan()
  local pP = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    local pP = GetPlayerPed(-1)
    TaskPlayAnim(pP, "mp_common", "givetake2_a", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
    TaskStartScenarioInPlace(pP, "mp_common", 0, true)
    Citizen.CreateThread(function()
      Citizen.Wait(2000)
      ClearPedTasksImmediately(pP)
      end)
    end)
end

function OpenAttansCan()
  local pP = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    local pP = GetPlayerPed(-1)
    TaskPlayAnim(pP, "gestures@m@standing@casual", "gesture_damn", 3.5, -8, -1, 2, 0, 0, 0, 0, 0)
    TaskStartScenarioInPlace(pP, "gestures@m@standing@casual", 0, true)
    FreezeEntityPosition(playerPed, true)
    Citizen.CreateThread(function()
      Citizen.Wait(2000)
      FreezeEntityPosition(playerPed, false)
      ClearPedTasksImmediately(pP)
      end)
    end)
end

RegisterCommand("checkid", function()
  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
end)

RegisterCommand("checkDriver", function()
  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
end)

RegisterCommand("checkFirearms", function()
  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
end)

RegisterCommand("showid", function()
  local player, distance = ESX.Game.GetClosestPlayer()
  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
  OpenTrashCan()
end)

RegisterCommand("showDriver", function()
  local player, distance = ESX.Game.GetClosestPlayer()
  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
  OpenTrashCan()
end)

RegisterCommand("showFirearms", function()
  local player, distance = ESX.Game.GetClosestPlayer()
  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
  OpenTrashCan()
end)

local disableShuffle = true
function disableSeatShuffle(flag)
  disableShuffle = flag
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsPedInAnyVehicle(GetPlayerPed(-1), false) and disableShuffle then
      if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
        if GetIsTaskActive(GetPlayerPed(-1), 165) then
          SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
        end
      end
    end
  end
end)

RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
  if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
    disableSeatShuffle(false)
    Citizen.Wait(5000)
    disableSeatShuffle(true)
  else
    CancelEvent()
  end
end)

RegisterCommand("shuff", function(source, args, raw) --change command here
    TriggerEvent("SeatShuffle")
end, false)

RegisterCommand("blindfold", function(source, args, raw) --change command here
    lagiblindfold = true
    local lib = 'random@mugging4'
    local anim = 'struggle_loop_b_thief'
    ESX.Streaming.RequestAnimDict(lib, function()
        TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, false, false, false)
    end)
    
    Citizen.Wait(3000)

    local player, distance = ESX.Game.GetClosestPlayer()

    if distance ~= -1 and distance <= 2.0 then
      ESX.TriggerServerCallback('jsfour-blindfold', function( hasItem )
          TriggerServerEvent('jsfour-blindfold', GetPlayerServerId(player), hasItem)
       end)
    end

    lagiblindfold = false
end, false)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    if lagiblindfold then
      DisableControlAction(0, 323, true)
    else
      EnableControlAction(0, 323, true)
      Citizen.Wait(500)
    end
  end
end)