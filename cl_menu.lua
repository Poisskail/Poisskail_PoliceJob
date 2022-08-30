function mug(title, subject, msg)
    local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
    AdvancedNotif(title, subject, msg, mugshotStr, 1)
    UnregisterPedheadshot(mugshot)
end

_print = print
_NetworkExplodeVehicle = NetworkExplodeVehicle
_AddExplosion = AddExplosion
local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }

local cuffedN = false
local isArresting = false
local isHandcuffed = false

local cuffeddict = 'mp_arresting'
local cuffedanim = 'crook_p2_back_left'
local CoffrePolice = false
local cuffdict = 'mp_arrest_paired'
local cuffanim = 'cop_p2_back_left'

local uncuffdict = 'mp_arresting'
local uncuffanim = 'a_uncuff'
local DragStatus              = {}
  DragStatus.IsDragged          = false
local prevDrawable, prevTexture, prevPalette = 0, 0, 0
local maleHash, femaleHash = `mp_m_freemode_01`, `mp_f_freemode_01`
local policeboss = false
local ClotheMPoliceVP,vestswat,ammunationswat = false,false,false
local serverEventTrigger , openf6police , policeservice, StateService ,identiterp, ammunationpolice, Items , Armes , ArgentSale, ClotheMPoliceMR, MenuList, MenuList1, policegarage, vehicleStats , policehelico , openGAVMenu= TriggerServerEvent , false , false , "~r~Hors service", nil, false, {}, {}, {}, false, {List1 = 1,},{List1 = 1,}, false, nil, false,false
local MenuPoliceJobADNS = RageUI.CreateMenu("Police Menu", "Votre Menu de Police", 10, 80)
MenuPoliceJobADNS:SetRectangleBanner(33,32,49,500)
local interact = RageUI.CreateSubMenu(MenuPoliceJobADNS, "Police Intéractions", " Interaction Citoyen(ne)", 10, 80)
interact:SetRectangleBanner(33,32,49,500)
local radio = RageUI.CreateSubMenu(MenuPoliceJobADNS, "Police Radio", " Code Radio", 10,80)
radio:SetRectangleBanner(33,32,49,500)
local fouille = RageUI.CreateSubMenu(MenuPoliceJobADNS, "Police Fouille", " Fouillez", 10, 80)
fouille:SetRectangleBanner(33,32,49,500)
local vehicule = RageUI.CreateSubMenu(MenuPoliceJobADNS, "Police Voiture", " Vehicules",10 , 80)
vehicule:SetRectangleBanner(33,32,49,500)
local PoliceF6K9 = RageUI.CreateSubMenu(MenuPoliceJobADNS, "Police Chien", " Chien du Policier | K9", 10,80)
PoliceF6K9:SetRectangleBanner(33,32,49,500)
local MenuVestPoliceVP = RageUI.CreateMenu("Police Vestaire ", " Vestiaire de policier", 10, 80)
    MenuVestPoliceVP:SetRectangleBanner(33,32,49,500)
    MenuVestPoliceVP.Closed = function()
    
    ClotheMPoliceVP = false
end
local SubMenuCeremonieVP = RageUI.CreateSubMenu(MenuVestPoliceVP,"Police Vestiare", " Vestiaire de ceremonie", 10, 80)
SubMenuCeremonieVP:SetRectangleBanner(33,32,49,500)
local MenuVestSwat = RageUI.CreateMenu("S.W.A.T", " Vestiaire du SWAT", 10, 80)
MenuVestSwat:SetRectangleBanner(33,32,49,500)
MenuVestSwat.Closed = function()
    
    vestswat = false
end

local SubMenuVestPoliceVP = RageUI.CreateSubMenu(MenuVestPoliceVP, "Police Vestiare", " Vestiaire de policier",10 , 80)
SubMenuVestPoliceVP:SetRectangleBanner(33,32,49,500)

local objectPolice = RageUI.CreateSubMenu(MenuPoliceJobADNS, "Police Objets", " Objets",10 , 80)
objectPolice:SetRectangleBanner(33,32,49,500)
local objectPolice_deposit = RageUI.CreateSubMenu(objectPolice, "Police Objets", "Déposer un objet",10 , 80)
objectPolice_deposit:SetRectangleBanner(33,32,49,500)
local objectPolice_supp = RageUI.CreateSubMenu(objectPolice, "Police Objets", "Supprimer un objet",10 , 80)
objectPolice_supp:SetRectangleBanner(33,32,49,500)
    MenuPoliceJobADNS.Closed = function()
    openf6police = false
end
local stopNPC = RageUI.CreateSubMenu(MenuPoliceJobADNS, "Police ZoneNPC", " Zone d'arret",10 , 80)
stopNPC:SetRectangleBanner(33,32,49,500)

local MenugaragePoliceJobADNS = RageUI.CreateMenu("Police Garage", " Garage", 10, 80)
local MenugaragePolicePatrouille = RageUI.CreateSubMenu(MenugaragePoliceJobADNS, "Police Vehicules", " Vehicules",10 , 80)
MenugaragePolicePatrouille:SetRectangleBanner(33,32,49,500)
local MenugaragePoliceBrigades = RageUI.CreateSubMenu(MenugaragePoliceJobADNS, "Police Vehicules", " Vehicules",10 , 80)
MenugaragePoliceBrigades:SetRectangleBanner(33,32,49,500)
local MenugaragePoliceConvoi = RageUI.CreateSubMenu(MenugaragePoliceJobADNS, "Police Vehicules", " Vehicules",10 , 80)
MenugaragePoliceConvoi:SetRectangleBanner(33,32,49,500)
local MenugaragePoliceAcademy = RageUI.CreateSubMenu(MenugaragePoliceJobADNS, "Police Vehicules", " Vehicules",10 , 80)
MenugaragePoliceAcademy:SetRectangleBanner(33,32,49,500)
MenugaragePoliceJobADNS:SetRectangleBanner(33,32,49,500)
    MenugaragePoliceJobADNS.Closed = function()
    policegarage = false
end

local MenuGarageHelico = RageUI.CreateMenu("Police helicoptere", " Garage helicoptere", 10, 80)
MenuGarageHelico:SetRectangleBanner(33,32,49,500)
    MenuGarageHelico.Closed = function()
    policehelico = false
end

local sMenuGav = RageUI.CreateMenu("Police GAV", " Vestiaire des GAV", 10, 80)
sMenuGav:SetRectangleBanner(33,32,49,500)
    sMenuGav.Closed = function()
    
        openGAVMenu = false
end



local MenuVestPoliceMR = RageUI.CreateMenu("Police Vestiaire", " Vestiaire de policier", 10, 80)
    MenuVestPoliceMR:SetRectangleBanner(33,32,49,500)
    MenuVestPoliceMR.Closed = function()
    FreezeEntityPosition(PlayerPedId(), false)
    RenderScriptCams(0, 1, 800, 0, 0)
    ClotheMPoliceMR = false
end
local SubMenuVestPoliceMR = RageUI.CreateSubMenu(MenuVestPoliceMR, "Police Vestiaire", " Vestiaire",10 , 80)
SubMenuVestPoliceMR:SetRectangleBanner(33,32,49,500)
local SubMenuCeremonieMR = RageUI.CreateSubMenu(MenuVestPoliceMR,"Police ceremonie", " Vestiaire de ceremonie", 10, 80)
SubMenuCeremonieMR:SetRectangleBanner(33,32,49,500)


local sPoliceBoss = RageUI.CreateMenu("Police", " Gestion Patron", 10, 80)
sPoliceBoss:SetRectangleBanner(33,32,49,500)
sPoliceBoss.Closed = function()
    policeboss = false
end


local SubMenuBrigadePolice = RageUI.CreateSubMenu(MenuVestPoliceMR,"Police Vestiaire", " Vestiaire de policier",10,80)
SubMenuBrigadePolice:SetRectangleBanner(33,32,49,500)
local MenuAmmuPolice = RageUI.CreateMenu("Police Armurerie", " Armurerie de policier", 10, 80)
MenuAmmuPolice:SetRectangleBanner(33,32,49,500)
local SubMenuAmmuPolice = RageUI.CreateSubMenu(MenuAmmuPolice,"Police blanche", " Arme blanche",10,80)
SubMenuAmmuPolice:SetRectangleBanner(33,32,49,500)
local SubMenuAccessPolice = RageUI.CreateSubMenu(MenuAmmuPolice,"Police Accessoires", " Accessoires",10,80)
SubMenuAccessPolice:SetRectangleBanner(33,32,49,500)

local SubMenuAmmuLetalPolice = RageUI.CreateSubMenu(MenuAmmuPolice,"Police letale", " Arme letale",10,80)
SubMenuAmmuLetalPolice:SetRectangleBanner(33,32,49,500)
    MenuAmmuPolice.Closed = function() 
    ammunationpolice = false
    FreezeEntityPosition(PlayerPedId(), true)
    ResetWP()
end

local function getInformationsPolice(player)
	ESX.TriggerServerCallback('identity:getOtherPlayerData', function(data)
		identiterp = data
	end, GetPlayerServerId(player))
end

function getVehicleInfos(vehicleData)
	ESX.TriggerServerCallback('esx_policejob:getVehicleInfos', function(data)
		Citizen.SetTimeout(1800, function()
		vehicleStats = data
		end)
	end, vehicleData.plate)
end

local function getPlayerInv(player)
    Items = {}
    Armes = {}
    ArgentSale = {}
    
    ESX.TriggerServerCallback('finalpolice:getOtherPlayerData', function(data)
        for i=1, #data.accounts, 1 do
            if data.accounts[i].name == 'dirtycash' and data.accounts[i].money > 0 then
                table.insert(ArgentSale, {
                    label    = ESX.Math.Round(data.accounts[i].money),
                    value    = 'dirtycash',
                    itemType = 'item_account',
                    amount   = data.accounts[i].money
                })
    
                break
            end
        end
        for i=1, #data.weapons, 1 do
            table.insert(Armes, {
                label    = ESX.GetWeaponLabel(data.weapons[i].name),
                value    = data.weapons[i].name,
                right    = data.weapons[i].ammo,
                itemType = 'item_weapon',
                amount   = data.weapons[i].ammo
            })
        end
        for i=1, #data.inventory, 1 do
            if data.inventory[i].count > 0 then
                table.insert(Items, {
                    label    = data.inventory[i].label,
                    right    = data.inventory[i].count,
                    value    = data.inventory[i].name,
                    itemType = 'item_standard',
                    amount   = data.inventory[i].count
                })
            end
        end
    end, GetPlayerServerId(player))
    end

function openGaragePolice()
    
    if policegarage then
        policegarage = false
    else
        policegarage = true
        posJoueur =  GetEntityCoords(PlayerPedId())
        missionR = vector3(441.3739,-975.6722,25.69981)
        vespucci = vector3(-1077.626, -858.0791, 5.032959)
        pdp = GetEntityCoords(PlayerPedId())
        RageUI.Visible(MenugaragePoliceJobADNS, true)
        CreateThread(function()
            while policegarage do
                RageUI.IsVisible(MenugaragePoliceJobADNS, function() 
                    RageUI.Button('→ LSPD -~p~ Véhicules : ~p~[PATROUILLE]', nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            
                        end
                        },MenugaragePolicePatrouille);
                    RageUI.Button('→ LSPD -~p~ Véhicules : ~p~[BRIGADES]', nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            
                        end
                        },MenugaragePoliceBrigades);
                    RageUI.Button('→ LSPD -~p~ Véhicules : ~p~[CONVOIS]', nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            
                        end
                        },MenugaragePoliceConvoi);
                    RageUI.Button('→ LSPD -~p~ Véhicules : ~p~[ACADEMY]', nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            
                        end
                        },MenugaragePoliceAcademy);

                        
                end, function() end)

                RageUI.IsVisible(MenugaragePolicePatrouille, function() 
                        RageUI.Separator("~p~↓~s~ Véhicules de patrouille ~p~↓~s~")
                        for k,v in pairs(GaragePolice) do
                            if ESX.PlayerData.job.grade >= v.rank then
                                RageUI.Button(v.voiture.."~p~["..ESX.PlayerData.job.grade_label.."]", nil , {RightLabel = "→→"}, true ,{
                                    onSelected = function()
                                        if GetDistanceBetweenCoords(missionR, posJoueur, true) <= 15  then
                                            spawnuniCarMR(v.namecar,v.livery)
                                            RageUI.CloseAll()
                                            policegarage = false
                                        elseif GetDistanceBetweenCoords(vespucci,  posJoueur, true) <= 15  then
                                            spawnuniCarVP(v.namecar,v.livery)
                                            RageUI.CloseAll()
                                            policegarage = false
                                        end
                                    end
                                })
                            else
                                RageUI.Button(v.voiture..v.minimumRank, nil, {RightBadge = RageUI.BadgeStyle.Lock }, false, {
                                    onSelected = function()
                                        
                                    end
                                    });
                               
                            end
                        end
                end, function() end)
                RageUI.IsVisible(MenugaragePoliceBrigades, function() 
                    RageUI.Separator("~p~↓~s~ Véhicules de brigade ~p~↓~s~")
                    for k,v in pairs(GarageBrigades) do
                        if ESX.PlayerData.job.grade >= v.rank then
                            RageUI.Button(v.voiture.."~p~["..ESX.PlayerData.job.grade_label.."]", nil , {RightLabel = "→→"}, true ,{
                                onSelected = function()
                                    if GetDistanceBetweenCoords(missionR, posJoueur, true) <= 15  then
                                        spawnuniCarMR(v.namecar,v.livery)
                                        RageUI.CloseAll()
                                        policegarage = false
                                    elseif GetDistanceBetweenCoords(vespucci,  posJoueur, true) <= 15  then
                                        spawnuniCarVP(v.namecar,v.livery)
                                        RageUI.CloseAll()
                                        policegarage = false
                                    end
                                
                                end
                            })
                        else
                            RageUI.Button(v.voiture..v.minimumRank, nil, {RightBadge = RageUI.BadgeStyle.Lock }, false, {
                                onSelected = function()
                                    
                                end
                                });
                           
                        end
                    end
            end, function() end)
            RageUI.IsVisible(MenugaragePoliceConvoi, function() 
                RageUI.Separator("~p~↓~s~ Véhicules de convois ~p~↓~s~")
                for k,v in pairs(GarageConvoi) do
                    if ESX.PlayerData.job.grade >= v.rank then
                        RageUI.Button(v.voiture.."~p~["..ESX.PlayerData.job.grade_label.."]", nil , {RightLabel = "→→"}, true ,{
                            onSelected = function()
                                if GetDistanceBetweenCoords(missionR, posJoueur, true) <= 15  then
                                    spawnuniCarMR(v.namecar,v.livery)
                                    RageUI.CloseAll()
                                    policegarage = false
                                elseif GetDistanceBetweenCoords(vespucci,  posJoueur, true) <= 15  then
                                    spawnuniCarVP(v.namecar,v.livery)
                                    RageUI.CloseAll()
                                    policegarage = false
                                end
                            
                            end
                        })
                    else
                        RageUI.Button(v.voiture..v.minimumRank, nil, {RightBadge = RageUI.BadgeStyle.Lock }, false, {
                            onSelected = function()
                                
                            end
                            });
                       
                    end
                end
        end, function() end)
        RageUI.IsVisible(MenugaragePoliceAcademy, function() 
            RageUI.Separator("~p~↓~s~ Véhicules de l'Academy' ~p~↓~s~")
            for k,v in pairs(GarageAcadamy) do
                if ESX.PlayerData.job.grade >= v.rank then
                    RageUI.Button(v.voiture.."~p~["..ESX.PlayerData.job.grade_label.."]", nil , {RightLabel = "→→"}, true ,{
                        onSelected = function()
                            if GetDistanceBetweenCoords(missionR, posJoueur, true) <= 15  then
                                spawnuniCarMR(v.namecar,v.livery)
                                RageUI.CloseAll()
                                policegarage = false
                            elseif GetDistanceBetweenCoords(vespucci,  posJoueur, true) <= 15  then
                                spawnuniCarVP(v.namecar,v.livery)
                                RageUI.CloseAll()
                                policegarage = false
                            end
                        end
                    })
                else
                    RageUI.Button(v.voiture..v.minimumRank, nil, {RightBadge = RageUI.BadgeStyle.Lock }, false, {
                        onSelected = function()
                            
                        end
                        });
                   
                end
            end
    end, function() end)
                Wait(1)
            end
        end)
    end
