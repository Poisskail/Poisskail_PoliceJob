ESX = nil
TriggerEvent(Policeconfig.ESX, function(obj) ESX = obj end)
AddEventHandler('esx:playerLoaded', function(source, xPlayer)
	xPlayer.set('cuffState', {isCuffed = false, cuffMethod = nil})
end)
TriggerEvent('esx_phone:registerNumber', 'police', 'alerte police', true, true)
TriggerEvent('esx_society:registerSociety', 'police', 'police', 'society_police', 'society_police', 'society_police', {type = 'public'})
ESX.RegisterServerCallback('police:getOtherPlayerData', function(source, cb, target, notify)
    local xPlayer = ESX.GetPlayerFromId(target)
    TriggerClientEvent("esx:showNotification", target, notify)
    if xPlayer then
        local data = {
            name = xPlayer.getName(),
            job = xPlayer.job.label,
            grade = xPlayer.job.grade_label,
            inventory = xPlayer.getInventory(),
			Liquide = xPlayer.getMoney(),
            accounts = xPlayer.getAccounts(),
            weapons = xPlayer.getLoadout()
        }
        cb(data)
    end
end)
RegisterNetEvent('policeDog:hasClosestDrugs')
AddEventHandler('policeDog:hasClosestDrugs', function(playerId)
    local target = ESX.GetPlayerFromId(playerId)
    local src = source
    local inventory = target.inventory
    for i = 1, #inventory do
		
        for k, v in pairs(Config.Drugs) do
			print('b')
            if inventory[i].name == v and inventory[i].count > 0 then
                TriggerClientEvent('policeDog:hasDrugs', src, true)
                return
            end
        end
    end
    TriggerClientEvent('policeDog:hasDrugs', src, false)
end)

ESX.RegisterServerCallback("PoisskailDEV:getName", function(source, cb) 
	local xPlayer = ESX.GetPlayerFromId(source)
  
	if xPlayer then
	  MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
		  ['@identifier'] = xPlayer.identifier
	  }, function(rsultas)
		  local recup = {
			  firstname = rsultas[1]['firstname'],
			  lastname = rsultas[1]['lastname'],
			  sex = rsultas[1]['sex'],
			  dateofbirth = rsultas[1]['dateofbirth'],
			  height = rsultas[1]['height'],
			  job = rsultas[1]['job']
		  }
		  cb(recup)
	  end)
	end
  end)

local policeServiceWebhook = Policeconfig.PoliceServiceWebhook

RegisterServerEvent('police:PriseEtFinservice')
AddEventHandler('police:PriseEtFinservice', function(PriseOuFin,playerGrade,playerName)
	local _source = source
	local _raison = PriseOuFin
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local steamhex = GetPlayerIdentifier(source)
	local grade = xPlayer.getJob().grade_label,
	GetAllInformations()
	if _raison == 'prise' then
		MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
			['@identifier'] = xPlayer.identifier
		}, function(rsultas)
			local recup = {
				firstname = rsultas[1]['firstname'],
				lastname = rsultas[1]['lastname'],
			}
			playerName = recup.firstname..' '..recup.lastname
			local w = {{ ["author"] = { ["name"] = "LOS SANTOS POLICE DEPARTMENT", ["icon_url"] = Policeconfig.WebhookIconUrl }, ["thumbnail"] = { ["url"] = Policeconfig.WebhookLogoUrl }, ["color"] = "56108", ["title"] = "Prise de service", ["description"] = ("\n> **Agent : **%s\n> **Grade :** : %s\n> **Discord : **%s"):format(playerName,grade,discord), ["footer"] = { ["text"] = ""..os.date("%d/%m/%Y | %X"), ["icon_url"] = nil }, } }
			PerformHttpRequest(policeServiceWebhook, function(err, text, headers) end, 'POST', json.encode({username = "Gestionnaire du LSPD", embeds = w, avatar_url =  Policeconfig.WebhookAvatarUrl }), { ['Content-Type'] = 'application/json' })
		end)
	elseif _raison == 'fin' then
		MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
			['@identifier'] = xPlayer.identifier
		}, function(rsultas)
			local recup = {
				firstname = rsultas[1]['firstname'],
				lastname = rsultas[1]['lastname'],
			}
			playerName = recup.firstname..' '..recup.lastname
			local w = {{ ["author"] = { ["name"] = "LOS SANTOS POLICE DEPARTMENT", ["icon_url"] = Policeconfig.WebhookIconUrl }, ["thumbnail"] = { ["url"] = Policeconfig.WebhookLogoUrl }, ["color"] = "16711680", ["title"] = "Fin de service", ["description"] = ("\n> **Agent : **%s\n> **Grade :** : %s\n> **Discord : **%s"):format(playerName,grade,discord), ["footer"] = { ["text"] = ""..os.date("%d/%m/%Y | %X"), ["icon_url"] = nil }, } }
			PerformHttpRequest(policeServiceWebhook, function(err, text, headers) end, 'POST', json.encode({username = "Gestionnaire du LSPD", embeds = w, avatar_url = Policeconfig.WebhookAvatarUrl }), { ['Content-Type'] = 'application/json' })
		end)

	end
	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('police:InfoService', xPlayers[i], _raison, playerName,playerGrade)
		end
	end
