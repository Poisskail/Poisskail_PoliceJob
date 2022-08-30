ESX = nil 

function getESXPolice()
    while ESX == nil do  
        TriggerEvent(Policeconfig.ESX, function(obj) ESX = obj end)
        Wait(0)
        while ESX.GetPlayerData().job == nil do
            Wait(10)
        end

       if ESX.IsPlayerLoaded() then
           ESX.PlayerData = ESX.GetPlayerData()
       end
        ESX.TriggerServerCallback('PoisskailDEV:getName', function(recup)
            playerName = recup.firstname..' '..recup.lastname
        end) 
    end
end

CreateThread(function()
    getESXPolice()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	PlayerLoaded = true
end)

function MarqueurPlayerPolice(colorR, colorG, colorB)
    local pos = GetEntityCoords(GetPlayerPed(ESX.Game.GetClosestPlayer()))
    local _, distance = ESX.Game.GetClosestPlayer()
    if distance <= 2.5 then
    DrawMarker(20, pos.x, pos.y, pos.z+1.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, colorR, colorG, colorB, 200, 1, 1, 2, 1, nil, nil, 0)
    end
end

function MarqueurVehicle(colorR, colorG, colorB)
    local pos = GetEntityCoords(ESX.Game.GetClosestVehicle())
    local _, distanceveh = ESX.Game.GetClosestVehicle()
    if distanceveh <= 4.0 then
    DrawMarker(21, pos.x, pos.y, pos.z+1.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, colorR, colorG, colorB, 200, 0, 1, 2, 1, nil, nil, 0)
    end
end

function PoliceSkin(infos)
	TriggerEvent('skinchanger:getSkin', function(skin)
		local uniformObject
		if skin.sex == 0 then
			uniformObject = infos.variations.male
		else
			uniformObject = infos.variations.female
		end
		if uniformObject then
			TriggerEvent('skinchanger:loadClothes', skin, uniformObject)
		end
		infos.onEquip()
	end)
end

function mug(title, subject, msg)
    local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
    ESX.ShowAdvancedNotification(title, subject, msg, mugshotStr, 1)
    UnregisterPedheadshot(mugshot)
end

function PolicevestiaireCam()
    local cameravestiaire = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
    SetCamActive(cameravestiaire, true)                                        -- heading
    SetCamParams(cameravestiaire, 457.0506, -998.4252, 31.75502, -16.367, 0.0, 264.59231567383, 5.0, 0, 1, 1, 0)
    SetCamFov(cameravestiaire, 60.0)
    RenderScriptCams(1, 1, 1500, 1, 1)
end

function BoardPolice(TextEntry, ExampleText, MaxStringLenght)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) 
	blockinput = true

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

local tournerveh = nil
CreateThread(function() 
	while true do
        if headingobject then
            Wait(1)
        if tournerveh ~= nil then
            _heading = GetEntityHeading(tournerveh)
            _z = _heading - 0.2
            SetEntityHeading(tournerveh, _z)
        end
    else
        Wait(1500)
        end
    end
end)

function cameraweapon()
    DisplayRadar(false)
    SetFocusEntity(PlayerPedId())
    SetEntityVisible(PlayerPedId(), false, false)
    camweapon = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
    SetCamActive(camweapon, true)
    SetEntityCoords(PlayerPedId(), -1102.56, -823.051, 14.28279, false, false, false, true)
    SetCamParams(camweapon, -1102.56, -823.051, 14.28279, -2.0, 0.0, 19.92185, 50.2442, 0, 1, 1, 2)
    SetCamFov(camweapon, 25.0)
    RenderScriptCams(1, 0, 0, 1, 1)
end

function GetWeapon(propname, coords)
    cameraweapon()
    if DoesEntityExist(Model) then
        DeleteObject(Model)
    else
        ESX.Game.SpawnLocalObject(GetHashKey(propname), coords,  function(model)
        FreezeEntityPosition(model, true)
        Model = model
        tournerveh = Model
        headingobject = true
        end)
    end
end

function ResetWP()
    FreezeEntityPosition(PlayerPedId(), false)
    SetEntityVisible(PlayerPedId(), true, false)
    DisplayRadar(true)
    headingobject = false
    DeleteObject(Model)
    RenderScriptCams(0, 0, 0, 0, 0)
    SetFocusEntity(GetPlayerPed(PlayerId()))
    SetEntityCoords(PlayerPedId(), posp.x, posp.y, posp.z-1.0, false, false, false, true)
    DestroyCam(camweapon, 0)
    TriggerEvent('ui:toggle', true) 
    TriggerEvent("esx_status:setDisplay", 1.0)