end
                        


function openPoliceHelico() 
    if policehelico then  
        policehelico = false  
    else 
        policehelico = true 
        RageUI.Visible(MenuGarageHelico, true)
        CreateThread(function()
            while policehelico do 
                RageUI.IsVisible(MenuGarageHelico, function() 
                    RageUI.Separator("~p~↓~s~ Hélicoptère de service ~p~↓~s~")
                    for k,v in pairs(GarageHeliPolice) do
                        RageUI.Button(v.helico, nil , {RightLabel = "→→"}, true ,{
                            onSelected = function()
                            spawnuniCarHeli(v.name)
end
                        })
                    end
                end, function() end)
                Wait(1)
            end
        end)
    end
end
                        
function openAmmuPolice()
    if ammunationpolice then
        ammunationpolice = false
        ResetWP()
        FreezeEntityPosition(PlayerPedId(), false)
    else
        getESXPolice()
        ammunationpolice = true
        posp = GetEntityCoords(PlayerPedId())
        RageUI.Visible(MenuAmmuPolice, true)
        CreateThread(function()
            while ammunationpolice do
                Wait(1)
                RageUI.IsVisible(MenuAmmuPolice, function()
                        RageUI.Button('Rendre ses armes', nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                ESX.ShowNotification('~p~Police~s~\n~r~Vous avez rangé toutes vos armes.')
                            
                            RemoveAllPedWeapons(PlayerPedId(), true)
                        end});
                        RageUI.Separator("~p~↓~s~ ~o~Armurerie ~s~~p~↓~s~")
                        RageUI.Button('Armes blanche', nil, {RightLabel = "→→"}, true, {
                            onSelected = function() 
                        end}, SubMenuAmmuPolice);
                        RageUI.Button('Armes létale', nil, {RightLabel = "→→"}, true, {
                            onSelected = function() 
                        end}, SubMenuAmmuLetalPolice);
                        RageUI.Button('Accessoires ', nil, {RightLabel = "→→"}, true, {
                            onSelected = function() 
                        end},SubMenuAccessPolice);
                    end)


                    RageUI.IsVisible(SubMenuAccessPolice, function()
                        for k,v in pairs(WeaponAccess) do
                            RageUI.List(v.weaponaccess.." ~p~["..ESX.PlayerData.job.grade_label.."]", {"Preview", "Prendre"}, MenuList1.List1, nil, {}, true, {
                                onListChange = function(i,item)                 
                                    MenuList1.List1 = i;
                                end,
                                onSelected = function(i,item)
                                    if i == 1 then
                                        GetWeapon(v.propname, v.spawnposprop)
                                    elseif i == 2 then
                                   
                                        serverEventTrigger("police:priseItem",v.weaponname, 1,v.weaponaccess)
                                end
                            end});
                        end
                        
                    end)
                RageUI.IsVisible(SubMenuAmmuPolice, function()
                    for k,v in pairs(WeaponNoLetal) do

                        RageUI.List(v.weaponnoletal.." ~p~["..ESX.PlayerData.job.grade_label.."]", {"Preview", "Prendre"}, MenuList1.List1, nil, {}, true, {
                            onListChange = function(i,item)
                                MenuList1.List1 = i;
                                
                            end,
                            onSelected = function(i,item)
                                
                                if i == 1 then
                                    GetWeapon(v.propname, v.spawnposprop)
                                elseif i == 2 then
                                   
                                serverEventTrigger("police:prisearme",v.weaponname, 1,v.weaponnoletal)
                            end
                        end});
                    end
                    for k,v in pairs(WeaponNoLetal) do
                        RageUI.StatisticPanel(v.degats, "Dégâts", k)
                    end
                end)

                RageUI.IsVisible(SubMenuAmmuLetalPolice, function()
                    for k,v in pairs(Policeammunation) do
                        if ESX.PlayerData.job.grade >= v.rank then
                            
                            RageUI.List(v.btmname.." ~p~["..ESX.PlayerData.job.grade_label.."]", {"Preview", "Prendre"}, MenuList1.List1, nil, {}, true, {
                                onListChange = function(i,item)
                                    MenuList1.List1 = i;
                                end,
                                onSelected = function(i,item)
                                    if i == 1 then
                                        GetWeapon(v.propname, v.spawnposprop)
                                    elseif i == 2 then                                
                                    serverEventTrigger("police:prisearme", v.weaponname, 1)
                                end
                            end});
                        else
                            RageUI.Button(v.btmname..v.minimumRank, nil, {RightBadge = RageUI.BadgeStyle.Lock }, false, {
                                onSelected = function()
                                    
                                end
                                });
                           
                    end
                    end
                    for k,v in pairs(Policeammunation) do
                        RageUI.StatisticPanel(v.degats, "Dégâts", k)
                        RageUI.StatisticPanel(v.cadence, "Cadence de tir", k)
                        RageUI.StatisticPanel(v.precision, "Précision", k)
                        RageUI.StatisticPanel(v.porter, "Portée", k)
                    end
                end, function() end)
            end
        end)
    end
end






function openAmmuSWAT()
    if ammunationswat then
        ammunationswat = false
        ResetWP()
        FreezeEntityPosition(PlayerPedId(), false)
    else
        getESXPolice()
        ammunationswat = true
        posp = GetEntityCoords(PlayerPedId())
        RageUI.Visible(MenuAmmuSWAT, true)
        CreateThread(function()
            while ammunationswat do
                Wait(1)
                RageUI.IsVisible(MenuAmmuSWAT, function()
                    for k,v in pairs(WeaponSWAT) do
                        RageUI.List(v.btmname.." ~p~[SWAT]", {"Preview", "Prendre"}, MenuList1.List1, nil, {}, true, {
                            onListChange = function(i,item)
                                MenuList1.List1 = i;
                            end,
                            onSelected = function(i,item)
                                if i == 1 then
                                    GetWeapon(v.propname, v.spawnposprop)
                                elseif i == 2 then
                                    ESX.ShowNotification('~p~Police~s~\n~r~Vous avez recu (+1 ~r~'..v.btmname..'~s~)')
                                
                                serverEventTrigger("police:prisearme", v.weaponname, v.countname)
                            end
                        end});
                    end
                end)
            end
        end)
    end
end

function openVestSWAT()
    if vestswat then
        vestswat = false
       
    else
        vestswat = true
        
        RageUI.Visible(MenuVestSwat, true)
	CreateThread(function()
		while vestswat do
            Wait(1)
            RageUI.IsVisible(MenuVestSwat, function()

                RageUI.Separator("Division : ( ~r~S.W.A.T ~s~)")
                for _,infos in pairs(Cloak.clothes.specials) do
                    RageUI.Button(infos.label, nil, {RightBadge = RageUI.BadgeStyle.Clothes}, ESX.PlayerData.job.grade >= infos.minimum_grade, {
                        onSelected = function()
                            PoliceSkin(infos)
                        end
                    })
                end

                    RageUI.Separator("~p~↓~s~ Tenues - ~p~[SWAT] ~p~↓~s~")
                    for _,infos in pairs(SWAT.clothes.grades) do
                    RageUI.Button(infos.label, nil, {RightBadge = RageUI.BadgeStyle.Clothes}, ESX.PlayerData.job.grade >= infos.minimum_grade, {
                        onSelected = function()
                            PoliceSkin(infos)
                        end
                        })
                    end

                    
                end, function() end, 1)

               



            end
        end)
    end
end

function openMenuClothPoliceVP()
    if ClotheMPoliceVP then
        ClotheMPoliceVP = false
       
    else
        ClotheMPoliceVP = true
        
        RageUI.Visible(MenuVestPoliceVP, true)
	CreateThread(function()
		while ClotheMPoliceVP do
            Wait(1)
            RageUI.IsVisible(MenuVestPoliceVP, function()

                RageUI.Separator("Votre Grade : ( ~r~"..ESX.PlayerData.job.grade_label.." ~s~)")
                for _,infos in pairs(Cloak.clothes.specials) do
                    RageUI.Button(infos.label, nil, {RightBadge = RageUI.BadgeStyle.Clothes}, ESX.PlayerData.job.grade >= infos.minimum_grade, {
                        onSelected = function()
                            PoliceSkin(infos)
                        end
                    })
                end
                RageUI.Separator("~p~↓~s~ Tenues - ~p~[Cérémonie] ~p~↓~s~")
                RageUI.Button("→ LSPD - ~p~ Cérémonie ", nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                    onSelected = function()
                    end
                    },SubMenuCeremonieVP)
                    RageUI.Separator("~r~~h~Tenues OP interdites sans autorisation !")
                    RageUI.Separator("~p~↓~s~ Tenues - ~p~[LSPD] ~p~↓~s~")
                    for _,infos in pairs(Cloak.clothes.grades) do
                        RageUI.Button(infos.label, nil, {RightBadge = RageUI.BadgeStyle.Clothes}, ESX.PlayerData.job.grade >= infos.minimum_grade, {
                            onSelected = function()
                                vest = infos
                                gilet = infos.giletPB
                                gilet2 = infos.giletPB2
                            end
                            },SubMenuVestPoliceVP)
                    end
                    
                    
                end, function() end, 1)

                RageUI.IsVisible(SubMenuVestPoliceVP, function()

                    RageUI.Separator("~p~↓~s~ Tenues ~p~↓~s~")
                        RageUI.Button("→ LSPD - ~p~ Equiper sa tenue", nil, {RightBadge = RageUI.BadgeStyle.Clothes},true, {
                            onSelected = function()
                                PoliceSkin(vest)
                            end
                            })
                    end, function() end, 1)

                RageUI.IsVisible(SubMenuCeremonieVP, function()
                        
                    
    
                        RageUI.Separator("~p~↓~s~ Cérémonie ↓~s~")
                        for _,infos in pairs(Ceremonie.clothes.grades) do
                            RageUI.Button(infos.label, nil, {RightBadge = RageUI.BadgeStyle.Clothes}, ESX.PlayerData.job.grade >= infos.minimum_grade, {
                                onSelected = function()
                                    PoliceSkin(infos)
                                end
                                })
                        end
                        

                    end, function() end, 1)
                    


            end
        end)
    end
end

vest = {}
function openMenuClothPoliceMR()
    local plyPed = PlayerPedId()
    if ClotheMPoliceMR then
        ClotheMPoliceMR = false
        RenderScriptCams(0, 1, 1500, 0, 0)
        FreezeEntityPosition(PlayerPedId(), false)
    else
        ClotheMPoliceMR = true
        PolicevestiaireCam()
        FreezeEntityPosition(PlayerPedId(), true)
        SetEntityHeading(PlayerPedId(), 81.9651)
        RageUI.Visible(MenuVestPoliceMR, true)
	CreateThread(function()
		while ClotheMPoliceMR do
            Wait(1)
            RageUI.IsVisible(MenuVestPoliceMR, function()

                RageUI.Separator("Votre Grade : ( ~r~"..ESX.PlayerData.job.grade_label.." ~s~)")
                
                    for _,infos in pairs(Cloak.clothes.specials) do
                        RageUI.Button(infos.label, nil, {RightBadge = RageUI.BadgeStyle.Clothes}, ESX.PlayerData.job.grade >= infos.minimum_grade, {
                            onSelected = function()
                                PoliceSkin(infos)
                            end
                        })
                    end
                    RageUI.Separator("~p~↓~s~ Tenues - ~p~[Cérémonie] ~p~↓~s~")
                    RageUI.Button("→ LSPD - ~p~ Cérémonie ", nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                        onSelected = function()
                            
                        end
                        },SubMenuCeremonieMR)
                        RageUI.Separator("")
                    RageUI.Separator("~p~↓~s~ Tenues - ~p~[LSPD] ~p~↓~s~")
                    for _,infos in pairs(Cloak.clothes.grades) do
                    RageUI.Button(infos.label, nil, {RightBadge = RageUI.BadgeStyle.Clothes}, ESX.PlayerData.job.grade >= infos.minimum_grade, {
                        onSelected = function()
                            vest = infos
                            gilet = infos.giletPB
                            gilet2 = infos.giletPB2
                        end
                        },SubMenuVestPoliceMR)
                    end
                    

                    
                end, function() end, 1)
                RageUI.IsVisible(SubMenuVestPoliceMR, function()

                    RageUI.Separator("~p~↓~s~ Tenues ~p~↓~s~")
                        RageUI.Button("→ LSPD - ~p~ S'habiller", nil, {RightBadge = RageUI.BadgeStyle.Clothes},true, {
                            onSelected = function()
                                PoliceSkin(vest)
                            end
                            })

                    end, function() end, 1)
                
                    RageUI.IsVisible(SubMenuCeremonieMR, function()

                        RageUI.Separator("Votre Grade : ( ~r~"..ESX.PlayerData.job.grade_label.." ~s~)")
        
                            RageUI.Separator("~p~↓~s~ Cérémonie - ~p~[LSPD] ~p~↓~s~")
                            for _,infos in pairs(Ceremonie.clothes.grades) do
                                RageUI.Button(infos.label, nil, {RightBadge = RageUI.BadgeStyle.Clothes}, ESX.PlayerData.job.grade >= infos.minimum_grade, {
                                    onSelected = function()
                                        PoliceSkin(infos)
                                    end
                                    })
                            end
                            
        
                        end, function() end, 1)


            end
        end)
    end
end
RegisterNetEvent('police:demanderenfort')
AddEventHandler('police:demanderenfort', function(name, raison)
    ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\n~r~Renfort~s~\nAgent : ~g~ '..name..' ~s~'..raison)

end)
RegisterNetEvent('job:demanderenfort')
AddEventHandler('job:demanderenfort', function(name, raison)
    ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\n~r~Renfort~s~\nAgent : ~g~ '..name..' ~s~'..raison)

end)