end)

RegisterServerEvent('alerte:renfort')
AddEventHandler('alerte:renfort', function(name,raison)
	local _source = source
	local _raison = PriseOuFin
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()


	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('police:demanderenfort', xPlayers[i], name, raison)
		end
	end
end)

ESX.RegisterServerCallback('finalpolice:getOtherPlayerData', function(source, cb, target, notify)
    local xPlayer = ESX.GetPlayerFromId(target)

    TriggerClientEvent("esx:showNotification", target, "~r~Quelqu'un vous fouille ...")

    if xPlayer then
        local data = {
            name = xPlayer.getName(),
            job = xPlayer.job.label,
            grade = xPlayer.job.grade_label,
            inventory = xPlayer.getInventory(),
            accounts = xPlayer.getAccounts(),
            weapons = xPlayer.getLoadout(),
			--argentpropre = xPlayer.getMoney()
        }

        cb(data)
    end
end)

RegisterServerEvent('alerte:jobrenfort')
AddEventHandler('alerte:jobrenfort', function(name,raison)
	local _source = source
	local _raison = PriseOuFin
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()


	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'bcso' or thePlayer.job.name == 'police' then
			TriggerClientEvent('job:demanderenfort', xPlayers[i], name, raison)
		end
	end
end)




ESX.RegisterServerCallback('identity:getOtherPlayerData', function(source, cb, target)
	local targer = target
	local xPlayer = ESX.GetPlayerFromId(targer)

	MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		local data = {
			name = GetPlayerName(target),
			job = xPlayer.job,
			job2 = xPlayer.job2,
			inventory = xPlayer.inventory,
			accounts = xPlayer.accounts,
			weapons = xPlayer.getLoadout(),
			m = result[1]['money'],
			firstname = result[1]['firstname'],
			grade = result[1]['job_grade'],
			lastname = result[1]['lastname'],
			sex = result[1]['sex'],
			dob = result[1]['dateofbirth'],
			height = result[1]['height']
		}
		cb(data)
	end)
end)

ESX.RegisterServerCallback('esx_policejob:getVehicleInfos', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		local retrivedInfo = {plate = plate}

		if result[1] then
			local xPlayer = ESX.GetPlayerFromIdentifier(result[1].owner)
				MySQL.Async.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier',  {
					['@identifier'] = result[1].owner
				}, function(result2)
					if result2[1] then
                        retrivedInfo.owner = ('%s %s'):format(result2[1].firstname, result2[1].lastname)
						cb(retrivedInfo)
					else
						cb(retrivedInfo)
					end
                end)
		else
			cb(retrivedInfo)
		end
	end)
end)

