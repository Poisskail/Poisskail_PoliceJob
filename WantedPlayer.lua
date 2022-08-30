ESX,openWTDMenu = nil, false


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Policeconfig.ESX, function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
      ESX.PlayerData = xPlayer
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
      ESX.PlayerData.job = job
end)



local dangerType = {[1] = "Coopératif",[2] = "Dangereux",[3] = "Dangereux et armé",[4] = "Terroriste"}
local dangerSTR = {"Coopératif","Dangereux","Dangereux et armé","Terroriste"}
builderWTD = {dangerosity = 1}
resetWTD = {dangerosity = 1}
wtdDATA = nil
wtdIdx = 0
function returnDanger(level)
    if dangerType[level] ~= nil then
        return dangerType[level]
    else
        return level
    end
end

RegisterNetEvent("YnS:getWTD")
AddEventHandler("YnS:getWTD", function(result)
    local found = 0
    for k,v in pairs(result) do
        found = found + 1
    end
    if found > 0 then 
        wtdDATA = result 
    
    end
end)

RegisterNetEvent('YnS:spawnWTD')
AddEventHandler('YnS:spawnWTD', function(data)
    
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
	PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
	PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
	PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
	Wait(1000)
    TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba( 51, 94, 255 , 0.8); border-radius: 3px;"><i class="fa fa-podcast"></i> <h2><u><b>Avis de recherche fédéral</b></u></h2> <br>→ Nom : {0} {1}<br>Si vous trouvez cet individu, merci de contacter les service de police au plus vite.<br><br>→ Récompense : {2}$<br>→ Motif : {3}<br>→ Dangerosité : {4}<br><br>Pour toutes questions, contactez la LSPD.</div>',
        args = { data.firstname,data.lastname,data.prime,data.reason,returnDanger(math.floor(tonumber(data.dangerosity)))}
    })
    PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
	PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)
end)

function notNilString(str)
    if str == nil then
        return ""
    else
        return str
    end
end

local sMenuWanted = RageUI.CreateMenu("Police Avis", " Avis de recherche",10 , 80)
sMenuWanted:SetRectangleBanner(33,32,49,500)
local wtdSub = RageUI.CreateSubMenu(sMenuWanted,"Police Avis", "Avis de recherche",10 , 80)
wtdSub:SetRectangleBanner(33,32,49,500)
local startWtd = RageUI.CreateSubMenu(sMenuWanted,"Police Avis", "Avis de recherche",10 , 80)
startWtd:SetRectangleBanner(33,32,49,500)
local checkWTD = RageUI.CreateSubMenu(wtdSub,"Police Avis", "Avis de recherche",10 , 80)
checkWTD:SetRectangleBanner(33,32,49,500)
local modifyWTD = RageUI.CreateSubMenu(checkWTD,"Police Avis", "Avis de recherche",10 , 80)
modifyWTD:SetRectangleBanner(33,32,49,500)
fName,lName,rsn,danger,prime,save =  false,false,false,false,false,false
sMenuWanted.Closed = function()
    openWTDMenu = false
