ESX              = nil
local PlayerData = {}
PlayersResell   = {}
--https://discord.gg/MYb6TcHmq9
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local webhook = "https://discordapp.com/api/webhooks/688095225331056708/dS6MFr_xQPs9LS6Rq76D-G8b9UOH7ERR1YuPyir3Kx0KHMW7TvBHSxS2o5C6WVbAoLli"

function SendWebhookMessage(webhook,message)
    if webhook ~= nil and webhook ~= "" then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------ MENU F5 ------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('c_character:saveidentite')
AddEventHandler('c_character:saveidentite', function(sexe, prenom, nom, datedenaissance, taille)
    _source = source
    mySteamID = GetPlayerIdentifiers(_source)
    mySteam = mySteamID[1]

    MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname, `lastname` = @lastname, `dateofbirth` = @dateofbirth, `sex` = @sex, `height` = @height WHERE identifier = @identifier', {
      ['@identifier']		= mySteam,
      ['@firstname']		= prenom,
      ['@lastname']		= nom,
      ['@dateofbirth']	= datedenaissance,
      ['@sex']			= sexe,
      ['@height']			= taille
    }, function(rowsChanged)
      if callback then
        callback(true)
      end
    end)
end)



RegisterServerEvent("c_menu:lastpos")
AddEventHandler("c_menu:lastpos", function(xPlayer)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local player = xPlayer.getIdentifier()
    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier=@username", {['@username'] = player})
    if (result) then
        if xPlayer ~= nil then
            TriggerClientEvent("c_menu:lastpos", _source, json.decode(result[1].position))
        end
    end
end)

ESX.RegisterServerCallback('NB:getUsergroup', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local group = xPlayer.getGroup()
	cb(group)
  end)

RegisterServerEvent("SavellPlayer")
AddEventHandler("SavellPlayer", function(source)
SendWebhookMessage(webhook, "**Sauvegarde des joueurs**")
	ESX.SavePlayers(cb)
end)

RegisterServerEvent('LastPosition')
AddEventHandler('LastPosition', function(position)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.setLastPosition(position)
end)

RegisterServerEvent('sotek:deconnection')
AddEventHandler('sotek:deconnection', function()
    DropPlayer(source, "Déconnexion effectuée avec succès. \nVos données et votre position ont étés sauvegardées. \nMerci d'avoir joué sur Atlanta")
end)

ESX.RegisterUsableItem('boitierarmeslourdes', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent("boitierarmeslourdes:commencerdsqdqsdsqd", xPlayer.source)
	xPlayer.removeInventoryItem('boitierarmeslourdes', 1)
end)