RegisterNetEvent('police:InfoService')
AddEventHandler('police:InfoService', function(service, playerName,playerGrade)
    
	if service == 'prise' then
        ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\n~o~Agent~s~ : '..playerName..'\n~p~Grade:~s~ '..playerGrade..'~s~\nStatut: ~g~Prise de service')
		Wait(1000)
		
	elseif service == 'fin' then
        ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\n~o~Agent~s~ : '..playerName..'\n~p~Grade:~s~ '..playerGrade..'~s~\nStatut: ~g~Fin de service')
		Wait(1000)
		
	end
end)
function openMenuF6Poulice()
    if openf6police then
        openf6police = false
    else
        getESXPolice()
        openf6police = true
        RageUI.Visible(MenuPoliceJobADNS, true)
        CreateThread(function()
            while openf6police do
                Wait(1)
                RageUI.IsVisible(MenuPoliceJobADNS, function()

                    RageUI.Separator("Satut: "..StateService)

                    RageUI.List('Statut de service', {"~g~En service~s~", "~r~Hors service~s~"}, MenuList.List1, nil, {}, true, {
                        onListChange = function(i,item)
                            MenuList.List1 = i;
                        end,
                        onSelected = function(i,item)
                            grade = ESX.PlayerData.job.grade_label
                            
                            if i == 1 then
                                serverEventTrigger('police:PriseEtFinservice','prise',grade,playerName)
                                PlaySoundFrontend(-1, "Boss_Message_Orange", "GTAO_Boss_Goons_FM_Soundset", 0)
                                policeservice = true
                                StateService = "~g~En service~s~"
                            elseif i == 2 then
                                serverEventTrigger('police:PriseEtFinservice','fin',grade,playerName)
                                PlaySoundFrontend(-1, "Boss_Message_Orange", "GTAO_Boss_Goons_FM_Soundset", 0)
                                policeservice = false       
                                StateService = "~r~Hors service~s~"
                            end
                        end,
                    })

                        if policeservice == false then
                        RageUI.Separator("")RageUI.Separator("~o~Vous n'êtes pas en service")RageUI.Separator("") end

                        if policeservice then
                        RageUI.Separator('~p~↓~s~ Intéractions ~p~↓~s~')
                         if IsPedInAnyVehicle(PlayerPedId(), -1) then 
                            RageUI.Button('Intéraction citoyen', nil, {RightLabel = "→→"}, false)
                        else
                        RageUI.Button('~g~→~s~ Intéraction citoyen', nil, {RightLabel = "→→"}, true, {
                            onSelected = function() 
                        end}, interact);
                    end

                        RageUI.Button("~g~→~s~ Interactions véhicules", nil, {RightLabel = "→→"}, true, {
                            onSelected = function(Index, Items)
                            end,
                        },vehicule);
                        
                        RageUI.Button("~g~→~s~ Codes Radio", nil, {RightLabel = "→→"},true,{
                            onSelected = function()
                            end
                        }, radio);


                        RageUI.Separator("~p~↓~s~ ~o~Utils~s~ ~p~↓~s~")
                        if IsPedInAnyVehicle(PlayerPedId(), -1) then 
                            RageUI.Button('Objet(s)', nil, {RightLabel = "→→"}, false)
                        else
                        RageUI.Button('~p~→~s~ Objet(s)', nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                            end
                        },objectPolice)
                    end
                    if IsPedInAnyVehicle(PlayerPedId(), -1) then 
                        RageUI.Button('Chiens | K9', nil, {RightLabel = "→→"}, false)
                    else
                    RageUI.Button('~p~→~s~ Chiens | K9', nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                        end
                    },PoliceF6K9)
                    
                        
                    end
                    if IsPedInAnyVehicle(PlayerPedId(), -1) then 
                        RageUI.Button('Bouclier LSPD', nil, {RightLabel = "→→"}, false)
                    else
                        RageUI.Button('~p~→~s~ Bouclier LSPD', nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                TriggerEvent("YnS:shield")
                            end
                        })
                    end
                    if IsPedInAnyVehicle(PlayerPedId(), -1) then 
                        RageUI.Button("Zone d'arrêt NPC", nil, {RightLabel = "→→"}, false)
                    else
                        RageUI.Button("~p~→~s~ Zone d'arrêt NPC", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                
                            end
                        },stopNPC)
                    end
                    
                    if IsPedInAnyVehicle(PlayerPedId(), -1) then 
                        RageUI.Button("Poser/Prendre Radar",nil, {RightLabel = "→→"}, false)
                    else
                        RageUI.Button("~p~→~s~ Poser/Prendre Radar",nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                RageUI.CloseAll() 
                                openf6police = false 
                                TriggerEvent('police:POLICE_radar')
                            end
                        },stopNPC)
                    end

                    RageUI.Separator("~r~↓~s~ ~r~Autres~s~ ~r~↓~s~")

                    if ESX.PlayerData.job.grade >= 2 then wtdAccess = true else wtdAccess = false end
                    RageUI.Button("~r~→~s~ Avis de recherche", nil, {RightLabel = "→→"}, wtdAccess, {
                        onSelected = function()
                            RageUI.CloseAll()
                            openf6police = false 
                            wantedMenu()
                        end
                    })
                    if IsPedInAnyVehicle(PlayerPedId(), -1) then 
                        RageUI.Button('Menu Casier Judiciaire', nil, {RightLabel = "→→"}, false)
                    else
                        RageUI.Button('~r~→~s~ Menu Casier Judiciaire', nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                                menuCJ()
                            end
                        })
                    end
                    
                    
                    
                end
                end)
               


                RageUI.IsVisible(stopNPC, function()
                    RageUI.Separator("↓ ~p~Gestion de la circulation~s~ ↓")
                    RageUI.Button("Ajouter une zone d\'arrêt", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            RageUI.CloseAll()
                            openf6police = false
                            TriggerEvent('YnS:promptSpeedzone')
                        end
                    })
                    RageUI.Button("Afficher les zones", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            TriggerEvent('YnS:toggleSpeedzoneDraw')
                        end
                    })
                end)
                    RageUI.IsVisible(interact, function()
                        
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestPlayer ~= -1 and closestDistance <= 2.5 then

                        RageUI.Button("→ LSPD | ~p~Donner une facture", nil, {RightLabel = "→→"},true,{
                            
                            onActive = function()
                                
                                MarqueurPlayerPolice(251, 210, 0)
                            end,
                            onSelected = function()
                                local player, distance = ESX.Game.GetClosestPlayer()
                                local raison = ""
									local montant = 0
									AddTextEntry("FMMC_MPM_NA", "Raison de la facture")
									DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "Donnez une raison de la facture:", "", "", "", "", 30)
									while (UpdateOnscreenKeyboard() == 0) do
										DisableAllControlActions(0)
										Wait(0)
									end
									if (GetOnscreenKeyboardResult()) then
										local result = GetOnscreenKeyboardResult()
										if result then
											raison = result
											result = nil
											AddTextEntry("FMMC_MPM_NA", "Montant de la facture")
											DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "Donnez le montant de la facture:", "", "", "", "", 30)
											while (UpdateOnscreenKeyboard() == 0) do
												DisableAllControlActions(0)
												Wait(0)
											end
											if (GetOnscreenKeyboardResult()) then
												result = GetOnscreenKeyboardResult()
												if result then
													montant = result
													result = nil
													if player ~= -1 and distance <= 3.0 then
														TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_police', 'LSPD', montant)
														TriggerEvent('esx:showAdvancedNotification', 'Fl~g~ee~s~ca ~g~Banque', 'Facture envoyée : ', 'Vous avez envoyé une facture de : ~p~'..montant.. ' $ ~s~pour : ~p~' ..raison.. '', 'CHAR_BANK_FLEECA', 9)
                                                        TriggerClientEvent('esx:showNotification', 'Fl~g~ee~s~ca ~g~Banque~s~\nVous avez envoyé une facture de : ~p~'..montant.. ' $ ~s~pour : ~p~' ..raison.. '')
													else
														ESX.ShowNotification("~r~Problèmes~s~: Aucun joueur à proximitée")
													end
												end
											end
											
									  --  end
									end
									end
                            end
                        })
                        
                        
                        RageUI.Button("→ LSPD | ~p~Fouiller la personne", nil, {RightLabel = "→→"},true,{
                            onActive = function()
                                MarqueurPlayerPolice(251, 210, 0)
                            end,
                            onSelected = function()
                                getPlayerInv(closestPlayer)
                                ExecuteCommand("me fouille l'individu")
                            end
                        }, fouille);
                        
                        RageUI.Button("→ LSPD | ~p~Carte d\'identité", nil, {RightLabel = "→→"},true,{
                            onActive = function()
                                MarqueurPlayerPolice(251, 210, 0)
                            end,
                            onSelected = function()
                                getInformationsPolice(closestPlayer)
                                if identiterp then
                                    mug("Carte d'identité",nil,"~p~Nom:~s~ " ..identiterp.firstname.. "\n~p~Prénom:~s~ " ..identiterp.lastname.. "\n~p~DOB:~s~ " ..identiterp.dob.. "\n~p~Taille:~s~ " ..identiterp.height)
                                end
                            end
                        })

                        RageUI.Button("→ LSPD | ~p~Menotter la personne", nil, {RightLabel = "→→"},true,{
                            onActive = function()
                                MarqueurPlayerPolice(251, 210, 0)
                            end,
                            onSelected = function()
                                TriggerEvent('krz_handcuff:cbClosestPlayerID',  true, 'policecuff')
                            end
                        })

                        RageUI.Button("→ LSPD | ~p~Démenotter la personne", nil, {RightLabel = "→→"},true,{
                            onActive = function()
                                MarqueurPlayerPolice(251, 210, 0)
                            end,
                            onSelected = function()
                                TriggerEvent('krz_handcuff:cbClosestPlayerID',  false, 'policecuff')
                            end
                        })

                        RageUI.Button("→ LSPD | ~p~Escorter la personne", nil, {RightLabel = "→→"},true,{
                            onActive = function()
                                MarqueurPlayerPolice(251, 210, 0)
                            end,
                            onSelected = function()
                                TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(closestPlayer))
                            end
                        })
                   
                        

                        RageUI.Button("→ LSPD | ~p~Mettre dans le véhicule", nil, {RightLabel = "→→"},true,{
                            onActive = function()
                                MarqueurPlayerPolice(251, 210, 0)
                            end,
                            onSelected = function()
                                TriggerServerEvent('esx_policejob:putInVehicle', GetPlayerServerId(closestPlayer))
                            end
                        })

                        RageUI.Button("→ LSPD | ~p~Sortir du véhicule", nil, {RightLabel = "→→"},true,{
                            onActive = function()
                                MarqueurPlayerPolice(251, 210, 0)
                            end,
                            onSelected = function()
                                TriggerServerEvent('esx_policejob:OutVehicle', GetPlayerServerId(closestPlayer))
                            end
                        })
                    else 
                        RageUI.Separator("")RageUI.Separator("~r~Personne à proximité")RageUI.Separator("")
                    end
                end)

                
                local inventaire = false
                local status = true
                
                local inventaire = false
                local status = true
                RageUI.IsVisible(objectPolice, function ()
                    if IsPedSittingInAnyVehicle(PlayerPedId()) then
                        RageUI.Separator('') RageUI.Separator('~r~Aucune actions possible dans un véhicule !') RageUI.Separator('')
                    else
                        RageUI.Button("Mode suppression", "Supprimer des objets", {RightLabel = "→→"}, true, {
                            onSelected = function()
                            end
                        },objectPolice_supp)
                        RageUI.Separator('↓ Spawn props ↓')
                        for k,v in pairs(Policeconfig.props_list) do
                            RageUI.Button(k, "Spawn le props suivant : ~p~"..k, {RightLabel = "→→"}, not spawn_props_acess, {
                                onSelected = function()
                                    SpawnObj(v)
                                end
                            })
                            
                        end
                    end
                    
                    
                    
                end)
                
                RageUI.IsVisible(objectPolice_supp, function()
                   
                        for k,v in pairs(object) do
                            if GoodName(GetEntityModel(NetworkGetEntityFromNetworkId(v))) == 0 then table.remove(object, k) end
                            RageUI.Button("Object: "..GoodName(GetEntityModel(NetworkGetEntityFromNetworkId(v))).." ["..v.."]", nil, {}, true, {
                                 onActive = function()
                                    local entity = NetworkGetEntityFromNetworkId(v)
                                    local ObjCoords = GetEntityCoords(entity)
                                    DrawMarker(0, ObjCoords.x, ObjCoords.y, ObjCoords.z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 1, 0, 2, 1, nil, nil, 0)
                                end,
                                onSelected = function()
                                    RemoveObj(v, k)
                                end
                            })
                        end
                    
                end) 

                RageUI.IsVisible(vehicule, function()
                    local _, distanceveh = ESX.Game.GetClosestVehicle()
                    -- local coords  = GetEntityCoords(PlayerPedId())
                    -- local vehicle = ESX.Game.GetVehicleInDirection()
                    -- local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
                    -- local pos = GetEntityCoords(PlayerPedId())
                    -- local veh, dst = ESX.Game.GetClosestVehicle({x = pos.x, y = pos.y, z = pos.z+1.0})
                    -- pos = GetEntityCoords(veh)
                    if distanceveh <= 4.0 then
                    RageUI.Button("Informations véhicules", nil, {RightLabel = "→→"}, true , {
                        onActive = function()
                            MarqueurPlayerPolice(251, 210, 0)
                        end,
                        onSelected = function()
                            local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
                            getVehicleInfos(vehicleData)
                            if vehicleStats == nil then
                                TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
                                ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\n~g~Recherche des données en cours...')
                                
                                Wait(10000)
                                ClearPedTasksImmediately(PlayerPedId())
                            else
                                local owner = ""
                                if not vehicleStats.owner then owner = "Inconnus" else owner = vehicleStats.owner end
                                ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\n~p~Plaque d\'imatriculation : ~s~'..vehicleStats.plate..'\n ~p~Propriétaire du véhicule : ~s~'..owner)
                            end
                        end
                    })

                    RageUI.Button("Crocheter le véhicule", nil, {RightLabel = "→→"}, not cooltavie , {
                        onActive = function()
                            MarqueurPlayerPolice(251, 210, 0)
                        end,
                        onSelected = function()
                            cooltavie = true
                            SetTimeout(20000, function()  cooltavie = false end)
                            RageUI.CloseAll()
                            openf6police = false
                            vehicle = ESX.Game.GetVehicleInDirection()
                            if IsPedSittingInAnyVehicle(PlayerPedId()) then
                                ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\n~r~Vous ne pouvez pas faire ceci à l\'intérieur d\'un véhicule')                              
                                return
                            end
                
                            if DoesEntityExist(vehicle) then
                                Visual.Subtitle("Crochetage en cours [ ~p~--->~s~ ]",20000)
                                isBusy = true
                                TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_WELDING', 0, true)
                                Citizen.Wait(20000)
                                ClearPedTasksImmediately(PlayerPedId())
                                SetVehicleDoorsLocked(vehicle, 1)
                                SetVehicleDoorsLockedForAllPlayers(vehicle, false)
                                ClearPedTasksImmediately(PlayerPedId())
                                ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\n~g~Le véhicule est dévérouillé')
                                
                                Visual.Subtitle("~g~Crochetage terminé", 1000)
                                isBusy = false
                            else
                                ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\n~r~Il n\'y a pas de véhicule à côté de vous.')
                        end
                    end
                    })

                    RageUI.Button("Mise en fourrière", nil, {RightLabel = "→→"}, true , {
                        onActive = function()
                            MarqueurPlayerPolice(251, 210, 0)
                        end,
                        onSelected = function()
                            if IsPedInAnyVehicle(PlayerPedId(), false) then
                                local pVeh = GetVehiclePedIsIn(PlayerPedId(), false)
                                local model = GetEntityModel(pVeh)

                                Visual.Subtitle("Mise en Fourrière ...",5000)
                                TaskLeaveAnyVehicle(PlayerPedId(), 1, 1)
                                Wait(2500)
                                while IsPedInAnyVehicle(PlayerPedId(), false) do
                                    TaskLeaveAnyVehicle(PlayerPedId(), 1, 1)
                                    Visual.Subtitle("Mise en Fourrière ...",5000)
                                    Wait(200)
                                end
                                DeleteEntity(pVeh)
                                
                                ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\n~o~Fourrière\n~o~Véhicule mis en fourrière')
                                RageUI.CloseAll()
                                openf6police = false
                            else
                                Visual.Subtitle("~p~Police\n~r~Tu dois rentrer dans le véhicule~s~", 5000)
                            end
                        end
                    })
                else
                    RageUI.Separator("")RageUI.Separator("~r~Aucun véhicule à proximité")RageUI.Separator("")
                end
            end)
            RageUI.IsVisible(PoliceF6K9, function()
                
                
                    RageUI.Separator("↓ ~p~Intéractions principales~s~ ↓")
                    RageUI.Button("Sortir/Rentrer le chien", nil, {RightLabel = "→→"},not cooldown,{
                        onSelected = function()
                            if not DoesEntityExist(policeDog) then
                                RequestModel(0x431FC24C)
                                while not HasModelLoaded(0x431FC24C) do Wait(0) end
                                policeDog = CreatePed(4, 0x431FC24C, GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -0.98), 0.0, true, false)
                                SetEntityAsMissionEntity(policeDog, true, true)
                                ESX.ShowNotification('~g~Chien spawn')
                            else
                                ESX.ShowNotification('~r~Chien rentré')
                                DeleteEntity(policeDog)
                            end
                        end})
                        RageUI.Button("Monter / Descendre du véhicule", nil, {RightLabel = "→→"},DoesEntityExist(policeDog),{
                            onSelected = function()
                                if not IsPedInAnyVehicle(policeDog, false) then
                                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(policeDog)) <= 10.0 then
                                        local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 7.5, 0, 70)
                                        if DoesEntityExist(vehicle) then
                                            for i = 0, GetVehicleMaxNumberOfPassengers(vehicle) do
                                                if IsVehicleSeatFree(vehicle, i) then
                                                    TaskEnterVehicle(policeDog, vehicle, 15.0, i, 1.0, 1, 0)
                                                    break
                                                end
                                            end
                                        end
                                    else
                                        ESX.ShowNotification('Votre chien est trop ~r~loin !')
                                    end
                                else
                                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(policeDog)) <= 5.0 then
                                        TaskLeaveVehicle(policeDog, GetVehiclePedIsIn(policeDog, false), 0)
                                    else
                                        ESX.ShowNotification('Votre chien est trop ~r~loin !')
                                    end
                                end
                            end})

                            RageUI.Button("Attaque !", nil, {RightLabel = "→→"},DoesEntityExist(policeDog),{
                                onSelected = function()
                                    if DoesEntityExist(policeDog) then
                                        if not IsPedDeadOrDying(policeDog) then
                                            if GetDistanceBetweenCoords(GetEntityCoords(policeDog), GetEntityCoords(PlayerPedId()), true) <= 15.0 then
                                                local player, distance = ESX.Game.GetClosestPlayer()
                                                if distance ~= -1 then
                                                    if distance <= 3.0 then
                                                        local playerPed = GetPlayerPed(player)
                                                        if not IsPedInCombat(policeDog, playerPed) then
                                                            if not IsPedInAnyVehicle(playerPed, true) then
                                                                TaskCombatPed(policeDog, playerPed, 0, 16)
                                                                followingDogs = false
                                                            end
                                                        else
                                                            ClearPedTasksImmediately(policeDog)
                                                        end
                                                    end
                                                end
                                            end
                                        else
                                            ESX.ShowNotification('Ton chien est ~r~décédé..')
                                        end
                                    else
                                        ESX.ShowNotification('Tu ~r~n\'as pas~s~ de chiens.')
                                    end
                                end})

                                RageUI.Button("Cherche !", nil, {RightLabel = "→→"},DoesEntityExist(policeDog),{
                                    onSelected = function()
                                        if DoesEntityExist(policeDog) then
                                            if not IsPedDeadOrDying(policeDog) then
                                                if GetDistanceBetweenCoords(GetEntityCoords(policeDog), GetEntityCoords(PlayerPedId()), true) <= 3.0 then
                                                    local player, distance = ESX.Game.GetClosestPlayer()
                                                    if distance ~= -1 then
                                                        if distance <= 3.0 then
                                                            local playerPed = GetPlayerPed(player)
                                                            if not IsPedInAnyVehicle(playerPed, true) then
                                                                TriggerServerEvent('esx_policedog:hasClosestDrugs', GetPlayerServerId(player))
                                                            end
                                                        end
                                                    end
                                                end
                                            else
                                                ESX.ShowNotification('Ton chien est ~r~décédé..')
                                            end
                                        else
                                            ESX.ShowNotification('Tu ~r~n\'as pas~s~ de chiens.')
                                        end
                                    end})

                        RageUI.Button("Suis moi !", nil, {RightLabel = "→→"},DoesEntityExist(policeDog),{
                            onSelected = function()
                                local playerPed = PlayerPedId()
                            if DoesEntityExist(policeDog) then
                                if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(policeDog), true) <= 50.0 then
                                    ExecuteCommand('e whistle')
                                    TaskPlayAnim(PlayerPedId(), 'rcmnigel1c', 'hailing_whistle_waive_a', 8.0, -8, -1, 120, 0, false, false, false)
                                    
                                    TaskFollowToOffsetOfEntity( policeDog, playerPed, 0.5, 0.0, 0.0, 5.0, -1, 1.0, true)
                                else
                                    ESX.ShowNotification('~r~Le chien est trop loin de vous !')
                                end
                            else
                                ESX.ShowNotification('~r~Vous n\'avez pas de chien !')
                            end
                            end})
                            RageUI.Separator("↓ ~o~Animations~s~ ↓")
                        RageUI.Button("Assis / Debout !", nil, {RightLabel = "→→"},DoesEntityExist(policeDog),{
                            onSelected = function()
                                if DoesEntityExist(policeDog) then
                                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(policeDog), true) <= 5.0 then
                                        if IsEntityPlayingAnim(policeDog, 'creatures@rottweiler@amb@world_dog_sitting@base', 'base', 3) then
                                            ClearPedTasks(policeDog)
                                        else
                                            loadDict('creatures@rottweiler@amb@world_dog_sitting@base')
                                            TaskPlayAnim(policeDog, 'creatures@rottweiler@amb@world_dog_sitting@base', 'base', 8.0, -8, -1, 1, 0, false, false, false)
                                        end
                                    else
                                        ESX.ShowNotification('Votre chien est trop ~r~loin !')
                                    end
                                else
                                    ESX.ShowNotification('Tu ~r~n\'as pas~s~ de chiens.')
                                end
                            end})
                    RageUI.Button("Coucher / Debout !", nil, {RightLabel = "→→"},DoesEntityExist(policeDog),{
                        onSelected = function()
                            if DoesEntityExist(policeDog) then
                                if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(policeDog), true) <= 5.0 then
                                    if IsEntityPlayingAnim(policeDog, 'creatures@rottweiler@amb@sleep_in_kennel@', 'sleep_in_kennel', 3) then
                                        ClearPedTasks(policeDog)
                                    else
                                        loadDict('creatures@rottweiler@amb@sleep_in_kennel@')
                                        TaskPlayAnim(policeDog, 'creatures@rottweiler@amb@sleep_in_kennel@', 'sleep_in_kennel', 8.0, -8, -1, 1, 0, false, false, false)
                                    end
                                else
                                    ESX.ShowNotification('Votre chien est trop ~r~loin !')
                                end
                            else
                                ESX.ShowNotification('Tu ~r~n\'as pas~s~ de chien.')
                            end
                        end})
            
                        RageUI.Button("Aboie / Chut !", nil, {RightLabel = "→→"},DoesEntityExist(policeDog),{
                            onSelected = function()
                                if DoesEntityExist(policeDog) then
                                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(policeDog), true) <= 5.0 then
                                        if IsEntityPlayingAnim(policeDog, 'creatures@rottweiler@amb@world_dog_barking@idle_a', 'idle_a', 3) then
                                            ClearPedTasks(policeDog)
                                        else
                                            loadDict('creatures@rottweiler@amb@world_dog_barking@idle_a')
                                            TaskPlayAnim(policeDog, 'creatures@rottweiler@amb@world_dog_barking@idle_a', 'idle_a', 8.0, -8, -1, 1, 0, false, false, false)
                                        end
                                    else
                                        ESX.ShowNotification('Votre chien est trop ~r~loin !')
                                    end
                                else
                                    ESX.ShowNotification('Tu ~r~n\'as pas~s~ de chien.')
                                end
                            end})
                   
                            RageUI.Button("La patte !", nil, {RightLabel = "→→"},DoesEntityExist(policeDog),{
                                onSelected = function()
                                    if DoesEntityExist(policeDog) then
                                        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(policeDog), true) <= 5.0 then
                                            if IsEntityPlayingAnim(policeDog, 'creatures@rottweiler@tricks@', 'paw_right_loop', 3) then
                                                ClearPedTasks(policeDog)
                                            else
                                                loadDict('creatures@rottweiler@tricks@')
                                                TaskPlayAnim(policeDog, 'creatures@rottweiler@tricks@', 'paw_right_loop', 8.0, -8, -1, 1, 0, false, false, false)
                                            end
                                        else
                                            ESX.ShowNotification('Votre chien est trop ~r~loin !')
                                        end
                                    else
                                        ESX.ShowNotification('Tu ~r~n\'as pas~s~ de chien.')
                                    end
                                end})
                    

    

                    
        end)

                    RageUI.IsVisible(radio, function()

                        RageUI.Separator("~p~↓~s~ ~o~Codes~s~ ~p~↓~s~")

                            for k,v in pairs(RadioPolice) do
                            RageUI.Button(v.Radio, nil, {RightLabel = "→→"},not cooldown,{
                                onSelected = function()
                                cooldown = true
                                raison = v.raison
                                
                                serverEventTrigger('renfort:policejob', GetEntityCoords(PlayerPedId()), raison)
                              --  serverEventTrigger('renfort:job', GetEntityCoords(PlayerPedId()), raison)
                                serverEventTrigger('alerte:renfort', playerName, v.message)
                                
                                SetTimeout(1000, function()  cooldown = false end)
                            end
                        })
                    end
                end)

            function getInformations(player)
                ESX.TriggerServerCallback('finalpolice:getOtherPlayerData', function(data)
                    identityStats = data
                end, GetPlayerServerId(player))
            end
            
                    RageUI.IsVisible(fouille, function()
                        
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestPlayer ~= -1 and closestDistance <= 2.5 then
                            if #ArgentSale >= 1 then
                                RageUI.Separator("↓ ~r~Argent Sale ~s~↓")
                                for k,v  in pairs(ArgentSale) do
                                RageUI.Button("Argent non déclaré - ("..v.label.."~r~$~s~)", nil, {RightLabel = "→→"},true,{
                                    onSelected = function()
                                            local combien = BoardPolice("Quantité ?", '' , 5)
                                            if tonumber(combien) > v.amount then
                                                ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\n~r~Quantité invalide')
                                                
                                            elseif tonumber(combien) < v.amount then
                                                serverEventTrigger('yaya:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                                            end
                                            RageUI.GoBack()
                                        end
                                    })
                                end
                            else
                            RageUI.Separator("")RageUI.Separator("~r~Aucun argent non déclaré~s~")RageUI.Separator("")
                            end

                            if #Armes >= 1 then
                        
                                RageUI.Separator("~p~↓~s~ ~o~Liste des armes ~s~~p~↓~s~")
                                for k,v  in pairs(Armes) do
                                    RageUI.Button("→ ".. v.label.." ~p~[x"..v.right.."]", nil, { RightLabel ='~o~→' },true,{
                                        onSelected = function()
                                        
                                            serverEventTrigger('yaya:confiscatePlayerItem', GetPlayerServerId(closestPlayer), 'item_weapon', v.value,1)
                                            getPlayerInv(closestPlayer)
                                        end
                                    })
                                end
                            else
                                RageUI.Separator("")RageUI.Separator("~r~Aucune arme~s~")RageUI.Separator("")
                            end
                            
                            if #Items >= 1 then 
                                RageUI.Separator("~p~↓~s~ ~o~Liste des objets ~s~~p~↓~s~")
                                for k,v  in pairs(Items) do
                                    RageUI.Button(v.label.. " - (~p~x~s~"..v.right..")", nil, {RightLabel = "→→"},true,{
                                        onSelected = function()
                                            local combien = BoardPolice("Quantité ?", '' , 5)
                                            if tonumber(combien) > v.amount then
                                                ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\n~r~Quantité invalide')
                                            else
                                                serverEventTrigger('yaya:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                                            end
                                            RageUI.GoBack()
                                        end
                                    })
                                end
                            else
                                RageUI.Separator("")RageUI.Separator("~r~Aucun objet~s~")RageUI.Separator("")
                            end
                            
                            
                    else
                    RageUI.GoBack()
                    end
                end)
            end

                while policeservice do
                    local playerPed = PlayerPedId()
                local coords    = GetEntityCoords(playerPed)
                local pCoords2 = GetEntityCoords(PlayerPedId())
                local activerfps = false

            
                for _,v in pairs(Policeconfig.Ammunation.posammupoli) do
                    if ESX.PlayerData.job.name and ESX.PlayerData.job.name == "police" then
                        if #(pCoords2 - v.posmenuammupolice) < 1.5 then
                            activerfps = true
                            Visual.Subtitle("Appuyer sur ~p~[E]~s~ pour accèder a l'armurie", 1 )
                            if IsControlJustReleased(0, 38) then
                                if ammunationpolice == false then
                                    openAmmuPolice()
                                end
                            end
                        elseif #(pCoords2 - v.posmenuammupolice) < 4.5 then
                            activerfps = true
                            DrawMarker(21, v.posmenuammupolice, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 66, 158, 245, 255, 1, 1, 2, 0, nil, nil, 0)
                        end
                    end
                end
            
                
                
                
                for _,v in pairs(Policeconfig.VehicleRepair.repairpos) do
                    if ESX.PlayerData.job.name and ESX.PlayerData.job.name == "police" then
                        if #(pCoords2 - v.pos) < 1.5 then
                            local vehicle = GetVehiclePedIsIn(playerPed, false)
                            activerfps = true
                            Visual.Subtitle("Appuyer sur ~p~[E]~s~ pour réparer le véhicule", 1)
                            if IsControlJustReleased(0, 38) then
                                RepareAvecPNJ(vehicle)
                            end
                        elseif #(pCoords2 - v.pos) < 15 then
                            activerfps = true
                            DrawMarker(21, v.pos, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false);
                        end
                    end
                end
                for _,v in pairs(Policeconfig.AmmunationSWAT.posammu) do
                    if ESX.PlayerData.job.name and ESX.PlayerData.job.name == "police" then
                        if #(pCoords2 - v.posmenuammuswat) < 1.5 then
                            activerfps = true
                            Visual.Subtitle("Appuyer sur ~p~[E]~s~ pour accèder a l'armurie du SWAT", 1 )
                            if IsControlJustReleased(0, 38) then
                                if ammunationswat == false then
                                    openAmmuSWAT()
                                end
                            end
                        elseif #(pCoords2 - v.posmenuammuswat) < 4.5 then
                            activerfps = true
                            DrawMarker(21, v.posmenuammuswat, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 66, 158, 245, 255, 1, 1, 2, 0, nil, nil, 0)
                        end
                    end
                end
                for _,v in pairs(Policeconfig.ClotheSwat.posvest) do
                    if ESX.PlayerData.job.name and ESX.PlayerData.job.name == "police" then
                        if #(pCoords2 - v.posmenuvestswat) < 1.5 then
                            activerfps = true
                            Visual.Subtitle("Appuyer sur ~p~[E]~s~ pour accèder au vestiaire du SWAT", 1 )
                            if IsControlJustReleased(0, 38) then
                                if vestswat == false then
                                    openVestSWAT()
                                end
                            end
                        elseif #(pCoords2 - v.posmenuvestswat) < 4.5 then
                            activerfps = true
                            DrawMarker(21, v.posmenuvestswat, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 66, 158, 245, 255, 1, 1, 2, 0, nil, nil, 0)
                        end
                    end
                end
                for _,v in pairs(Policeconfig.Camera.pos) do
                    if ESX.PlayerData.job.name and ESX.PlayerData.job.name == "police" then
                        if #(pCoords2 - v.pos) < 1.5 then
                            local vehicle = GetVehiclePedIsIn(playerPed, false)
                            activerfps = true
                            Visual.Subtitle("Appuyer sur ~p~[E]~s~ pour accéder aux caméras", 1)
                            if IsControlJustReleased(0, 38) then
                                    PoliceCam()
                            end
                        elseif #(pCoords2 - v.pos) < 15 then

                            activerfps = true
                            DrawMarker(21, v.pos, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false);
                        end
                    end
                end
                for _,v in pairs(Policeconfig.VehicleDeleters.delpos) do
                    if ESX.PlayerData.job.name and ESX.PlayerData.job.name == "police" then
                        if #(pCoords2 - v.pos) < 1.5 then
                            local vehicle = GetVehiclePedIsIn(playerPed, false)
                            activerfps = true
                            Visual.Subtitle("Appuyer sur ~p~[E]~s~ pour ranger le véhicule", 1)
                            if IsControlJustReleased(0, 38) then
                                ESX.Game.DeleteVehicle(vehicle)
                            end
                        elseif #(pCoords2 - v.pos) < 15 then
                            activerfps = true
                            DrawMarker(21, v.pos, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false);
                        end
                    end
                end
                for _,v in pairs(Policeconfig.bossaction.bosspos) do
                    if ESX.PlayerData.job.name and ESX.PlayerData.job.name == "police" and (ESX.PlayerData.job.grade >= 7) then
                        if #(pCoords2 - v.bpos) < 1.5 then
                            activerfps = true
                            Visual.Subtitle("Appuyer sur ~p~[E]~s~ pour accèder aux actions patrons", 1)
                            if IsControlJustReleased(0, 38) then
                                if policeboss == false then
                                    RefreshpoliceMoney()           
                                    BossPolice()
                                end
                            end
                        elseif #(pCoords2 - v.bpos) < 7.5 then
                            activerfps = true
                            DrawMarker(21, v.bpos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 66, 158, 245, 255, 1, 1, 2, 0, nil, nil, 0)
                        end
                    end
                end
                for _,v in pairs(Policeconfig.Vestpospoli.posvestpoliMR) do
                    if ESX.PlayerData.job.name and ESX.PlayerData.job.name == "police" then
                        if #(pCoords2 - v.posmenu1poli) < 1.5 then
                            activerfps = true
                            Visual.Subtitle("Appuyer sur ~p~[E]~s~ pour accèder au vestiaire", 1)
                            if IsControlJustReleased(0, 38) then
                                if ClotheMPoliceMR == false then
                                    openMenuClothPoliceMR()
                                end
                            end
                        elseif #(pCoords2 - v.posmenu1poli) < 7.5 then
                            activerfps = true
                            DrawMarker(21, v.posmenu1poli, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 66, 158, 245, 255, 1, 1, 2, 0, nil, nil, 0)
                        end
                    end
                end
                for _,v in pairs(Policeconfig.Vestpospoli.posvestpoliVP) do
                    if ESX.PlayerData.job.name and ESX.PlayerData.job.name == "police" then
                        if #(pCoords2 - v.posmenu1poli) < 1.5 then
                            activerfps = true
                            Visual.Subtitle("Appuyer sur ~p~[E]~s~ pour accèder au vestiaire", 1)
                            if IsControlJustReleased(0, 38) then
                                if ClotheMPoliceVP == false then
                                    openMenuClothPoliceVP()
                                end
                            end
                        elseif #(pCoords2 - v.posmenu1poli) < 7.5 then
                            activerfps = true
                            DrawMarker(21, v.posmenu1poli, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 66, 158, 245, 255, 1, 1, 2, 0, nil, nil, 0)
                        end
                    end
                end
                for k,v in pairs(Policeconfig.PoliceGarage.vpos) do
                    if #(pCoords2 - v.posmenugarage) < 1.5 then
                        activerfps = true
                        Visual.Subtitle("Appuyer sur ~p~[E]~s~ pour accèder au garage", 1)
                        if IsControlJustReleased(0, 38) then 
                            
                            if policegarage == false then   
                                openGaragePolice() 
                            end
                        end
                    elseif #(pCoords2 - v.posmenugarage) < 20.0 then
                        activerfps = true
                        DrawMarker(21, v.posmenugarage, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 80, 255, 200, 0, 1, 2, 0, nil, nil, 0)
                    end
                end
                for k,v in pairs(Policeconfig.stockpol.posstockpoli) do
                    if ESX.PlayerData.job.name and ESX.PlayerData.job.name == "police" then
                        if #(pCoords2 - v.posstockpoli) < 1.5 then
                            activerfps = true
                            Visual.Subtitle("Appuyer sur ~p~E~s~ pour accèder au stock de l'entreprise")
                            if IsControlJustReleased(0, 38) then
                                if CoffrePolice == false then 
                                    Coffrepolice()
                                    TriggerEvent('blowSociety:openStock')
                                end
                            end
                        elseif #(pCoords2 - v.posstockpoli) < 4.5 then
                            activerfps = true
                            DrawMarker(21, v.posstockpoli, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 66, 158, 245, 255, 1, 1, 2, 0, nil, nil, 0)
                        end
                    end
                end
                for k,v in pairs(Policeconfig.PoliceHeliGarage.vpos) do
                    if #(pCoords2 - v.posmenuheligarage) < 1.5 then
                        activerfps = true
                        Visual.Subtitle("Appuyer sur ~p~[E]~s~ pour accèder au garage hélicoptère", 1)
                        if IsControlJustReleased(0, 38) then  
                            if policehelico == false then   
                                openPoliceHelico() 
                            end
                        end
                    elseif #(pCoords2 - v.posmenuheligarage) < 5.0 then
                        activerfps = true
                        DrawMarker(21, v.posmenuheligarage, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 80, 255, 200, 0, 1, 2, 0, nil, nil, 0)
                    end
                end
                if activerfps then
                    Wait(1)
                else
                    Wait(1500)
                end
            end
        end)
    end
end



RegisterNetEvent('policeDog:hasDrugs')
AddEventHandler('policeDog:hasDrugs', function(hadIt)
    if hadIt then
        ESX.ShowNotification(Strings['drugs_found'])
        loadDict('missfra0_chop_find')
        TaskPlayAnim(policeDog, 'missfra0_chop_find', 'chop_bark_at_ballas', 8.0, -8, -1, 0, 0, false, false, false)
    else
        ESX.ShowNotification('Pas de drogue ici')
    end
end)
function RegisterCommandKey(action, description, defaultKey, callback)
    RegisterKeyMapping(action, description, 'keyboard', defaultKey)
    RegisterCommand(action, function()
        callback()
    end, false)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
        if IsControlJustPressed(1,167) then
            openMenuF6Poulice()
        end
    end
end
end)