RegisterNetEvent('yaya:confiscatePlayerItem')
AddEventHandler('yaya:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

    if itemType == 'item_standard' then
        local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)
		
			targetXPlayer.removeInventoryItem(itemName, amount)
			sourceXPlayer.addInventoryItem   (itemName, amount)
            TriggerClientEvent("esx:showNotification", source, "Vous avez confisqué ~p~"..amount..' '..sourceItem.label.."~s~.")
            TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous a pris ~p~"..amount..' '..sourceItem.label.."~s~.")
        else
			TriggerClientEvent("esx:showNotification", source, "~r~Quantité invalide")
		end
        
    if itemType == 'item_account' then
        targetXPlayer.removeAccountMoney(itemName, amount)
        sourceXPlayer.addAccountMoney   (itemName, amount)
        
        TriggerClientEvent("esx:showNotification", source, "Vous avez confisqué ~p~"..amount.." d' "..itemName.."~s~.")
        TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous aconfisqué ~p~"..amount.." d' "..itemName.."~s~.")

	elseif itemType == 'item_cash' then
		targetXPlayer.removeMoney(itemName, amount)
		sourceXPlayer.addMoney   (itemName, amount)
			
		TriggerClientEvent("esx:showNotification", source, "Vous avez confisqué ~p~"..amount.." d' "..itemName.."~s~.")
		TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous aconfisqué ~p~"..amount.." d' "..itemName.."~s~.")
        
    elseif itemType == 'item_weapon' then
        if amount == nil then amount = 0 end
        targetXPlayer.removeWeapon(itemName, amount)
        sourceXPlayer.addWeapon   (itemName, amount)

        TriggerClientEvent("esx:showNotification", source, "Vous avez confisqué ~p~"..ESX.GetWeaponLabel(itemName).."~s~ avec ~p~"..amount.."~s~ balle(s).")
        TriggerClientEvent("esx:showNotification", target, "Quelqu'un vous a confisqué ~p~"..ESX.GetWeaponLabel(itemName).."~s~ avec ~p~"..amount.."~s~ balle(s).")
		sendToDiscord('LogsFouille', 'Arme confisqué !\nJoueur : ' .. target .. ' [' .. _source .. ']\na volé a  : '..  source.. " un ".. ESX.GetWeaponLabel(itemName).. "avec ~p~ "..amount.."~s~ balle(s).")
    end
end)


RegisterServerEvent("police:prisearme")
AddEventHandler("police:prisearme", function(weaponName)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getWeapon(weaponName) then
        TriggerClientEvent('esx:showNotification', source, "~r~Vous avez déjà cette arme !")
    else
		local labelName = ESX.GetWeaponLabel(weaponName)
		TriggerClientEvent('esx:showNotification', source, '~p~Police Information~s~\nVous avez recu (+1 ~r~'..labelName..'~s~')
		xPlayer.addWeapon(weaponName, 100)
		xPlayer.addWeaponComponent('WEAPON_COMBATPISTOL', 'flashlight')
		xPlayer.addWeaponComponent('WEAPON_CARBINERIFLE', 'flashlight')
        xPlayer.addWeaponComponent('WEAPON_CARBINERIFLE', 'grip')
        xPlayer.addWeaponComponent('WEAPON_CARBINERIFLE', 'scope')
        xPlayer.addWeaponComponent('WEAPON_PUMPSHOTGUN', 'flashlight')
	end
end)

RegisterServerEvent("police:priseItem")
AddEventHandler("police:priseItem", function(weaponName, count,labelName)
	local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(weaponName)

	if (item.count + count) > item.limit then
		TriggerClientEvent('esx:showNotification', source, '~p~Police Information~s~\n~r~Dépassement de la limite d\'inventaire !')
	else
		xPlayer.addInventoryItem(weaponName, 1)
		TriggerClientEvent('esx:showNotification', source, '~p~Police Information~s~\nVous avez recu (+1 ~r~'..labelName..'~s~)')

	end
			
end)

RegisterServerEvent('codedix:notif')
AddEventHandler('codedix:notif', function(titre, soustitre, msgg, name, charr, num)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], 'L\'agent ~p~~s~' ..msgg)
		else 
			TriggerClientEvent('esx:showNotification', xPlayers[i], 'Police\n' ..msgg)
		end
	end
end)

RegisterServerEvent('renfort:policejob')
AddEventHandler('renfort:policejob', function(coords, raison)
	local _raison = raison
	local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'police' then
			TriggerClientEvent('renfort:setBlip', xPlayers[i], coords, _raison)
		end
	end
end)