end
function GetClosestPedNotInVehicle(coords)
	local ignoreList = ignoreList or {}
	local peds = ESX.Game.GetPeds(ignoreList)
	local closestDistance = -1
	local closestPed= -1
	for i=1, #peds, 1 do
		local pedCoords = GetEntityCoords(peds[i])
		local distance  = GetDistanceBetweenCoords(pedCoords.x, pedCoords.y, pedCoords.z, coords.x, coords.y, coords.z, true)
		if GetPlayerServerId(NetworkGetPlayerIndexFromPed(peds[i])) ~= 0 then
			if not IsPedInAnyVehicle(peds[i], true) then
				if peds[i] ~= PlayerPedId() then
					if closestDistance == -1 or closestDistance > distance then
						closestPed = peds[i]
						closestDistance = distance
					end
				end
			end
		end
	end
	return closestPed, closestDistance
end
RegisterNetEvent('renfort:setBlip')
AddEventHandler('renfort:setBlip', function(coords, raison)
	if raison == 'petit' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		Wait(1000)
        PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        textrenfort = 'Renfort [~g~Petit~s~]'
        sprite = 42
        scale = 0.5
	elseif raison == 'moyenne' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		Wait(1000)
        PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        textrenfort = 'Renfort [~o~Moyen~s~]'
        sprite = 42
        scale = 0.7
    elseif raison == 'omfgg' then
		PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
		PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
		PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
		Wait(1000)
		PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
        PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)
        textrenfort = 'Code 99 [~r~Plus Haute Importance~s~]'
        sprite = 42
        scale = 1.0
	end
	local blipId = AddBlipForCoord(coords)
	SetBlipSprite(blipId, sprite)
	SetBlipScale(blipId, scale)
	SetBlipColour(blipId, 5)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(textrenfort)
	EndTextCommandSetBlipName(blipId)
	Wait(20 * 1000)
	RemoveBlip(blipId)
end)





object = {}
OtherItems = {}

function SpawnObj(obj)
    local playerPed = PlayerPedId()
	local coords, forward = GetEntityCoords(playerPed), GetEntityForwardVector(playerPed)
    local objectCoords = (coords + forward * 1.0)
    local Ent = nil

    SpawnObject(obj, objectCoords, function(obj)
        SetEntityCoords(obj, objectCoords, 0.0, 0.0, 0.0, 0)
        SetEntityHeading(obj, GetEntityHeading(playerPed))
        PlaceObjectOnGroundProperly(obj)
        Ent = obj
        Wait(1)
    end)
    Wait(1)
    while Ent == nil do Wait(1) end
    SetEntityHeading(Ent, GetEntityHeading(playerPed))
    PlaceObjectOnGroundProperly(Ent)
    local placed = false
    while not placed do
        Citizen.Wait(1)
        local coords, forward = GetEntityCoords(playerPed), GetEntityForwardVector(playerPed)
        local objectCoords = (coords + forward * 2.0)
        SetEntityCoords(Ent, objectCoords, 0.0, 0.0, 0.0, 0)
        SetEntityHeading(Ent, GetEntityHeading(playerPed))
        PlaceObjectOnGroundProperly(Ent)
        SetEntityAlpha(Ent, 170, 170)

        if IsControlJustReleased(1, 38) then
            placed = true
        end
    end

    FreezeEntityPosition(Ent, true)
    SetEntityInvincible(Ent, true)
    ResetEntityAlpha(Ent)
    local NetId = NetworkGetNetworkIdFromEntity(Ent)
    table.insert(object, NetId)

end


function RemoveObj(id, k)
    Citizen.CreateThread(function()
        SetNetworkIdCanMigrate(id, true)
        local entity = NetworkGetEntityFromNetworkId(id)
        NetworkRequestControlOfEntity(entity)
        local test = 0
        while test > 100 and not NetworkHasControlOfEntity(entity) do
            NetworkRequestControlOfEntity(entity)
            Wait(1)
            test = test + 1
        end
        SetEntityAsNoLongerNeeded(entity)

        local test = 0
        while test < 100 and DoesEntityExist(entity) do 
            SetEntityAsNoLongerNeeded(entity)
            TriggerServerEvent("DeleteEntity", NetworkGetNetworkIdFromEntity(entity))
            DeleteEntity(entity)
            DeleteObject(entity)
            if not DoesEntityExist(entity) then 
                table.remove(object, k)
            end
            SetEntityCoords(entity, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0)
            Wait(1)
            test = test + 1
        end
    end)