function cuffedYnS()
    
            
            DisableControlAction(0, 2, true) -- Disable tilt
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 257, true) -- Attack 2
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 263, true) -- Melee Attack 1
            DisableControlAction(0, Keys['W'], true) -- W
            DisableControlAction(0, Keys['A'], true) -- A
            DisableControlAction(0, 31, true) -- S (fault in Keys table!)
            DisableControlAction(0, 30, true) -- D (fault in Keys table!)

            DisableControlAction(0, Keys['R'], true) -- Reload
            DisableControlAction(0, Keys['SPACE'], true) -- Jump
            DisableControlAction(0, Keys['Q'], true) -- Cover
            DisableControlAction(0, Keys['TAB'], true) -- Select Weapon
            DisableControlAction(0, Keys['F'], true) -- Also 'enter'?

            DisableControlAction(0, Keys['F1'], true) -- Disable phone
            DisableControlAction(0, Keys['F2'], true) -- Inventory
            DisableControlAction(0, Keys['F3'], true) -- Animations
            DisableControlAction(0, Keys['F6'], true)
            DisableControlAction(0, Keys['F5'], true)-- Job

            DisableControlAction(0, Keys['V'], true) -- Disable changing view
            DisableControlAction(0, Keys['C'], true) -- Disable looking behind
            DisableControlAction(0, Keys['X'], true) -- Disable clearing animation
            DisableControlAction(2, Keys['P'], true) -- Disable pause screen

            DisableControlAction(0, 59, true) -- Disable steering in vehicle
            DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
            DisableControlAction(0, 72, true) -- Disable reversing in vehicle

            DisableControlAction(2, Keys['LEFTCTRL'], true) -- Disable going stealth

            DisableControlAction(0, 47, true)  -- Disable weapon
            DisableControlAction(0, 264, true) -- Disable melee
            DisableControlAction(0, 257, true) -- Disable melee
            DisableControlAction(0, 140, true) -- Disable melee
            DisableControlAction(0, 141, true) -- Disable melee
            DisableControlAction(0, 142, true) -- Disable melee
            DisableControlAction(0, 143, true) -- Disable melee
            DisableControlAction(0, 75, true)  -- Disable exit vehicle
            DisableControlAction(27, 75, true) -- Disable exit vehicle
			 
