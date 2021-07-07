RegisterCommand('fallover', function(source, args)

local playerPed = PlayerPedId() -- Gets the local player's ped ID
local playerID = PlayerId() -- Gets the player's ID
local getPlayerPed = GetPlayerPed(-1) -- get the player ped
local playerVehicle = GetVehiclePedIsUsing(getPlayerPed) -- get player vehicle

if args[1] == "on" then
    SetPedRagdollOnCollision(getPlayerPed, 1)
    exports.pNotify:SendNotification({text = "You will now fall over easier when hitting anything.", type = "success", timeout = (10000), layout = "bottomCenter",})
elseif args[1] == "off" then
    SetPedRagdollOnCollision(getPlayerPed, 0)
    exports.pNotify:SendNotification({text = "You will no longer fall over.", type = "success", timeout = (10000), layout = "bottomCenter",})
end

TriggerEvent("chat:addSuggestion", "/fallover", "Makes your character fall over easier when hitting anything.")
end)

RegisterCommand('sweat', function (source, args)

local getPlayerPed = GetPlayerPed(-1) -- get the player ped

if args[1] == "none" then
    SetPedSweat(getPlayerPed, 0)
    exports.pNotify:SendNotification({text = "You now have no sweat.", type = "success", timeout = (5000), layout = "bottomCenter",})
elseif args[1] == "half" then
    SetPedSweat(getPlayerPed, 50)
    exports.pNotify:SendNotification({text = "You now have some sweat.", type = "success", timeout = (5000), layout = "bottomCenter",})
elseif args[1] == "full" then
    SetPedSweat(getPlayerPed, 100)
    exports.pNotify:SendNotification({text = "You now have the most sweat.", type = "success", timeout = (5000), layout = "bottomCenter",})
end

TriggerEvent("chat:addSuggestion", "/sweat", "Makes your character have different levels of sweat.")
end)

RegisterCommand('wet', function(source, args)

local getPlayerPed = GetPlayerPed(-1)

if args[1] == "half" then
    SetPedWetnessEnabledThisFrame(getPlayerPed)
    SetPedWetnessHeight(getPlayerPed, 50)
    exports.pNotify:SendNotification({text = "You now are partially wetfrom the waist down.", type = "success", timeout = (5000), layout = "bottomCenter",})
elseif args[1] == "full" then
    SetPedWetnessEnabledThisFrame(getPlayerPed)
    SetPedWetnessHeight(getPlayerPed, 100)
    exports.pNotify:SendNotification({text = "You now are fully wet from the waist down.", type = "success", timeout = (5000), layout = "bottomCenter",})
end

TriggerEvent("chat:addSuggestion", "/wet", "Makes your character have different amounts of water on them from the waist down.")
end)

RegisterCommand('startsmallfire', function()

    local getPlayerPed = GetPlayerPed(-1)
    local playerCoord = GetEntityCoords(getPlayerPed)

    StartScriptFire(playerCoord.x, playerCoord.y, playerCoord.z-1, 15, 0)
    exports.pNotify:SendNotification({text = "You have started a small fire.", type = "success", timeout = (5000), layout = "bottomCenter",})

    TriggerEvent("chat:addSuggestion", "/startsmallfire", "Starts a small gas fire at your location. If you don't move you can be set on fire.")
end)

RegisterCommand('disablecover', function()
    local playerID = PlayerId() -- Gets the player's ID

    SetPlayerCanUseCover(playerID, 0)
    exports.pNotify:SendNotification({text = "You are now unable to take cover.", type = "success", timeout = (5000), layout = "bottomCenter",})
end)

RegisterCommand('enablecover', function()
    local playerID = PlayerId() -- Gets the player's ID

    SetPlayerCanUseCover(playerID, 1)
    exports.pNotify:SendNotification({text = "You are now able to take cover.", type = "success", timeout = (5000), layout = "bottomCenter",})
end)

RegisterCommand('enableequipallweapons', function()

local getPlayerPed = GetPlayerPed(-1)

SetCanPedEquipAllWeapons(getPlayerPed, 1)

TriggerEvent("chat:addSuggestion", "/enableequipallweapons", "Allows player to equip weapons not in the weapon wheel by hitting tab, as long as the weapon was the last equipped weapon. (Mainly used for the smoke greanda launcher.)")
end)

RegisterCommand('openphone', function()

    local phone = CreateMobilePhone(0)
    local phonePos = GetMobilePhonePosition()
    SetMobilePhoneScale(300.0)
    SetMobilePhonePosition(phonePos.x+1.5, phonePos.y-1.0, phonePos.z-1)
end)

RegisterCommand('closephone', function()

    DestroyMobilePhone()
end)

RegisterCommand('marklocation', function()
    local getPlayerPed = GetPlayerPed(-1)
    local playerLocation = GetEntityCoords(getPlayerPed)
    local markedLocationBlip = AddBlipForCoord(playerLocation.x, playerLocation.y, playerLocation.z)
    SetBlipSprite(markedLocationBlip, 162)
end)

RegisterCommand('markarea', function()
    local getPlayerPed = GetPlayerPed(-1)
    local playerID = PlayerId()
    local playerLocation = GetEntityCoords(getPlayerPed)
    local markedAreaBlip = AddBlipForCoord(playerLocation.x, playerLocation.y, playerLocation.z)
    SetBlipSprite(markedAreaBlip, 161)
    SetBlipNameToPlayerName(markedAreaBlip, playerID)
end)