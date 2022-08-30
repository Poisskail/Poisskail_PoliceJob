Policeconfig = {} 

Policeconfig.ESX = "esx:getSharedObject"
Policeconfig.NotifTitle = 'PoisskailDEV' --- Titre des notifications
Policeconfig.NotifSubTitle = "Système" --- Sous titre des notifications
Policeconfig.NotifChar = "CHAR_ARTHUR"  --- Image des notifications

----WehbHook
Policeconfig.PoliceGAVWehbhook = ""
Policeconfig.PoliceServiceWebhook = ""
Policeconfig.PoliceCoffre = ""
Policeconfig.WebhookIconUrl = "https://cdn.discordapp.com/attachments/877497897283911690/910880493610872923/Logo_lspd.png"
Policeconfig.WebhookLogoUrl = "https://cdn.discordapp.com/attachments/877497897283911690/910880493610872923/Logo_lspd.png"
Policeconfig.WebhookAvatarUrl= "https://cdn.discordapp.com/attachments/877497897283911690/910880493610872923/Logo_lspd.png"
Policeconfig.posGAV = {
    {
        Zones = "Zones1",
        x= -1072.21 ,y= -829.7454,z= 122.5771
    },
}
Policeconfig.posCJ = {
    {
        Zones = "Zones1",
        x= -1071.54,y= -822.45,z= 167.80
    },
}

--Position
Policeconfig.Ammunation = {posammupoli = {
    {posmenuammupolice = vector3(-1102, -829.4506, 14.26672)},
    {posmenuammupolice = vector3(-1098.659, -826.2198, 14.26672)},
    }
}
Policeconfig.AmmunationSWAT = {posammu = {
    {posmenuammuswat = vector3(-1078.13,-824.149,14.88)},
    }

}
Policeconfig.ClotheSwat = {posvest = {
    {posmenuvestswat= vector3(-1080.62, -822.74, 14.88)},
    }
}
Policeconfig.GAV = {postenu = {
    {postenugav = vector3(-1072.523, -829.3978, 5.471069)},
    }
}
Policeconfig.Vestpospoli = {
    posvestpoliMR = {
        
    },
    posvestpoliVP = {
        {posmenu1poli =  vector3(-1097.947, -832.1539, 14.26672)},
        {posmenu1poli =  vector3(-1096.694, -829.0417, 26.81982)},
    },
}
Policeconfig.PoliceGarage = {
                                vpos = {
                                    {posmenugarage = vector3(441.46, -985.05, 25.69)}, 
                                    {posmenugarage = vector3(-1077.626, -858.0791, 5.032959)}
                                }
                         }
Policeconfig.PoliceHeliGarage = {vpos = {
    {posmenuheligarage = vector3(-1091.842, -840.2505, 37.68787)},--------VESPUCCI
}}
Policeconfig.PositionRecherche = {vpos = {
    {posrechercheman = vector3(-1089.922, -834.1988, 30.75696)}}}
Policeconfig.stockpol = {posstockpoli = {
    {posstockpoli = vector3(472.8264, -994.3253, 26.26379)},--------MISSION ROW
    {posstockpoli = vector3(-1079.686, -816.1828, 11.03149)},--------VESPUCCI
}}
Policeconfig.bossaction = {bosspos = {
    {bpos =  vector3(-1113.27, -833.2352, 34.35168)},
}}



Policeconfig.props_list = {
    ["Barrière"] = "prop_barrier_work05",
    ["Plot"] = "prop_roadcone02a",
    ["Herse"] = "p_ld_stinger_s",
    ["Gros Carton"] = "prop_boxpile_07d",
    ["Lampe"] = "prop_worklight_03b",
    ["Panneau de signalisation"] = "prop_trafficdiv_02",
    ["signalisation"] = "prop_consign_02a",
    ["Stop"] = "prop_sign_road_01a",
}

Policeconfig.Camera = {
    pos= {
        {pos = vector3(444.99,-998.82,34.97)},--------MISSION ROW

    }
}
Policeconfig.VehicleDeleters = {
    delpos = {
        {pos =  vector3(450.3165, -975.8242, 25.6908)},--------MISSION ROW
        {pos = vector3(-1079.42, -884.2154, 4.594849)},--------vespucci
        {pos = vector3(-1076.281, -882.0396, 4.679077)},--------vespucci
        {pos = vector3(-1072.826, -880.0879, 4.763428)},--------vespucci
        {pos =  vector3(-1069.609, -877.9253, 4.847656)},--------vespucci
        
       
    }
}

Policeconfig.VehicleRepair = {
    repairpos = {
        {pos = vector3(458.9275, -992.545, 25.6908)},--------MISSION ROW
        {pos = vector3(-1081.609, -848.4923, 4.965576)},--------vespucci
        {pos = vector3(-1115.42, -832.0615, 13.32312)},--------vespucci
        {pos = vector3(-1111.833, -836.967, 13.32312)},--------vespucci
        
    }   
}

Config                            = {

        --Marker Config--
        MarkerType = 22, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
        MarkerSizeLargeur = 0.3, -- Largeur du marker
        MarkerSizeEpaisseur = 0.3, -- Épaisseur du marker
        MarkerSizeHauteur = 0.3, -- Hauteur du marker
        MarkerDistance = 6.0, -- Distane de visibiliter du marker (1.0 = 1 mètre)
        MarkerColorR = 255, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
        MarkerColorG = 175, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
        MarkerColorB = 0, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
        MarkerOpacite = 255, -- Opacité du marker (min: 0, max: 255)
        MarkerSaute = true, -- Si le marker saute (true = oui, false = non)
        MarkerTourne = true, -- Si le marker tourne (true = oui, false = non)
        Position = {
            Coffre = {vector3(-1080.455, -816.9943, 11.03593)}, -- Menu coffre 
        },
}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 21
Config.MarkerSize                 = { x = 0.8, y = 0.8, z = 0.8 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }


Config.Vespucci  = { 
    garage = {
        pos = {
            {pos = vector3(-1051.569, -867.244, 4.729614), heading = 58.5 },
            {pos = vector3(-1048.352, -864.5011, 4.594849), heading = 58.5},
            {pos = vector3(-1044.949, -861.7055, 4.51062), heading = 58.5},
			{pos = vector3(-1042.009, -858.7253, 4.476929), heading = 58.5},
            {pos = vector3(-1039.306, -855.6132, 4.476929), heading = 58.5},
            
        },
    },
}