end


AddEventHandler('krz_handcuff:cbClosestPlayerID', function(wannacuff, method)
    
	local closestPlayer, distance = ESX.Game.GetClosestPlayer()

	if distance ~= -1 and distance <= 3 and not IsPedInAnyVehicle(PlayerPedId()) and not IsPedInAnyVehicle(GetPlayerPed(closestPlayer)) and not isArresting then
		serverEventTrigger('krz_handcuff:handcuff', GetPlayerServerId(closestPlayer), wannacuff, method)
	else
        ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\n~r~Aucun joueurs à proximité.')
	end
end)



RegisterNetEvent('krz_handcuff:thecuff')
AddEventHandler('krz_handcuff:thecuff', function(wannamove, cufferSource)
	local plyPed = PlayerPedId()
	if wannamove then
		cuffedYnS()
        
		local targetPed = GetPlayerPed(GetPlayerFromServerId(cufferSource))
	
		ESX.Streaming.RequestAnimDict(cuffdict)
		ESX.Streaming.RequestAnimDict(cuffeddict)
		
		AttachEntityToEntity(plyPed, targetPed, 11816, -0.1, 0.45, 0.0, 0.0, 0.0, 20.0, false, false, false, false, 20, false)
		TaskPlayAnim(plyPed, cuffdict, cuffedanim, 8.0, -8.0, 4300, 33, 0.0, false, false, false)
		RemoveAnimDict(cuffdict)
		Citizen.Wait(2000)

		DetachEntity(plyPed, true, false)
		serverEventTrigger('InteractSound_SV:PlayWithinDistance', 3.0, 'cuff', 0.7)
		Citizen.Wait(2300)
        TriggerEvent("ui:toggle", false)
        SetEnableHandcuffs(plyPed, true)
        DisablePlayerFiring(plyPed, true)
        SetCurrentPedWeapon(plyPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
        SetPedCanPlayGestureAnims(plyPed, false)
        
        
        DisplayRadar(false)
		prevDrawable, prevTexture, prevPalette = GetPedDrawableVariation(plyPed, 7), GetPedTextureVariation(plyPed, 7), GetPedPaletteVariation(plyPed, 7)

		if GetEntityModel(plyPed) == femaleHash then
			SetPedComponentVariation(plyPed, 7, 25, 0, 0)
		elseif GetEntityModel(plyPed) == maleHash then
			SetPedComponentVariation(plyPed, 7, 41, 0, 0)
		end

		plyPed = PlayerPedId()
		SetEnableHandcuffs(plyPed, true)

		TaskPlayAnim(plyPed, cuffeddict, 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
		RemoveAnimDict(cuffeddict)
	elseif not wannamove then
		serverEventTrigger('InteractSound_SV:PlayWithinDistance', 3.0, 'uncuff', 0.7)
        DisplayRadar(true)
        TriggerEvent("ui:toggle", true)
		ClearPedTasks(plyPed)
		SetEnableHandcuffs(plyPed, false)
		UncuffPed(plyPed)
		SetPedComponentVariation(plyPed, 7, prevTexture, prevTexture, prevPalette)

		
	end
end)

loadDict = function(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
end
RegisterNetEvent('krz_handcuff:arresting')
AddEventHandler('krz_handcuff:arresting', function()
    isHandcuffed = true
	ESX.Streaming.RequestAnimDict(cuffdict)

	isArresting = true
	local plyPed = PlayerPedId()

	TaskPlayAnim(plyPed, cuffdict, cuffanim, 8.0, -8.0, 4300, 33, 0.0, false, false, false)
	RemoveAnimDict(cuffdict)
	Citizen.Wait(4300)
	isArresting = false
end)

RegisterNetEvent('krz_handcuff:unarresting')
AddEventHandler('krz_handcuff:unarresting', function()
    isHandcuffed = false
	ESX.Streaming.RequestAnimDict(uncuffdict)

	isArresting = true
	local plyPed = PlayerPedId()

	TaskPlayAnim(plyPed, uncuffdict, uncuffanim, 8.0, -8.0, -1, 2, 0.0, false, false, false)
	RemoveAnimDict(uncuffdict)
	Citizen.Wait(2200)
	ClearPedTasksImmediately(plyPed)
	isArresting = false
end)



RegisterNetEvent('esx_policejob:drag')
  AddEventHandler('esx_policejob:drag', function(copID)
    
	  if  isHandcuffed then
		  return
	  end
  
	  DragStatus.IsDragged = not DragStatus.IsDragged
	  DragStatus.CopId     = tonumber(copID)
      DragYnS()
    end)
    
    function DragYnS()
        local playerPed
        local targetPed
  
      if not isHandcuffed then
          
          playerPed = PlayerPedId()
  
          if DragStatus.IsDragged then
              
              targetPed = GetPlayerPed(GetPlayerFromServerId(DragStatus.CopId))
  
              -- undrag if target is in an vehicle
              if not IsPedSittingInAnyVehicle(targetPed) then
                  
                  AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
              else
                  
                  DragStatus.IsDragged = false
                  DetachEntity(playerPed, true, false)
              end
  
          else
              DetachEntity(playerPed, true, false)
          end
      else
          Citizen.Wait(500)
      end
        
    end

    RegisterNetEvent('esx_policejob:putInVehicle')
    AddEventHandler('esx_policejob:putInVehicle', function()
        local playerPed = PlayerPedId()
        local coords    = GetEntityCoords(playerPed)
    
        if  IsHandcuffed then
            return
        end
    
        if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
            local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
    
            if DoesEntityExist(vehicle) then
                local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
                local freeSeat = nil
    
                for i=maxSeats - 1, 0, -1 do
                    if IsVehicleSeatFree(vehicle, i) then
                        freeSeat = i
                        break
                    end
                end
    
                if freeSeat ~= nil then
                    TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
                    DragStatus.IsDragged = false
                end
            end
        end
    end)

    RegisterNetEvent('esx_policejob:OutVehicle')
    AddEventHandler('esx_policejob:OutVehicle', function()
        local playerPed = PlayerPedId()
    
        if not IsPedSittingInAnyVehicle(playerPed) then
            return
        end
    
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        TaskLeaveVehicle(playerPed, vehicle, 16)
    end)







    
    function RepareAvecPNJ(target)
        
        Citizen.CreateThread(function()
            SetVehicleUndriveable(target, true)
            SetVehicleDoorOpen(target, 4, false, false)
            Citizen.Wait(0)
            SetVehicleDoorShut(target, 4, 0)
            SetVehicleFixed(target)
            SetVehicleDeformationFixed(target)
            SetVehicleUndriveable(target, false)
        end)
    end








----------------------- BOSS ------------------------------


local PlayerData = {}
local societypolicemoney = nil
local camera = false



---------------- FONCTIONS ------------------

function BossPolice()
    
    if policeboss then
        policeboss = false
        
    else
        policeboss = true
        RageUI.Visible(sPoliceBoss, true)
        CreateThread(function()
            while policeboss do
                Wait(1)
                RageUI.IsVisible(sPoliceBoss, function()
                    if societypolicemoney ~= nil then
                        RageUI.Button("Argent société :", nil, {RightLabel = "$" .. societypolicemoney},true,{
                            onSelected = function()
                            end}) 
                    end

                   

                    
                
                    RageUI.Button("Accéder aux actions de Management",nil, {RightLabel = ""},true,{
                        onSelected = function()
                            aboss()
                            RageUI.CloseAll()
                            policeboss = false
                        end})
                    end)
                end
            end)
    end
end
local policeCamOpen = false
local sPoliceCam = RageUI.CreateMenu("Police", "Caméras", 10, 80)
sPoliceCam:SetRectangleBanner(33,32,49,500)
sPoliceCam.Closed = function()
policeCamOpen = false
end
function PoliceCam()
    if policeCamOpen then
        policeCamOpen = false
        RageUI.Visible(sPoliceCam, false)
    else
        policeCamOpen = true
        RageUI.Visible(sPoliceCam, true)
        CreateThread(function()
            while policeCamOpen do
                Wait(1)
                RageUI.IsVisible(sPoliceCam, function()
                        RageUI.Checkbox("Accéder aux caméras", nil, checkbox, {}, {
                            onChecked = function()
                                camera = true
                            end,
                            onUnChecked = function()
                                camera = false
                            end,
                            onSelected = function(Index)
                                checkbox = Index
                            end
                        })
                
               

                    if camera then
                        for k,v in pairs(CCTVCamLocations)do
                        RageUI.Button(v['info'],nil,  {RightLabel = "→→"},true,{
                            onSelected = function()
                                TriggerEvent('cctv:camera', k)
                            end}) 
                        end
                                                                            
                end


                end, function()
            end)
            
            
        end
    end)
end
end

---------------------------------------------



function RefreshpoliceMoney()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
        ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
            UpdateSocietypoliceMoney(money)
        end, ESX.PlayerData.job.name)
    end
end

function UpdateSocietypoliceMoney(money)
    societypolicemoney = ESX.Math.GroupDigits(money)
end

function aboss()
    TriggerEvent('esx_society:openBoslikesMenu', 'police', function(data, menu)
        menu.close()
    end, {wash = false})
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end 
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end






---- Chien
local policeDog = false
followingDogs = false
local PlayerData = {}


Citizen.CreateThread(function()
    PlayerData = ESX.GetPlayerData()
    while true do
        local sleep = 3500
        if DoesEntityExist(policeDog) then
            if GetDistanceBetweenCoords(GetEntityCoords(policeDog), GetEntityCoords(PlayerPedId()), true) >= 50 and not IsEntityPlayingAnim(policeDog, 'creatures@rottweiler@amb@world_dog_sitting@base', 'base', 3) and not IsPedInAnyVehicle(policeDog, false) then
                SetEntityCoords(policeDog, GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -1.0, -0.98))
            end
            if GetDistanceBetweenCoords(GetEntityCoords(policeDog), GetEntityCoords(PlayerPedId()), true) >= 2.0 and not IsPedInAnyVehicle(policeDog, true) and not IsEntityPlayingAnim(policeDog, 'creatures@rottweiler@amb@world_dog_sitting@base', 'base', 3) and IsPedStill(policeDog) then
                TaskGoToCoordAnyMeans(policeDog, GetEntityCoords(PlayerPedId()), 5.0, 0, 0, 786603, 0xbf800000)
            end
        end
        Wait(sleep)
    end
end)

RegisterNetEvent('esx_policedog:hasDrugs')
AddEventHandler('esx_policedog:hasDrugs', function(hadIt)
    if hadIt then
        ESX.ShowNotification('De la drogue a été ~g~trouvée !')
        loadDict('missfra0_chop_find')
        TaskPlayAnim(policeDog, 'missfra0_chop_find', 'chop_bark_at_ballas', 8.0, -8, -1, 0, 0, false, false, false)
    else
        ESX.ShowNotification('~r~Pas de drogues~s~ sur la personne !')
    end
end)

loadDict = function(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
end


------ GAV -------------





local interval = 1000
InZone = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(interval)
        for k,v in pairs(Policeconfig.posGAV)do
            local pCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local distance = Vdist(pCoords.x, pCoords.y, pCoords.z, Policeconfig.posGAV[k].x, Policeconfig.posGAV[k].y, Policeconfig.posGAV[k].z)
            if distance <= 7.0  then
                interval = 0
                InZone[v.Zones] = true
                DrawMarker(20, Policeconfig.posGAV[k].x, Policeconfig.posGAV[k].y, Policeconfig.posGAV[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 0, 255, 255, 0, 1, 2, 0, nil, nil, 0)
            else
                if InZone[v.Zones] then
                        interval = 1000
                        InZone[v.Zones] = false
                 end
            end
            if distance <= 1.0 then
                Visual.Subtitle("Appuyez sur ~p~[E]~s~ pour accéder au vestiaire de GAV", 1)
                if IsControlJustPressed(1,51) then           
                    MenuGAV()
                    end
            end  
        end
    end
end)
local tenuGAV = false

function MenuGAV()
    
    if openGAVMenu then
        openGAVMenu = false
       
    else
        openGAVMenu = true
        
        RageUI.Visible(sMenuGav, true)
        local playerPed = GetPlayerPed(-1)
	CreateThread(function()
		while openGAVMenu do
            Wait(1)
            RageUI.IsVisible(sMenuGav, function()
                if tenuGAV == true then
                    RageUI.Separator("")
                    RageUI.Separator("↓ Tenue - ~g~[Civil]~s~ ↓")
                    RageUI.Separator("")
                    for _,infos in pairs(Cloak.clothes.specials) do
                        
                        RageUI.Button("→ GAV - ~g~Récupérer ses affaires", nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                            onSelected = function()
                                PoliceSkin(infos)
                                    tenuGAV = false
                            end
                        })
                    end
                    
                    
                else 
                    RageUI.Separator("")
                    RageUI.Separator("↓ Tenue - ~o~[GAV]~s~ ↓")
                    RageUI.Separator("")
                    for _,infos in pairs(Cloak.clothes.gav) do
                        
                        RageUI.Button("→ GAV - ~o~S'habiller", nil, {RightBadge = RageUI.BadgeStyle.Clothes}, true, {
                            onSelected = function()
                                tenuGAV = true
                                PoliceSkin(infos)
                            end
                        })
                    end
                    
                    
    
                
                        
                end
                    end, function() end, 1)

            end
        end)
    end
end







--------------SHIELD--------------------------------
local shieldActive = false
local shieldEntity = nil
local hadPistol = false

-- ANIM
local animDict = "combat@gestures@gang@pistol_1h@beckon"
local animName = "0"

local prop = "prop_ballistic_shield"
local pistol = `WEAPON_PISTOL`

AddEventHandler('YnS:shield', function()
	if shieldActive then
		DisableShield()
	else
		EnableShield()
	end
end)

function EnableShield()
	if IsPedInAnyVehicle(PlayerPedId(), true) then
		return
	end

	TriggerEvent('nwx:setHolstering', false)
	Citizen.Wait(200)
	shieldActive = true
    if not IsEntityPlayingAnim(ped, animDict, animName, 1) then
        RequestAnimDict(animDict)
        repeat
            Citizen.Wait(0)
        until HasAnimDictLoaded(animDict)

        TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, (2 + 16 + 32), 0.0, 0, 0, 0)
    end
    sleep = 0
    DisableControlAction(0, 23, true)
    DisableControlAction(0, 25, true)

    local playerPed = PlayerPedId()
    local _,weaponHash = GetCurrentPedWeapon(playerPed, 1)
    if weaponHash ~= `WEAPON_UNARMED` and GetPedAmmoTypeFromWeapon(playerPed, weaponHash) ~= `AMMO_PISTOL` then
        print('a:'..tostring(weaponHash ~= `WEAPON_UNARMED`))
        print('b:'..tostring(GetPedAmmoTypeFromWeapon(playerPed, weaponHash) ~= `AMMO_PISTOL`))
        SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, true)
    end
    SetCurrentPedWeapon(ped, pistol, 1)

    for _, vehicle in EnumerateVehicles() do
        SetEntityNoCollisionEntity(vehicle, shieldEntity, false)
    end
	local ped = PlayerPedId()
	local pedPos = GetEntityCoords(ped, false)

	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(100)
	end

	TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, (2 + 16 + 32), 0.0, 0, 0, 0)

	ESX.Streaming.RequestModel(GetHashKey(prop))

	shieldEntity = CreateObject(GetHashKey(prop), pedPos.x, pedPos.y, pedPos.z, true, true, true)
	AttachEntityToEntity(shieldEntity, ped, GetEntityBoneIndexByName(ped, "IK_L_Hand"), 0.0, -0.05, -0.10, -30.0, 180.0, 40.0, 0, 0, 1, 0, 0, 1)
	SetWeaponAnimationOverride(ped, `Gang1H`)

	if HasPedGotWeapon(ped, pistol, 0) or GetSelectedPedWeapon(ped) == pistol then
		SetCurrentPedWeapon(ped, pistol, 1)
		hadPistol = true
	else
		hadPistol = false
	end