end
good = false
wantedMenu = function()
    if openWTDMenu then
        openWTDMenu = false
       
    else
        openWTDMenu = true
        RageUI.Visible(sMenuWanted, true)
        
        CreateThread(function()
            while openWTDMenu do
                Wait(1)
                RageUI.IsVisible(sMenuWanted, function()
                    
                    RageUI.Button("→ LSPD - ~p~Consulter les avis en cours", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            wtdDATA = nil 
                            TriggerServerEvent("YnS:getWtdData")
                        end
                    },wtdSub)

                    RageUI.Button("→ LSPD - ~g~Lancer un avis de recherche", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\nAvis de recherche supprimé ~g~avec succès ~s~!')
                        end
                    },startWtd)
                    
                end)

                RageUI.IsVisible(wtdSub, function()
                
                    if wtdDATA == nil then
                        RageUI.Separator("")
                        RageUI.Separator("~r~Aucun avis de recherche")
                        RageUI.Separator("")
                    else
            
                        RageUI.Separator("↓ ~r~ Avis de recherche~s~ ↓")
            
                        for index,v in pairs(wtdDATA) do
                            if v.dangerosity == '1' then 
                                colorVar = "~g~"
                            elseif v.dangerosity == '2' then 
                                colorVar = "~o~"
                            elseif v.dangerosity == '3' then 
                                colorVar = "~r~"
                            elseif v.dangerosity == '4' then 
                                colorVar = "~p~"
                            end
                            RageUI.Button(colorVar.."[NV."..v.dangerosity.."] ~s~"..v.firstname.." "..v.lastname, nil, { RightLabel = "~o~Consulter ~s~→→" }, true, {
                                onSelected = function()
                                    wtdIdx = index
                                    Wait(10)
                                    good = true
                                end
                            },checkWTD)
                            
                            
                        end
                        
                    end
                end)

                RageUI.IsVisible(checkWTD, function() 
                    if good == true then
                        
                    
                        RageUI.Separator("↓ ~o~Informations ~s~↓")
                        RageUI.Button("~p~Dépositaire: ~s~"..wtdDATA[wtdIdx].author, nil, {}, true, {})
                        RageUI.Button("~p~Date: ~s~"..wtdDATA[wtdIdx].date, nil, {}, true, {})
                        RageUI.Button("~o~Prénom: ~s~"..wtdDATA[wtdIdx].firstname, nil, {}, true, {})
                        RageUI.Button("~o~Nom: ~s~"..wtdDATA[wtdIdx].lastname, nil, {}, true, {})
                        RageUI.Button("~o~Dangerosité: ~s~"..returnDanger(math.floor(tonumber(wtdDATA[wtdIdx].dangerosity))), nil, {}, true, {})
                        RageUI.Button("~o~Raison: ~s~"..wtdDATA[wtdIdx].reason, nil, {}, true, {})
                        RageUI.Button("~o~Prime: ~s~"..wtdDATA[wtdIdx].prime, nil, {}, true, {})
                        RageUI.Separator("↓ ~r~Actions ~s~↓")
                        RageUI.Button("~r~Émettre l'avis de recherche", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                RageUI.GoBack()
                                good = false
                                TriggerServerEvent('YnS:dropWTD',wtdDATA[wtdIdx])
                                TriggerClientEvent('chatMessage', -1, "☂️・Alysta - LSPD ", {127, 0, 255}, table.concat("test", " "))
                            end
                        })
                        RageUI.Button("~r~Modifier l'avis de recherche", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                
                            end
                        },modifyWTD)
                        RageUI.Button("~r~Retirer l'avis de recherche", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                RageUI.GoBack()
                                TriggerServerEvent("YnS:delWtdData", wtdIdx)
                                good = false
                                wtdDATA = nil 
                                TriggerServerEvent("YnS:getWtdData")
                            end
                        })
                    else 
                        RageUI.Separator("↓ ~r~Récupération des données ~s~↓")
                    end
                    
                end)
                RageUI.IsVisible(modifyWTD, function() 
                    RageUI.Separator("↓ ~r~Champs modifiables ~s~↓")
                    RageUI.Button("Raison :", "~o~Raison : ~s~"..notNilString(wtdDATA[wtdIdx].reason), { RightLabel = "→→" }, true, {
                        onSelected = function()
                            wtdDATA[wtdIdx].reason = KeyboardInput("Raison", "", 100)
                            
                        end
                    })
        
                    RageUI.List("Dangerosité", dangerSTR, wtdDATA[wtdIdx].dangerosity, "~r~Dangerosité (Code) : ~s~"..notNilString(wtdDATA[wtdIdx].dangerosity), {}, true, {
                        onListChange = function(i,item)
                            wtdDATA[wtdIdx].dangerosity = i
                        end;
                        onSelected = function(i,item)
                            wtdDATA[wtdIdx].dangerosity = i
                            
                        end
                    })
                    
                    RageUI.Button("Prime :", "~p~Prime : ~s~"..notNilString(wtdDATA[wtdIdx].prime), { RightLabel = "→→" }, true, {
                        onSelected = function()
                            wtdDATA[wtdIdx].prime = KeyboardInput("Prime", "", 10)
                            
                        end
                    })
                    RageUI.Button("~g~Sauvegarder et modifier", "~r~Motif : ~s~"..notNilString(wtdDATA[wtdIdx].reason),{RightLabel = "✔️", Color = { BackgroundColor = {39, 174, 96, 200}}}, true, {
                        onSelected = function()
                            RageUI.GoBack()
                            TriggerServerEvent("YnS:modifyWTD", wtdDATA[wtdIdx],wtdIdx)
                            ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\nAvis de recherche modifié ~g~avec succès ~s~!')
                        end
                    })
                    
                end)



                RageUI.IsVisible(startWtd, function()
                    RageUI.Button("Prénom : ~s~"..notNilString(builderWTD.firstname), "~r~Prénom : ~s~"..notNilString(builderWTD.firstname), { RightLabel = "→→" }, true, {
                        onSelected = function()
                            builderWTD.firstname = KeyboardInput("Prénom", "", 50)
                            fName = true
                        end
                    })
                    RageUI.Button("Nom : ~s~"..notNilString(builderWTD.lastname), "~r~Nom : ~s~"..notNilString(builderWTD.lastname), { RightLabel = "→→" }, fName, {
                        onSelected = function()
                            builderWTD.lastname = KeyboardInput("Nom", "", 50)
                            lName = true
                        end
                    })
                    RageUI.Button("Raison :", "~r~Raison : ~s~"..notNilString(builderWTD.reason), { RightLabel = "→→" }, lName, {
                        onSelected = function()
                            builderWTD.reason = KeyboardInput("Raison", "", 100)
                            rsn = true
                        end
                    })
        
                    RageUI.List("Dangerosité", dangerSTR, builderWTD.dangerosity, "~r~Dangerosité (Code) : ~s~"..notNilString(builderWTD.dangerosity), {}, rsn, {
                        onListChange = function(i,item)
                            builderWTD.dangerosity = i
                        end;
                        onSelected = function(i,item)
                            builderWTD.dangerosity = i
                            danger = true
                        end
                    })
                    
                    RageUI.Button("Prime :", "~p~Prime : ~s~"..notNilString(builderWTD.prime), { RightLabel = "→→" }, danger, {
                        onSelected = function()
                            builderWTD.prime = KeyboardInput("Prime", "", 10)
                            prime = true
                        end
                    })
                    if fName and lName and rsn and danger and prime then 
                        save = true
                        saveLabel = "✔️"
                        saveColor = {39, 174, 96, 200}

                    else 
                        save = false
                        savelabel = ""
                        saveColor ={232, 10, 10, 200}
                    end
                    RageUI.Button("~g~Sauvegarder et envoyer", "~r~Motif : ~s~"..notNilString(builderWTD.reason),{RightLabel = saveLabel, Color = { BackgroundColor = saveColor}}, save, {
                        onSelected = function()
                            RageUI.GoBack()
                            TriggerServerEvent("YnS:addWTD", builderWTD)
                            builderWTD = resetWTD
                            ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\nAvis de recherche enregistré ~g~avec succès ~s~!')
                        end
                    })
                
                end)

            end
        end)
    end
end
RegisterCommand("wanted", function(source, args, rawCommand)
    if ESX.PlayerData.job.name == 'police' then 
        if ESX.PlayerData.job.grade >= 2 then 
            wantedMenu()
        else
            ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\n~r~Vous n\'avez pas le rang nécessaire')
        end
    else 
        ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\n~r~Vous ne faites pas parti de la police')
    end
end)


