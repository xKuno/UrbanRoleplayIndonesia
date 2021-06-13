
--===============================================================================
--=== Stworzone przez Alcapone aka suprisex. Zakaz rozpowszechniania skryptu! ===
--===================== na potrzeby LS-Story.pl =================================
--===============================================================================


-- ESX

ESX = nil
local PlayerData                = {}

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)


local radioMenu = false

function PrintChatMessage(text)
    TriggerEvent('chatMessage', "system", { 255, 0, 0 }, text)
end

function hasRadio (cb)
  if (ESX == nil) then return cb(0) end
  ESX.TriggerServerCallback('ls-radio:getItemAmount', function(qtty)
    cb(qtty > 0)
  end, 'radio')
end

function ShowNoRadioWarning () 
  if (ESX == nil) then return end
  exports['mythic_notify']:SendAlert('error', 'Kamu tidak memiliki radio')
end

function enableRadio(enable)

  SetNuiFocus(true, true)
  radioMenu = enable

  SendNUIMessage({

    type = "enableui",
    enable = enable

  })
  RadioPlayAnim('text', false, true)
end

--- sprawdza czy komenda /radio jest włączony

--[[RegisterCommand('radio', function(source, args)
    if Config.enableCmd then
      enableRadio(true)
    end
end, false)]]

RegisterCommand("radio", function(source, args)
  -- Wait for next frame just to be safe
  Citizen.Wait(0)

  hasRadio(function (hasRadio)
    if hasRadio == true then
      enableRadio(true)
    else
      ShowNoRadioWarning()
    end
  end)

end, false)


-- radio test

--[[RegisterCommand('radiotest', function(source, args)
  local playerName = GetPlayerName(PlayerId())
  local data = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")

  print(tonumber(data))

  if data == "nil" then
    exports['mythic_notify']:SendAlert('inform', Config.messages['not_on_radio'])
  else
   exports['mythic_notify']:SendAlert('inform', Config.messages['on_radio'] .. data .. '.00 MHz </b>')
 end

end, false)]]

-- dołączanie do radia

RegisterNUICallback('joinRadio', function(data, cb)
    local _source = source
    local PlayerData = ESX.GetPlayerData(_source)
    local playerName = GetPlayerName(PlayerId())
    local getPlayerRadioChannel = exports.saltychat:GetRadioChannel(true)

    if tonumber(data.channel) ~= tonumber(getPlayerRadioChannel) then
        if tonumber(data.channel) <= Config.RestrictedChannels then
          if(PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'mechanic' or PlayerData.job.name == 'pedagang' or PlayerData.job.name == 'taxi') then
            exports.saltychat:SetRadioChannel(data.channel, true)
            exports['mythic_notify']:SendAlert ('inform', Config.messages['joined_to_radio'] .. data.channel .. '.00 MHz </b>', { ['background-color'] = '#008e00', ['color'] = '#ffffff' })
          elseif not (PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'mechanic') then
            --- info że nie możesz dołączyć bo nie jesteś policjantem
            exports['mythic_notify']:SendAlert ('error', Config.messages['restricted_channel_error'], { ['background-color'] = '#ff0000', ['color'] = '#ffffff' })

          end
        end
        if tonumber(data.channel) > Config.RestrictedChannels then
          exports.saltychat:SetRadioChannel(data.channel, true)
        end
      else
        exports['mythic_notify']:SendAlert ('error', Config.messages['you_on_radio'] .. data.channel .. '.00 MHz </b>', { ['background-color'] = '#ff0000', ['color'] = '#ffffff' })
      end
      --[[
    exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
    exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(data.channel), true);
    exports.tokovoip_script:addPlayerToRadio(tonumber(data.channel))
    PrintChatMessage("radio: " .. data.channel)
    print('radiook')
      ]]--
    cb('ok')
end)

-- opuszczanie radia

RegisterNUICallback('leaveRadio', function(data, cb)
   local playerName = GetPlayerName(PlayerId())
   local getPlayerRadioChannel = exports.saltychat:GetRadioChannel(true)

    if getPlayerRadioChannel == "nil" then
      exports['mythic_notify']:SendAlert ('inform', Config.messages['not_on_radio'], { ['background-color'] = '#008e00', ['color'] = '#ffffff' })
        else
        exports.saltychat:SetRadioChannel('', true)
          SendNUIMessage({ type = "changeChannel", value = -1})
    end

   cb('ok')

end)

RegisterNUICallback('escape', function(data, cb)

    enableRadio(false)
    SetNuiFocus(false, false)
    RadioPlayAnim('out', false, true)


    cb('ok')
end)

-- net eventy

RegisterNetEvent('ls-radio:use')
AddEventHandler('ls-radio:use', function()
  enableRadio(true)
end)

RegisterNetEvent('ls-radio:onRadioDrop')
AddEventHandler('ls-radio:onRadioDrop', function(source)
  local playerName = GetPlayerName(source)
  local getPlayerRadioChannel = exports.saltychat:GetRadioChannel(true)


  if getPlayerRadioChannel ~= "nil" then

    exports.saltychat:SetRadioChannel('', true)
    SendNUIMessage({ type = "changeChannel", value = -1})
    SendNUIMessage({ type = "hasradio", state = false})
    --exports['ls_notify']:DoHudText('inform', Config.messages['you_leave'] .. getPlayerRadioChannel .. '.00 MHz </b>')

end
end)

Citizen.CreateThread(function()
    while true do
        if radioMenu then
            DisableControlAction(0, 1, guiEnabled) -- LookLeftRight
            DisableControlAction(0, 2, guiEnabled) -- LookUpDown

            DisableControlAction(0, 142, guiEnabled) -- MeleeAttackAlternate

            DisableControlAction(0, 106, guiEnabled) -- VehicleMouseControlOverride

            if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
                SendNUIMessage({
                    type = "click"
                })
            end
        end
        Citizen.Wait(0)
    end
end)