--Backup
RadioPolice = {
    {Radio = "Demande de renfort | ~g~Faible~s~", raison = "petit", evant2 = 'codedix:notif', message = 'a besoin de renfort (~g~Faible~s~)'},
    {Radio = "Demande de renfort | ~o~Moyenne~s~",raison = "moyenne",evant2 = 'codedix:notif', message = 'a besoin de renfort important (~o~Moyenne~s~)'},
    {Radio = "Demande de renfort | ~r~CODE 99~s~",raison = "omfgg",evant2 = 'codedix:notif', message = 'a besoin d\'un renfort immédiat (~r~danger de mort~s~)'},
}

--Ammunation 
Policeammunation = {
    {btmname = "~p~ Glock 17", weaponname = "weapon_combatpistol",rank = 1,minimumRank = " ~p~[Officier]",countname = 200, degats = 0.9, cadence = 0.2, precision = 0.3, porter = 0.9,propname = "w_pi_combatpistol",spawnposprop = vector3(-1103.19, -820.7408, 14.28278)},
   {btmname = "~p~Remington 870", weaponname = "weapon_pumpshotgun",minimumRank = " ~p~[Officier 3]",rank = 1,countname = 200, degats = 0.1, cadence = 0.2, precision = 0.3, porter = 0.9,propname = "h4_prop_h4_pumpshotgunh4",spawnposprop = vector3(-1103.19, -820.7408, 14.28278)},
  {btmname = "~p~M4A1", weaponname = "weapon_carbinerifle",minimumRank = " ~p~[Sergent]",   rank = 3, countname = 200, degats = 0.1, cadence = 0.2, precision = 0.3, porter = 0.7,propname = "w_ar_carbinerifle",spawnposprop = vector3(-1103.19, -820.7408, 14.28278)},
}

WeaponNoLetal = {
    {weaponnoletal = "~p~Tazer", weaponname = "weapon_stungun", rank = 0,countname = nil, degats = 0.1,propname = "w_pi_stungun",spawnposprop = vector3(-1102.097, -819.6675, 14.28279)},
    {weaponnoletal = "~p~Matraque", weaponname = "weapon_nightstick", rank = 0,countname = nil, degats = 0.1,propname = "w_me_nightstick",spawnposprop = vector3(-1102.097, -819.6675, 14.28279)},
    {weaponnoletal = "~p~Lampe torche", weaponname = "weapon_flashlight",rank = 0, countname = nil, degats = 0.3,propname = "prop_scn_police_torch",spawnposprop = vector3(482.0372, -997.0876, 30.68965)},--pour ajouter des différents props vous pouvez vous rendre sur ce site https://forge.plebmasters.de/objects/?d=eyJzZWFyY2giOiJwcm9wX3RyZWUiLCJwYWdlIjoyLCJmaWx0ZXIiOnsidGFncyI6e30sImRsYyI6W10sInNpemUiOltdLCJjYXRlZ29yeSI6MH0sImNhdGVnb3J5IjowfQ%3D%3D
}

WeaponAccess = {
    {weaponaccess = "~p~Gilet pare balle 1", weaponname = "armorLSPD",rank = 0, countname = 1,propname = "v_club_roc_jacket1",spawnposprop = vector3(482.0372, -997.0876, 30.68965)},
    {weaponaccess = "~p~Gilet pare balle 2", weaponname = "armorLSPD2",rank = 0, countname = 1,propname = "v_club_roc_jacket2",spawnposprop = vector3(482.0372, -997.0876, 30.68965)},--pour ajouter des différents props vous pouvez vous rendre sur ce site https://forge.plebmasters.de/objects/?d=eyJzZWFyY2giOiJwcm9wX3RyZWUiLCJwYWdlIjoyLCJmaWx0ZXIiOnsidGFncyI6e30sImRsYyI6W10sInNpemUiOltdLCJjYXRlZ29yeSI6MH0sImNhdGVnb3J5IjowfQ%3D%3D
}

WeaponSWAT = {
    {btmname = "~p~Gilet pare balle 2", weaponname = "armorLSPD2",rank = 0, countname = 1,propname = "v_club_roc_jacket1",spawnposprop = vector3(482.0372, -997.0876, 30.68965)},
    
}
GaragePolice = {
    {voiture = "→~g~ [LSPD]~p~ Stanier : ", namecar ='police', rank = 0,livery = 0,minimumRank = " ~p~[Officier]"},
    {voiture = "→~g~ [LSPD]~p~ Buffalo : ", namecar ='police2', rank = 1,livery = 0,minimumRank = " ~p~[Officier]"},
    {voiture = "→~g~ [LSPD]~p~ Buffalo Sport : ", namecar ='pdbuffalo', rank = 3,livery = 0,minimumRank = " ~p~[Sergent]"},
    {voiture = "→~g~ [LSPD]~p~ Torrence : ", namecar ='police3', rank = 0,livery = 0,minimumRank = " ~p~[Officier]"},
    {voiture = "→~g~ [LSPD]~p~ Scout équipé: ", namecar ='nscoutlspd', rank = 1,livery = 0,minimumRank = " ~p~[Officier]"},
    {voiture = "→~g~ [LSPD]~p~ Stanier SilckTop : ", namecar ='policeslick', rank = 0,livery = 0,minimumRank = " ~p~[Officier]"},
    {voiture = "→~g~ [LSPD]~p~ Stanier CEREMONIE : ", namecar ='policeold', rank = 1,livery = 0,minimumRank = " ~p~[Officier]"},
    {voiture = "→~g~ [LSPD]~p~ Contender : ", namecar ='beachp', rank =2,livery = 0,minimumRank = " ~p~[Sergent]"},
    {voiture = "→~g~ [LSPD]~p~ Everon : ", namecar ='poleveron', rank =3,livery = 0,minimumRank = " ~p~[Sergent II ]"},

}

GarageAcadamy = {
    {voiture = "→~g~ [PA]~p~ Buffalo : ", namecar ='police2', rank = 4,livery = 1,minimumRank = " ~p~[RECRUTEUR]"},
    {voiture = "→~g~ [PA]~p~ Sultan : ", namecar ='sultan', rank = 4,livery = 1,minimumRank = " ~p~[RECRUTEUR]"},
}

