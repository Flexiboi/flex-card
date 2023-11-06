local QBCore = exports['qb-core']:GetCoreObject()

for k, v in pairs(Config.Items) do
    QBCore.Functions.CreateUseableItem(v, function(source,item)
        TriggerClientEvent('flex-card:client:showCard', source, item.name, item.info)
    end)
end

QBCore.Functions.CreateCallback('flex-card:server:getPlayerInfo', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    if Player then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
        info.phone = Player.PlayerData.charinfo.phone
        info.callsign = Player.PlayerData.metadata.callsign
        info.email = Player.PlayerData.metadata.email
        cb(info)
    end
end)

RegisterServerEvent("flex-card:sever:showplayer", function(player, item, itemInfo)
    local src = source
    TriggerClientEvent('flex-card:client:show', src, item, itemInfo)
    if player ~= nil and player ~= src then
        -- print(player)
        TriggerClientEvent('flex-card:client:show', player, item, itemInfo)
    end
end)

RegisterServerEvent("flex-card:sever:showSelf", function(item, itemInfo)
    local src = source
    TriggerClientEvent('flex-card:client:show', src, item, itemInfo)
end)

QBCore.Commands.Add('givelicense', Lang:t("info.command"), {{ name = Lang:t("info.commandid"), help = Lang:t("info.commandidtip") }, { name = Lang:t("info.cardtype"), help = Lang:t("info.cardtypetip") }, { name = Lang:t("info.extrainfo"), help = Lang:t("info.extrainfotip") }}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if Player ~= nil then
        local info = {}

        info.receivedate = os.date ("%x")
        if string.lower(args[2]) == "id_card" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
            info.phone = Player.PlayerData.charinfo.phone
        elseif string.lower(args[2]) == "driver_license" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
            info.type = "Klasse C Rijbewijs"
            info.phone = Player.PlayerData.charinfo.phone
        elseif string.lower(args[2]) == "driver_temp_license" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
            info.type = "Class B Driver License"
            info.phone = Player.PlayerData.charinfo.phone
        elseif string.lower(args[2]) == "lawyer_card" then
            if args[3] ~= nil then
                local stretinfo = args[3]
                if args[3] ~= nil then
                    local str = ''
                    local i = 3

                    while args[i] ~= null do
                        str = str .. " " .. args[i]
                        i = i + 1
                    end
                    stretinfo = str
                end
                info.citizenid = Player.PlayerData.citizenid
                info.firstname = Player.PlayerData.charinfo.firstname
                info.lastname = Player.PlayerData.charinfo.lastname
                info.birthdate = Player.PlayerData.charinfo.birthdate
                info.gender = Player.PlayerData.charinfo.gender
                info.nationality = Player.PlayerData.charinfo.nationality
                info.locataion = stretinfo
                info.phone = Player.PlayerData.charinfo.phone
                info.email = Player.PlayerData.metadata.email
            else
                return
            end
        elseif string.lower(args[2]) == "police_card" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
            info.phone = Player.PlayerData.charinfo.phone
        else
            return
        end
        Player.Functions.AddItem(string.lower(args[2]), 1, false, info)
        TriggerClientEvent('inventory:client:ItemBox', args[1], QBCore.Shared.Items[string.lower(args[2])], 'add')
    end
end)
