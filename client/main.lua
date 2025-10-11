local isUiOpen = false
local VEHICLE_TYPES = {
    [0] = "Compacts",
    [1] = "Sedans",
    [2] = "SUVs",
    [3] = "Coupes",
    [4] = "Muscle",
    [5] = "Sports Classics",
    [6] = "Sports",
    [7] = "Super",
    [8] = "Motorcycles",
    [9] = "Off-Road",
    [10] = "Industrial",
    [11] = "Utility",
    [12] = "Vans",
    [13] = "Cycles",
    [14] = "Boats",
    [15] = "Helicopters",
    [16] = "Planes",
    [17] = "Service",
    [18] = "Emergency",
    [19] = "Military",
    [20] = "Commercial",
    [21] = "Trains",
    [22] = "F1"
}

RegisterNetEvent("old_vehicleList:toggleUi", function(search)
    uiOpen = not isUiOpen
    SetNuiFocus(uiOpen, uiOpen)
    SendNUIMessage({
        type = "toggleUi",
        show = uiOpen,
        search = search or ""
    })
end)

RegisterNUICallback('closeUI', function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({ type = 'toggleUi', show = false })
    isUiOpen = false
    cb('ok')
end)

RegisterNUICallback("requestVehicles", function(_, cb)
    local vehicles = {}

    for _, model in ipairs(GetAllVehicleModels()) do
        local hash = type(model) == "string" and GetHashKey(model) or model
        local display = GetDisplayNameFromVehicleModel(hash)
        local label = GetLabelText(display)
        local classId = GetVehicleClassFromName(hash)
        local className = VEHICLE_TYPES[classId] or ("Unknown (" .. tostring(classId) .. ")")
        local seats = GetVehicleModelNumberOfSeats(hash) or 0
        local maxBraking = GetVehicleModelMaxBraking(hash) or 0.0
        local acceleration = GetVehicleModelAcceleration(hash) or 0.0


        table.insert(vehicles, {
            Name = model,
            DisplayName = (label ~= "NULL" and label) or display,
            Class = className,
            HexHash = hash,
            ManufacturerDisplayName = GetMakeNameFromVehicleModel(hash) or "?",
            Seats = seats,
            MaxBraking = maxBraking,
            Acceleration = acceleration
        })
    end

    cb(vehicles)
end)


RegisterNUICallback('spawnVehicle', function(data, cb)
    local model = data.model
    local colorHex = data.color or "#8a2be2"

    if model then
        TriggerServerEvent("old_vehicleList:SpawnVehicle", model, colorHex)
    end

    cb('ok')
end)