RegisterServerEvent('codedixe:notif')
AddEventHandler('codedixe:notif', function(titre, soustitre, msgg, name, charr, num)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'bcso' or thePlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], 'L\'agent ~p~~s~' ..msgg)
		else 
			TriggerClientEvent('esx:showNotification', xPlayers[i], 'L\'agent \n' ..msgg)
		end
	end
end)

RegisterServerEvent('renfort:job')
AddEventHandler('renfort:job', function(coords, raison)
	local _raison = raison
	local xPlayers = ESX.GetPlayers()
	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'bcso' or thePlayer.job.name == 'police' then
			TriggerClientEvent('renfort:setBlip', xPlayers[i], coords, _raison)
		end
	end
end)


RegisterServerEvent('krz_handcuff:handcuff')
AddEventHandler('krz_handcuff:handcuff', function(target, wannacuff, method)
	
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayerTarget = ESX.GetPlayerFromId(target)
	local targetCuff = xPlayerTarget.get('cuffState')

	if wannacuff then
		
		if not targetCuff.isCuffed then
			
			if method == 'policecuff' then
				
				TriggerClientEvent('krz_handcuff:arresting', xPlayer.source)
				TriggerClientEvent('krz_handcuff:thecuff', target, true, xPlayer.source)
				xPlayerTarget.set('cuffState', {isCuffed = true, cuffMethod = method})
			end
		end
	elseif not wannacuff then
		if targetCuff.isCuffed then
			if (method == targetCuff.cuffMethod) or (method == 'all') then
				TriggerClientEvent('krz_handcuff:unarresting', xPlayer.source)
				TriggerClientEvent('krz_handcuff:thecuff', target, false)
				xPlayerTarget.set('cuffState', {isCuffed = false, cuffMethod = nil})
			
			end
		
		end
	end
end)

RegisterServerEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function(target)
	TriggerClientEvent('esx_policejob:drag', target, source)
end)



RegisterServerEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function(target)
		TriggerClientEvent('esx_policejob:OutVehicle', target)
end)


RegisterServerEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function(target)
	TriggerClientEvent('esx_policejob:putInVehicle', target)
end)

ESX.RegisterServerCallback('sPolice:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		cb(inventory.items)
	end)
end)

RegisterNetEvent('sPolice:getStockItem')
AddEventHandler('sPolice:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and inventoryItem.count >= count then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				TriggerClientEvent('esx:showNotification', _source, 'Vous avez retiré ~r~'..inventoryItem.label.." x"..count)
		else
			TriggerClientEvent('esx:showNotification', _source, "Quantité invalide")
		end
	end)
end)

ESX.RegisterServerCallback('sPolice:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({items = items})
end)

RegisterNetEvent('sPolice:putStockItems')
AddEventHandler('sPolice:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		-- does the player have enough of the item?
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			xPlayer.showNotification('Vous avez déposé ~g~'..inventoryItem.label.." x"..count)
		else
			TriggerClientEvent('esx:showNotification', _source, "Quantité invalide")
		end
	end)
end)
---Chien

RegisterNetEvent('esx_policedog:hasClosestDrugs')
AddEventHandler('esx_policedog:hasClosestDrugs', function(playerId)
    local target = ESX.GetPlayerFromId(playerId)
    local src = source
    local inventory = target.inventory
	local drugs = {'weed', 'weed_pooch','ecstasy','ecstasy_pooch','opium','opium_pooch','coke','coke_pooch','crack_pooch', 'crack','ketamine','ketamine_pooch','meth'}
    for i = 1, #inventory do
        for k, v in pairs(drugs) do
            if inventory[i].name == v and inventory[i].count > 0 then
                TriggerClientEvent('esx_policedog:hasDrugs', src, true)
                return
            end
        end
    end
    TriggerClientEvent('esx_policedog:hasDrugs', src, false)
end)
-- Speedzones

RegisterNetEvent('YnS:addSpeedzone')
AddEventHandler('YnS:addSpeedzone', function(pos, size)
	TriggerClientEvent('YnS:addSpeedzone', -1, source, pos, size)
end)

RegisterNetEvent('YnS:removeSpeedzone')
AddEventHandler('YnS:removeSpeedzone', function(speedZone)
	TriggerClientEvent('YnS:removeSpeedzone', -1, source, speedZone)
end)