end

function DisableShield()
	local ped = PlayerPedId()
	DeleteEntity(shieldEntity)
	ClearPedTasksImmediately(ped)
	SetWeaponAnimationOverride(ped, `Default`)

	if not hadPistol then
		RemoveWeaponFromPed(ped, pistol)
	end

	hadPistol = false
	shieldActive = false
	TriggerEvent('nwx:setHolstering', true)
end



-- Speedzones

local Speedzones = {}
local DrawSpeedzones = false
local InstructionScaleform = nil

AddEventHandler('YnS:toggleSpeedzoneDraw', function()
	DrawSpeedzones = not DrawSpeedzones
	if DrawSpeedzones then
		ESX.ShowNotification('~g~Affichage des zones d\'arrêt NPC')
	else
		ESX.ShowNotification('~r~Zones d\'arrêt NPC masquées')
	end
end)

local sizeMax = 50.0
AddEventHandler('YnS:promptSpeedzone', function()
	local BeforougerawSpeedzones = DrawSpeedzones
	DrawSpeedzones = true
	InDrawSpeedzones()
	local placed = false
	local size = 1.0

	InitInstructionScaleform()

	repeat
		DrawMarker(25, GetEntityCoords(PlayerPedId()) + vector3(0,0,-0.95), 0, 0, 0, GetEntityRotation(PlayerPedId()), size * 2.0, size * 2.0, 1.0, 10, 10, 10, 255, false, false, 2, false, nil, nil, false)
		DrawScaleformMovieFullscreen(InstructionScaleform, 255, 255, 255, 255, 0);


		if IsControlPressed(0, 172) then -- UP
			if size <= sizeMax then
				size = size + 0.1
			end
		elseif IsControlPressed(0, 173) then -- DOWN
			if size >= 1.0 then
				size = size - 0.08
			end
		end

		if IsControlJustReleased(1, 348) or IsControlJustPressed(1, 201) then
			placed = true
		end

		if IsControlJustReleased(1, 194) or IsPedInAnyVehicle(PlayerPedId(), true) then -- Cancel
			ESX.ShowNotification('~r~Zone d\'arrêt annulée')
			DrawSpeedzones = BeforougerawSpeedzones
			InDrawSpeedzones()
			TriggerEvent('YnS:finishedPlacingSpeedzone')
			return
		end

		Citizen.Wait(0)
	until placed

	TriggerServerEvent('YnS:addSpeedzone', GetEntityCoords(PlayerPedId()), size)
	DrawSpeedzones = BeforougerawSpeedzones
	InDrawSpeedzones()
end)

RegisterNetEvent('YnS:addSpeedzone')
AddEventHandler('YnS:addSpeedzone', function(whoCreated, pos, size)
	local zoneIndex = AddSpeedZoneForCoord(pos.x, pos.y, pos.z, size, 0.0, false)
	table.insert(Speedzones, {
		whoCreated = whoCreated,
		pos = pos,
		size = size,
		zoneIndex = zoneIndex,
	})
	if whoCreated == GetPlayerServerId(PlayerId()) then
		ESX.ShowNotification('~g~Zone d\'arrêt placée')
		TriggerEvent('YnS:finishedPlacingSpeedzone')
	end
end)

RegisterNetEvent('YnS:removeSpeedzone')
AddEventHandler('YnS:removeSpeedzone', function(whoDeleted, deletedSpeedZone)
	for i,speedZone in pairs(Speedzones) do
		if speedZone.pos == deletedSpeedZone.pos then
			Speedzones[i] = nil
		end
	end
	RemoveSpeedZone(deletedSpeedZone.zoneIndex)
	if deletedSpeedZone.whoCreated ~= whoDeleted and deletedSpeedZone.whoCreated == GetPlayerServerId(PlayerId()) then
		ESX.ShowNotification('~r~Votre zone d\'arrêt a été supprimée')
	end
	if whoDeleted == GetPlayerServerId(PlayerId()) then
		ESX.ShowNotification('~r~Zone d\'arrêt supprimée')
	end
end)

function InitInstructionScaleform()
	InstructionScaleform = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS");
	repeat
		Citizen.Wait(0)
	until HasScaleformMovieLoaded(InstructionScaleform)

	BeginScaleformMovieMethod(InstructionScaleform, "CLEAR_ALL");
	EndScaleformMovieMethod();

	BeginScaleformMovieMethod(InstructionScaleform, "SET_DATA_SLOT");
	ScaleformMovieMethodAddParamInt(6);
	PushScaleformMovieMethodParameterString("~INPUT_FRONTEND_ACCEPT~");
	PushScaleformMovieMethodParameterString("~INPUT_MAP_POI~");
	PushScaleformMovieMethodParameterString("Poser la zone d'arrêt");
	EndScaleformMovieMethod();

	BeginScaleformMovieMethod(InstructionScaleform, "SET_DATA_SLOT");
	ScaleformMovieMethodAddParamInt(5);
	PushScaleformMovieMethodParameterString("~INPUT_FRONTEND_RRIGHT~");
	PushScaleformMovieMethodParameterString("Annuler");
	EndScaleformMovieMethod();

	BeginScaleformMovieMethod(InstructionScaleform, "SET_DATA_SLOT");
	ScaleformMovieMethodAddParamInt(4);
	PushScaleformMovieMethodParameterString("~INPUT_CELLPHONE_UP~");
	PushScaleformMovieMethodParameterString("Agrandir la zone");
	EndScaleformMovieMethod();

	BeginScaleformMovieMethod(InstructionScaleform, "SET_DATA_SLOT");
	ScaleformMovieMethodAddParamInt(3);
	PushScaleformMovieMethodParameterString("~INPUT_CELLPHONE_DOWN~");
	PushScaleformMovieMethodParameterString("Réduire la zone");
	EndScaleformMovieMethod();

	BeginScaleformMovieMethod(InstructionScaleform, "DRAW_INSTRUCTIONAL_BUTTONS");
	ScaleformMovieMethodAddParamInt(0);
	EndScaleformMovieMethod();