ESX.RegisterUsableItem('boitierarmesdepoing', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent("clippy_boitierarmesdepoing:commencerdsqdqsdsqd", xPlayer.source)
	xPlayer.removeInventoryItem('boitierarmesdepoing', 1)
end)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------- LTD --------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('sevenup')
AddEventHandler('sevenup', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 2 then 
    xPlayer.removeMoney(2)
    xPlayer.addInventoryItem('up7', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)

RegisterNetEvent('addpermis')
AddEventHandler('addpermis', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 50 then 
    xPlayer.removeMoney(50)
    xPlayer.addInventoryItem('permis', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent.")
    end
end)

RegisterNetEvent('tel')
AddEventHandler('tel', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 350 then 
        xPlayer.removeMoney(350)
        xPlayer.addInventoryItem('phone', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)

RegisterNetEvent('simadd')
AddEventHandler('simadd', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 50 then 
        xPlayer.removeMoney(50)
        xPlayer.addInventoryItem('sim', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('orangina')
AddEventHandler('orangina', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 2 then 
        xPlayer.removeMoney(2)
        xPlayer.addInventoryItem('orangina', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)

RegisterNetEvent('chalumaux')
AddEventHandler('chalumaux', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 275 then 
        xPlayer.removeMoney(275)
        xPlayer.addInventoryItem('oxycutter', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achatlockpick')
AddEventHandler('achatlockpick', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 20 then 
        xPlayer.removeMoney(20)
        xPlayer.addInventoryItem('lockpick', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('menottes')
AddEventHandler('menottes', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 155 then 
        xPlayer.removeMoney(155)
        xPlayer.addInventoryItem('cuffs', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('pinces')
AddEventHandler('pinces', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 65 then 
        xPlayer.removeMoney(65)
        xPlayer.addInventoryItem('cuff_keys', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achat1pot2')
AddEventHandler('achat1pot2', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 17 then 
        xPlayer.removeMoney(17)
        xPlayer.addInventoryItem('pot', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achatadvancedlockpick')
AddEventHandler('achatadvancedlockpick', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 65 then 
        xPlayer.removeMoney(65)
        xPlayer.addInventoryItem('advancedlockpick', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('truelleadss')
AddEventHandler('truelleadss', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 35 then 
        xPlayer.removeMoney(35)
        xPlayer.addInventoryItem('truele', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Sactactique')
AddEventHandler('Sactactique', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 75 then 
        xPlayer.removeMoney(75)
        xPlayer.addInventoryItem('sactactique', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)


RegisterNetEvent('eau')
AddEventHandler('eau', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getMoney() >= 1 then 
        xPlayer.removeMoney(1)
        xPlayer.addInventoryItem('water', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('icetea')
AddEventHandler('icetea', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getMoney() >= 2 then 
        xPlayer.removeMoney(2)
        xPlayer.addInventoryItem('icetea', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('sprite')
AddEventHandler('sprite', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getMoney() >= 2 then 
    xPlayer.removeMoney(2)
    xPlayer.addInventoryItem('sprite', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('sirop')
AddEventHandler('sirop', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getMoney() >= 2 then 
        xPlayer.removeMoney(2)
        xPlayer.addInventoryItem('sirop', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('mojito')
AddEventHandler('mojito', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getMoney() >= 4 then 
        xPlayer.removeMoney(4)
        xPlayer.addInventoryItem('mojito', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('pain')
AddEventHandler('pain', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getMoney() >= 2 then 
        xPlayer.removeMoney(2)
        xPlayer.addInventoryItem('bread', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('hamburger')
AddEventHandler('hamburger', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getMoney() >= 4 then
        xPlayer.removeMoney(4)
        xPlayer.addInventoryItem('hamburger', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('frites')
AddEventHandler('frites', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 3 then
        xPlayer.removeMoney(3)
        xPlayer.addInventoryItem('frites', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('pizza')
AddEventHandler('pizza', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getMoney() >= 5 then
        xPlayer.removeMoney(5)
        xPlayer.addInventoryItem('pizza', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('clip')
AddEventHandler('clip', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getMoney() >= 50 then
        xPlayer.removeMoney(50)
        xPlayer.addInventoryItem('clip', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('ChargeurBasique')
AddEventHandler('ChargeurBasique', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 25 then 
        xPlayer.removeAccountMoney('black_money', 25)
        xPlayer.addInventoryItem('clip', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('lampe')
AddEventHandler('lampe', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getMoney() >= 75 then
        xPlayer.removeAccountMoney('black_money', 75)
        xPlayer.addInventoryItem('flashlight', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('lampe1')
AddEventHandler('lampe1', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 25 then 
        xPlayer.removeAccountMoney('black_money', 25)
        xPlayer.addInventoryItem('flashlight', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Silencieuxdebilly')
AddEventHandler('Silencieuxdebilly', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 100 then 
        xPlayer.removeAccountMoney('black_money', 100)
        xPlayer.addInventoryItem('silencieux', 1)
    else 
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achatbmxdivers')
AddEventHandler('achatbmxdivers', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 5 then 
        xPlayer.removeAccountMoney('black_money', 5)
        xPlayer.addInventoryItem('bmx', 1)
    else 
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achatKevlardivers')
AddEventHandler('achatKevlardivers', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 50 then 
        xPlayer.removeAccountMoney('black_money', 50)
        xPlayer.addInventoryItem('bulletproof', 1)
    else 
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)

RegisterNetEvent('Hazmatnoire')
AddEventHandler('Hazmatnoire', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 35 then 
        xPlayer.removeAccountMoney('black_money', 35)
        xPlayer.addInventoryItem('hazmat1', 1)
    else 
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Hazmatbleu')
AddEventHandler('Hazmatbleu', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 35 then 
        xPlayer.removeAccountMoney('black_money', 35)
        xPlayer.addInventoryItem('hazmat2', 1)
    else 
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Hazmatblanche')
AddEventHandler('Hazmatblanche', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 35 then 
        xPlayer.removeAccountMoney('black_money', 35)
        xPlayer.addInventoryItem('hazmat4', 1)
    else 
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Hazmatjaune')
AddEventHandler('Hazmatjaune', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 35 then 
        xPlayer.removeAccountMoney('black_money', 35)
        xPlayer.addInventoryItem('hazmat3', 1)
    else 
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Casadepapel')
AddEventHandler('Casadepapel', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 35 then 
        xPlayer.removeAccountMoney('black_money', 35)
        xPlayer.addInventoryItem('casapapel', 1)
    else 
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Kartingrouge')
AddEventHandler('Kartingrouge', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 35 then 
        xPlayer.removeAccountMoney('black_money', 35)
        xPlayer.addInventoryItem('karting1', 1)
    else 
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Kartingnoir')
AddEventHandler('Kartingnoir', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 35 then 
        xPlayer.removeAccountMoney('black_money', 35)
        xPlayer.addInventoryItem('karting2', 1)
    else 
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('SkyDiving')
AddEventHandler('SkyDiving', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 35 then 
        xPlayer.removeAccountMoney('black_money', 35)
        xPlayer.addInventoryItem('skydiving', 1)
    else 
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('tenuePrisonnier')
AddEventHandler('tenuePrisonnier', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 35 then 
        xPlayer.removeAccountMoney('black_money', 35)
        xPlayer.addInventoryItem('prisonnier', 1)
    else 
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('LittlePricks')
AddEventHandler('LittlePricks', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 35 then 
        xPlayer.removeAccountMoney('black_money', 35)
        xPlayer.addInventoryItem('LittlePricks', 1)
    else 
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('masc_swim')
AddEventHandler('masc_swim', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 35 then 
        xPlayer.removeAccountMoney('black_money', 35)
        xPlayer.addInventoryItem('mask_swim', 1)
    else 
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('tenuemecano')
AddEventHandler('tenuemecano', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 35 then 
        xPlayer.removeAccountMoney('black_money', 35)
        xPlayer.addInventoryItem('LsCustoms', 1)
    else 
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('bongachat')
AddEventHandler('bongachat', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 35 then 
        xPlayer.removeAccountMoney('black_money', 35)
        xPlayer.addInventoryItem('bong', 1)
    else 
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)



RegisterNetEvent('silencieux')
AddEventHandler('silencieux', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getMoney() >= 150 then
        xPlayer.removeMoney(150)
        xPlayer.addInventoryItem('silencieux', 1)
    else 
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('ChargeurLong')
AddEventHandler('ChargeurLong', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 50 then 
        xPlayer.removeAccountMoney('black_money', 50)
        xPlayer.addInventoryItem('clipextended', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('ChargeurDrum')
AddEventHandler('ChargeurDrum', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 75 then 
        xPlayer.removeAccountMoney('black_money', 75)
        xPlayer.addInventoryItem('clipdrum', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('poignée')
AddEventHandler('poignée', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getMoney() >= 25 then
        xPlayer.removeMoney(25)
        xPlayer.addInventoryItem('grip', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)

RegisterNetEvent('skindeluxe')
AddEventHandler('skindeluxe', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 425 then 
        xPlayer.removeAccountMoney('black_money', 425)
        xPlayer.addInventoryItem('yusuf', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('skindeluxe1')
AddEventHandler('skindeluxe1', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getMoney() >= 1250 then
        xPlayer.removeMoney(1250)
        xPlayer.addInventoryItem('yusuf', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)

RegisterNetEvent('viseurshop')
AddEventHandler('viseurshop', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 175 then 
        xPlayer.removeAccountMoney('black_money', 175)
        xPlayer.addInventoryItem('viseur', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)

RegisterNetEvent('cleusbweed1')
AddEventHandler('cleusbweed1', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 350000 then 
        xPlayer.removeAccountMoney('black_money', 350000)
        xPlayer.addInventoryItem('weedburn', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)

RegisterNetEvent('cleusbcoke1')
AddEventHandler('cleusbcoke1', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 750000 then 
        xPlayer.removeAccountMoney('black_money', 750000)
        xPlayer.addInventoryItem('cokeburn', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)

RegisterNetEvent('cleusbmeth1')
AddEventHandler('cleusbmeth1', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 1250000 then 
        xPlayer.removeAccountMoney('black_money', 1250000)
        xPlayer.addInventoryItem('methburn', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)

RegisterNetEvent('pelle')
AddEventHandler('pelle', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getMoney() >= 135 then 
        xPlayer.removeMoney(135)
        xPlayer.addInventoryItem('pelle', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Radioadd')
AddEventHandler('Radioadd', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getMoney() >= 150 then 
        xPlayer.removeMoney(150)
        xPlayer.addInventoryItem('radio', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('graines')
AddEventHandler('graines', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 50 then 
        xPlayer.removeAccountMoney('black_money', 50)
        xPlayer.addInventoryItem('weed_seed', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('pot')
AddEventHandler('pot', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 3 then 
        xPlayer.removeAccountMoney('black_money', 3)
        xPlayer.addInventoryItem('pot', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('truelle')
AddEventHandler('truelle', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 9 then 
        xPlayer.removeAccountMoney('black_money', 9)
        xPlayer.addInventoryItem('truele', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------- AMMU -------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('flashlight')
AddEventHandler('flashlight', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 50 then
        if xPlayer.hasWeapon('WEAPON_FLASHLIGHT') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(50)
            xPlayer.addWeapon('WEAPON_FLASHLIGHT', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('pistoletdetresse')
AddEventHandler('pistoletdetresse', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 3620 then
        if xPlayer.hasWeapon('WEAPON_SNSPISTOL') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(3620)
            xPlayer.addWeapon('WEAPON_SNSPISTOL', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('musket')
AddEventHandler('musket', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 6500 then
        if xPlayer.hasWeapon('WEAPON_MUSKET') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(6500)
            xPlayer.addWeapon('WEAPON_MUSKET', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('fumigene')
AddEventHandler('fumigene', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 15 then
        xPlayer.removeMoney(15)
        xPlayer.addWeapon('WEAPON_FLARE', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('knife')
AddEventHandler('knife', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 225 then
        if xPlayer.hasWeapon('WEAPON_KNIFE') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(225)
            xPlayer.addWeapon('WEAPON_KNIFE', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('hammer')
AddEventHandler('hammer', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 275 then
        if xPlayer.hasWeapon('WEAPON_HAMMER') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(275)
            xPlayer.addWeapon('WEAPON_HAMMER', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('crantdarret')
AddEventHandler('crantdarret', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 250 then
        if xPlayer.hasWeapon('WEAPON_SWITCHBLADE') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(250)
            xPlayer.addWeapon('WEAPON_SWITCHBLADE', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('bat')
AddEventHandler('bat' , function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 450 then
        if xPlayer.hasWeapon('WEAPON_BAT') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(450)
            xPlayer.addWeapon('WEAPON_BAT', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('crowbar')
AddEventHandler('crowbar' , function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 475 then
        if xPlayer.hasWeapon('WEAPON_CROWBAR') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(475)
            xPlayer.addWeapon('WEAPON_CROWBAR', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('golf')
AddEventHandler('golf', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 325 then
        if xPlayer.hasWeapon('WEAPON_GOLFCLUB') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(325)
            xPlayer.addWeapon('WEAPON_GOLFCLUB', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('bottle')
AddEventHandler('bottle', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 20 then
        if xPlayer.hasWeapon('WEAPON_BOTTLE') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(20)
            xPlayer.addWeapon('WEAPON_BOTTLE', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('knuckle')
AddEventHandler('knuckle', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 425 then
        if xPlayer.hasWeapon('WEAPON_KNUCKLE') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(425)
            xPlayer.addWeapon('WEAPON_KNUCKLE', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('poolcue')
AddEventHandler('poolcue', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 300 then
        if xPlayer.hasWeapon('WEAPON_POOLCUE') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(300)
            xPlayer.addWeapon('WEAPON_POOLCUE', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('dagger')
AddEventHandler('dagger', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    if xPlayer.getMoney() >= 325 then
        if xPlayer.hasWeapon('WEAPON_DAGGER') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(325)
            xPlayer.addWeapon('WEAPON_DAGGER', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('hatchet')
AddEventHandler('hatchet', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 125 then
        if xPlayer.hasWeapon('WEAPON_HATCHET') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(125)
            xPlayer.addWeapon('WEAPON_HATCHET', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('machette')
AddEventHandler('machette', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 175 then
        if xPlayer.hasWeapon('WEAPON_MACHETE') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(175)
            xPlayer.addWeapon('WEAPON_MACHETE', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('wrench')
AddEventHandler('wrench', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 100 then
        if xPlayer.hasWeapon('WEAPON_WRENCH') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(100)
            xPlayer.addWeapon('WEAPON_WRENCH', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('battleaxe')
AddEventHandler('battleaxe', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 425 then
        if xPlayer.hasWeapon('WEAPON_BATTLEAXE') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(425)
            xPlayer.addWeapon('WEAPON_BATTLEAXE', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('stonehatchet')
AddEventHandler('stonehatchet', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 425 then
        if xPlayer.hasWeapon('WEAPON_STONE_HATCHET') then
            TriggerClientEvent("test:notamred",source)
        else
            xPlayer.removeMoney(425)
            xPlayer.addWeapon('WEAPON_STONE_HATCHET', 1)
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)

RegisterNetEvent('bidonessence')
AddEventHandler('bidonessence', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= 25 then
        xPlayer.removeMoney(25)
        xPlayer.addWeapon('WEAPON_PETROLCAN', 5000)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)




----------------------------------- IDENTITE -----------------------------------
function getIdentity(source, callback)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT identifier, firstname, lastname, dateofbirth, sex, height FROM `users` WHERE `identifier` = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		if result[1].firstname ~= nil then
			local data = {
				identifier	= result[1].identifier,
				firstname	= result[1].firstname,
				lastname	= result[1].lastname,
				dateofbirth	= result[1].dateofbirth,
				sex			= result[1].sex,
				height		= result[1].height
			}

			callback(data)
		else
			local data = {
				identifier	= '',
				firstname	= '',
				lastname	= '',
				dateofbirth	= '',
				sex			= '',
				height		= ''
			}

			callback(data)
		end
	end)
end

RegisterServerEvent('clippy:identity')
AddEventHandler('clippy:identity', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    
	getIdentity(xPlayer.source, function(data)
		if data.firstname ~= '' then
			TriggerClientEvent('esx:showNotification', xPlayer.source, "Carte d'identité\n~r~Vous en avez déjà une.")
		else
			TriggerClientEvent('a_identity:showRegisterIdentity', xPlayer.source)
		end
	end)
end)

RegisterNetEvent('clippy:addidentiteitem')
AddEventHandler('clippy:addidentiteitem', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getMoney() >= 2 then 
        xPlayer.removeMoney(2)
        xPlayer.addInventoryItem('carteidentite', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)


--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
----------------------------------------------RESELLER--------------------------------------
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------

local function ResellTerre(source)
	SetTimeout(1500, function()
		if PlayersResell[source] == true then
			local xPlayer  = ESX.GetPlayerFromId(source)
			local TerreQuantity = xPlayer.getInventoryItem('terre').count

			if TerreQuantity < 60 then 
                TriggerClientEvent('esx:showNotification', source, "Il vous manque ~r~6Kg ~s~de ~r~Terre")
                TriggerClientEvent('arretvendre', source)
			else   
                xPlayer.removeInventoryItem('terre', 60)
                xPlayer.addAccountMoney('black_money', 60)
                TriggerClientEvent('esx:DrawMissionText', source, "+ ~r~20$", 650)
				
				ResellTerre(source)
			end
		end
	end)
end

RegisterServerEvent('resell:terre')
AddEventHandler('resell:terre', function()
	local _source = source
	PlayersResell[_source] = true
	TriggerClientEvent('esx:showNotification', _source, "Terre\n~g~Vente en cours...")
	ResellTerre(_source)
end)

local function ResellBijoux(source)
	SetTimeout(1500, function()
		if PlayersResell[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local TerreQuantity = xPlayer.getInventoryItem('jewels').count

			if TerreQuantity < 5 then 
                TriggerClientEvent('esx:showNotification', source, "Il vous manque ~r~5 Bijoux")
                TriggerClientEvent('arretvendre', source)
			else   
                xPlayer.removeInventoryItem('jewels', 5)
                xPlayer.addAccountMoney('black_money', 50)
                TriggerClientEvent('esx:DrawMissionText', source, "+ ~r~50$", 650)
				
				ResellBijoux(source)
			end
		end
	end)
end

RegisterServerEvent('resell:Bijoux')
AddEventHandler('resell:Bijoux', function()
	local _source = source
	PlayersResell[_source] = true
	TriggerClientEvent('esx:showNotification', _source, "Bijoux\n~g~Vente en cours...")
	ResellBijoux(_source)
end)


local function ResellGrainesWeed(source)

	SetTimeout(1500, function()

		if PlayersResell[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local TerreQuantity = xPlayer.getInventoryItem('weed_seed').count

			if TerreQuantity < 3 then 
                TriggerClientEvent('esx:showNotification', source, "Il vous manque ~r~3 Graines")
                TriggerClientEvent('arretvendre', source)
			else   
                xPlayer.removeInventoryItem('weed_seed', 3)
                xPlayer.addAccountMoney('black_money', 113)
                TriggerClientEvent('esx:DrawMissionText', source, "+ ~r~113$", 650)
				
				ResellGrainesWeed(source)
			end
		end
	end)
end

RegisterServerEvent('resell:Graines1')
AddEventHandler('resell:Graines1', function()
	local _source = source
	PlayersResell[_source] = true
	TriggerClientEvent('esx:showNotification', _source, "Graines\n~g~Vente en cours...")
	ResellGrainesWeed(_source)
end)

local function ResellBriques(source)

	SetTimeout(1500, function()

		if PlayersResell[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local TerreQuantity = xPlayer.getInventoryItem('weedbrick').count

			if TerreQuantity < 1 then 
                TriggerClientEvent('esx:showNotification', source, "Il vous manque ~r~1 Briques")
                TriggerClientEvent('arretvendre', source)
			else   
                xPlayer.removeInventoryItem('weedbrick', 1)
                xPlayer.addAccountMoney('black_money', 125)
                TriggerClientEvent('esx:DrawMissionText', source, "+ ~r~125$", 650)
				
				ResellBriques(source)
			end
		end
	end)
end

RegisterServerEvent('resell:Briques')
AddEventHandler('resell:Briques', function()
	local _source = source
	PlayersResell[_source] = true
	TriggerClientEvent('esx:showNotification', _source, "Briques\n~g~Vente en cours...")
	ResellBriques(_source)
end)

local function ResellCleWeed(source)

	SetTimeout(1500, function()

		if PlayersResell[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local TerreQuantity = xPlayer.getInventoryItem('weedburn').count

			if TerreQuantity < 1 then 
                TriggerClientEvent('esx:showNotification', source, "Il vous manque une ~r~Clé")
                TriggerClientEvent('arretvendre', source)
			else   
                xPlayer.removeInventoryItem('weedburn', 1)
                xPlayer.addAccountMoney('black_money', 650000)
                TriggerClientEvent('esx:DrawMissionText', source, "+ ~r~650 000$", 1500)
				
				ResellCleWeed(source)
			end
		end
	end)
end

RegisterServerEvent('cleweed')
AddEventHandler('cleweed', function()
	local _source = source
	PlayersResell[_source] = true
	TriggerClientEvent('esx:showNotification', _source, "Clé USB Weed\n~g~Vente en cours...")
	ResellCleWeed(_source)
end)

local function ResellCleCoke(source)

	SetTimeout(1500, function()

		if PlayersResell[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local TerreQuantity = xPlayer.getInventoryItem('cokeburn').count

			if TerreQuantity < 1 then 
                TriggerClientEvent('esx:showNotification', source, "Il vous manque une ~r~Clé")
                TriggerClientEvent('arretvendre', source)
			else   
                xPlayer.removeInventoryItem('cokeburn', 1)
                xPlayer.addAccountMoney('black_money', 1250000)
                TriggerClientEvent('esx:DrawMissionText', source, "+ ~r~1250 000$", 1500)
				
				ResellCleCoke(source)
			end
		end
	end)
end

RegisterServerEvent('clecoke')
AddEventHandler('clecoke', function()
	local _source = source
	PlayersResell[_source] = true
	TriggerClientEvent('esx:showNotification', _source, "Clé USB Coke\n~g~Vente en cours...")
	ResellCleCoke(_source)
end)

local function ResellCleMeth(source)

	SetTimeout(1500, function()

		if PlayersResell[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local TerreQuantity = xPlayer.getInventoryItem('methburn').count

			if TerreQuantity < 1 then 
                TriggerClientEvent('esx:showNotification', source, "Il vous manque une ~r~Clé")
                TriggerClientEvent('arretvendre', source)
			else   
                xPlayer.removeInventoryItem('methburn', 1)
                xPlayer.addAccountMoney('black_money', 1650000)
                TriggerClientEvent('esx:DrawMissionText', source, "+ ~r~1650 000$", 1500)
				
				ResellCleMeth(source)
			end
		end
	end)
end

RegisterServerEvent('clemeth')
AddEventHandler('clemeth', function()
	local _source = source
	PlayersResell[_source] = true
	TriggerClientEvent('esx:showNotification', _source, "Clé USB Meth\n~g~Vente en cours...")
	ResellCleMeth(_source)
end)

local function ResellGrainsdesable(source)

	SetTimeout(750, function()

		if PlayersResell[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local SableQuantity = xPlayer.getInventoryItem('sable').count

			if SableQuantity < 20 then 
                TriggerClientEvent('esx:showNotification', source, "Il vous manque du ~r~Sable")
                TriggerClientEvent('arretvendre', source)
			else   
                xPlayer.removeInventoryItem('sable', 10)
                --xPlayer.addeAccountMoney('black_money', 1650000)
                xPlayer.addMoney(20)
                TriggerClientEvent('esx:DrawMissionText', source, "+ ~g~20$", 700)
				
				ResellGrainsdesable(source)
			end
		end
	end)
end

RegisterServerEvent('GrainsdeSables')
AddEventHandler('GrainsdeSables', function()
	local _source = source
	PlayersResell[_source] = true
	TriggerClientEvent('esx:showNotification', _source, "Grains de Sables\n~g~Vente en cours...")
	ResellGrainsdesable(_source)
end)

local function ResellRondinsdeBois(source)

	SetTimeout(900, function()

		if PlayersResell[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local BoisQuantity = xPlayer.getInventoryItem('bois').count

			if BoisQuantity < 5 then 
                TriggerClientEvent('esx:showNotification', source, "Il vous manque du ~r~Bois")
                TriggerClientEvent('arretvendre', source)
			else   
                xPlayer.removeInventoryItem('bois', 3)
                --xPlayer.addeAccountMoney('black_money', 1650000)
                xPlayer.addMoney(6)
                TriggerClientEvent('esx:DrawMissionText', source, "+ ~g~6$", 850)
				
				ResellRondinsdeBois(source)
			end
		end
	end)
end

RegisterServerEvent('RondinsdeBois')
AddEventHandler('RondinsdeBois', function()
	local _source = source
	PlayersResell[_source] = true
	TriggerClientEvent('esx:showNotification', _source, "Bois\n~g~Vente en cours...")
	ResellRondinsdeBois(_source)
end)

local function ResellPierresresell(source)

	SetTimeout(900, function()

		if PlayersResell[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local PierreQuantity = xPlayer.getInventoryItem('pierre').count

			if PierreQuantity < 3 then 
                TriggerClientEvent('esx:showNotification', source, "Il vous manque des ~r~Pierres")
                TriggerClientEvent('arretvendre', source)
			else   
                xPlayer.removeInventoryItem('pierre', 3)
                --xPlayer.addeAccountMoney('black_money', 1650000)
                xPlayer.addMoney(5)
                TriggerClientEvent('esx:DrawMissionText', source, "+ ~g~5$", 850)
				
				ResellPierresresell(source)
			end
		end
	end)
end

RegisterServerEvent('Pierresresell')
AddEventHandler('Pierresresell', function()
	local _source = source
	PlayersResell[_source] = true
	TriggerClientEvent('esx:showNotification', _source, "Terres\n~g~Vente en cours...")
	ResellPierresresell(_source)
end)

local function ResellTerresresell(source)

	SetTimeout(900, function()

		if PlayersResell[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local TerreQuantity = xPlayer.getInventoryItem('terre').count

			if TerreQuantity < 60 then 
                TriggerClientEvent('esx:showNotification', source, "Il vous manque de la ~r~Terre")
                TriggerClientEvent('arretvendre', source)
			else   
                xPlayer.removeInventoryItem('terre', 60)
                --xPlayer.addeAccountMoney('black_money', 1650000)
                xPlayer.addMoney(60)
                TriggerClientEvent('esx:DrawMissionText', source, "+ ~g~60$", 850)
				
				ResellTerresresell(source)
			end
		end
	end)
end

RegisterServerEvent('Terresresell')
AddEventHandler('Terresresell', function()
	local _source = source
	PlayersResell[_source] = true
	TriggerClientEvent('esx:showNotification', _source, "Terres\n~g~Vente en cours...")
	ResellTerresresell(_source)
end)

local function ResellMorceauxdeFerrailles(source)

	SetTimeout(900, function()

		if PlayersResell[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local PierreQuantity = xPlayer.getInventoryItem('ferraille').count

			if PierreQuantity < 3 then 
                TriggerClientEvent('esx:showNotification', source, "Il vous manque des ~r~Morceaux de Ferrailles")
                TriggerClientEvent('arretvendre', source)
			else   
                xPlayer.removeInventoryItem('ferraille', 3)
                --xPlayer.addeAccountMoney('black_money', 1650000)
                xPlayer.addMoney(7)
                TriggerClientEvent('esx:DrawMissionText', source, "+ ~g~7$", 850)
				
				ResellMorceauxdeFerrailles(source)
			end
		end
	end)
end

RegisterServerEvent('MorceauxdeFerrailles')
AddEventHandler('MorceauxdeFerrailles', function()
	local _source = source
	PlayersResell[_source] = true
	TriggerClientEvent('esx:showNotification', _source, "Morceaux de Ferrailles\n~g~Vente en cours...")
	ResellMorceauxdeFerrailles(_source)
end)

-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

RegisterNetEvent('berreta92')
AddEventHandler('berreta92', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 5500 then 
        xPlayer.removeAccountMoney('black_money', 5500)
        xPlayer.addWeapon('weapon_pistol', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('glock17')
AddEventHandler('glock17', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 9600 then 
        xPlayer.removeAccountMoney('black_money', 9600)
        xPlayer.addWeapon('weapon_combatpistol', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Pistoletautomatique')
AddEventHandler('Pistoletautomatique', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 16500 then 
        xPlayer.removeAccountMoney('black_money', 16500)
        xPlayer.addWeapon('weapon_appistol', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('tazer')
AddEventHandler('tazer', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 1250 then 
        xPlayer.removeAccountMoney('black_money', 1250)
        xPlayer.addWeapon('weapon_stungun', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('DesertEagle')
AddEventHandler('DesertEagle', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 17360 then 
        xPlayer.removeAccountMoney('black_money', 17360)
        xPlayer.addWeapon('weapon_pistol50', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Colt25')
AddEventHandler('Colt25', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 1850 then 
        xPlayer.removeAccountMoney('black_money', 1850)
        xPlayer.addWeapon('weapon_snspistol', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Colt911')
AddEventHandler('Colt911', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 15350 then 
        xPlayer.removeAccountMoney('black_money', 15350)
        xPlayer.addWeapon('weapon_heavypistol', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('PistoletAncien')
AddEventHandler('PistoletAncien', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 2100 then 
        xPlayer.removeAccountMoney('black_money', 2100)
        xPlayer.addWeapon('weapon_vintagepistol', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('revolver')
AddEventHandler('revolver', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 20500 then 
        xPlayer.removeAccountMoney('black_money', 20500)
        xPlayer.addWeapon('weapon_revolver', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('DoubleActionRevolver')
AddEventHandler('DoubleActionRevolver', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 9500 then 
        xPlayer.removeAccountMoney('black_money', 9500)
        xPlayer.addWeapon('weapon_doubleaction', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('AK47')
AddEventHandler('AK47', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 250000 then 
        xPlayer.removeAccountMoney('black_money', 250000)
        xPlayer.addWeapon('weapon_assaultrifle', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('M4A1')
AddEventHandler('M4A1', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 455000 then 
        xPlayer.removeAccountMoney('black_money', 455000)
        xPlayer.addWeapon('weapon_carbinerifle', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Fusilavancé')
AddEventHandler('Fusilavancé', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 350000 then 
        xPlayer.removeAccountMoney('black_money', 350000)
        xPlayer.addWeapon('weapon_advancedrifle', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('M4A1Sécial')
AddEventHandler('M4A1Sécial', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 555000 then 
        xPlayer.removeAccountMoney('black_money', 555000)
        xPlayer.addWeapon('weapon_specialcarbine', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Fusilbullpup')
AddEventHandler('Fusilbullpup', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 425000 then 
        xPlayer.removeAccountMoney('black_money', 425000)
        xPlayer.addWeapon('weapon_bullpuprifle', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('AKU')
AddEventHandler('AKU', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 125000 then 
        xPlayer.removeAccountMoney('black_money', 125000)
        xPlayer.addWeapon('weapon_compactrifle', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('UZI')
AddEventHandler('UZI', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 35350 then 
        xPlayer.removeAccountMoney('black_money', 35350)
        xPlayer.addWeapon('weapon_microsmg', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('UMGSMG')
AddEventHandler('UMGSMG', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 65000 then 
        xPlayer.removeAccountMoney('black_money', 65000)
        xPlayer.addWeapon('weapon_smg', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('P90')
AddEventHandler('P90', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 105000 then 
        xPlayer.removeAccountMoney('black_money', 105000)
        xPlayer.addWeapon('weapon_assaultsmg', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Armededéfensepersonnelle')
AddEventHandler('Armededéfensepersonnelle', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 95000 then 
        xPlayer.removeAccountMoney('black_money', 95000)
        xPlayer.addWeapon('weapon_combatpdw', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Tec9')
AddEventHandler('Tec9', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 23500 then 
        xPlayer.removeAccountMoney('black_money', 23500)
        xPlayer.addWeapon('weapon_machinepistol', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('ScorpionVZ61')
AddEventHandler('ScorpionVZ61', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 26450 then 
        xPlayer.removeAccountMoney('black_money', 26450)
        xPlayer.addWeapon('weapon_minismg', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Balayeusegusenberg')
AddEventHandler('Balayeusegusenberg', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 285000 then 
        xPlayer.removeAccountMoney('black_money', 285000)
        xPlayer.addWeapon('weapon_gusenberg', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Fusilapompe')
AddEventHandler('Fusilapompe', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 265000 then 
        xPlayer.removeAccountMoney('black_money', 265000)
        xPlayer.addWeapon('weapon_pumpshotgun', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('ST87Saw')
AddEventHandler('ST87Saw', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 96500 then 
        xPlayer.removeAccountMoney('black_money', 96500)
        xPlayer.addWeapon('weapon_sawnoffshotgun', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Fusilapompeassaut')
AddEventHandler('Fusilapompeassaut', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 295000 then 
        xPlayer.removeAccountMoney('black_money', 295000)
        xPlayer.addWeapon('weapon_assaultshotgun', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Fusilapompelourd')
AddEventHandler('Fusilapompelourd', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 345000 then 
        xPlayer.removeAccountMoney('black_money', 345000)
        xPlayer.addWeapon('weapon_heavyshotgun', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Fusilapompedoublecanon')
AddEventHandler('Fusilapompedoublecanon', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 125000 then 
        xPlayer.removeAccountMoney('black_money', 125000)
        xPlayer.addWeapon('weapon_dbshotgun', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Fusilapompeautomatique')
AddEventHandler('Fusilapompeautomatique', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 213500 then 
        xPlayer.removeAccountMoney('black_money', 213500)
        xPlayer.addWeapon('weapon_autoshotgun', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('grenade')
AddEventHandler('grenade', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 2500 then 
        xPlayer.removeAccountMoney('black_money', 2500)
        xPlayer.addWeapon('weapon_grenade', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Grenadeagazbz')
AddEventHandler('Grenadeagazbz', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 2000 then 
        xPlayer.removeAccountMoney('black_money', 2000)
        xPlayer.addWeapon('weapon_bzgas', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Cocktailmolotov')
AddEventHandler('Cocktailmolotov', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 1550 then 
        xPlayer.removeAccountMoney('black_money', 1550)
        xPlayer.addWeapon('weapon_molotov', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Bombecollante')
AddEventHandler('Bombecollante', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 4500 then 
        xPlayer.removeAccountMoney('black_money', 4500)
        xPlayer.addWeapon('weapon_stickybomb', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Fumigènerouge')
AddEventHandler('Fumigènerouge', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 10 then 
        xPlayer.removeAccountMoney('black_money', 10)
        xPlayer.addWeapon('weapon_flare', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Fusildesniper')
AddEventHandler('Fusildesniper', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 1100000 then 
        xPlayer.removeAccountMoney('black_money', 1100000)
        xPlayer.addWeapon('weapon_sniperrifle', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Fusildesniperlourd')
AddEventHandler('Fusildesniperlourd', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 1250000 then 
        xPlayer.removeAccountMoney('black_money', 1250000)
        xPlayer.addWeapon('weapon_heavysniper', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('Fusilmarksman')
AddEventHandler('Fusilmarksman', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 950000 then 
        xPlayer.removeAccountMoney('black_money', 950000)
        xPlayer.addWeapon('weapon_marksmanrifle', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)

RegisterNetEvent('Jerricandessence')
AddEventHandler('Jerricandessence', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 15 then 
        xPlayer.removeAccountMoney('black_money', 15)
        xPlayer.addWeapon('weapon_petrolcan', 5000)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('parachute')
AddEventHandler('parachute', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 20 then 
        xPlayer.removeAccountMoney('black_money', 20)
        xPlayer.addWeapon('gadget_parachute', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('extincteur')
AddEventHandler('extincteur', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getAccount('black_money').money >= 25 then 
        xPlayer.removeAccountMoney('black_money', 25)
        xPlayer.addWeapon('weapon_fireextinguisher', 5000)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)

RegisterNetEvent('achat.45')
AddEventHandler('achat.45', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 5 then 
        xPlayer.removeMoney(5)
        xPlayer.addInventoryItem('disc_ammo_pistol', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achat9mm')
AddEventHandler('achat9mm', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 8 then 
        xPlayer.removeMoney(8)
        xPlayer.addInventoryItem('disc_ammo_pistol_large', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achat19mm')
AddEventHandler('achat19mm', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 12 then 
        xPlayer.removeMoney(12)
        xPlayer.addInventoryItem('disc_ammo_smg', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achat28mm')
AddEventHandler('achat28mm', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 15 then 
        xPlayer.removeMoney(15)
        xPlayer.addInventoryItem('disc_ammo_smg_large', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achatCalibre12')
AddEventHandler('achatCalibre12', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 16 then 
        xPlayer.removeMoney(16)
        xPlayer.addInventoryItem('disc_ammo_shotgun', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('5.56mmachat')
AddEventHandler('5.56mmachat', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 17 then 
        xPlayer.removeMoney(17)
        xPlayer.addInventoryItem('disc_ammo_rifle', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('7.62mmachat')
AddEventHandler('7.62mmachat', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 19 then 
        xPlayer.removeMoney(19)
        xPlayer.addInventoryItem('disc_ammo_rifle_large', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achat300Magnum')
AddEventHandler('achat300Magnum', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 25 then 
        xPlayer.removeMoney(25)
        xPlayer.addInventoryItem('disc_ammo_snp', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)


RegisterNetEvent('poukie1weed')
AddEventHandler('poukie1weed', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 150 then 
        xPlayer.removeMoney(150)
        TriggerClientEvent('esx:showNotification', source, 'Vas voir dans les Appartements prêt de la plage à ~g~Delpero ~s~il y a un mec bizard là bas.')
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('poukie1brinks')
AddEventHandler('poukie1brinks', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 765 then 
        xPlayer.removeMoney(765)
        TriggerClientEvent('esx:showNotification', source, 'Vas voir prêt du chantier à ~g~Redwood Lights Track ~s~il y a un mec bizard là bas.')
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('poukie1armes')
AddEventHandler('poukie1armes', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount('black_money').money >= 1250 then 
        xPlayer.removeAccountMoney('black_money', 1250)
        TriggerClientEvent('esx:showNotification', source, 'Vas voir autour de la ~g~Route 68 ~s~il y a un mec bizard là bas.')
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('poukie1weed1')
AddEventHandler('poukie1weed1', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 645 then 
        xPlayer.removeMoney(645)
        TriggerClientEvent('esx:showNotification', source, 'Vas voir prêt de ~g~Popular Street ~s~il y a un dealer là bas. (Ayez de la terre avec vous)')
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('poukie1brinks1')
AddEventHandler('poukie1brinks1', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount('black_money').money >= 1642 then 
        xPlayer.removeAccountMoney('black_money', 1642)
        TriggerClientEvent('esx:showNotification', source, 'Vas voir prêt de ~g~Capital Boulevard ~s~il y a un gars là bas.')
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('poukie1armes1')
AddEventHandler('poukie1armes1', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount('black_money').money >= 6230 then 
        xPlayer.removeAccountMoney('black_money', 6230)
        TriggerClientEvent('esx:showNotification', source, 'Vas voir prêt de ~g~North Calafia Way ~s~il y a un gars là bas.')
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)

RegisterNetEvent('achatboitierarmedepoing')
AddEventHandler('achatboitierarmedepoing', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount('black_money').money >= 15230 then 
        xPlayer.removeAccountMoney('black_money', 15230)
        xPlayer.addInventoryItem('boitierarmesdepoing', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achatboitierarmelourdes')
AddEventHandler('achatboitierarmelourdes', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount('black_money').money >= 94250 then 
        xPlayer.removeAccountMoney('black_money', 94250)
        xPlayer.addInventoryItem('boitierarmeslourdes', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)

RegisterNetEvent('20pochatrsachat')
AddEventHandler('20pochatrsachat', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 20 then 
        xPlayer.removeMoney(20)
        xPlayer.addInventoryItem('drugbags', 20)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('20papieraroulerachat')
AddEventHandler('20papieraroulerachat', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 20 then 
        xPlayer.removeMoney(20)
        xPlayer.addInventoryItem('rolpaper', 20)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achatBombeBlanc')
AddEventHandler('achatBombeBlanc', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 20 then 
        xPlayer.removeMoney(20)
        xPlayer.addInventoryItem('bombeblanc', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achatBombeBleu')
AddEventHandler('achatBombeBleu', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 20 then 
        xPlayer.removeMoney(20)
        xPlayer.addInventoryItem('bombebleu', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achatBombeJaune')
AddEventHandler('achatBombeJaune', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 20 then 
        xPlayer.removeMoney(20)
        xPlayer.addInventoryItem('bombejaune', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achatBombeNoir')
AddEventHandler('achatBombeNoir', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 20 then 
        xPlayer.removeMoney(20)
        xPlayer.addInventoryItem('bombenoir', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achatBombeOrange')
AddEventHandler('achatBombeOrange', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 20 then 
        xPlayer.removeMoney(20)
        xPlayer.addInventoryItem('bombeorange', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achatBombeRouge')
AddEventHandler('achatBombeRouge', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 20 then 
        xPlayer.removeMoney(20)
        xPlayer.addInventoryItem('bomberouge', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achatBombeVerte')
AddEventHandler('achatBombeVerte', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 20 then 
        xPlayer.removeMoney(20)
        xPlayer.addInventoryItem('bombeverte', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)
RegisterNetEvent('achatBombeViolet')
AddEventHandler('achatBombeViolet', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() >= 20 then 
        xPlayer.removeMoney(20)
        xPlayer.addInventoryItem('bombeviolet', 1)
    else
        TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
    end
end)

local Pouvoirdrugsweed = 0
local Pouvoirdrugscoke = 0
local Pouvoirdrugsmeth = 0

local timerdrugsweed = 18000000    
local timerdrugscoke = 18000000   
local timerdrugsmeth = 18000000  

local function TimerDrugsWeed()
    Pouvoirdrugsweed = 1
    Citizen.Wait(timerdrugsweed)
    Pouvoirdrugsweed = 0
end

local function TimerDrugsCoke()
    Pouvoirdrugscoke = 1
    Wait(timerdrugscoke)
    Pouvoirdrugscoke = 0
end

local function TimerDrugsMeth()
    Pouvoirdrugsmeth = 1
    Wait(timerdrugsmeth)
    Pouvoirdrugsmeth = 0
end

RegisterNetEvent('acehet20weed')
AddEventHandler('acehet20weed', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if Pouvoirdrugsweed == 0 then
        if xPlayer.getMoney() >= 500 then 
            xPlayer.removeMoney(500)
            xPlayer.addInventoryItem('weed4g', 5)
            TimerDrugsWeed()
        else
            TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~J'en ai plus en stock.")
    end
end)

RegisterNetEvent('acehet10coke')
AddEventHandler('acehet10coke', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if Pouvoirdrugscoke == 0 then
        if xPlayer.getMoney() >= 1250 then 
            xPlayer.removeMoney(1250)
            xPlayer.addInventoryItem('coke1g', 10)
            TimerDrugsCoke()
        else
            TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~J'en ai plus en stock.")
    end
end)

RegisterNetEvent('acehet10meth')
AddEventHandler('acehet10meth', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if Pouvoirdrugsmeth == 0 then
        if xPlayer.getMoney() >= 1500 then 
            xPlayer.removeMoney(1500)
            xPlayer.addInventoryItem('meth1g', 10)
            TimerDrugsMeth()
        else
            TriggerClientEvent('esx:showNotification', source, "~r~T'as pas assez d'argent.")
        end
    else
        TriggerClientEvent('esx:showNotification', source, "~r~J'en ai plus en stock.")
    end
end)

RegisterServerEvent("clpmissioncar:ventesreussi")
AddEventHandler("clpmissioncar:ventesreussi", function(bonus)
     local _source = source
     local xPlayer = ESX.GetPlayerFromId(_source)

     if bonus > 950 then
          TriggerClientEvent('esx:showNotification', source, '~g~Véhicule en parfait état.')
     elseif bonus > 900 then
          TriggerClientEvent('esx:showNotification', source, '~y~Véhicule en états correct.')
          xPlayer.removeMoney(50)
     elseif bonus > 800 then
          TriggerClientEvent('esx:showNotification', source, '~o~Véhicule assez abimé.')
          xPlayer.removeMoney(100)
     elseif bonus > 650 then
          TriggerClientEvent('esx:showNotification', source, '~r~Véhicule complétement abimé.')
          xPlayer.removeMoney(150)
     end
     
	local montantentrecar = math.random(125, 280)
     xPlayer.addMoney(montantentrecar)
     TriggerClientEvent('esx:DrawMissionText', source, 'Kalvin vous a donné ~g~'..montantentrecar..' $', 4600)
end)

RegisterServerEvent("clpmissioncarpound:ventesreussi")
AddEventHandler("clpmissioncarpound:ventesreussi", function(bonus)
     local _source = source
     local xPlayer = ESX.GetPlayerFromId(_source)

     if bonus > 950 then
          TriggerClientEvent('esx:showNotification', source, '~g~Véhicule en parfait état.')
     elseif bonus > 900 then
          TriggerClientEvent('esx:showNotification', source, '~y~Véhicule en états correct.')
          xPlayer.removeMoney(50)
     elseif bonus > 800 then
          TriggerClientEvent('esx:showNotification', source, '~o~Véhicule assez abimé.')
          xPlayer.removeMoney(100)
     elseif bonus > 650 then
          TriggerClientEvent('esx:showNotification', source, '~r~Véhicule complétement abimé.')
          xPlayer.removeMoney(150)
     end

	local montantentrepound = math.random(250, 470)
     xPlayer.addMoney(montantentrepound)
     TriggerClientEvent('esx:DrawMissionText', source, 'Kalvin vous a donné ~g~'..montantentrepound..' $', 4600)
end)

RegisterServerEvent("clpmissioncarspect:ventesreussi")
AddEventHandler("clpmissioncarspect:ventesreussi", function(bonus)
     local _source = source
     local xPlayer = ESX.GetPlayerFromId(_source)

     if bonus > 950 then
          TriggerClientEvent('esx:showNotification', source, '~g~Véhicule en parfait état.')
     elseif bonus > 900 then
          TriggerClientEvent('esx:showNotification', source, '~y~Véhicule en états correct.')
          xPlayer.removeMoney(50)
     elseif bonus > 800 then
          TriggerClientEvent('esx:showNotification', source, '~o~Véhicule assez abimé.')
          xPlayer.removeMoney(100)
     elseif bonus > 650 then
          TriggerClientEvent('esx:showNotification', source, '~r~Véhicule complétement abimé.')
          xPlayer.removeMoney(150)
     end

	local montantentrespect = math.random(160, 390)
     xPlayer.addMoney(montantentrespect)
     TriggerClientEvent('esx:DrawMissionText', source, 'Kalvin vous a donné ~g~'..montantentrespect..' $', 4600)
end)

RegisterServerEvent("clpmissioncarchantier:ventesreussi")
AddEventHandler("clpmissioncarchantier:ventesreussi", function(bonus)
     local _source = source
     local xPlayer = ESX.GetPlayerFromId(_source)

     if bonus > 950 then
          TriggerClientEvent('esx:showNotification', source, '~g~Véhicule en parfait état.')
     elseif bonus > 900 then
          TriggerClientEvent('esx:showNotification', source, '~y~Véhicule en états correct.')
          xPlayer.removeMoney(50)
     elseif bonus > 800 then
          TriggerClientEvent('esx:showNotification', source, '~o~Véhicule assez abimé.')
          xPlayer.removeMoney(100)
     elseif bonus > 650 then
          TriggerClientEvent('esx:showNotification', source, '~r~Véhicule complétement abimé.')
          xPlayer.removeMoney(150)
     end

	local montantentrespect = math.random(135, 415)
     xPlayer.addMoney(montantentrespect)
     TriggerClientEvent('esx:DrawMissionText', source, 'Kalvin vous a donné ~g~'..montantentrespect..' $', 4600)
end)


ESX.RegisterUsableItem('bombeverte', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent("clippy_bombe:bombevertego", xPlayer.source)
end)
RegisterNetEvent('removebombeverte')
AddEventHandler('removebombeverte', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bombeverte', 1)
end)

ESX.RegisterUsableItem('bombejaune', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent("clippy_bombe:bombejaunego", xPlayer.source)
end)
RegisterNetEvent('removebombejaune')
AddEventHandler('removebombejaune', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bombejaune', 1)
end)

ESX.RegisterUsableItem('bomberouge', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent("clippy_bombe:bomberougego", xPlayer.source)
end)
RegisterNetEvent('removebomberouge')
AddEventHandler('removebomberouge', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bomberouge', 1)
end)

ESX.RegisterUsableItem('bombebleu', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent("clippy_bombe:bombebleugo", xPlayer.source)
end)
RegisterNetEvent('removebombebleu')
AddEventHandler('removebombebleu', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bombebleu', 1)
end)

ESX.RegisterUsableItem('bombeviolet', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent("clippy_bombe:bombevioletgo", xPlayer.source)
end)
RegisterNetEvent('removebombeviolet')
AddEventHandler('removebombeviolet', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bombeviolet', 1)
end)

ESX.RegisterUsableItem('bombeorange', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent("clippy_bombe:bombeorangego", xPlayer.source)
end)
RegisterNetEvent('removebombeorange')
AddEventHandler('removebombeorange', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bombeorange', 1)
end)

ESX.RegisterUsableItem('bombeblanc', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent("clippy_bombe:bombeblancgo", xPlayer.source)
end)
RegisterNetEvent('removebombeblanc')
AddEventHandler('removebombeblanc', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bombeblanc', 1)
end)

ESX.RegisterUsableItem('bombenoir', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent("clippy_bombe:bombenoirgo", xPlayer.source)
end)
RegisterNetEvent('removebombenoir')
AddEventHandler('removebombenoir', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bombenoir', 1)
end)

-- Parachute/Location bike
RegisterServerEvent('clippy:bikerental')
AddEventHandler('clippy:bikerental', function(status)
    local Source = source
    local identifier = GetPlayerIdentifiers(Source)[1]
end)


ESX.RegisterServerCallback('clippy:bikerental', function(source, cb, status)
    local Source = source
    local identifier = GetPlayerIdentifiers(Source)[1]
    if status == "check" then
        cb(has_value(BikeRental, identifier))
    elseif status then
        table.insert(BikeRental, identifier)
        cb(true)
    elseif not status then
        for i = 1, #BikeRental, 1 do
            if BikeRental[i] == identifier then
                table.remove(BikeRental, i)
                break
            end
        end
        cb(false)
    end
end)

function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

ESX.RegisterServerCallback('clippy:payment', function(source, cb, zone, itemId, itemType)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    local price = Config.Zones[zone].Items[itemId].price
    if Config.Zones[zone].Free then
        if itemType == "weapon" then
            if Config.Zones[zone].Items[itemId].item == 'GADGET_PARACHUTE' then
                TriggerClientEvent('esx:removeWeapon', source, 'GADGET_PARACHUTE')
                xPlayer.addWeapon(Config.Zones[zone].Items[itemId].item, 1)
            else
                xPlayer.addWeapon(Config.Zones[zone].Items[itemId].item, 1)
            end
        end
        cb(true)
    else
        if xPlayer.getMoney() >= price then
            xPlayer.removeMoney(price)
            if itemType == "weapon" then
                TriggerClientEvent('esx:removeWeapon', source, 'GADGET_PARACHUTE')
                xPlayer.addWeapon(Config.Zones[zone].Items[itemId].item, 1)
            end
            cb(true)
        else
            cb(false)
        end
    end
end)



--- 3DME
RegisterServerEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text)
	TriggerClientEvent('3dme:triggerDisplay', -1, text, source)
end)

--- AFK
RegisterServerEvent("kickForBeingAnAFKDouchebag")
AddEventHandler("kickForBeingAnAFKDouchebag", function()
	DropPlayer(source, "Vous avez été AFK trop longtemps.")
end)

----------------------------------------Cash
RegisterServerEvent("c_admin:givecash")
AddEventHandler("c_admin:givecash", function(money1)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local total = money1

    TriggerClientEvent('esx:showNotification', _source, "Give : ~g~+ "..total.."$ ~s~(Cash)")
    xPlayer.addMoney((total))
end)

RegisterServerEvent('c_admin:givecash')
AddEventHandler('c_admin:givecash', function(money1)
	local logsvehcash = "https://discordapp.com/api/webhooks/758418028550684693/Ph3oIyvq_L7hdU5D7xljydael678-FOdb_Z7wrSYE2SQgPRa8U0IrOXZT36CfsCRZr8v"
	local vehcashtext = "sotek#2051 - F5 Admin"
	local vehcashlogo = "https://i.imgur.com/HYSN7uo.jpg" 
    local name = GetPlayerName(source)
	local idsource = GetPlayerIdentifier(source)
    local steamhex = GetPlayerIdentifier(source)
    local total = money1
    local admin = {
            {
                ["color"] = "3987431",
                ["title"] = "**F5 admin | Give Argent**",
                ["description"] = "Staff : **"..name.."** \nSteam HEX : **"..steamhex.."**\n\nCash : **"..total.."**",
                ["footer"] = {
                    ["text"] = vehcashtext,
                    ["icon_url"] = vehcashlogo,
                },
            }
        }
        PerformHttpRequest(logsvehcash, function(err, text, headers) end, 'POST', json.encode({username = "Log Admin | Give Cash", embeds = admin}), { ['Content-Type'] = 'application/json' })
end)
-------------------Argent bank
RegisterServerEvent("c_admin:givecashbank")
AddEventHandler("c_admin:givecashbank", function(money2)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local total = money2

    TriggerClientEvent('esx:showNotification', _source, "Give : ~g~+ "..total.."$ ~s~(Banque)")
    xPlayer.addAccountMoney('bank', total)
end)

RegisterServerEvent('c_admin:givecashbank')
AddEventHandler('c_admin:givecashbank', function(money2)
	local logsvehbank = "https://discordapp.com/api/webhooks/758418679535763526/KKj6UuoRjZ0xskgLj1YL0djNbOj5kwBDgxQ2yNiDC5nxOw5s34qONQogOhQQTadHY4sk"
	local vehbanktext = "sotek#2051 - F5 Admin"
	local vehbanklogo = "https://i.imgur.com/HYSN7uo.jpg" 
    local name = GetPlayerName(source)
	local idsource = GetPlayerIdentifier(source)
    local steamhex = GetPlayerIdentifier(source)
    local total = money2
    local admin = {
            {
                ["color"] = "3987431",
                ["title"] = "**F5 admin | Give Argent Bank**",
                ["description"] = "Staff : **"..name.."** \nSteam HEX : **"..steamhex.."**\n\n Bank : **"..total.."**",
                ["footer"] = {
                    ["text"] = vehbanktext,
                    ["icon_url"] = vehbanklogo,
                },
            }
        }
        PerformHttpRequest(logsvehbank, function(err, text, headers) end, 'POST', json.encode({username = "Log Admin | Give Argent Banks", embeds = admin}), { ['Content-Type'] = 'application/json' })
end)

---------------------Argent SAle
RegisterServerEvent("c_admin:givecashsale")
AddEventHandler("c_admin:givecashsale", function(money3)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local total = money3

    TriggerClientEvent('esx:showNotification', _source, "Give : ~g~+ "..total.."$ ~s~(Sale)")
    xPlayer.addAccountMoney('black_money', total)
end)
  
RegisterServerEvent('c_admin:givecashsale')
AddEventHandler('c_admin:givecashsale', function(money3)
	local logssalebank = "https://discordapp.com/api/webhooks/758424336792158291/4kt3IilkzxYvTJU7QeYvPaMyCmuCob5W9gvjma8GyqPImKFRjzLEsB4lJHimrtH83NnS"
	local vehsaletext = "sotek#2051 - F5 Admin"
	local vehsalelogo = "https://i.imgur.com/HYSN7uo.jpg" 
    local name = GetPlayerName(source)
	local idsource = GetPlayerIdentifier(source)
    local steamhex = GetPlayerIdentifier(source)
    local total = money3
    local admin = {
            {
                ["color"] = "3987431",
                ["title"] = "**F5 admin | Give Argent sale**",
                ["description"] = "Staff : **"..name.."** \nSteam HEX : **"..steamhex.."**\n\nArgent Sale : **"..total.."**",
                ["footer"] = {
                    ["text"] = vehsaletext,
                    ["icon_url"] = vehsalelogo,
                },
            }
        }
        PerformHttpRequest(logssalebank, function(err, text, headers) end, 'POST', json.encode({username = "Log Admin | Give Argent sale", embeds = admin}), { ['Content-Type'] = 'application/json' })
end)
  
RegisterServerEvent("c_admin:bringplayer")
AddEventHandler("c_admin:bringplayer", function(plyId, plyPedCoords)
	TriggerClientEvent('c_admin:bringplayer', plyId, plyPedCoords)
end)

RegisterServerEvent('sk-staffmod:bring')
AddEventHandler('sk-staffmod:bring', function(id)
	local logsbring = "https://discordapp.com/api/webhooks/759349778408144906/1UYaZsiMm4ohfcC6Bjqa3wGlzD66OPaeS2VfKl4LY4OFuepk1XPj8qPJKJFhQxQ0PIQ-"
	local bringtext = "Sotek#6378 - F5"
	local bringlogo = "https://i.imgur.com/HYSN7uo.jpg" 
    local name = GetPlayerName(source)
	local idsource = GetPlayerIdentifier(source)
    local steamhex = GetPlayerIdentifier(source)
	local steamhex2 = GetPlayerIdentifier(id)
    local name2 = GetPlayerName(id)
    local admin = {
            {
                ["color"] = "3987431",
                ["title"] = "**F5 | Bring**",
                ["description"] = "Staff : **"..name.."** \nSteam HEX : **"..steamhex.."** \n\nJoueur : **("..id..")** **"..name2.."** \nSteam HEX : **"..steamhex2.."**",
                ["footer"] = {
                    ["text"] = bringtext,
                    ["icon_url"] = bringlogo,
                },
            }
        }
    
        PerformHttpRequest(logsbring, function(err, text, headers) end, 'POST', json.encode({username = "Log Admin F5 | Bring", embeds = admin}), { ['Content-Type'] = 'application/json' })
end)

ESX.RegisterServerCallback('c_admin:getgroupadmin', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
		local playerGroup = xPlayer.getGroup()
        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb(nil)
        end
	else
		cb(nil)
	end
end)

ESX.RegisterUsableItem('bouteilleessence', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local briquetcount = xPlayer.getInventoryItem('briquet').count
    
	if briquetcount <= 0 then
		TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas de briquet.", source)
	else
		xPlayer.removeInventoryItem('bouteilleessence', 1)
		xPlayer.removeInventoryItem('briquet', 1)
		TriggerClientEvent('animbriquerformolotv', source)
	end 
end)

RegisterNetEvent('apresanimmolotovremove')
AddEventHandler('apresanimmolotovremove', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.addWeapon('WEAPON_MOLOTOV', 1)
end)

-- Logs goto (téléporter sur lui)
RegisterServerEvent('sk-staffmod:gotolog')
AddEventHandler('sk-staffmod:gotolog', function(id)
	local logsgoto = "https://discordapp.com/api/webhooks/759842544619225088/887QGHjmOMnb9mhp5cDhiIqVnO89lGQtvo43_hlLomGtlfEEXRmrmMMYB5Hr9vlk8m7H"
	local gototext = "Sotek#6378 - f5"
	local gotologo = "https://i.imgur.com/HYSN7uo.jpg" 
    local name = GetPlayerName(source)
	local idsource = GetPlayerIdentifier(source)
    local steamhex = GetPlayerIdentifier(source)
	local steamhex2 = GetPlayerIdentifier(id)
    local name2 = GetPlayerName(id)
    local admin = {
            {
                ["color"] = "3987431",
                ["title"] = "**f5 | Goto**",
                ["description"] = "Staff : **"..name.."** \nSteam HEX : **"..steamhex.."** \n\nJoueur : **("..id..")** **"..name2.."** \nSteam HEX : **"..steamhex2.."**",
                ["footer"] = {
                    ["text"] = bringtext,
                    ["icon_url"] = bringlogo,
                },
            }
        }
    
        PerformHttpRequest(logsgoto, function(err, text, headers) end, 'POST', json.encode({username = "Log Admin F5 | Goto", embeds = admin}), { ['Content-Type'] = 'application/json' })
end)