------ Avis de recherche ------
RegisterNetEvent("YnS:getWtdData")
AddEventHandler("YnS:getWtdData", function()
	local _src = source
    local table = {}
    MySQL.Async.fetchAll('SELECT * FROM wanted_players', {}, function(result)
        for k,v in pairs(result) do
            table[v.id] = v
			
        end
		
        TriggerClientEvent("YnS:getWTD", _src, table)
    end)
end)

RegisterNetEvent("YnS:delWtdData")
AddEventHandler("YnS:delWtdData", function(id)
    MySQL.Async.execute('DELETE FROM wanted_players WHERE id = @id',
    { ['id'] = id })
end)

RegisterNetEvent("YnS:addWTD")
AddEventHandler("YnS:addWTD", function(builder)
	local xPlayer = ESX.GetPlayerFromId(source)
	local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
    local date = os.date("*t", os.time()).day.."/"..os.date("*t", os.time()).month.."/"..os.date("*t", os.time()).year.." à "..os.date("*t", os.time()).hour.."h"..os.date("*t", os.time()).min
	if xPlayer then
		MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
			['@identifier'] = xPlayer.identifier
		}, function(rsultas)
			local recup = {
				firstname = rsultas[1]['firstname'],
				lastname = rsultas[1]['lastname'],
			}
		
		local name = recup.firstname..' '..recup.lastname
		MySQL.Async.execute('INSERT INTO wanted_players (author,date,firstname,lastname,reason,dangerosity,prime) VALUES (@a,@b,@c,@d,@e,@f,@g)',

		{ 
			['a'] = name,
			['b'] = date,
			['c'] = builder.firstname,
			['d'] = builder.lastname,
			['e'] = builder.reason,
			['f'] = builder.dangerosity,
			['g'] = builder.prime
		})
	end)
	end
end)

RegisterServerEvent('YnS:dropWTD')
AddEventHandler('YnS:dropWTD', function(data)
	TriggerClientEvent('YnS:spawnWTD', -1,data)
end)

RegisterNetEvent("YnS:modifyWTD")
AddEventHandler("YnS:modifyWTD", function(builder,id)
	local xPlayer = ESX.GetPlayerFromId(source)
	local _src = source
	if xPlayer then
		MySQL.Async.execute('UPDATE wanted_players SET `reason`= @a, `dangerosity` = @b, `prime` = @c WHERE id = @d ',

		{ 
			['a'] = builder.reason,
			['b'] = builder.dangerosity,
			['c'] = builder.prime,
			['d'] = id
		})
	
	end
end)
GetAllInformations = function()
	for k,v in pairs(GetPlayerIdentifiers(source)) do
		if string.sub(v, 1, string.len("steam:")) == "steam:" then
			steamid = v
		elseif string.sub(v, 1, string.len("license:")) == "license:" then
			license = v
		elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
			xbl  = v
		elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
			playerip = v
		elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
			discordid = string.sub(v, 9)
			discord = "<@" .. discordid .. ">"
		elseif string.sub(v, 1, string.len("live:")) == "live:" then
			liveid = v
		end
	end
end

-----CJ
RegisterNetEvent('YnSCJ:uploadWebhook')
AddEventHandler('YnSCJ:uploadWebhook', function(builder)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local steamhex = GetPlayerIdentifier(source)
	local grade = xPlayer.getJob().grade_label,
	GetAllInformations()
	MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
		['@identifier'] = xPlayer.identifier
	}, function(rsultas)
		local recup = {
			firstname = rsultas[1]['firstname'],
			lastname = rsultas[1]['lastname'],
		}
		playerName = recup.firstname..' '..recup.lastname
		local w = {{ ["author"] = { ["name"] = "LOS SANTOS POLICE DEPARTMENT", ["icon_url"] = Policeconfig.WebhookIconUrl }, ["thumbnail"] = { ["url"] = Policeconfig.WebhookLogoUrl }, ["color"] = "56108", ["title"] = "Rapport de GAV", ["description"] = ("\t\t\t**__AUTEUR__**\n> **Agent : **%s\n> **Grade :** : %s\n> **Discord : **%s\n\t\t\t**__SUSPECT__**\n> **Identité : **%s %s\n> **Date de naissance : **%s\n> **Temps de détention : **%smin\n> **Délit : **%s\n> **Objets saisis : **%s"):format(playerName,grade,discord,builder.firstname,builder.name,builder.dob,builder.time,builder.reason,builder.saisis), ["footer"] = { ["text"] = ""..os.date("%d/%m/%Y | %X"), ["icon_url"] = nil }, } }
		PerformHttpRequest(Policeconfig.PoliceGAVWehbhook, function(err, text, headers) end, 'POST', json.encode({username = "Gestionnaire du LSPD", embeds = w, avatar_url = Policeconfig.WebhookAvatarUrl }), { ['Content-Type'] = 'application/json' })
	end)