GarageBrigades = {
    {voiture = "→~g~ [BI]~p~ Revolter Banalisé : ", namecar ='prevolter', rank = 4,livery = 1,minimumRank = " ~p~[Detective]"},
    {voiture = "→~g~ [BI]~p~ Sultan RS : ", namecar ='sultanrs', rank = 4,livery = 1,minimumRank = " ~p~[Detective]"},
    {voiture = "→~g~ [BI]~p~ Buffalo Sport UM : ", namecar ='pdumkbuffalo', rank = 4,livery = 1,minimumRank = " ~p~[Detective]"},
    {voiture = "→~g~ [BI]~p~ Stanier Banalisé : ", namecar ='police4', rank = 1,livery = 0,minimumRank = " ~p~[Detective]"},
    {voiture = "→~g~ [BI]~p~ Merit Banalisé : ", namecar ='polmerit2', rank = 1,livery = 0,minimumRank = " ~p~[Detective]"},
    {voiture = "→~g~ [BI]~p~ Buffalo Banalisé : ", namecar ='police42', rank = 1,livery = 1,minimumRank = " ~p~[Detective]"},
    {voiture = "→~g~ [BI]~p~ Buffalo STX Banalisé : ", namecar ='umkbuffalo', rank = 2,livery = 0,minimumRank = " ~p~[Detective]"},
    {voiture = "→~g~ [GND]~p~ Buffalo Gang : ", namecar ='trubuffalo', rank = 2,livery = 0,minimumRank = " ~p~[Detective]"},
    {voiture = "→~g~ [GND]~p~ Buffalo Gang 2 : ", namecar ='trubuffalo2', rank = 2,livery = 0,minimumRank = " ~p~[Detective]"},
    {voiture = "→~g~ [TD]~p~ Vacca : ", namecar ='polvacca', rank = 3,livery = 0,minimumRank = " ~p~[Sergent]"},
    {voiture = "→~g~ [TD]~p~ Bike TD : ", namecar ='r1200rtp', rank = 1,livery = 0,minimumRank = " ~p~[Officier]"},
    {voiture = "→~g~ [K9]~p~ Scout K9 : ", namecar ='policek9', rank = 1,livery = 0,minimumRank = " ~p~[Officier]"},
    {voiture = "→~g~ [K9]~p~ Sadler K9 : ", namecar ='polsadlerk9', rank = 1,livery = 0,minimumRank = " ~p~[Officier]"},
    {voiture = "→~g~ [SWAT]~p~ SWAT Blindée : ", namecar ='polriot', rank = 2,livery = 0,minimumRank = " ~p~[Sergent]"},
    {voiture = "→~g~ [SWAT]~p~ Stalker Non Blindée : ", namecar ='swatstalker', rank = 4,livery = 0,minimumRank = " ~p~[Lieutnant]"},
}
GarageConvoi = {
    {voiture = "→~g~ [LSPD]~p~ Bus Pénitencier : ", namecar ='pbus', rank = 2,livery = 0,minimumRank = " ~p~[Officier]"},
    {voiture = "→~g~ [LSPD]~p~ Transporter : ", namecar ='polspeedo', rank = 2,livery = 0,minimumRank = " ~p~[Officier]"},
    {voiture = "→~g~ [LSPD]~p~ Speedo new : ", namecar ='polnspeedo', rank = 2,livery = 0,minimumRank = " ~p~[Officier]"},
    {voiture = "→~g~ [SWAT]~p~ Riot : ", namecar ='polriot', rank = 3,livery = 0,minimumRank = " ~p~[Sergent]"},
    {voiture = "→~g~ [SWAT]~p~ Stalker Non Blindée : ", namecar ='swatstalker', rank = 1,livery = 0,minimumRank = " ~p~[Sergent]"},
    
    
}



GarageHeliPolice = {
    {helico = "→~g~ [Henry]~p~ Polmav",name = 'polmav' },
    {helico = "→~g~ [Henry SWAT]~p~ Buzzard",name = 'buzzard2' },

}

