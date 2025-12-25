-- Logs discord
local webHook = ""

local function sendToDiscord(playerName, vehicleName, coords)
    if webHook == "" then return end
    local embed = {
        {
            ["title"] = "old_vehicleList",
            ["color"] = 7419530,
            ["fields"] = {
                { name = "Joueur",        value = playerName or "Inconnu", inline = true },
                { name = "VéhiculeSpawn", value = vehicleName,             inline = true },
                { name = "Coords",        value = coords,                  inline = false },
            },
            ["footer"] = {
                ["text"] = "OldxBlunt / " .. os.date("%d/%m/%Y %H:%M:%S"),
            },
        }
    }

    PerformHttpRequest(webHook, function(err, text, headers) end, "POST", json.encode({
        username = "old_vehicleList Logs",
        embeds = embed
    }), { ["Content-Type"] = "application/json" })
end

RegisterCommand("vehiclelist", function(source, args)
    local perm = IsPlayerAceAllowed(source, "permissions.old_vehicleList")
    if perm then
        local search = table.concat(args, " ")
        if search == "" then search = nil end
        TriggerClientEvent("old_vehicleList:toggleUi", source, search)
    else
        TriggerClientEvent("chat:addMessage", source, {
            args = { "^1Accès refusé ^7: Vous n’avez pas la permission d’utiliser cette commande." }
        })
    end
end)

local function GetRGBfromHex(hex)
    hex = hex:gsub("#", "")
    return tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6))
end

RegisterNetEvent("old_vehicleList:SpawnVehicle", function(model, colorHex)
    local src = source
    local ped = GetPlayerPed(src)
    if not ped or ped == 0 then return end

    if model then
        local hash = GetHashKey(model)
        local coords = GetEntityCoords(ped)
        local heading = GetEntityHeading(ped)
        local veh = CreateVehicle(hash, coords.x, coords.y, coords.z, heading, true, true)
        local r, g, b = GetRGBfromHex(colorHex or "ffffff")
        SetVehicleCustomPrimaryColour(veh, r, g, b)
        SetVehicleCustomSecondaryColour(veh, r, g, b)
        TaskWarpPedIntoVehicle(ped, veh, -1)
        --
        local playerName = GetPlayerName(src)
        sendToDiscord(playerName, model, ("X: %.2f Y: %.2f Z: %.2f"):format(coords.x, coords.y, coords.z))
    end
end)