end

function DrawSpeedzone(Speedzone, Selected)
	if Selected then
		DrawMarker(25, Speedzone.pos + vector3(0,0,-0.95), 0, 0, 0, 0, 0, 0, Speedzone.size * 2.0, Speedzone.size * 2.0, 1.0, 127, 0, 0, 200, false, false, 2, false, nil, nil, false)
	else
		DrawMarker(25, Speedzone.pos + vector3(0,0,-0.95), 0, 0, 0, 0, 0, 0, Speedzone.size * 2.0, Speedzone.size * 2.0, 1.0, 0, 0, 127, 127, false, false, 2, false, nil, nil, false)
	end
end

function InDrawSpeedzones()
	if not DrawSpeedzones then return end

	Citizen.CreateThread(function()
		while DrawSpeedzones do
			Citizen.Wait(0)
			local playerPos = GetEntityCoords(PlayerPedId())
			local closest, closestDistance = nil, 1000

			for _,Speedzone in pairs(Speedzones) do
				local distance = #(Speedzone.pos - playerPos)
				if distance < 30 then
					DrawSpeedzone(Speedzone, false)
					if distance < closestDistance then
						closestDistance = distance
						closest = Speedzone
					end
				end
			end

			if closest and closestDistance < closest.size then
				DrawSpeedzone(closest, true)
				ESX.ShowHelpNotification('~INPUT_CELLPHONE_OPTION~ pour supprimer la zone d\'arrêt NPC')
				if IsControlJustReleased(1, 178) then
					TriggerServerEvent('YnS:removeSpeedzone', closest)
				end
			end
		end
	end)
end

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
    local specialContact = {
        name       = 'police',
        number     = 'police',
        base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTVGcd/u3cfSXaTLEk2j80TCI8ECI9ABCyoiBqhBVQqVG2ppVKBQqUVgUl5OU7HKqNOHUHU0oHamZZWoGkVS6cWAR2JPJuAQBPy2ISEvLN57+v2u2E33e4k6Ngz85+9d++95/zP9/h/39GpqsqiRYsIGz8QZAq28/8PRfC+4HT4fMXFxeiH+GC54NeCbYLLATLpYe/ECx4VnBTsF0wWhM6lXY8VbBE0Ch4IzLcpfDFD2P1TgrdC7nMCZLRxQ9AkiAkQCn77DcH3BC2COoFRkCSIG2JzLwqiQi0RSmCD4JXbmNKh0+kc/X19tLtc9Ll9sk9ZS1yoU71YIk3xsbEx8QaDEc2ttxmaJSKC1ggSKBK8MKwTFQVXRzs3WzpJGjmZgvxcMpMtWIwqsjztvSrlzjYul56jp+46qSmJmMwR+P3+4aZ8TtCprRkk0DvUW7JjmV6lsqoKW/pU1q9YQOE4Nxkx4ladE7zd8ivuVmJQfXZKW5dx5EwPRw4fxNx2g5SUVLw+33AkzoRaQDP9SkFu6OKqz0uF8yaz7vsOL6ycQVLkcSg/BlWNsjuFoKE1knqDSl5aNnmPLmThrE0UvXqQqvJPyMrMGorEHwQfEha57/3P7mXS684GFjy8kreLppPUuBXfyd/ibeoS2kb0mWPANhJdYjb61AxUvx5PdT3+4y+Tb3mTd19ZSebE+VTXVGNQlHAC7w4VhH8TbA36vKq6ilnzlvPSunHw6Trc7XpZ14AyfgYeyz18crGN1Alz6e3qwNNQSv4dZox1h/BW9+O7eIaEsVv41Y4XeHJDG83Nl4mLTwzGhJYtx0PzNTjOB9KMTlc7Nkcem39YAGU7cbeBKVLMPGMVf296nMd2VbBq1wmizHoqqm/wrS1/Zf0+N19YN2PIu1fcIda4Vk66Zx/rVi+jo9eIX9wZGGcFXUMR6BHUa76/2ezioYcXMtpyAl91DSaTfDxlJbtLprHm2ecpObqPuTPzSNV9yKz4a4zJSuLo71/j8Q17ON69EmXiPIlNMe6FoyzOqWPW/MU03Lw5EFcyKghTrNDh7+/vw545mcJcWbTiGKpRdGPMXbx90sGmDaux6sXk+kimjU+BjnMkx3kYP34cXrFuZ+3nrHi6iDMt92JITcPjk3R3naRwZhpuNSqoD93DKaFVU7j2dhcF8+YzNlpErbIBTVh8toVccbaysPB+4pMcuPw25kwSsau7BIlmHpy3guaOPtISYyi/UkaJM5Lpc5agq5Xkcl6gIHkmqaMn0dtylcjIyPThCNyhaXyfR2W0I1our0v6qBii07ih5rDtGSOxNVdk1y4R2SR8jR/g7hQD9l1jUeY/WLJB5m39AlZN4GZyIQ1fFJNsEgt0duBIc5GRkcZF53mNwIzhXPDgQPoZIkiMkbTxtstDMVnmFA4cOsbz2/aKjSQjev4Mp9ZAg+hIpFhB3EH5Yal16+X+Kq3dGfxkzRY+KauBjBzREvGN0kNCTARu94AejBLMHorAQ7cEQMGs2cXvkWshYLDi6e9l728O8P1XW6hKeB2yv42q18tjj+iFTGoSi+X9jJM9RTxS9E+OHT0krhNiZqlbqraoT7RAU5bBGrEknEBhgJks7KXbLS8qERI0ErVqF/Y4K6NHZfLZB+/wzJvncacvFd91oXO3o/O40MfZKJOKu/rne+mRQByXM4lYreb1tUnkizVVA/0SpfpbWaCNBeEE5gb/UH19NLqEgDF+oNDQWcn41Cj0EXFEWqzkOIyYekslFkThsvMxpIyE2hIc6lXGZ6cPyK7Nnk5OipixRdxgUESAYmhq68VsGgy5CYKCUAJTg0+izApXne3CJFmUTwg4L3FProFxU+6krqmXu3MskkhSD2av41jLdzlnfFrSdCZxyqfMnppN6ZUa7pwt0h3fiK9DCt4IO9e7YqisvI7VYgmNv7mhBKKD/9psNi5dOMv5ZjukjsLdr0ffWsyTi6eSlfcA+dmiVyOXs+/sHNZu3M6PdxzgVO9GmDSHsSNqmTz/R6y6Xxqma4fwaS5Mn85n1ZE0Vl3CHBER3lUNEhiURpPJRFdTOcVnpUJnPIhR7cZXfoH5UYc5+E4RzRH3sfSnl9m2dSMjE+Tz9msse+o5dr7UwcQ5T3HwlWUkNuzG3dKFSTbsNs7m/Y8vExOlC29UWkMJlAxKoRQMR3IC7x85zOn6fHS50+U/2Untx2R1voinu5no+DQmz7yPXmMKZnsu0wrm0Oe3YhOVHdm8A09dBQYhTv4T7C+xUPrZh8Qn2MMr4qcDSRfoirWgKAvtgOpv1JI8Zi77X15G7L+fxeOUOiUFxZiULD5fSlNzNM62W+k1yq5gjajGX/ZHvOIyxd+Fkj+P092rWP/si0Qr7VisMaEWuCiYonXFwbAUTWWPYLV245NITnGkUXnpI9butLJn2y6iba+hlp7C09qBcvoN7FYL9mhxo1/y/LoEXK8Pv6qIC8WbBY/xr9YlPLf9dZT+OqKTUwfmDBm/GOw7ws4FWpuUP2gJEZvKqmocuXPZuWYJMzKuSsH+SNwh3bo0p6hao6HeEqwYEZ2M6aKWd3PwTCy7du/D0F1DsmzE6/WGLr5LsDF4LggnYBacCOboQLHQ3FFfR58SR+HCR1iQH8ukhA5s5o5AYZMwUqOp74nl8xvRHDlRTsnxYpJsUjtsceHt2C8Fm0MPJrphTkZvBc4It9RKLOFx91Pf0Igu0k7W2MmkOewS2QYJUJVWVz9VNbXUVVwkyuAmKTFJayrDo/4Jwe/CT0aGYTrWVYEeUfsgXssMRcpyenraQJa0VX9O3ZU+Ma1fax4xGxUsUVFkOUbcama1hf+7+LmA9juHWshwmwOE1iMmCFYEzg1jtIm1BaxW6wCGGoFdewPfvyE4ertTiv4rHC73B855dwp2a23bbd4tC1hvhOCbX7b4VyUQKhxrtSOaYKngasizvwi0RmOS4O1QZf2yYfiaR+73AvhTQEVf+rpn9/8IMAChKDrDzfsdIQAAAABJRU5ErkJggg=='
    }

    TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)


--------------RADAR --------------
local maxSpeed = 0
-- local minSpeed = 0
local info = ""
local isRadarPlaced = false -- bolean to get radar status
local Radar -- entity object
local RadarBlip -- blip
local RadarPos = {} -- pos
local RadarAng = 0 -- angle
local LastPlate = ""
local LastVehDesc = ""
local LastSpeed = 0
local LastInfo = ""
 
function GetPlayers2()
    local players = {}
    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    return players
end
 
function GetClosestDrivingPlayerFromPos(radius, pos)
    local players = GetPlayers2()
    local closestDistance = radius or -1
    local closestPlayer = -1
    local closestVeh = -1
    for _ ,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local ped = GetPlayerPed(value)
            if GetVehiclePedIsUsing(ped) ~= 0 then
                local targetCoords = GetEntityCoords(ped, 0)
                local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], pos["x"], pos["y"], pos["z"], true)
                if(closestDistance == -1 or closestDistance > distance) then
                    closestVeh = GetVehiclePedIsUsing(ped)
                    closestPlayer = value
                    closestDistance = distance
                end
            end
        end
    end
    return closestPlayer, closestVeh, closestDistance
end
 
 
function radarSetSpeed(defaultText)
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", defaultText or "", "", "", "", 5)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0);
        Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        local gettxt = tonumber(GetOnscreenKeyboardResult())
        if gettxt ~= nil then
            return gettxt
        else
            ClearPrints()
            SetTextEntry_2("STRING")
            AddTextComponentString("~r~Veuillez entrer un nombre correct !")
            DrawSubtitleTimed(3000, 1)
            return
        end
    end
    return
end
 
 
function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 33,32,49,500)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
 
RegisterNetEvent('police:POLICE_radar')
AddEventHandler('police:POLICE_radar', function (data)

    POLICE_radar()
end)

function POLICE_radar()

    if isRadarPlaced then 
        
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), RadarPos.x, RadarPos.y, RadarPos.z, true) < 0.9 then 
       
            RequestAnimDict("anim@apt_trans@garage")
            while not HasAnimDictLoaded("anim@apt_trans@garage") do
               Wait(1)
            end
            TaskPlayAnim(GetPlayerPed(-1), "anim@apt_trans@garage", "gar_open_1_left", 1.0, -1.0, 5000, 0, 1, true, true, true) 
       
            Citizen.Wait(2000) 
       
            SetEntityAsMissionEntity(Radar, false, false)
           
            DeleteObject(Radar)
            DeleteEntity(Radar)
            Radar = nil
            RadarPos = {}
            RadarAng = 0
            isRadarPlaced = false
            RadarISPlaced()
            RemoveBlip(RadarBlip)
            RadarBlip = nil
            LastPlate = ""
            LastVehDesc = ""
            LastSpeed = 0
            LastInfo = ""
           
        else
           
            ClearPrints()
            SetTextEntry_2("STRING")
            AddTextComponentString("~r~Vous n'êtes pas à coté de votre Radar !")
            DrawSubtitleTimed(3000, 1)
           
            Citizen.Wait(1500) 
       
        end
   
    else 
        maxSpeed = radarSetSpeed("50")
       
        Citizen.Wait(200) 
        RadarPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 1.5, 0)
        RadarAng = GetEntityRotation(GetPlayerPed(-1))
       
        if maxSpeed ~= nil then 
       
            RequestAnimDict("anim@apt_trans@garage")
            while not HasAnimDictLoaded("anim@apt_trans@garage") do
               Wait(1)
            end
            TaskPlayAnim(GetPlayerPed(-1), "anim@apt_trans@garage", "gar_open_1_left", 1.0, -1.0, 5000, 0, 1, true, true, true) -- animation
           
            Citizen.Wait(1500)
           
            RequestModel("prop_cctv_pole_01a")
            while not HasModelLoaded("prop_cctv_pole_01a") do
               Wait(1)
            end
           
            Radar = CreateObject(GetHashKey('prop_cctv_pole_01a'), RadarPos.x, RadarPos.y, RadarPos.z - 7, true, true, true) 
            SetEntityRotation(Radar, RadarAng.x, RadarAng.y, RadarAng.z - 115)
            SetEntityAsMissionEntity(Radar, true, true)
           
            FreezeEntityPosition(Radar, true) 
 
            isRadarPlaced = true
            RadarISPlaced()
            RadarBlip = AddBlipForCoord(RadarPos.x, RadarPos.y, RadarPos.z)
            SetBlipSprite(RadarBlip, 380) 
            SetBlipColour(RadarBlip, 1) 
            SetBlipAsShortRange(RadarBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Radar")
            EndTextCommandSetBlipName(RadarBlip)
       
        end
       
    end
end


RadarISPlaced = function() 
    CreateThread(function()
        while isRadarPlaced do
        Wait(0)
 
        
       
            if HasObjectBeenBroken(Radar) then 
               
                SetEntityAsMissionEntity(Radar, false, false)
                SetEntityVisible(Radar, false)
                DeleteObject(Radar) 
                DeleteEntity(Radar) 
               
                Radar = nil
                RadarPos = {}
                RadarAng = 0
                isRadarPlaced = false
               
                RemoveBlip(RadarBlip)
                RadarBlip = nil
               
                LastPlate = ""
                LastVehDesc = ""
                LastSpeed = 0
                LastInfo = ""
               
            end
           
            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), RadarPos.x, RadarPos.y, RadarPos.z, true) > 300 then 
           
                SetEntityAsMissionEntity(Radar, false, false)
                SetEntityVisible(Radar, false)
                DeleteObject(Radar) 
                DeleteEntity(Radar) 
               
                Radar = nil
                RadarPos = {}
                RadarAng = 0
                isRadarPlaced = false
               
                RemoveBlip(RadarBlip)
                RadarBlip = nil
               
                LastPlate = ""
                LastVehDesc = ""
                LastSpeed = 0
                LastInfo = ""
               
                ClearPrints()
                SetTextEntry_2("STRING")
                AddTextComponentString("~r~Vous êtes parti trop loin de votre Radar !")
                DrawSubtitleTimed(3000, 1)
               
            end
           
        
 
            local viewAngle = GetOffsetFromEntityInWorldCoords(Radar, -8.0, -4.4, 0.0) 
            local ply, veh, dist = GetClosestDrivingPlayerFromPos(30, viewAngle) 

            if veh ~= nil then
           
                local vehPlate = GetVehicleNumberPlateText(veh) or ""
                local vehSpeedKm = GetEntitySpeed(veh)*3.6
                local vehDesc = GetDisplayNameFromVehicleModel(GetEntityModel(veh))--.." "..GetVehicleColor(veh)
                if vehDesc == "CARNOTFOUND" then vehDesc = "" end
                       
                     
                if vehSpeedKm < maxSpeed then
                    info = string.format("   Vehicule ~r~%s ~w~Plaque ~r~%s ~w~Km/h ~g~%s", vehDesc, vehPlate, math.ceil(vehSpeedKm))
                else
                    info = string.format("   Vehicule ~r~%s ~w~Plaque ~r~%s ~w~Km/h ~r~%s", vehDesc, vehPlate, math.ceil(vehSpeedKm))
                    if LastPlate ~= vehPlate then
                        LastSpeed = vehSpeedKm
                        LastVehDesc = vehDesc
                        LastPlate = vehPlate
                    elseif LastSpeed < vehSpeedKm and LastPlate == vehPlate then
                            LastSpeed = vehSpeedKm
                    end
                    LastInfo = string.format("   Vehicule ~r~%s ~w~Plaque ~r~%s ~w~Km/h ~r~%s", LastVehDesc, LastPlate, math.ceil(LastSpeed))
                end
                   
                DrawRect(0.88, 0.97, 0.2, 0.03, 0, 0, 0, 220)
                drawTxt(0.88, 0.97, 0.2, 0.03, 0.24, info, 255, 255, 255, 255)
               
                DrawRect(0.88, 0.93, 0.2, 0.03, 0, 0, 0, 220)
                drawTxt(0.88, 0.93, 0.2, 0.03, 0.24, LastInfo, 255, 255, 255, 255)
               
            end
           
    
           
    end  
