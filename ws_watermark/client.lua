-- Made by FAXES, Based off HRC
local display
AddEventHandler('onClientMapStart', function()
  Citizen.CreateThread(function()
    display = true
    TriggerEvent('logo:display', true)
  end)
end)

RegisterNetEvent('logo:display')
AddEventHandler('logo:display', function(value)
  SendNUIMessage({
    type = "logo",
    display = value
  })
  display = value
end)

Citizen.CreateThread(function()
  while true do
    if IsPauseMenuActive() then
      if display == nil or display == true then 
        TriggerEvent('logo:display', false)
      end
    else
      if display == nil or display == false then 
        TriggerEvent('logo:display', true)
      end
    end
    Wait(10000)
  end
end)

function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end

-- MULAI WATERMARK
local Ping = 0

RegisterNetEvent('ws-watermark:returnPing')
AddEventHandler('ws-watermark:returnPing', function(ping)
	Ping = ping
end)

Citizen.CreateThread(function()
	while true do
		TriggerServerEvent('ws-watermark:checkPing')
		Wait(2000)
	end
end)

servername = "URBAN ROLEPLAY"
offset = {x = 0.8350, y = 0.050}
rgb = {r = 200, g = 200, b = 200}
alpha = 255
scale = 0.4
font = 0

Citizen.CreateThread(function()
	while true do
		Wait(1)

		if (Ping >= 80 and Ping <= 120) then 
			SetTextColour(255, 165, 0, alpha)
		elseif Ping >= 120 then 
			SetTextColour(255, 0, 0, alpha)
		else
			SetTextColour(rgb.r, rgb.g, rgb.b, alpha)
		end
		

		SetTextFont(font)
		SetTextScale(scale, scale)
		SetTextWrap(0.0, 1.0)
		SetTextCentre(false)
		SetTextDropshadow(2, 2, 0, 0, 0)
		SetTextEdge(1, 0, 0, 0, 205)
		SetTextEntry("STRING")
		AddTextComponentString(servername)
		DrawText(offset.x, offset.y)
	end
end)
-- SELESAI WATERMARK