end

function GoodName(hash)
    if hash == GetHashKey("prop_roadcone02a") then
        return "Cone"
    elseif hash == GetHashKey("prop_barrier_work05") then
        return "Barrière"
    else
        return hash
    end

end



function SpawnObject(model, coords, cb)
	local model = GetHashKey(model)

	Citizen.CreateThread(function()
		RequestModels(model)
        Wait(1)
		local obj = CreateObject(model, coords.x, coords.y, coords.z, true, false, true)

		if cb then
			cb(obj)
		end
	end)
end


function RequestModels(modelHash)
	if not HasModelLoaded(modelHash) and IsModelInCdimage(modelHash) then
		RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
			Citizen.Wait(1)
		end
	end
end


local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end

		enum.destructor = nil
		enum.handle = nil
	end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumerateObjects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end



function spawnuniCarVP(car,livery)
    
    local car = GetHashKey(car)
    local pos = FoundClearSpawnPoint(Config.Vespucci.garage.pos)
    if pos ~= false then
        RequestModel(car)
        while not HasModelLoaded(car) do
            RequestModel(car)
            Citizen.Wait(0)
        end
        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
        local vehicle = CreateVehicle(car, pos.pos, pos.heading, true, false)
        SetEntityAsMissionEntity(vehicle, true, true)
        local plaque = "LSPD"..math.random(1,9)
        SetVehicleNumberPlateText(vehicle, plaque)
        SetVehicleDirtLevel(vehicle, 0.0)
        SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
        SetVehicleMaxMods(vehicle)
        SetVehicleLivery(vehicle, livery)
    
        SetVehicleExtra(vehicle, -1, true)
    else
        ShowNotification("Aucun point de sortie disponible")
    end        
         
end

function spawnuniCarMR(car,livery)
    
    local car = GetHashKey(car)
    local pos = FoundClearSpawnPoint(Config.MissionRow.garage.pos)
    
    if pos ~= false then
        RequestModel(car)
        while not HasModelLoaded(car) do
            RequestModel(car)
            Citizen.Wait(0)
        end
        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
        local vehicle = CreateVehicle(car, pos.pos, pos.heading, true, false)
        SetEntityAsMissionEntity(vehicle, true, true)
        local plaque = "LSPD"..math.random(1,9)
        SetVehicleNumberPlateText(vehicle, plaque)
        SetVehicleDirtLevel(vehicle, 0.0)
        SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
        SetVehicleMaxMods(vehicle)
        SetVehicleLivery(vehicle, livery)
    
        SetVehicleExtra(vehicle, -1, true)
    else
        ShowNotification("Aucun point de sortie disponible")
    end        
         
end
function spawnuniCarHeli(car)

    local car = GetHashKey(car)
    local pos = {pos =vector3(449.77,-981.81,43.69), heading = 92.75}


    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, pos.pos, pos.heading, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    local plaque = "LSPD"..math.random(1,9)
    SetVehicleNumberPlateText(vehicle, plaque)
    SetVehicleDirtLevel(vehicle, 0.0)
    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
    SetVehicleMaxMods(vehicle)
    SetVehicleLivery(vehicle, 0)

    SetVehicleExtra(vehicle, -1, true)


end

function FoundClearSpawnPoint(zones)
    
	local found = false
	local count = 0
	for k,v in pairs(zones) do
        
		local clear = IsSpawnPointClear(v.pos, 2.0)
		if clear then
			found = v
			break
		end
	end
	return found
end

 function IsSpawnPointClear(coords, radius)
	local vehicles = GetVehiclesInArea(coords, radius)

	return #vehicles == 0
 end

 function GetVehiclesInArea (coords, area)
 	local vehicles       = GetVehicles()
 	local vehiclesInArea = {}

 	for i=1, #vehicles, 1 do
 		local vehicleCoords = GetEntityCoords(vehicles[i])
 		local distance      = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

 		if distance <= area then
			table.insert(vehiclesInArea, vehicles[i])
		end
	end

	return vehiclesInArea
end

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function GetVehicles()
	local vehicles = {}

	for vehicle in EnumerateVehicles() do
		table.insert(vehicles, vehicle)
	end

	return vehicles
end
function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function SetVehicleMaxMods(vehicle)
    local props = {
      modEngine       = 2,
      modBrakes       = 4,
      modTransmission = 4,
      modSuspension   = 4,
      modTurbo        = true,
    }
    ESX.Game.SetVehicleProperties(vehicle, props)
  end