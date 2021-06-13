-- ModFreakz
-- For support, previews and showcases, head to https://discord.gg/ukgQa5K

MF_Stress = {}
local MFS = MF_Stress

MFS.Version = '1.0.10'

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
Citizen.CreateThread(function(...)
  while not ESX do 
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end) 
    Citizen.Wait(0)
  end
end)

MFS.GetSickAt       = 65 -- only change the first value (percent player gets sick at)
MFS.MildlySickAt    = 75
MFS.ExtremelySickAt = 85 -- only change the first value (percent player vomits at)

MFS.CoughTimer      = 60 -- seconds between cough
MFS.VomitTimer      = 90 -- seconds between vomit
MFS.VomitHealthLoss = 30 -- from vomiting

MFS.DrugsTimer      = 60 -- how long drugs last (seconds)
MFS.SmokeRelief     = 25 -- from smoking cigarette
MFS.JointRelief     = 25 -- from smoking joint
MFS.AlchoholRelief  = 20 -- from drinking alchohol beverage
MFS.DrinkingRelief  = 10 -- from drinking non-alchoholic beverage

MFS.StaticRelief    = 0.2 -- % stress relieved over time from events like swimming, riding bikes, etc.
MFS.StaticAdder     = 0.01 -- % stress gained over time from things like driving too fast.
MFS.CombatAdder     = 0.00010 -- % stress gained while in combat
MFS.ShootingAdder   = 0.00015 -- % stress gained while shooting
MFS.StressAtSpeed   = 210 -- kph
MFS.RelaxAtSpeed    = 60  -- kph