Cloak = {
	clothes = {
        specials = {
                [0] = {
                    label = "~g~ Reprendre sa tenue civil",
                    minimum_grade = 0,
                    variations = {male = {}, female = {}},
                    onEquip = function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin) TriggerEvent('skinchanger:loadSkin', skin) end)
                        SetPedArmour(PlayerPedId(), 0)
                    end
                },
            },
            
            gav = {
                [0] = {
                    
                    variations = {
                        male = {
                            bags_1 = 0, bags_2 = 0,
                        tshirt_1 = 15, tshirt_2 = 0,
                        torso_1 = 5, torso_2 = 0,
                        arms = 5,
                        pants_1 = 5, pants_2 = 7,
                        mask_1 = 0, mask_2 = 0,
                        bproof_1 = 0, bproof_2 = 0,
                        helmet_1 = -1, helmet_2 = 0,
                        chain_1 = 0, chain_2 = 0,
                        decals_1 = 0, decals_2 = 0,
                        },
                        female = {
                            bags_1 = 0, bags_2 = 0,
                            tshirt_1 = 15, tshirt_2 = 0,
                            torso_1 = 74, torso_2 = 0,
                            arms = 4,
                            pants_1 = 66, pants_2 = 6,
                            mask_1 = 0, mask_2 = 0,
                            bproof_1 = 0, bproof_2 = 0,
                            helmet_1 = -1, helmet_2 = 0,
                            chain_1 = 0, chain_2 = 0,
                            decals_1 = 0, decals_2 = 0,
                            
                        }
                    },
                    onEquip = function()
                        
                        SetPedArmour(PlayerPedId(), 0)
                    end
                },
            },

            
            grades = {
                -- @label = Le nom affiché de la tenue de grade
                -- @male = Les composants skinchanger pour les hommes
                -- @female = Les composants skinchanger pour les femmes
                [0] = {
                    label = "→ LSPD - ~p~ Tenues : ~p~[Cadet]",
                    minimum_grade = 0,
                    giletPB = 20,
                    giletPB2 = 0,
                    variations = {
                    male = {
                        bags_1 = 52, bags_2 = 0,
                    tshirt_1 = 58, tshirt_2 = 0,
                    torso_1 = 200, torso_2 = 0,
                    arms = 1,
                    pants_1 = 35, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 101, mask_2 = 0,
                    bproof_1 = 13, bproof_2 = 0,
                    helmet_1 = 46, helmet_2 = 0,
                    chain_1 = 9, chain_2 = 0,
                    decals_1 = 0, decals_2 = 0,
                    },
                    female = {
                        bags_1 = 52, bags_2 = 0,
                        tshirt_1 = 58, tshirt_2 = 0,
                        torso_1 = 200, torso_2 = 0,
                        arms = 1,
                        pants_1 = 35, pants_2 = 0,
                        shoes_1 = 24, shoes_2 = 0,
                        mask_1 = 101, mask_2 = 0,
                        bproof_1 = 13, bproof_2 = 0,
                        helmet_1 = 46, helmet_2 = 0,
                        chain_1 = 9, chain_2 = 0,
                        decals_1 = 0, decals_2 = 0,
                        
                    }
                },
                onEquip = function()

                end
            },
                [1] = {
                    minimum_grade = 1,
                    label = "→ LSPD - ~p~ Tenues : ~p~[Officier]",
                    giletPB = 12,
                    giletPB2 = 3,
                    variations = {
                    male = {
                        bags_1 = 52, bags_2 = 0,
                        tshirt_1 = 58, tshirt_2 = 0,
                        torso_1 = 193, torso_2 = 0,
                        arms = 1,
                        pants_1 = 35, pants_2 = 0,
                        shoes_1 = 25, shoes_2 = 0,
                        mask_1 = 90, mask_2 = 0,
                        bproof_1 = 13, bproof_2 = 0,
                        helmet_1 = -1, helmet_2 = 0,
                        chain_1 = 8, chain_2 = 0,
                        decals_1 = 0, decals_2 = 0,
                    },
                    female = {
                        bags_1 = 52, bags_2 = 0,
                        tshirt_1 = 58, tshirt_2 = 0,
                        torso_1 = 193, torso_2 = 0,
                        arms = 1,
                        pants_1 = 35, pants_2 = 0,
                        shoes_1 = 24, shoes_2 = 0,
                        mask_1 = 90, mask_2 = 0,
                        bproof_1 = 13, bproof_2 = 0,
                        helmet_1 = -1, helmet_2 = 0,
                        chain_1 = 8, chain_2 = 0,
                        decals_1 = 0, decals_2 = 0,
                    }
                },
                onEquip = function()

                end
                },
                [2] = {
                    minimum_grade = 1,
                    label =  "→ LSPD - ~p~ Tenues : ~p~[Officier II]",
                    giletPB = 12,
                    giletPB2 = 3,
                    variations = {
                    male = {
                        bags_1 = 52, bags_2 = 0,
                        tshirt_1 = 58, tshirt_2 = 0,
                        torso_1 = 190, torso_2 = 0,
                        arms = 26,
                        pants_1 = 35, pants_2 = 0,
                        shoes_1 = 25, shoes_2 = 0,
                        mask_1 = 90, mask_2 = 0,
                        bproof_1 = 13, bproof_2 = 0,
                        helmet_1 = -1, helmet_2 = 0,
                        chain_1 = 8, chain_2 = 0,
                        decals_1 = 15, decals_2 = 0,
                    },
                    female = {
                        bags_1 = 0, bags_2 = 0,
                        tshirt_1 = 27, tshirt_2 = 0,
                        torso_1 = 93, torso_2 = 0,
                        arms = 0,
                        pants_1 = 61, pants_2 = 0,
                        shoes_1 = 24, shoes_2 = 0,
                        mask_1 = 121, mask_2 = 0,
                        bproof_1 = 11, bproof_2 = 3,
                        helmet_1 = -1, helmet_2 = 0,
                        chain_1 = 0, chain_2 = 0,
                        decals_1 = 14, decals_2 = 1
                    }
                },
                onEquip = function()

                end
            },
            [3] = {
                minimum_grade = 1,
                label = "→ LSPD - ~p~ Tenues : ~p~[Senior Lead Officier]",
                giletPB = 12,
                    giletPB2 = 3,
                variations = {
                male = {
                    bags_1 = 52, bags_2 = 0,
                    tshirt_1 = 58, tshirt_2 = 0,
                    torso_1 = 190, torso_2 = 0,
                    arms = 26,
                    pants_1 = 35, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 90, mask_2 = 0,
                    bproof_1 = 13, bproof_2 = 0,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 8, chain_2 = 0,
                    decals_1 = 15, decals_2 = 1,
                },
                female = {
                    bags_1 = 52, bags_2 = 0,
                    tshirt_1 = 58, tshirt_2 = 0,
                    torso_1 = 190, torso_2 = 0,
                    arms = 26,
                    pants_1 = 35, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 90, mask_2 = 0,
                    bproof_1 = 13, bproof_2 = 0,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 8, chain_2 = 0,
                    decals_1 = 15, decals_2 = 0,
                }
            },
            onEquip = function()
                
                end
            },

            [4] = {
                minimum_grade = 2,
                label = "→ LSPD - ~p~ Tenues : ~p~[Sergent]",
                giletPB = 12,
                    giletPB2 = 3,
                variations = {
                    male = {
                        bags_1 = 52, bags_2 = 1,
                        tshirt_1 = 58, tshirt_2 = 0,
                        torso_1 = 190, torso_2 = 1,
                        arms = 26,
                        pants_1 = 35, pants_2 = 0,
                        shoes_1 = 25, shoes_2 = 0,
                        mask_1 = 90, mask_2 = 0,
                        bproof_1 = 37, bproof_2 = 0,
                        helmet_1 = -1, helmet_2 = 0,
                        chain_1 = 8, chain_2 = 0,
                        decals_1 = 15, decals_2 = 2,

                },
                female = {
                    bags_1 = 52, bags_2 = 1,
                    tshirt_1 = 58, tshirt_2 = 0,
                    torso_1 = 190, torso_2 = 1,
                    arms = 26,
                    pants_1 = 35, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 90, mask_2 = 0,
                    bproof_1 = 37, bproof_2 = 0,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 8, chain_2 = 0,
                    decals_1 = 15, decals_2 = 2,
                }
            },
            onEquip = function()

                end
            },

            [5] = {
                minimum_grade = 3,
                label = "→ LSPD - ~p~ Tenues : ~p~[Sergent II]",
                giletPB = 12,
                    giletPB2 = 3,
                variations = {
                male = {
                    bags_1 = 52, bags_2 = 1,
                    tshirt_1 = 58, tshirt_2 = 0,
                    torso_1 = 190, torso_2 = 1,
                    arms = 26,
                    pants_1 = 35, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 90, mask_2 = 0,
                    bproof_1 = 37, bproof_2 = 0,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 8, chain_2 = 0,
                    decals_1 = 15, decals_2 = 3,
                },
                female = {
                    bags_1 = 0, bags_2 = 0,
                    tshirt_1 = 27, tshirt_2 = 0,
                    torso_1 = 93, torso_2 = 0,
                    arms = 0,
                    pants_1 = 61, pants_2 = 0,
                    shoes_1 = 24, shoes_2 = 0,
                    mask_1 = 121, mask_2 = 0,
                    bproof_1 = 11, bproof_2 = 3,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 0, chain_2 = 0,
                    decals_1 = 14, decals_2 = 4
                }
            },
            onEquip = function()

                end
            },

            [6] = {
                minimum_grade = 4,
                label = "→ LSPD - ~p~ Tenues : ~p~[Lieutenant]",
                giletPB = 12,
                    giletPB2 = 3,
                variations = {
                male = {
                    bags_1 = 52, bags_2 = 2,
                    tshirt_1 = 58, tshirt_2 = 0,
                    torso_1 = 193, torso_2 = 0,
                    arms = 27,
                    pants_1 = 35, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 90, mask_2 = 0,
                    bproof_1 = 14, bproof_2 = 0,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 8, chain_2 = 0,
                    decals_1 = 44, decals_2 = 0,
                },
                female = {
                    bags_1 = 52, bags_2 = 2,
                    tshirt_1 = 58, tshirt_2 = 0,
                    torso_1 = 193, torso_2 = 0,
                    arms = 27,
                    pants_1 = 35, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 90, mask_2 = 0,
                    bproof_1 = 14, bproof_2 = 0,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 8, chain_2 = 0,
                    decals_1 = 44, decals_2 = 0,
                }
            },
            onEquip = function()

                end
            },

            [7] = {
                minimum_grade = 5,
                label = "→ LSPD - ~p~ Tenues : ~p~[Capitaine]",
                giletPB = 12,
                    giletPB2 = 3,
                variations = {
                male = {
                    bags_1 = 52, bags_2 = 3,
                    tshirt_1 = 58, tshirt_2 = 0,
                    torso_1 = 255, torso_2 = 4,
                    arms = 27,
                    pants_1 = 35, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 90, mask_2 = 0,
                    bproof_1 = 37, bproof_2 = 0,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 8, chain_2 = 0,
                    decals_1 = 45, decals_2 = 1,
                },
                female = {
                    bags_1 = 0, bags_2 = 0,
                    tshirt_1 = 27, tshirt_2 = 0,
                    torso_1 = 93, torso_2 = 0,
                    arms = 0,
                    pants_1 = 61, pants_2 = 0,
                    shoes_1 = 24, shoes_2 = 0,
                    mask_1 = 121, mask_2 = 0,
                    bproof_1 = 11, bproof_2 = 3,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 0, chain_2 = 0,
                    decals_1 = 14, decals_2 = 6
                }
            },
            onEquip = function()

                end
            },

            [8] = {
                minimum_grade = 2,
                label = "→ BI - ~p~ Tenues : ~p~ [Civil]",
                giletPB = 12,
                    giletPB2 = 3,
                variations = {
                male = {
                    bags_1 = 61, bags_2 = 4,
                    tshirt_1 = 88, tshirt_2 = 0,
                    torso_1 = 349, torso_2 = 4,
                    arms = 6,
                    pants_1 = 28, pants_2 = 0,
                    shoes_1 = 2, shoes_2 = 0,
                    mask_1 = 121, mask_2 = 0,
                    bproof_1 = 7, bproof_2 = 0,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 6, chain_2 = 0,
                    decals_1 = 0, decals_2 = 0,
                },
                female = {
                    bags_1 = 0, bags_2 = 0,
                    tshirt_1 = 27, tshirt_2 = 0,
                    torso_1 = 93, torso_2 = 0,
                    arms = 0,
                    pants_1 = 61, pants_2 = 0,
                    shoes_1 = 24, shoes_2 = 0,
                    mask_1 = 121, mask_2 = 0,
                    bproof_1 = 11, bproof_2 = 3,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 0, chain_2 = 0,
                    decals_1 = 14, decals_2 = 7
                }
            },
            onEquip = function()

                end
            },
            [9] = {
                label = "→ LSPD - ~p~ Tenues : ~o~ [OP Léger]",
                minimum_grade = 0,
                giletPB = 54,
                giletPB2 = 0,
                variations = {
                male = {
                    bags_1 = 0, bags_2 = 0,
                tshirt_1 = 95, tshirt_2 = 0,
                torso_1 = 150, torso_2 = 7,
                arms = 36,
                pants_1 = 59, pants_2 = 0,
                shoes_1 = 25, shoes_2 = 0,
                mask_1 = 36, mask_2 = 0,
                bproof_1 = 5, bproof_2 = 2,
                helmet_1 = 92, helmet_2 = 0,
                chain_1 = 1, chain_2 = 0,
                decals_1 = 12, decals_2 = 0,
                },
                female = {
                    bags_1 = 0, bags_2 = 0,
                    tshirt_1 = 51, tshirt_2 = 0,
                    torso_1 = 351, torso_2 = 3,
                    arms = 14,
                    pants_1 = 61, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 169, mask_2 = 0,
                    bproof_1 = 11, bproof_2 = 3,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 6, chain_2 = 0,
                    decals_1 = 0, decals_2 = 0
                    
                }
            },
            onEquip = function()

            end
        },

        [10] = {
            label = "→ LSPD - ~p~ Tenues : ~r~ [OP Lourd]",
            minimum_grade = 1,
            giletPB = 54,
            giletPB2 = 0,
            variations = {
            male = {
                bags_1 = 45, bags_2 = 0,
                tshirt_1 = 92, tshirt_2 = 6,
                torso_1 = 209, torso_2 = 0,
                arms = 46,
                pants_1 = 31, pants_2 = 2,
                shoes_1 = 24, shoes_2 = 0,
                mask_1 = 185, mask_2 = 0,
                bproof_1 = 27, bproof_2 = 0,
                helmet_1 = 117, helmet_2 = 2,
                chain_1 = 111, chain_2 = 0,
                decals_1 = -1, decals_2 = 0,
            },
            female = {
                bags_1 = 45, bags_2 = 0,
                tshirt_1 = 92, tshirt_2 = 6,
                torso_1 = 209, torso_2 = 0,
                arms = 46,
                pants_1 = 31, pants_2 = 2,
                shoes_1 = 24, shoes_2 = 0,
                mask_1 = 185, mask_2 = 0,
                bproof_1 = 27, bproof_2 = 0,
                helmet_1 = 117, helmet_2 = 0,
                chain_1 = 111, chain_2 = 0,
                decals_1 = -1, decals_2 = 0,
                
            }
        },
        onEquip = function()

        end
    },
            [11] = {
                label = "→ LSPD - ~p~ Tenues : ~h~[HazMat]",
                minimum_grade = 2,
                giletPB = 54,
                giletPB2 = 0,
                variations = {
                male = {
                    bags_1 = 52, bags_2 = 3,
                    tshirt_1 = 92, tshirt_2 = 6,
                    torso_1 = 67, torso_2 = 1,
                    arms = 88,
                    pants_1 = 40, pants_2 = 1,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 36, mask_2 = 0,
                    bproof_1 = 25, bproof_2 = 0,
                    helmet_1 = 117, helmet_2 = 0,
                    chain_1 = 1, chain_2 = 0,
                    decals_1 = 0, decals_2 = 0,
                },
                female = {
                    bags_1 = 0, bags_2 = 0,
                    tshirt_1 = 51, tshirt_2 = 0,
                    torso_1 = 351, torso_2 = 3,
                    arms = 14,
                    pants_1 = 61, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 169, mask_2 = 0,
                    bproof_1 = 11, bproof_2 = 3,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 6, chain_2 = 0,
                    decals_1 = 0, decals_2 = 0
                    
                }
            },
            onEquip = function()

            end
        },
        [12] = {
            label = "→ TD - ~p~ Tenues : ~r~[Moto]",
            minimum_grade = 1,
            giletPB = 54,
            giletPB2 = 0,
            variations = {
            male = {
                bags_1 = 74, bags_2 = 2,
                tshirt_1 = 53, tshirt_2 = 0,
                torso_1 = 193, torso_2 = 1,
                arms = 33,
                pants_1 = 32, pants_2 = 1,
                shoes_1 = 13, shoes_2 = 0,
                mask_1 = 0, mask_2 = 0,
                bproof_1 = 4, bproof_2 = 0,
                helmet_1 = 17, helmet_2 = 1,
                chain_1 = 1, chain_2 = 0,
                decals_1 = 0, decals_2 = 0,
            },
            female = {
                bags_1 = 0, bags_2 = 0,
                tshirt_1 = 51, tshirt_2 = 0,
                torso_1 = 351, torso_2 = 3,
                arms = 14,
                pants_1 = 61, pants_2 = 0,
                shoes_1 = 25, shoes_2 = 0,
                mask_1 = 169, mask_2 = 0,
                bproof_1 = 11, bproof_2 = 3,
                helmet_1 = -1, helmet_2 = 0,
                chain_1 = 6, chain_2 = 0,
                decals_1 = 0, decals_2 = 0
                
            }
        },
        onEquip = function()

        end
    },
    [13] = {
        label = "→ K9 - ~p~ Tenues : ~r~[K9]",
        minimum_grade = 1,
        giletPB = 54,
        giletPB2 = 0,
        variations = {
        male = {
            bags_1 = 74, bags_2 = 2,
            tshirt_1 = 95, tshirt_2 = 0,
            torso_1 = 101, torso_2 = 0,
            arms = 57,
            pants_1 = 59, pants_2 = 0,
            shoes_1 = 25, shoes_2 = 0,
            mask_1 = 121, mask_2 = 0,
            bproof_1 = 7, bproof_2 = 4,
            helmet_1 = -1, helmet_2 = 1,
            chain_1 = 1, chain_2 = 0,
            decals_1 = 12, decals_2 = 0,
        },
        female = {
            bags_1 = 0, bags_2 = 0,
            tshirt_1 = 51, tshirt_2 = 0,
            torso_1 = 351, torso_2 = 3,
            arms = 14,
            pants_1 = 61, pants_2 = 0,
            shoes_1 = 25, shoes_2 = 0,
            mask_1 = 169, mask_2 = 0,
            bproof_1 = 11, bproof_2 = 3,
            helmet_1 = -1, helmet_2 = 0,
            chain_1 = 6, chain_2 = 0,
            decals_1 = 0, decals_2 = 0
            
        }
    },
    onEquip = function()

    end
},
    [14] = {
        label = "→ ASD - ~p~ Tenues Hélico : ~r~[ASD]",
        minimum_grade = 1,
        giletPB = 54,
        giletPB2 = 0,
        variations = {
        male = {
            bags_1 = 0, bags_2 = 0,
            tshirt_1 = 67, tshirt_2 = 0,
            torso_1 = 108, torso_2 = 0,
            arms = 33,
            pants_1 = 38, pants_2 = 2,
            shoes_1 = 25, shoes_2 = 0,
            mask_1 = 122, mask_2 = 0,
            bproof_1 = 29, bproof_2 = 0,
            helmet_1 = 79, helmet_2 = 1,
            chain_1 = 8, chain_2 = 0,
        },
        female = {
            bags_1 = 0, bags_2 = 0,
            tshirt_1 = 51, tshirt_2 = 0,
            torso_1 = 351, torso_2 = 3,
            arms = 14,
            pants_1 = 61, pants_2 = 0,
            shoes_1 = 25, shoes_2 = 0,
            mask_1 = 169, mask_2 = 0,
            bproof_1 = 11, bproof_2 = 3,
            helmet_1 = -1, helmet_2 = 0,
            chain_1 = 6, chain_2 = 0,
            decals_1 = 0, decals_2 = 0
            
        }
    },
    onEquip = function()

    end
},
        [15] = {
            label = "→ GBP - ~p~ Equiper : ~p~[Gilet LSPD]",
            minimum_grade = 0,
            giletPB = 27,
            giletPB2 = 2,
            variations = {
            male = {
                bproof_1 = 20, bproof_2 = 0,
            },
            female = {
                bproof_1 = 20, bproof_2 =0,
                
            }
        },
        onEquip = function()

        end
    },


        }
    }
}

                