end)
end


----Casier Jud'
local sMenuCJ = RageUI.CreateMenu("Police", "Casiers Judiciaires", 10, 80)
sMenuCJ:SetRectangleBanner(33,32,49,500)
sMenuCJ.Closed = function()
    openCJmenu = false
    FreezeEntityPosition(PlayerPedId(), false)
    RenderScriptCams(0, 1, 800, 0, 0)
end



local interval = 1000
InZone = {}

RegisterCommand('casierj', function() 
    if ESX.PlayerData.job.name == "police" then
    menuCJ() 
    end
end)
local builderCJ = {}
local resetCJ = {}
function notNilStringA(str)
    if str == nil then
        return ""
    else
        return "~p~ - "..str
    end
end
function notNilStringb(str)
    if str == nil then
        return ""
    else
        return str
    end
end
local fName, name,dob,delit,saisi,save,time = false,false,false,false,false,false,false
local hided = false
function menuCJ()
    if openCJmenu then
        openCJmenu = false
        FreezeEntityPosition(PlayerPedId(), false)
        RenderScriptCams(0, 1, 800, 0, 0)
    else
        openCJmenu = true
        RageUI.Visible(sMenuCJ, true)
        local playerPed = GetPlayerPed(-1)
        CreateThread(function()
            while openCJmenu do
                Wait(1)
                RageUI.IsVisible(sMenuCJ, function()
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestPlayer ~= -1 and closestDistance <= 10.0 then
                        RageUI.Button("→ Enregister ~p~les données de l'individu", nil, {RightLabel = "→→"}, true, {
                            onSelected = function()
                            getInformationsPolice(closestPlayer)
                            if identiterp then
                                if identiterp.firstname then
                                    builderCJ.firstname = identiterp.firstname
                                    fName = true
                                end

                                if identiterp.lastname then
                                builderCJ.name = identiterp.lastname
                                name = true
                                end
                                if identiterp.dob then
                                builderCJ.dob = identiterp.dob
                                dob = true
                                end

                            end
                        end})
                        RageUI.Separator('')
                    end
                        RageUI.Button("→ Enregister ~p~le prénom"..notNilStringA(builderCJ.firstname), "Prénom : ~g~"..notNilStringb(builderCJ.firstname), {RightLabel = "→→"}, true, {
                        onSelected = function()
                            builderCJ.firstname = KeyboardInput("Prénom", "", 50)
                            if builderCJ.firstname then
                                fName = true
                            end
                        end})

                        RageUI.Button("→ Enregister ~p~le nom"..notNilStringA(builderCJ.name), "Nom : ~g~"..notNilStringb(builderCJ.name), {RightLabel = "→→"}, fName, {
                        onSelected = function()
                            builderCJ.name = KeyboardInput("Nom de famille", "", 50)
                            if builderCJ.name then
                                name = true
                            end
                        end})
                        RageUI.Button("→ Enregister ~p~la date de naissance"..notNilStringA(builderCJ.dob), "Date : ~g~"..notNilStringb(builderCJ.dob), {RightLabel = "→→"}, name, {
                        onSelected = function()
                            builderCJ.dob = KeyboardInput("Date de naissance (../../....)", "", 50)
                            if builderCJ.dob then
                                if string.find(builderCJ.dob, "/+") == 3 then
                                    if string.find(builderCJ.dob, "/+",4) == 6 then
                                        dob = true
                                    else
                                    ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\nMerci de rentrer une date de naissance au format suivant\n ~r~../../.... ~s~!')

                                    end
                                else
                                    ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\nMerci de rentrer une date de naissance au format suivant\n ~r~../../.... ~s~!')
                                end

                            end
                        end})
                        RageUI.Button("→ Enregister ~p~le temps de détention"..notNilStringA(builderCJ.time), "Temps : ~g~"..notNilStringb(builderCJ.time), {RightLabel = "→→"}, dob, {
                        onSelected = function()
                            builderCJ.time = KeyboardInput("Temps de détention (en minutes)", "", 50)
                            if tonumber(builderCJ.time) then
                                time = true
                            else
                                ESX.ShowNotification('~p~POLICE INFORMATIONS~s~\nMerci de rentrer un temps de détention minutes !')

                            end
                        end})
                        RageUI.Button("→ Enregister ~p~le délit"..notNilStringA(builderCJ.reason), "Délit : ~g~"..notNilStringb(builderCJ.reason), {RightLabel = "→→"}, time, {
                        onSelected = function()
                            builderCJ.reason = KeyboardInput("Délit", "", 50)
                            if builderCJ.reason then
                            delit = true
                            end
                        end})
                        RageUI.Button("→ Enregister ~p~les objets saisis"..notNilStringA(builderCJ.saisis), "Objets saisis : ~g~"..notNilStringb(builderCJ.saisis), {RightLabel = "→→"}, delit, {
                        onSelected = function()
                            builderCJ.saisis = KeyboardInput("Objets saisis", "", 50)
                            if builderCJ.saisis then
                            saisi = true
                            end
                        end})
                        RageUI.Separator('')
                        RageUI.Button("→ Réinitialiser les données", nil, {RightLabel = "→→"}, true, {
                        onSelected = function()
                            builderCJ = resetCJ
                            fName, name,dob,delit,saisi,save,time = false,false,false,false,false,false,false
                        end})
                        if fName and name and dob and delit and saisi then
                            save = true
                            saveLabel = "✔️"
                            saveColor = {39, 174, 96, 200}

                        else
                            save = false
                            savelabel = ""
                            saveColor ={232, 10, 10, 200}
                        end

                        RageUI.Button("→ Prendre la photo et envoyer", nil, {RightLabel = saveLabel, Color = { BackgroundColor = saveColor}}, save, {
                        onSelected = function()
                            RageUI.Visible(sMenuCJ,false)

                            TriggerEvent('es:setMoneyDisplay', 0.0)
                            TriggerEvent("statushud:toggle", false)
                            TriggerEvent('esx_status:setDisplay', 0.0)
                            DisplayRadar(false)
                            TriggerEvent('ui:toggle', false)
                            TriggerEvent('ui:togglevoit', false)


                            local camCJ = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
                            SetCamActive(camCJ, true)                               -- heading
                            SetCamParams(camCJ, -1100.4, -828.7194, 5.458333, 0.0, 0.0, 308.449, 0.0, 0, 1, 1, 0)
                            SetCamFov(camCJ, 80.0)
                            FreezeEntityPosition(PlayerPedId(), true)
                            RenderScriptCams(1, 1, 1500, 1, 1)
                            TriggerServerEvent('YnSCJ:uploadWebhook',builderCJ)
                            Citizen.Wait(3000)
                            exports['screenshot-basic']:requestScreenshotUpload("https://discord.com/api/webhooks/940598386162298950/ZGxJVFqB77uMUpJ6YcUElgSlc6DAA2Gp3Xfu_tGgWBeODVnLO9E-Qtcf9Ow9pMHI9wWS", "files[]",function()end)
                            Citizen.Wait(500)

                            RageUI.Visible(sMenuCJ,true)
                            builderCJ = resetCJ
                            FreezeEntityPosition(PlayerPedId(), false)
                            RenderScriptCams(0, 1, 800, 0, 0)
                            SetCamActive(camCJ, false)

                            ESX.UI.HUD.SetDisplay(1.0)
                            TriggerEvent('es:setMoneyDisplay', 1.0)
                            TriggerEvent("statushud:toggle", true)
                            TriggerEvent('esx_status:setDisplay', 1.0)
                            DisplayRadar(true)
                            TriggerEvent('ui:toggle', true)
                            TriggerEvent('ui:togglevoit', true)

                            RageUI.CloseAll()
                            openCJmenu = false
                        end})

                    
                end)
            end
        end)
    end
end

-- Coffre

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local mainMenu = RageUI.CreateMenu("Coffre", "Action :")
local PutMenu = RageUI.CreateSubMenu(mainMenu,"Coffre", "Contenue :")
local GetMenu = RageUI.CreateSubMenu(mainMenu,"Coffre", "Contenue :")
local PutMenuW = RageUI.CreateSubMenu(mainMenu,"Coffre", "Contenue :")
local GetMenuW = RageUI.CreateSubMenu(mainMenu,"Coffre", "Contenue :")

local open = false

mainMenu:DisplayGlare(false)
mainMenu.Closed = function()
    open = false
end

all_items = {}

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    
    blockinput = true 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "Somme", ExampleText, "", "", "", MaxStringLenght) 
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end 
         
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500) 
        blockinput = false
        return result 
    else
        Citizen.Wait(500) 
        blockinput = false 
        return nil 
    end
end

    
function CoffreLSPD() 
    if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
            
        RageUI.IsVisible(mainMenu, function()

            RageUI.Separator("↓ Objet(s) ↓")
            RageUI.Button("Prendre un objet", nil, {RightLabel = "→"}, true, {onSelected = function()
                getStock()
            end},GetMenu);

            RageUI.Button("Déposer un objet", nil, {RightLabel = "→"}, true, {onSelected = function()
                getInventory()
            end},PutMenu);

            RageUI.Separator("↓ Arme(s) ↓")

            RageUI.Button("Prendre Arme(s)", nil, {RightLabel = "→"}, true, {onSelected = function()
                OpenGetWeaponMenu()
            end},GetMenuW);

            RageUI.Button("Déposer Arme(s)", nil, {RightLabel = "→"}, true, {onSelected = function()
                OpenPutWeaponMenu()
            end},PutMenuW);
            

        end)

        RageUI.IsVisible(GetMenu, function()
            
            for k,v in pairs(all_items) do
                RageUI.Button(v.label, nil, {RightLabel = "x"..VarColor..""..v.nb}, true, {onSelected = function()
                    local count = KeyboardInput("Combien voulez vous en déposer",nil,4)
                    count = tonumber(count)
                    if count <= v.nb then
                        TriggerServerEvent("police:takeStockItems",v.item, count)
                    else
                        ESX.ShowNotification("~r~Vous n'en avez pas assez sur vous")
                    end
                    getStock()
                end});
            end

        end)

        RageUI.IsVisible(PutMenu, function()
            
            for k,v in pairs(all_items) do
                RageUI.Button(v.label, nil, {RightLabel = "x"..VarColor..""..v.nb}, true, {onSelected = function()
                    local count = KeyboardInput("Combien voulez vous en déposer",nil,4)
                    count = tonumber(count)
                    TriggerServerEvent("police:putStockItems",v.item, count)
                    getInventory()
                end});
            end
            

       end)

        Wait(0)
    end
 end)
 end
 end

function getInventory()
    ESX.TriggerServerCallback('police:playerinventory', function(inventory)               
                
        all_items = inventory
        
    end)
end

function getStock()
    ESX.TriggerServerCallback('police:getStockItems', function(inventory)               
                
        all_items = inventory
        
    end)
end

Citizen.CreateThread(function()
    while true do 
       Citizen.Wait(500)
       if VarColor == "~p~" then VarColor = "~s~" else VarColor = "~p~" end 
   end 
end)

Citizen.CreateThread(function()
    while true do
		local wait = 750
			if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
				for k in pairs(Config.Position.Coffre) do
				local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
				local pos = Config.Position.Coffre
				local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

				if dist <= Config.MarkerDistance then
					wait = 0
					DrawMarker(21, pos[k].x, pos[k].y, pos[k].z, 0.0, 0.0, 0.0, 0.0,0.0,0.0, Config.MarkerSizeLargeur, Config.MarkerSizeEpaisseur, Config.MarkerSizeHauteur, Config.MarkerColorR, Config.MarkerColorG, Config.MarkerColorB, Config.MarkerOpacite, Config.MarkerSaute, true, p19, Config.MarkerTourne)  
				end

				if dist <= 1.0 then
					wait = 0
                    Visual.Subtitle("Appuyer sur ~p~[E]~s~ pour accèder au Coffre LSPD", 1)
					if IsControlJustPressed(1,51) then
						CoffreLSPD()
					end
				end
			end
		end
    Citizen.Wait(wait)
    end
end)


-----------------------------------------

function OpenGetWeaponMenu()

	ESX.TriggerServerCallback('finalpolice:getArmoryWeapons', function(weapons)
		local elements = {}

		for i=1, #weapons, 1 do
			if weapons[i].count > 0 then
				table.insert(elements, {
					label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name),
					value = weapons[i].name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_get_weapon',
		{
			title    = ('Armurerie'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)

			menu.close()

			ESX.TriggerServerCallback('finalpolice:removeArmoryWeapon', function()
			OpenGetWeaponMenu()
			end, data.current.value)

		end, function(data, menu)
			menu.close()
		end)
	end)

end

function OpenPutWeaponMenu()
	local elements   = {}
	local playerPed  = PlayerPedId()
	local weaponList = ESX.GetWeaponList()

	for i=1, #weaponList, 1 do
		local weaponHash = GetHashKey(weaponList[i].name)

		if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			table.insert(elements, {
				label = weaponList[i].label,
				value = weaponList[i].name
			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_put_weapon',
	{
		title    = ('Armurerie'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)

		menu.close()

		ESX.TriggerServerCallback('finalpolice:addArmoryWeapon', function()
			OpenPutWeaponMenu()
		end, data.current.value, true)

	end, function(data, menu)
		menu.close()
	end)
end