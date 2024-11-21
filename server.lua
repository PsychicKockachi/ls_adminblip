ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Get all connected players with their job data
ESX.RegisterServerCallback('blip_system:getPlayersData', function(source, cb)
    local players = ESX.GetPlayers()
    local data = {}

    for _, playerId in ipairs(players) do
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer then
            table.insert(data, {
                id = playerId,
                name = xPlayer.getName(),
                job = xPlayer.getJob().name
            })
        end
    end

    cb(data)
end)

-- Check if the player is an admin
ESX.RegisterServerCallback('blip_system:isAdmin', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local group = xPlayer.getGroup()
        cb(group == Config.AdminGroup)
    else
        cb(false)
    end
end)
