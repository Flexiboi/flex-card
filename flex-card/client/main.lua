local QBCore = exports['qb-core']:GetCoreObject()

local function GetClosestPlayer()
    local closestPlayers = QBCore.Functions.GetPlayersFromCoords()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(PlayerPedId())

    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end
	return closestPlayer, closestDistance
end

RegisterNetEvent('flex-card:client:showCard', function(item, itemInfo)
    local shower = PlayerPedId()
    local player, distance = QBCore.Functions.GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        -- QBCore.Functions.TriggerCallback('flex-card:server:getPlayerInfo', function(info)
        --     if info then
        --         TriggerServerEvent('flex-card:sever:showplayer', GetPlayerServerId(player), item, info, itemInfo)
        --     end
        -- end)
        TriggerServerEvent('flex-card:sever:showplayer', GetPlayerServerId(player), item, itemInfo)
    else
        -- QBCore.Functions.TriggerCallback('flex-card:server:getPlayerInfo', function(info)
        --     if info then
        --         TriggerServerEvent('flex-card:sever:showSelf', item, info, itemInfo)
        --     end
        -- end)
        TriggerServerEvent('flex-card:sever:showSelf', item, itemInfo)
    end
end)

RegisterNetEvent('flex-card:client:show', function(item, playerInfo)
    SendNUIMessage({
        item = item,
        citizenid = playerInfo.citizenid or nil,
        firstname = playerInfo.firstname or nil,
        lastname = playerInfo.lastname or nil,
        birthdate = playerInfo.birthdate or nil,
        gender = playerInfo.gender or nil,
        nationality = playerInfo.nationality or nil,
        type = playerInfo.type or nil,
        phone = playerInfo.phone or nil,
        location = playerInfo.locataion or nil,
        callsign = playerInfo.callsign or nil,
        receivedate = playerInfo.receivedate or nil,
        email = playerInfo.email
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback('CloseNui', function(data, cb)
    SetNuiFocus(false, false)
end)