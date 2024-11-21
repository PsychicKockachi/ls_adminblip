ESX = nil
local playerBlips = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    ESX.TriggerServerCallback('blip_system:isAdmin', function(isAdmin)
        if isAdmin then
            updateBlips()
        end
    end)
end)

function updateBlips()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(5000) -- Update every 5 seconds

            -- Remove old blips
            for _, blip in ipairs(playerBlips) do
                RemoveBlip(blip)
            end
            playerBlips = {}

            -- Get updated player data
            ESX.TriggerServerCallback('blip_system:getPlayersData', function(players)
                for _, player in ipairs(players) do
                    local playerPed = GetPlayerPed(GetPlayerFromServerId(player.id))
                    if DoesEntityExist(playerPed) then
                        local blip = AddBlipForEntity(playerPed)
                        SetBlipSprite(blip, 1) -- Standard blip
                        SetBlipColour(blip, Config.JobBlipColors[player.job] or 0)
                        SetBlipScale(blip, 0.9)
                        BeginTextCommandSetBlipName('STRING')
                        AddTextComponentSubstringPlayerName(player.name)
                        EndTextCommandSetBlipName(blip)
                        table.insert(playerBlips, blip)
                    end
                end
            end)
        end
    end)
end