SWAT = {
	clothes = {
            grades = {
                -- @label = Le nom affiché de la tenue de grade
                -- @male = Les composants skinchanger pour les hommes
                -- @female = Les composants skinchanger pour les femmes
                [0] = {
                    label = "→ SWAT - ~p~ Intervention",
                    
                    minimum_grade = 0,
                    
                    variations = {
                        male = {
                            bags_1 = 0, bags_2 = 0,
                        tshirt_1 = 92, tshirt_2 = 1,
                        torso_1 = 220, torso_2 = 0,
                        arms = 38,
                        pants_1 = 31, pants_2 = 0,
                        shoes_1 = 25, shoes_2 = 0,
                        mask_1 = 185, mask_2 = 0,
                        bproof_1 = 25, bproof_2 = 0,
                        helmet_1 = 117, helmet_2 = 0,
                        chain_1 = 110, chain_2 = 0,
                        decals_1 = 0, decals_2 = 0,
                        glasses_1 = 25, glasses_2 = 1,
                        },
                    female = {
                        bags_1 = 0, bags_2 = 0,
                        tshirt_1 = 51, tshirt_2 = 0,
                        torso_1 = 351, torso_2 = 3,
                        arms = 14,
                        pants_1 = 61, pants_2 = 0,
                        shoes_1 = 25, shoes_2 = 0,
                        mask_1 = 169, mask_2 = 0,
                        bproof_1 = 11, bproof_2 = 3,
                        helmet_1 = -1, helmet_2 = 0,
                        chain_1 = 6, chain_2 = 0,
                        decals_1 = 0, decals_2 = 0
                        
                    }
                },
                onEquip = function()

                end
            }, 
            [1] = {
                label = "→ SWAT - ~p~ Entrainement",
                
                minimum_grade = 0,
                
                variations = {
                male = {
                    bags_1 = 0, bags_2 = 0,
                tshirt_1 = 87, tshirt_2 = 0,
                torso_1 = 93, torso_2 = 1,
                arms = 0,
                pants_1 = 59, pants_2 = 0,
                shoes_1 = 25, shoes_2 = 0,
                mask_1 = 121, mask_2 = 0,
                bproof_1 = 29, bproof_2 = 0,
                helmet_1 = -1, helmet_2 = 0,
                chain_1 = 8, chain_2 = 0,
                decals_1 = 0, decals_2 = 0,
                glasses_1 = 15, glasses_2 = 1,
                },
                female = {
                    bags_1 = 0, bags_2 = 0,
                    tshirt_1 = 129, tshirt_2 = 0,
                    torso_1 = 75, torso_2 = 6,
                    arms = 86,
                    pants_1 = 33, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 0, mask_2 = 0,
                    bproof_1 = 14, bproof_2 = 0,
                    helmet_1 = -1, helmet_2 = 0,
                    chain_1 = 0, chain_2 = 0,
                    decals_1 = 0, decals_2 = 0
                    
                }
            },
            onEquip = function()
                SetPedArmour(PlayerPedId(), 100)
            end
        }, 
        }
    }
}