end)




--COFFRE

ESX.RegisterServerCallback('police:playerinventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory
	local all_items = {}
	
	for k,v in pairs(items) do
		if v.count > 0 then
			table.insert(all_items, {label = v.label, item = v.name,nb = v.count})
		end
	end

	cb(all_items)

	
end)

ESX.RegisterServerCallback('police:getStockItems', function(source, cb)
	local all_items = {}
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		for k,v in pairs(inventory.items) do
			if v.count > 0 then
				table.insert(all_items, {label = v.label,item = v.name, nb = v.count})
			end
		end

	end)
	cb(all_items)
end)

ESX.RegisterServerCallback('police:getStockItems', function(source, cb)
	local all_items = {}
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		for k,v in pairs(inventory.items) do
			if v.count > 0 then
				table.insert(all_items, {label = v.label,item = v.name, nb = v.count})
			end
		end

	end)
	cb(all_items)
end)

RegisterServerEvent('police:putStockItems')
AddEventHandler('police:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item_in_inventory = xPlayer.getInventoryItem(itemName).count

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
		if item_in_inventory >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "- ~g~Dépot\n~s~- ~g~Coffre : ~s~police's \n~s~- ~o~Quantitée ~s~: "..count.."")
			PerformHttpRequest(Policeconfig.PoliceCoffre , function(err, text, headers) end, 'POST', json.encode({username = "Dépot Item", content = "__**Un nouveau Dépot a été effectué**__\n\nLa personne : " .. GetPlayerName(source) .. "\nà déposer : x" .. count .. " un(e) " .. itemName}), { ['Content-Type'] = 'application/json' })
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, "~r~Vous n'en avez pas assez sur vous")
		end
	end)
end)

RegisterServerEvent('police:takeStockItems')
AddEventHandler('police:takeStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
			xPlayer.addInventoryItem(itemName, count)
			inventory.removeItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "- ~r~Retrait\n~s~- ~g~Coffre : ~s~police's \n~s~- ~o~Quantitée ~s~: "..count.."")
			PerformHttpRequest(Policeconfig.PoliceCoffre, function(err, text, headers) end, 'POST', json.encode({username = "Retrait Item", content = "__**Un nouveau Retrait a été effectué**__\n\nLa personne : " .. GetPlayerName(source) .. "\nà retirer : x" .. count .. " un(e) " .. itemName}), { ['Content-Type'] = 'application/json' })
	end)
end)

ESX.RegisterServerCallback('finalpolice:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)
	local xPlayer = ESX.GetPlayerFromId(source)

	if removeWeapon then
		xPlayer.removeWeapon(weaponName)
		PerformHttpRequest(Policeconfig.PoliceCoffre , function(err, text, headers) end, 'POST', json.encode({username = "", content = GetPlayerName(source) .. " à déposer une arme (" ..weaponName.. ")"}), { ['Content-Type'] = 'application/json' })
	end

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)
		local weapons = store.get('weapons') or {}
		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 1
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('finalpolice:getArmoryWeapons', function(source, cb)
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end
		cb(weapons)
	end)
end)

ESX.RegisterServerCallback('finalpolice:removeArmoryWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 0)
	PerformHttpRequest(Policeconfig.PoliceCoffre, function(err, text, headers) end, 'POST', json.encode({username = "", content = GetPlayerName(source) .. " à pris une arme (" ..weaponName.. ")"}), { ['Content-Type'] = 'application/json' })

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)
		local weapons = store.get('weapons') or {}

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name = weaponName,
				count = 0
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)