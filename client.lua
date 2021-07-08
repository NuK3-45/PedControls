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

RegisterCommand('teleportto', function(source, args)
    local playerID = PlayerId()

    if args[1] == "paletopd" then
        StartPlayerTeleport(playerID, -442.56, 6017.2, 31.71, 135.2, 1, 0, 1)
    elseif args[1] == "paletofd" then
        StartPlayerTeleport(playerID, -381.12, 6119.76, 31.48, 226.21, 1, 0, 1)
    elseif args[1] == "sandypd" then
        StartPlayerTeleport(playerID, 1855.93, 3682.09, 34.27, 29.5, 1, 0, 1)
    elseif args[1] == "sandyfd" then
        StartPlayerTeleport(playerID, 1690.54, 3580.7, 35.62, 31.15, 1, 0, 1)
    elseif args[1] == "prison" then
        StartPlayerTeleport(playerID, 1847.53, 2585.87, 45.67, 88.82, 1, 0, 1)
    elseif args[1] == "vinewoodpd" then
        StartPlayerTeleport(playerID, 641.83, 0.59, 82.79, 68.82, 1, 0, 1)
    elseif args[1] == "pillbox" then
        StartPlayerTeleport(playerID, 298.15, -584.4, 43.26, 253.62, 1, 0, 1)
    elseif args[1] == "missionrowpd" then
        StartPlayerTeleport(playerID, 432.73, -982.01, 30.71, 271.79, 1, 0, 1)
    elseif args[1] == "davispd" then
        StartPlayerTeleport(playerID, 360.17, -1583.88, 29.29, 228.53, 1, 0, 1)
    elseif args[1] == "vespuccipd" then
        StartPlayerTeleport(playerID, -1111.48, -847.7, 19.32, 311.32, 1, 0, 1)
    elseif args[1] == "delperropd" then
        StartPlayerTeleport(playerID, -1631.3, -1014.53, 13.12, 138.49, 1, 0, 1)
    else
        exports.pNotify:SendNotification({text = "You did not specify a valid location.", type = "error", timeout = (5000), layout = "bottomCenter",})
    end
end)

RegisterCommand('weaponstats', function()
    local getPlayerPed = GetPlayerPed(-1)
    local getPlayerWeapon = GetSelectedPedWeapon(getPlayerPed)
    local weaponStats = GetWeaponHudStats(getPlayerWeapon)

    exports.pNotify:SendNotification({text = "<b>Weapon Stats</b> <br /><br />Damage: "..hudDamage.."<br />Travel Speed: "..hudSpeed.."<br />Accuracy: "..hudAccuracy.."<br />Range: "..hudRange.."", type = "success", timeout = (5000), layout = "bottomCenter",})
end)