Ceremonie = {
	clothes = {

            grades = {
                -- @label = Le nom affiché de la tenue de grade
                -- @male = Les composants skinchanger pour les hommes
                -- @female = Les composants skinchanger pour les femmes
                [0] = {
                    label = "→ LSPD - ~p~ Cérémonie : ~p~[Cadet]",
                    minimum_grade = 0,
                    giletPB = 12,
                    giletPB2 = 3,
                    variations = {
                    male = {
                        bags_1 = 52, bags_2 = 0,
                        tshirt_1 = 50, tshirt_2 = 0,
                        torso_1 = 200, torso_2 = 0,
                        arms = 75,
                        pants_1 = 35, pants_2 = 0,
                        shoes_1 = 25, shoes_2 = 0,
                        mask_1 = 0, mask_2 = 0,
                        bproof_1 = 0, bproof_2 = 0,
                        helmet_1 = 46, helmet_2 = 0,
                        chain_1 = 8, chain_2 = 0,
                        decals_1 = 0, decals_2 = 0,
                    },
                    female = {
                        bags_1 = 52, bags_2 = 0,
                        tshirt_1 = 50, tshirt_2 = 0,
                        torso_1 = 200, torso_2 = 0,
                        arms = 75,
                        pants_1 = 35, pants_2 = 0,
                        shoes_1 = 25, shoes_2 = 0,
                        mask_1 = 0, mask_2 = 0,
                        bproof_1 = 0, bproof_2 = 0,
                        helmet_1 = 46, helmet_2 = 0,
                        chain_1 = 8, chain_2 = 0,
                        decals_1 = 0, decals_2 = 0,
                        
                    }
                },
                onEquip = function()

                end
            },
                [1] = {
                    minimum_grade = 1,
                    label = "→ LSPD - ~p~ Cérémonie : ~p~[Officier]",
                    giletPB = 12,
                    giletPB2 = 3,
                    variations = {
                    male = {
                        bags_1 = 52, bags_2 = 0,
                        tshirt_1 = 50, tshirt_2 = 0,
                        torso_1 = 255, torso_2 = 0,
                        arms = 75,
                        pants_1 = 35, pants_2 = 0,
                        shoes_1 = 25, shoes_2 = 0,
                        mask_1 = 0, mask_2 = 0,
                        bproof_1 = 0, bproof_2 = 0,
                        helmet_1 = 46, helmet_2 = 0,
                        chain_1 = 8, chain_2 = 0,
                        decals_1 = 0, decals_2 = 0,
                    },
                    female = {
                        tshirt_1 = 36,  tshirt_2 = 1,
                        torso_1 = 48,   torso_2 = 0,
                        decals_1 = 0,   decals_2 = 0,
                        arms = 44,
                        pants_1 = 34,   pants_2 = 0,
                        shoes_1 = 27,   shoes_2 = 0,
                        helmet_1 = 45,  helmet_2 = 0,
                        chain_1 = 0,    chain_2 = 0,
                        ears_1 = -1,     ears_2 = 0
                    }
                },
                onEquip = function()

                end
                },
                [2] = {
                    minimum_grade = 1,
                    label =  "→ LSPD - ~p~ Cérémonie : ~p~[Officier II]",
                    giletPB = 12,
                    giletPB2 = 3,
                    variations = {
                    male = {
                        bags_1 = 52, bags_2 = 0,
                        tshirt_1 = 50, tshirt_2 = 0,
                        torso_1 = 255, torso_2 = 1,
                        arms = 75,
                        pants_1 = 35, pants_2 = 0,
                        shoes_1 = 25, shoes_2 = 0,
                        mask_1 = 0, mask_2 = 0,
                        bproof_1 = 0, bproof_2 = 0,
                        helmet_1 = 46, helmet_2 = 0,
                        chain_1 = 8, chain_2 = 0,
                        decals_1 = 12, decals_2 = 0,
                    },
                    female = {
                        bags_1 = 52, bags_2 = 0,
                        tshirt_1 = 50, tshirt_2 = 0,
                        torso_1 = 255, torso_2 = 1,
                        arms = 75,
                        pants_1 = 35, pants_2 = 0,
                        shoes_1 = 25, shoes_2 = 0,
                        mask_1 = 0, mask_2 = 0,
                        bproof_1 = 0, bproof_2 = 0,
                        helmet_1 = 46, helmet_2 = 0,
                        chain_1 = 8, chain_2 = 0,
                        decals_1 = 12, decals_2 = 1,
                    }
                },
                onEquip = function()

                end
            },
            [3] = {
                minimum_grade = 1,
                label = "→ LSPD - ~p~ Cérémonie : ~p~[SLO]",
                giletPB = 12,
                    giletPB2 = 3,
                variations = {
                male = {
                    bags_1 = 52, bags_2 = 0,
                    tshirt_1 = 50, tshirt_2 = 0,
                    torso_1 = 255, torso_2 = 1,
                    arms = 75,
                    pants_1 = 35, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 0, mask_2 = 0,
                    bproof_1 = 0, bproof_2 = 0,
                    helmet_1 = 46, helmet_2 = 0,
                    chain_1 = 8, chain_2 = 0,
                    decals_1 = 12, decals_2 = 1,
                },
                female = {
                    bags_1 = 52, bags_2 = 0,
                    tshirt_1 = 50, tshirt_2 = 0,
                    torso_1 = 255, torso_2 = 1,
                    arms = 75,
                    pants_1 = 35, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 0, mask_2 = 0,
                    bproof_1 = 0, bproof_2 = 0,
                    helmet_1 = 46, helmet_2 = 0,
                    chain_1 = 8, chain_2 = 0,
                    decals_1 = 12, decals_2 = 1,
                }
            },
            onEquip = function()
                
                end
            },

            [4] = {
                minimum_grade = 2,
                label = "→ LSPD - ~p~ Cérémonie : ~p~[Sergent]",
                giletPB = 12,
                    giletPB2 = 3,
                variations = {
                    male = {
                    bags_1 = 52, bags_2 = 1,
                    tshirt_1 = 50, tshirt_2 = 0,
                    torso_1 = 255, torso_2 = 2,
                    arms = 75,
                    pants_1 = 35, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 0, mask_2 = 0,
                    bproof_1 = 0, bproof_2 = 0,
                    helmet_1 = 46, helmet_2 = 0,
                    chain_1 = 8, chain_2 = 0,
                    decals_1 = 12, decals_2 = 2,

                },
                female = {
                    tshirt_1 = 36,  tshirt_2 = 1,
                    torso_1 = 48,   torso_2 = 0,
                    decals_1 = 0,   decals_2 = 0,
                    arms = 44,
                    pants_1 = 34,   pants_2 = 0,
                    shoes_1 = 27,   shoes_2 = 0,
                    helmet_1 = 45,  helmet_2 = 0,
                    chain_1 = 0,    chain_2 = 0,
                    ears_1 = -1,     ears_2 = 0
                }
            },
            onEquip = function()

                end
            },

            [5] = {
                minimum_grade = 3,
                label = "→ LSPD - ~p~ Cérémonie : ~p~[Sergent II]",
                giletPB = 12,
                    giletPB2 = 3,
                variations = {
                male = {
                    bags_1 = 52, bags_2 = 1,
                    tshirt_1 = 50, tshirt_2 = 0,
                    torso_1 = 255, torso_2 = 3,
                    arms = 75,
                    pants_1 = 35, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 0, mask_2 = 0,
                    bproof_1 = 0, bproof_2 = 0,
                    helmet_1 = 46, helmet_2 = 0,
                    chain_1 = 8, chain_2 = 0,
                    decals_1 = 12, decals_2 = 3,
                },
                female = {
                    tshirt_1 = 36,  tshirt_2 = 1,
                    torso_1 = 48,   torso_2 = 0,
                    decals_1 = 0,   decals_2 = 0,
                    arms = 44,
                    pants_1 = 34,   pants_2 = 0,
                    shoes_1 = 27,   shoes_2 = 0,
                    helmet_1 = 45,  helmet_2 = 0,
                    chain_1 = 0,    chain_2 = 0,
                    ears_1 = -1,     ears_2 = 0
                }
            },
            onEquip = function()

                end
            },

            [6] = {
                minimum_grade = 4,
                label = "→ LSPD - ~p~ Cérémonie : ~p~[Lieutenant]",
                giletPB = 12,
                    giletPB2 = 3,
                variations = {
                male = {
                    bags_1 = 52, bags_2 = 2,
                    tshirt_1 = 50, tshirt_2 = 0,
                    torso_1 = 255, torso_2 = 4,
                    arms = 75,
                    pants_1 = 35, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 0, mask_2 = 0,
                    bproof_1 = 0, bproof_2 = 0,
                    helmet_1 = 1, helmet_2 = 0,
                    chain_1 = 8, chain_2 = 0,
                    decals_1 = 45, decals_2 = 0,
                },
                female = {
                    tshirt_1 = 36,  tshirt_2 = 1,
                    torso_1 = 48,   torso_2 = 0,
                    decals_1 = 0,   decals_2 = 0,
                    arms = 44,
                    pants_1 = 34,   pants_2 = 0,
                    shoes_1 = 27,   shoes_2 = 0,
                    helmet_1 = 45,  helmet_2 = 0,
                    chain_1 = 0,    chain_2 = 0,
                    ears_1 = -1,     ears_2 = 0
                }
            },
            onEquip = function()

                end
            },

            [7] = {
                minimum_grade = 5,
                label = "→ LSPD - ~p~ Cérémonie : ~p~[Capitaine I ]",
                giletPB = 12,
                    giletPB2 = 3,
                variations = {
                male = {
                    bags_1 = 52, bags_2 = 3,
                    tshirt_1 = 50, tshirt_2 = 0,
                    torso_1 = 255, torso_2 = 5,
                    arms = 75,
                    pants_1 = 35, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 0, mask_2 = 0,
                    bproof_1 = 0, bproof_2 = 0,
                    helmet_1 = 1, helmet_2 = 0,
                    chain_1 = 8, chain_2 = 0,
                    decals_1 = 45, decals_2 = 1,
                },
                female = {
                    tshirt_1 = 36,  tshirt_2 = 1,
                    torso_1 = 48,   torso_2 = 0,
                    decals_1 = 0,   decals_2 = 0,
                    arms = 44,
                    pants_1 = 34,   pants_2 = 0,
                    shoes_1 = 27,   shoes_2 = 0,
                    helmet_1 = 45,  helmet_2 = 0,
                    chain_1 = 0,    chain_2 = 0,
                    ears_1 = -1,     ears_2 = 0
                }
            },
            onEquip = function()

                end
            },

            [8] = {
                minimum_grade = 6,
                label = "→ LSPD - ~p~ Cérémonie : ~p~[Capitaine II]",
                giletPB = 12,
                    giletPB2 = 3,
                variations = {
                male = {
                    bags_1 = 52, bags_2 = 3,
                    tshirt_1 = 50, tshirt_2 = 0,
                    torso_1 = 255, torso_2 = 17,
                    arms = 75,
                    pants_1 = 35, pants_2 = 0,
                    shoes_1 = 25, shoes_2 = 0,
                    mask_1 = 0, mask_2 = 0,
                    bproof_1 = 0, bproof_2 = 0,
                    helmet_1 = 1, helmet_2 = 0,
                    chain_1 = 8, chain_2 = 0,
                    decals_1 = 45, decals_2 = 1,
                },
                female = {
                    tshirt_1 = 36,  tshirt_2 = 1,
                    torso_1 = 48,   torso_2 = 0,
                    decals_1 = 0,   decals_2 = 0,
                    arms = 44,
                    pants_1 = 34,   pants_2 = 0,
                    shoes_1 = 27,   shoes_2 = 0,
                    helmet_1 = 45,  helmet_2 = 0,
                    chain_1 = 0,    chain_2 = 0,
                    ears_1 = -1,     ears_2 = 0
                }
            },
            onEquip = function()

                end
            },
        }
    }
}