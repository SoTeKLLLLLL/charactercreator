ESX = nil
--https://discord.gg/MYb6TcHmq9
local playerPed = PlayerPedId()
local incamera = false
local board_scaleform
local handle
local board
local board_model = GetHashKey("prop_police_id_board")
local board_pos = vector3(0.0,0.0,0.0)
local overlay
local overlay_model = GetHashKey("prop_police_id_text")
local isinintroduction = false
local pressedenter = false
local introstep = 0
local timer = 0
local inputgroups = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31}
local enanimcinematique = false
local guiEnabled = false

local sound = false
local mum = {"Angel","Hannah","Audrey","Jasmine","Giselle","Amelia","Isabella","Zoe","Ava","Camilia","Violet","Sophie","Evelyn","Nicole","Ashley","Grace","Briana","Natalie","Olivia","Elizabeth","Charlotte"}
local dad = {"Benjamin","Daniel","Joshua","Noah","Andrew","Juan","Alex","Isaac","Evan","Ethan","Vincent","Diego","Adrian","Gabriel","Michael","Santiago","Kevin","Louis","Samuel","Anthony","Claude"}
LastSkin = nil
Character = {}
local isCameraActive = false
----Menu
local boutonprincipale = {
    'Héritage',
    'Apparence',
    'Maquillage',
    'Traits du Visage',
    'Vêtements',
    'Accessoires',
    '~g~Identité',

}
Citizen.CreateThread(function()
	while true do
        if guiEnabled then
            ESX.UI.HUD.SetDisplay(0.0)
            TriggerEvent('es:setMoneyDisplay', 0.0)
            TriggerEvent('esx_status:setDisplay', 0.0)
            DisplayRadar(false)
            TriggerEvent('ui:toggle', false)
			DisableControlAction(0, 1,   true) -- LookLeftRight
			DisableControlAction(0, 2,   true) -- LookUpDown
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 30,  true) -- MoveLeftRight
			DisableControlAction(0, 31,  true) -- MoveUpDown
			DisableControlAction(0, 21,  true) -- disable sprint
			DisableControlAction(0, 24,  true) -- disable attack
			DisableControlAction(0, 25,  true) -- disable aim
			DisableControlAction(0, 47,  true) -- disable weapon
			DisableControlAction(0, 58,  true) -- disable weapon
			DisableControlAction(0, 263, true) -- disable melee
			DisableControlAction(0, 264, true) -- disable melee
			DisableControlAction(0, 257, true) -- disable melee
			DisableControlAction(0, 140, true) -- disable melee
			DisableControlAction(0, 141, true) -- disable melee
			DisableControlAction(0, 143, true) -- disable melee
			DisableControlAction(0, 75,  true) -- disable exit vehicle
			DisableControlAction(27, 75, true) -- disable exit vehicle
		end
		Citizen.Wait(10)
	end
end)

function spawncinematiqueplayer()
    guiEnabled = true
    local playerPed = PlayerPedId()
    pressedenter = true
    local introcam
    TriggerEvent('chat:clear')
    TriggerEvent('chat:toggleChat')
    SetEntityVisible(playerPed, false, false)
    --SetEntityCoordsNoOffset(playerPed, -103.8, -921.06, 287.29, false, false, false, true)
    FreezeEntityPosition(GetPlayerPed(-1), true)
    SetFocusEntity(playerPed)
    PrepareMusicEvent("FM_INTRO_START")
    Wait(1)
    SetOverrideWeather("EXTRASUNNY")
    NetworkOverrideClockTime(19, 0, 0)
    BeginSrl()
    introstep = 1
    isinintroduction = true
    Wait(1)
    DoScreenFadeIn(500)
    if introstep == 1 then
            TriggerMusicEvent("FM_INTRO_START")
            introcam = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
            SetCamActive(introcam, true)
            --SetFocusArea(994.14, 3075.45, 1042.35, 0.0, 0.0, 0.0)
            --SetCamParams(introcam, 994.14, 3075.45, 1042.35, -14.367, 0.0, 161.75, 42.2442, 0, 1, 1, 2)
            --SetCamParams(introcam, 211.07, -28.3, 272.71, -9.6114, 0.0, 161.75, 44.8314, 100000, 0, 0, 2)
            SetFocusArea(754.2219, 1226.831, 356.5081, 0.0, 0.0, 0.0)
            SetFocusArea(-57.43, -1012.55, 56.26, 0.0, 0.0, 0.0)
            SetCamParams(introcam, 754.2219, 1226.831, 356.5081, -14.367, 0.0, 157.3524, 42.2442, 0, 1, 1, 2)
            SetCamParams(introcam, -57.43, -1012.55, 56.26, -9.6114, 0.0, 157.8659, 44.8314, 120000, 0, 0, 2)
            ShakeCam(introcam, "HAND_SHAKE", 0.50)
            RenderScriptCams(true, false, 3000, 1, 1)
        return
    end
end

Citizen.CreateThread(function()
    while true do 
        Wait(0)

        local playerPed = PlayerPedId()

        if pressedenter then 
            ESX.ShowHelpNotification("Appuyez sur ~g~ENTER ~s~pour valider votre entrée.", 500)
            if IsControlJustPressed(1, 191) then 
                ESX.ShowNotification("~g~Vous avez validé votre entrée.")
                ESX.ShowNotification("~g~Vous avez été replacé à votre ancienne position.")
                ESX.ShowNotification("~g~Connexion au vocal réussie.")
                destorycam()
                spawncinematiqueplayer(false)
                DoScreenFadeOut(0)
                enanimcinematique = false
                pressedenter = false
                guiEnabled = false
                isinintroduction = false
                PrepareMusicEvent("FM_SUDDEN_DEATH_STOP_MUSIC")
                TriggerMusicEvent("FM_SUDDEN_DEATH_STOP_MUSIC")
                TriggerEvent("playerSpawned")
                SetEntityVisible(playerPed, true, false)
                FreezeEntityPosition(GetPlayerPed(-1), false)
                DestroyCam(createdCamera, 0)
                DestroyCam(createdCamera, 0)
                RenderScriptCams(0, 0, 1, 1, 1)
                createdCamera = 0
                ClearTimecycleModifier("scanline_cam_cheap")
                SetFocusEntity(GetPlayerPed(PlayerId()))   
                --ExecuteCommand('lastpos')
                DoScreenFadeIn(1500)
                ESX.UI.HUD.SetDisplay(1.0)
                TriggerEvent('es:setMoneyDisplay', 1.0)
                TriggerEvent('esx_status:setDisplay', 1.0)
                DisplayRadar(true)
                TriggerEvent('ui:toggle', true)
            end
        end
    end
end)


local function LoadScaleform (scaleform)
	local handle = RequestScaleformMovie(scaleform)
	if handle ~= 0 then
		while not HasScaleformMovieLoaded(handle) do
			Citizen.Wait(0)
		end
	end
	return handle
end


local function CreateNamedRenderTargetForModel(name, model)
	local handle = 0
	if not IsNamedRendertargetRegistered(name) then
		RegisterNamedRendertarget(name, 0)
	end
	if not IsNamedRendertargetLinked(model) then
		LinkNamedRendertarget(model)
	end
	if IsNamedRendertargetRegistered(name) then
		handle = GetNamedRendertargetRenderId(name)
	end

	return handle
end

Citizen.CreateThread(function()
	board_scaleform = LoadScaleform("mugshot_board_01")
	handle = CreateNamedRenderTargetForModel("ID_Text", overlay_model)


	while handle do
		SetTextRenderId(handle)
		Set_2dLayer(4)
		Citizen.InvokeNative(0xC6372ECD45D73BCD, 1)
		DrawScaleformMovie(board_scaleform, 0.405, 0.37, 0.81, 0.74, 255, 255, 255, 255, 0)
		Citizen.InvokeNative(0xC6372ECD45D73BCD, 0)
		SetTextRenderId(GetDefaultScriptRendertargetRenderId())

		Citizen.InvokeNative(0xC6372ECD45D73BCD, 1)
		Citizen.InvokeNative(0xC6372ECD45D73BCD, 0)
		Wait(0)
	end
end)

local function CallScaleformMethod (scaleform, method, ...)
	local t
	local args = { ... }

	BeginScaleformMovieMethod(scaleform, method)

	for k, v in ipairs(args) do
		t = type(v)
		if t == 'string' then
			PushScaleformMovieMethodParameterString(v)
		elseif t == 'number' then
			if string.match(tostring(v), "%.") then
				PushScaleformMovieFunctionParameterFloat(v)
			else
				PushScaleformMovieFunctionParameterInt(v)
			end
		elseif t == 'boolean' then
			PushScaleformMovieMethodParameterBool(v)
		end
	end
	EndScaleformMovieMethod()
end


function KeyboardInput(inputText, maxLength) -- Thanks to Flatracer for the function.
    AddTextEntry('FMMC_KEY_TIP12', "")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP12", "", inputText, "", "", "", maxLength)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    else
        Citizen.Wait(500)
        return nil
    end
end

function CreateBoard(ped)
    local plyData = ESX.GetPlayerData()
    RequestModel(board_model)
    while not HasModelLoaded(board_model) do Wait(0) end
    RequestModel(overlay_model)
    while not HasModelLoaded(overlay_model) do Wait(0) end
    board = CreateObject(board_model, GetEntityCoords(ped), false, true, false)
    overlay = CreateObject(overlay_model, GetEntityCoords(ped), false, true, false)
    AttachEntityToEntity(overlay, board, -1, 4103, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
    ClearPedWetness(ped)
    ClearPedBloodDamage(ped)
    ClearPlayerWantedLevel(PlayerId())
    SetCurrentPedWeapon(ped, GetHashKey("weapon_unarmed"), 1)
    AttachEntityToEntity(board, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1)
    CallScaleformMethod(board_scaleform, 'SET_BOARD', plyData.job.label, GetPlayerName(PlayerId()), 'LOS SANTOS POLICE DEPT', '' , 0, 1, 116)
end

local FirstSpawn     = true
local LastSkin       = nil
local PlayerLoaded   = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerLoaded = true
end)

AddEventHandler('playerSpawned', function()
	Citizen.CreateThread(function()
		while not PlayerLoaded do
			Citizen.Wait(10)
		end
		if FirstSpawn then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin == nil then
					TriggerEvent('c_charact:create')
				else
                    TriggerEvent('skinchanger:loadSkin', skin)
                    TriggerEvent('topserveur:openme')
                    spawncinematiqueplayer()
				end
			end)
			FirstSpawn = false
		end
	end)
end)

function createcamvisage(default)
    DisplayRadar(false)
    TriggerEvent('esx_status:setDisplay', 0.0)
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    if (not DoesCamExist(cam)) then
        if default then
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', 410.72, -998.68, -98.3, 0.0, 0.0, 88.455696105957, 15.0, false, 0)
        else
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', 410.72, -998.68, -98.3, 0.0, 0.0, 88.455696105957, 15.0, false, 0)
        end
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 0, true, false)
    end
end

function createcamcinematique(default)
    DisplayRadar(false)
    TriggerEvent('esx_status:setDisplay', 0.0)
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    if (not DoesCamExist(cam)) then
        if default then
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', -490.69, -667.96, 47.43, -35.0, 0.0, 180.16, 40.0, false, 0)
        else
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', -490.69, -667.96, 47.43, -35.0, 0.0, 180.16, 40.0, false, 0)
        end
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 0, true, false)
    end
end



function createcamtorse(default)
    DisplayRadar(false)
    TriggerEvent('esx_status:setDisplay', 0.0)
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    if (not DoesCamExist(cam)) then
        if default then
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', 410.72, -998.68, -98.3, 0.0, 0.0, 88.455696105957, 10.0, false, 0)
        else
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', 410.72, -998.68, -98.3, 0.0, 0.0, 88.455696105957, 10.0, false, 0)
        end
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 0, true, false)
    end
end


function createcam(default)
    DisplayRadar(false)
    TriggerEvent('esx_status:setDisplay', 0.0)
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    if (not DoesCamExist(cam)) then
        if default then
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', 410.2, -998.60, -98.5, -18.0, 0.0, 89.60, 70.0, false, 0)
        else
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', 410.2, -998.60, -98.5, -18.0, 0.0, 89.60, 70.0, false, 0)
        end
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 0, true, false)
    end
end

function createcamfin(default)
    DisplayRadar(false)
    TriggerEvent('esx_status:setDisplay', 0.0)
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    if (not DoesCamExist(cam)) then
        if default then
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', 414.64, -998.16, -98.68, 0.0, 0.0, 88.455696105957, 60.0, false, 0)
        else
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', 414.64, -998.16, -98.68, 0.0, 0.0, 88.455696105957, 60.0, false, 0)
        end
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 0, true, false)
    end
end

function createcamjambe(default)
    DisplayRadar(false)
    TriggerEvent('esx_status:setDisplay', 0.0)
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    if (not DoesCamExist(cam)) then
        if default then
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', 410.2, -998.60, -98.9, -18.0, 0.0, 89.60, 50.0, false, 0)
        else
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', 410.2, -998.60, -98.9, -18.0, 0.0, 89.60, 50.0, false, 0)
        end
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 0, true, false)
    end
end

function createcamchaussure(default)
    DisplayRadar(false)
    TriggerEvent('esx_status:setDisplay', 0.0)
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    if (not DoesCamExist(cam)) then
        if default then
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', 410.2, -998.60, -99.1, -21.0, 0.0, 89.60, 50.0, false, 0)
        else
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', 410.2, -998.60, -99.1, -21.0, 0.0, 89.60, 50.0, false, 0)
        end
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 0, true, false)
    end
end

function createcamtorse(default)
    DisplayRadar(false)
    TriggerEvent('esx_status:setDisplay', 0.0)
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    if (not DoesCamExist(cam)) then
        if default then
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', 410.72, -998.68, -98.75, 0.0, 0.0, 88.455696105957, 27.0, false, 0)
        else
            cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', 410.72, -998.68, -98.75, 0.0, 0.0, 88.455696105957, 27.0, false, 0)
        end
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 0, true, false)
    end
end

function CreateCamEnter()
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 415.55, -998.50, -99.29, 0.00, 0.00, 89.75, 50.00, false, 0)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 2000, true, true) 
end

function SpawnCharacter()
    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 411.30, -998.62, -99.01, 0.00, 0.00, 89.75, 50.00, false, 0)
    PointCamAtCoord(cam2, 411.30, -998.62, -99.01)
    SetCamActiveWithInterp(cam2, cam, 5000, true, true)
end

function destorycam()
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    TriggerServerEvent('barbershop:removeposition')
end


function openCinematique()
	hasCinematic = not hasCinematic
	if not hasCinematic then
        SendNUIMessage({openCinema = false})
        ESX.UI.HUD.SetDisplay(1.0)
        TriggerEvent('es:setMoneyDisplay', 1.0)
        TriggerEvent('esx_status:setDisplay', 1.0)
        DisplayRadar(true)
        TriggerEvent('ui:toggle', true)
	elseif hasCinematic then
		SendNUIMessage({openCinema = true})
		ESX.UI.HUD.SetDisplay(0.0)
		TriggerEvent('es:setMoneyDisplay', 0.0)
		TriggerEvent('esx_status:setDisplay', 0.0)
		DisplayRadar(false)
		TriggerEvent('ui:toggle', false)
	end
end

RegisterNetEvent('c_character:SpawnCharacter')
AddEventHandler('c_character:SpawnCharacter', function(spawn)
    PrepareMusicEvent("FM_INTRO_START")
    TriggerMusicEvent("FM_INTRO_START")
    SetRunSprintMultiplierForPlayer(PlayerId(),1.49)
    openCinematique()
    SetOverrideWeather("EXTRASUNNY")
    SetWeatherTypePersist("EXTRASUNNY")
    NetworkOverrideClockTime(16, 0, 0)
    PlaySoundFrontend(-1, "CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0)
    TriggerServerEvent('SavellPlayer')
    RenderScriptCams(0, 0, 1, 1, 1)
    ClearTimecycleModifier("scanline_cam_cheap")
    SetFocusEntity(GetPlayerPed(PlayerId()))
    DoScreenFadeOut(0)
    --SetTimecycleModifier('rply_saturation')
    SetEntityCoords(PlayerPedId(), -491.0, -737.32, 23.92-0.98)
    SetEntityHeading(PlayerPedId(), 359.3586730957)
    createcamcinematique(true)
    FreezeEntityPosition(PlayerPedId(), false)
    DoScreenFadeIn(1500)
    ClearPedTasks(GetPlayerPed(-1))
    TaskPedSlideToCoord(PlayerPedId(), -491.68, -681.96, 33.2, 359.3586730957, 1.0)
    Citizen.Wait(21000)
    openCinematique()
    --spawncinematiqueplayer()
    ESX.ShowNotification("~g~Attention.\n~s~Nous vous souhaitons un agréable séjour parmis nous.")
    SetTimecycleModifier('')
    PlaySoundFrontend(-1, "CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0)
    TriggerEvent('instance:close')
    for i = 0, 357 do
        EnableAllControlActions(i)
    end
    destorycam()
    PrepareMusicEvent("FM_SUDDEN_DEATH_STOP_MUSIC")
    TriggerMusicEvent("FM_SUDDEN_DEATH_STOP_MUSIC")
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end)

function startAnims(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 8.0, -1, 14, 0, false, false, false)
	end)
end

local isCameraActive = false

creator = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 255, 255}, Title = "Création Personnage" , Blocked = true},
	Data = { currentMenu = "Création Personnage" },
	Events = {
        onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
            RequestStreamedTextureDict("pause_menu_pages_char_mom_dad",false)
            SetStreamedTextureDictAsNoLongerNeeded("pause_menu_pages_char_mom_dad",false)
            SetStreamedTextureDictAsNoLongerNeeded("pause_menu_pages_char_mom_dad",false)
            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
            RequestStreamedTextureDict("char_creator_portraits",false)RequestStreamedTextureDict("mpleaderboard",false)
            SetStreamedTextureDictAsNoLongerNeeded("char_creator_portraits",false)
			local slide = btn.slidenum
			local btn = btn.name
			local check = btn.unkCheckbox
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
			local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            local result = GetOnscreenKeyboardResult()
                
            if btn == "Maquillage" then 
                createcamvisage(true)
                OpenMenu('Maquillage')
            end
            if btn == "Héritage" then
                createcamvisage(true)
                OpenMenu("Héritage")
            end
            if btn == 'Apparence' then 
                createcamvisage(true)
                OpenMenu('Apparence')
            end 
            if btn == "Vêtements" then 
                OpenMenu("Vêtements")
            end
            if btn == "Traits du Visage" then 
                createcamvisage(true)
                OpenMenu("Traits du Visage")
            end
            if btn == 'Accessoires' then 
                OpenMenu("Accessoires")
            end
            if btn == '~g~Identité' then 
                OpenMenu("~g~Identité")
            end

            if btn == "Prénom" then 
        
                if result ~= nil then
                    ResultPrenom = result
                 end
            elseif btn == "Nom" then 
        
                 if result ~= nil then
                      ResultNom = result
                 end
            elseif btn == "Date de naissance" then 
          
                 if result ~= nil then
                    datedenaissance = result
                end
            elseif btn == "Lieu de naissance" then 
          
                if result ~= nil then
                    ResultLieuNaissance = result
                end
            elseif btn == "Taille" then 
        
                if result ~= nil then
                    taille = result
                end
            elseif btn == "Sexe" then 
        
                if result ~= nil then
                    ResultSexe = result
                end
            end
            if btn == "~g~Valider" then 
                
                isCameraActive = false
                TriggerServerEvent("charselect:createsign") 
                TriggerServerEvent('c_character:saveidentite', ResultSexe, ResultPrenom, ResultNom, ResultDateDeNaissance, ResultTaille)
                CreateBoard(GetPlayerPed(-1))
                TriggerServerEvent("charselect:createsign") 
                startAnims("mp_character_creation@customise@male_a", "drop_outro")
                TriggerEvent('skinchanger:getSkin', function(skin)
                    LastSkin = skin
                end)
                TriggerEvent('skinchanger:getSkin', function(skin)
                TriggerServerEvent('esx_skin:save', skin)
                end)
                ESX.ShowNotification("~g~Attention.\n~s~Vous venez d'enregistrer votre personnage.")
                incamera = true
                createcam(false)
                self:CloseMenu(true)
                createcamfin(false)
                SetTimecycleModifier('scanline_cam_cheap')
                local cam = {}
                cam = CreateCam("DEFAULT_SCRIPTED_Camera", 1)
                SetCamCoord(cam, 414.54, -998.27, -98.5)
                RenderScriptCams(1, 0, 0, 1, 1)
                PointCamAtCoord(cam, 408.89, -998.42, -99.0)
                DoScreenFadeIn(1500)
                PlaySoundFrontend(-1, "Parcel_Vehicle_Lost", "GTAO_FM_Events_Soundset", 1)
                while GetCamFov(cam) >= 32.0 do
                    Wait(0)
                    SetCamFov(cam, GetCamFov(cam)-0.05)
                end
                FreezeEntityPosition(GetPlayerPed(-1), false)
                --RequestAnimDict("mp_character_creation@lineup@male_a")
                PrepareMusicEvent("FM_SUDDEN_DEATH_STOP_MUSIC")
                TriggerMusicEvent("FM_SUDDEN_DEATH_STOP_MUSIC")
                startAnims("mp_character_creation@lineup@male_a", "outro")
                PlaySoundFrontend(-1, "ScreenFlash", "MissionFailedSounds", 1)
                DoScreenFadeOut(10500)
                Citizen.Wait(8500)
                destorycam()
                ClearPedTasksImmediately(GetPlayerPed(-1))
                DeleteObject(board)
                DeleteObject(overlay)
                PlaySoundFrontend(-1, "1st_Person_Transition", "PLAYER_SWITCH_CUSTOM_SOUNDSET", 1)
                TriggerEvent('c_character:SpawnCharacter')
            end
            if btn == "Chaussures" then 
                creator.Menu["Chaussures"].b = {}
                for i=0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1),6), 1 do 
                table.insert(creator.Menu["Chaussures"].b, {name = 'Chaussure N°'..i, ask = '' , askX = true, advSlider = {0,GetNumberOfPedTextureVariations(GetPlayerPed(-1),6),0} , iterator = i})
                end
            
            OpenMenu('Chaussures')
            end 
            if btn == "Hauts" then 
                creator.Menu["Hauts"].b = {}
                for i=0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1),11), 1 do 
                table.insert(creator.Menu["Hauts"].b, {name = 'Hauts N°'..i, ask = '' , askX = true, advSlider = {0,GetNumberOfPedTextureVariations(GetPlayerPed(-1),11),0} , iterator = i})
                end
            
            OpenMenu('Hauts')
            elseif btn == "T-shirts" then 
                creator.Menu["T-shirts"].b = {}
                for i=0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1),8), 1 do 
                table.insert(creator.Menu["T-shirts"].b, {name = 'T-shirts N°'..i, ask = '' , askX = true, advSlider = {0,GetNumberOfPedTextureVariations(GetPlayerPed(-1),8),0} , iterator = i})
                end
            
            OpenMenu('T-shirts')
            elseif btn == "Bas" then 
                creator.Menu["Bas"].b = {}
                for i=0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1),4), 1 do 
                table.insert(creator.Menu["Bas"].b, {name = 'Bas N°'..i, ask = '' , askX = true, advSlider = {0,GetNumberOfPedTextureVariations(GetPlayerPed(-1),4),0} , iterator = i})
                end
            
            OpenMenu('Bas')
            elseif btn == "Bras" then 
                creator.Menu["Bras"].b = {}
                for i=0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1),3), 1 do 
                table.insert(creator.Menu["Bras"].b, {name = 'Bras N°'..i, ask = '' , askX = true, advSlider = {0,GetNumberOfPedTextureVariations(GetPlayerPed(-1),3),0} , iterator = i})
                end
            
            OpenMenu('Bras')
            end
            if btn == "Chapeaux" then
                creator.Menu["Chapeaux"].b = {}
                for i=0, GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1),0), 1 do 
                table.insert(creator.Menu["Chapeaux"].b, {name = 'Chapeaux N°'..i, ask = '' , askX = true, advSlider = {0,GetNumberOfPedPropTextureVariations(GetPlayerPed(-1),0),0} , iterator = i})
                end
                createcamvisage(true)
            OpenMenu('Chapeaux')
            end
            if btn == "Lunettes" then
                creator.Menu["Lunettes"].b = {}
                for i=0, GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1),1), 1 do 
                table.insert(creator.Menu["Lunettes"].b, {name = 'Lunettes N°'..i, ask = '' , askX = true, advSlider = {0,GetNumberOfPedPropTextureVariations(GetPlayerPed(-1),1),0} , iterator = i})
                end
                createcamvisage(true)
                 OpenMenu('Lunettes')
            end
            if btn == "Oreillettes" then
                creator.Menu["Oreillettes"].b = {}
                for i=0, GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1),2), 1 do 
                table.insert(creator.Menu["Oreillettes"].b, {name = 'Oreillettes N°'..i, ask = '' , askX = true, advSlider = {0,GetNumberOfPedPropTextureVariations(GetPlayerPed(-1),2),0} , iterator = i})
                end
                createcamvisage(true)
                 OpenMenu('Oreillettes')
            end
            if btn == "Montres" then
                creator.Menu["Montres"].b = {}
                for i=0, GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1),6), 1 do 
                table.insert(creator.Menu["Montres"].b, {name = 'Montres N°'..i, ask = '' , askX = true, advSlider = {0,GetNumberOfPedPropTextureVariations(GetPlayerPed(-1),6),0} , iterator = i})
                end
                 OpenMenu('Montres')
            end
            if btn == "Bracelets" then
                creator.Menu["Bracelets"].b = {}
                for i=0, GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1),7), 1 do 
                table.insert(creator.Menu["Bracelets"].b, {name = 'Bracelets N°'..i, ask = '' , askX = true, advSlider = {0,GetNumberOfPedPropTextureVariations(GetPlayerPed(-1),7),0} , iterator = i})
                end
                 OpenMenu('Bracelets')
            end
            if btn == "Sacs" then
                creator.Menu["Sacs"].b = {}
                for i=0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1),5), 1 do 
                table.insert(creator.Menu["Sacs"].b, {name = 'Sacs N°'..i, ask = '' , askX = true, advSlider = {0,GetNumberOfPedTextureVariations(GetPlayerPed(-1),5),0} , iterator = i})
                end
                 OpenMenu('Sacs')
            end
            if btn == "Chaînes/Accessoires" then
                creator.Menu["Chaînes/Accessoires"].b = {}
                for i=0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1),7), 1 do 
                table.insert(creator.Menu["Chaînes/Accessoires"].b, {name = 'Chaînes/Accessoires N°'..i, ask = '' , askX = true, advSlider = {0,GetNumberOfPedTextureVariations(GetPlayerPed(-1),7),0} , iterator = i})
                end
                 OpenMenu('Chaînes/Accessoires')
            end
            if btn == "Calques" then
                creator.Menu["Calques"].b = {}
                for i=0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1),10), 1 do 
                table.insert(creator.Menu["Calques"].b, {name = 'Calques N°'..i, ask = '' , askX = true, advSlider = {0,GetNumberOfPedTextureVariations(GetPlayerPed(-1),10),0} , iterator = i})
                end
                 OpenMenu('Calques')
            end

        end,
        onButtonSelected = function(currentMenu, currentBtn, menuData, newButtons, self)
            if currentMenu == "Chaussures" then 
                for k, v in pairs(creator.Menu['Chaussures'].b) do 
                    if currentBtn - 1 == v.iterator then
                        SetPedComponentVariation(GetPlayerPed(-1),6,v.iterator)
                    end
                end
            end
            if currentMenu == "Hauts" then 
                for k, v in pairs(creator.Menu['Hauts'].b) do 
                    if currentBtn - 1 == v.iterator then
                        SetPedComponentVariation(GetPlayerPed(-1),11,v.iterator)
                    end
                end
            end
            if currentMenu == "T-shirts" then 
                for k, v in pairs(creator.Menu['T-shirts'].b) do 
                    if currentBtn - 1 == v.iterator then
                        SetPedComponentVariation(GetPlayerPed(-1),8,v.iterator)
                    end
                end
            end
            if currentMenu == "Bas" then 
                for k, v in pairs(creator.Menu['Bas'].b) do 
                    if currentBtn - 1 == v.iterator then
                        SetPedComponentVariation(GetPlayerPed(-1),4,v.iterator)
                    end
                end
            end
            if currentMenu == "Bras" then 
                for k, v in pairs(creator.Menu['Bras'].b) do 
                    if currentBtn - 1 == v.iterator then
                        SetPedComponentVariation(GetPlayerPed(-1),3,v.iterator)
                    end
                end
            end
            if currentMenu == "Chapeaux" then 
                createcamvisage(true)
                for k, v in pairs(creator.Menu['Chapeaux'].b) do 
                    if currentBtn - 1 == v.iterator then
                        SetPedPropIndex(GetPlayerPed(-1),0,v.iterator)
                    end
                end
            end
            if currentMenu == "Lunettes" then 
                createcamvisage(true)
                for k, v in pairs(creator.Menu['Lunettes'].b) do 
                    if currentBtn - 1 == v.iterator then
                        SetPedPropIndex(GetPlayerPed(-1),1,v.iterator)
                    end
                end
            end
            if currentMenu == "Oreillettes" then 
                createcamvisage(true)
                for k, v in pairs(creator.Menu['Oreillettes'].b) do 
                    if currentBtn - 1 == v.iterator then
                        SetPedPropIndex(GetPlayerPed(-1),2,v.iterator)
                    end
                end
            end
            if currentMenu == "Montres" then 
                for k, v in pairs(creator.Menu['Montres'].b) do 
                    if currentBtn - 1 == v.iterator then
                        SetPedPropIndex(GetPlayerPed(-1),6,v.iterator)
                    end
                end
            end
            if currentMenu == "Bracelets" then 
                for k, v in pairs(creator.Menu['Bracelets'].b) do 
                    if currentBtn - 1 == v.iterator then
                        SetPedPropIndex(GetPlayerPed(-1),7,v.iterator)
                    end
                end
            end
            if currentMenu == "Sacs" then 
                for k, v in pairs(creator.Menu['Sacs'].b) do 
                    if currentBtn - 1 == v.iterator then
                        SetPedComponentVariation(GetPlayerPed(-1),5,v.iterator)
                    end
                end
            end
            if currentMenu == "Chaînes/Accessoires" then 
                
                for k, v in pairs(creator.Menu['Chaînes/Accessoires'].b) do 
                    if currentBtn - 1 == v.iterator then
                        SetPedComponentVariation(GetPlayerPed(-1),7,v.iterator)
                    end
                end
            end
            if currentMenu == "Calques" then 
                for k, v in pairs(creator.Menu['Calques'].b) do 
                    if currentBtn - 1 == v.iterator then
                        SetPedComponentVariation(GetPlayerPed(-1),10,v.iterator)
                    end
                end
            end
            if currentMenu == "Apparence" then
                if currentBtn == 7 then 
                    createcamtorse(true)
                else
                    createcamvisage(true)
                end
                
            end
            if currentMenu == "Création Personnage" then 
                createcam(true)
            end
            if currentMenu == "Traits du Visage" then 
                createcamvisage(true)
            end
            if currentMenu == "Accessoires" then 
                createcam(true)
            end
        end,

        onAdvSlide =  function(self, btn, currentBtn, currentButtons)
            local I=(currentBtn.advSlider[3]/40*2)-1
            if self.Data.currentMenu == "Maquillage" and currentBtn.name == "Maquillage Visage"  then 
                SetPedHeadOverlayColor(GetPlayerPed(-1), 4, 1,currentBtn.advSlider[3],currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Maquillage" and currentBtn.name == "Rouge à lèvres"  then 
                SetPedHeadOverlayColor(GetPlayerPed(-1), 8, 1,currentBtn.advSlider[3],currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Maquillage" and currentBtn.name == "Teint" then 
                SetPedHeadOverlayColor(GetPlayerPed(-1), 5, 1,currentBtn.advSlider[3],currentBtn.advSlider[3])
            end

            ---apparence
            if self.Data.currentMenu == 'Apparence'and currentBtn.name == "Cheveux" then 
                SetPedHairColor(GetPlayerPed(-1),currentBtn.advSlider[3],currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Apparence" and currentBtn.name == "Sourcils" then 
                SetPedHeadOverlayColor(GetPlayerPed(-1), 2, 1,currentBtn.advSlider[3],currentBtn.advSlider[3])
            end 
            if self.Data.currentMenu == "Apparence" and currentBtn.name == "Pilosité faciale" then 
                SetPedHeadOverlayColor(GetPlayerPed(-1), 1, 1,currentBtn.advSlider[3],currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Apparence" and currentBtn.name == "Pilosité torse" then
                SetPedHeadOverlayColor(GetPlayerPed(-1), 10, 1,currentBtn.advSlider[3],currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Hauteur nez" then
            
                SetPedFaceFeature(GetPlayerPed(-1), 1 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Largeur nez" then
                SetPedFaceFeature(GetPlayerPed(-1), 0 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Longueur nez" then
                SetPedFaceFeature(GetPlayerPed(-1), 2 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Abaissement du nez" then
                SetPedFaceFeature(GetPlayerPed(-1), 3 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Torsion du nez" then
                SetPedFaceFeature(GetPlayerPed(-1), 5 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Hauteur sourcils" then
                SetPedFaceFeature(GetPlayerPed(-1), 6 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Profondeur sourcils" then
                SetPedFaceFeature(GetPlayerPed(-1), 7 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Hauteur des pommettes" then
                SetPedFaceFeature(GetPlayerPed(-1), 8 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Largeur des pommettes" then
                SetPedFaceFeature(GetPlayerPed(-1), 9 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Largeur des joues" then
                SetPedFaceFeature(GetPlayerPed(-1), 10 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Ouverture des yeux" then
                SetPedFaceFeature(GetPlayerPed(-1), 11 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Épaisseur des lèvres" then
                SetPedFaceFeature(GetPlayerPed(-1), 12 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Largeur de la mâchoire" then
                SetPedFaceFeature(GetPlayerPed(-1), 13 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Longueur du dos de la mâchoire" then
                SetPedFaceFeature(GetPlayerPed(-1), 14 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Abaissement du menton" then
                SetPedFaceFeature(GetPlayerPed(-1), 15 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Longueur de l'os du menton" then
                SetPedFaceFeature(GetPlayerPed(-1), 16 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Largeur du menton" then
                SetPedFaceFeature(GetPlayerPed(-1), 17 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Trou du menton" then
                SetPedFaceFeature(GetPlayerPed(-1), 18 ,I)
            end
            if self.Data.currentMenu == "Traits du Visage" and currentBtn.name == "Epaisseur du cou" then
                local I=(currentBtn.advSlider[3]/40*2)-1
                SetPedFaceFeature(GetPlayerPed(-1), 19,I)
            end
            if self.Data.currentMenu == "Chaussures" then
                SetPedComponentVariation(GetPlayerPed(-1), 6,GetPedDrawableVariation(GetPlayerPed(-1),6),currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Hauts" then
                SetPedComponentVariation(GetPlayerPed(-1), 11,GetPedDrawableVariation(GetPlayerPed(-1),11),currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "T-shirts" then
                SetPedComponentVariation(GetPlayerPed(-1), 8,GetPedDrawableVariation(GetPlayerPed(-1),8),currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Bas" then
                SetPedComponentVariation(GetPlayerPed(-1), 4,GetPedDrawableVariation(GetPlayerPed(-1),4),currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Bras" then
                SetPedComponentVariation(GetPlayerPed(-1), 3,GetPedDrawableVariation(GetPlayerPed(-1),3),currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Chapeaux" then
                SetPedPropIndex(GetPlayerPed(-1), 0,GetPedPropIndex(GetPlayerPed(-1),0),currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Lunettes" then
                SetPedPropIndex(GetPlayerPed(-1), 1,GetPedPropIndex(GetPlayerPed(-1),1),currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Oreillettes" then
                SetPedPropIndex(GetPlayerPed(-1), 2,GetPedPropIndex(GetPlayerPed(-1),2),currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Montres" then
                SetPedPropIndex(GetPlayerPed(-1), 6,GetPedPropIndex(GetPlayerPed(-1),6),currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Bracelets" then
                SetPedPropIndex(GetPlayerPed(-1), 7,GetPedPropIndex(GetPlayerPed(-1),7),currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Sacs" then
                SetPedComponentVariation(GetPlayerPed(-1), 5,GetPedDrawableVariation(GetPlayerPed(-1),5),currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Chaînes/Accessoires" then
                SetPedComponentVariation(GetPlayerPed(-1), 7,GetPedDrawableVariation(GetPlayerPed(-1),7),currentBtn.advSlider[3])
            end
            if self.Data.currentMenu == "Calques" then
                SetPedComponentVariation(GetPlayerPed(-1), 10,GetPedDrawableVariation(GetPlayerPed(-1),10),currentBtn.advSlider[3])
            end
            
        end,

        onSlide = function(menuData,btn, currentButton, currentSlt)
            local currentMenu, ped = menuData.currentMenu, GetPlayerPed(-1)
            local slide = btn.slidenum
            local opacity = btn.opacity 
            local btn = btn.name
            ----Maquillage
            if currentMenu == "Maquillage"  and btn == "Maquillage Visage" then
            
                SetPedHeadOverlay(GetPlayerPed(-1), 4, slide,opacity ) 
            end
            if currentMenu == "Maquillage" and btn == "Rouge à lèvres" then 
            
                SetPedHeadOverlay(GetPlayerPed(-1), 8, slide,opacity ) 
            end
            if currentMenu == "Maquillage" and btn == "Teint" then    
            
                SetPedHeadOverlay(GetPlayerPed(-1), 5, slide,opacity ) 
            end

            ----Apparence
            if currentMenu == "Apparence" and btn == "Cheveux" then 
            
                SetPedComponentVariation(GetPlayerPed(-1),2,slide,0,2)
            end

            if currentMenu == "Apparence" and btn == "Sourcils" then 
            
                SetPedHeadOverlay(GetPlayerPed(-1), 2, slide,opacity ) 
            end
            if currentMenu == "Apparence" and btn == "Pilosité faciale" then 
            
                SetPedHeadOverlay(GetPlayerPed(-1), 1, slide,opacity )
            end
            if currentMenu == "Apparence" and btn == "Problème de peau" then 
                SetPedHeadOverlay(GetPlayerPed(-1), 11, slide,opacity )
            end
            if currentMenu == "Apparence" and btn == "Signe de vieillissement" then 
            
                SetPedHeadOverlay(GetPlayerPed(-1), 3, slide,opacity )
            end
            if currentMenu == "Apparence" and btn == "Pilosité torse" then 
                createcamtorse(true)
                SetPedHeadOverlay(GetPlayerPed(-1), 10, slide,opacity )

            end
            if currentMenu == "Apparence" and btn == "Taches cutanées"then
            
                SetPedHeadOverlay(GetPlayerPed(-1), 0, slide,opacity )
            end
            if currentMenu == "Apparence" and btn == "Taches de rousseur"then
            
                SetPedHeadOverlay(GetPlayerPed(-1), 9, slide,opacity )

            end
            if currentMenu == "Apparence" and btn == "Dommage UV"then
                SetPedHeadOverlay(GetPlayerPed(-1), 7, slide,opacity )

            end
            if currentMenu == "Apparence" and btn == "Couleur des yeux"then
                SetPedEyeColor(GetPlayerPed(-1), slide)		
            end
            if currentMenu == "Héritage"  then   
                mum = creator.Menu["Héritage"].b[1].slidenum
                dad = creator.Menu["Héritage"].b[2].slidenum
                ressemblance = creator.Menu["Héritage"].b[3].parentSlider
                peau = creator.Menu["Héritage"].b[4].parentSlider         
                SetPedHeadBlendData(GetPlayerPed(-1), dad,mum,nil,dad,mum,nil,ressemblance,peau,nil,true)
                
            end
            if slide == 1 and btn == "Sexe" then 
                changeModel('mp_m_freemode_01')

            elseif slide == 2 and btn == "Sexe" then 
                changeModel('mp_f_freemode_01')
            end
            ---male alpha
            if slide == 1 and btn == "Père" then 
              
                creator.Menu["Héritage"].father = "male_0"
            
            end
            if slide == 2 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_1"   
            end
            if slide == 3 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_2"            
            end
            if slide == 4 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_3"
            end
            if slide == 5 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_4"
            end
            if slide == 6 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_5"           

            end
            if slide == 7 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_6"
            end
            if slide == 8 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_7"
            end
            if slide == 9 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_8"
            end
            if slide == 10 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_9"            
            end
            if slide == 11 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_10"            
            end
            if slide == 12 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_11"            
            end
            if slide == 13 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_12"            
            end
            if slide == 14 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_13"            
            end
            if slide == 15 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_14"            
            end
            if slide == 16 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_15"            
            end
            if slide == 17 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_16"            
            end
            if slide == 18 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_17"            
            end
            if slide == 19 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_18"            
            end
            if slide == 20 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_19"            
            end
            if slide == 21 and btn == "Père" then 
                creator.Menu["Héritage"].father = "male_20"           
            end            
            if slide == 1 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_0"
            end
            if slide == 2 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_1"
            end
            if slide == 3 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_2"
            end
            if slide == 4 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_3"
            end
            if slide == 5 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_4"
            end
            if slide == 6 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_5"
            end
            if slide == 7 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_6"
            end
            if slide == 8 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_7"
            end
            if slide == 9 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_8"
            end
            if slide == 10 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_9"
            end
            if slide == 11 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_10"            
            end
            if slide == 12 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_11"
            end
            if slide == 13 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_12"
            end
            if slide == 14 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_13"
            end
            if slide == 15 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_14"
            end
            if slide == 16 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_15"
            end
            if slide == 17 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_16"
            end
            if slide == 18 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_17"
            end
            if slide == 19 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_18"
            end
            if slide == 20 and btn == "Mère" then 
                creator.Menu["Héritage"].mother = "female_19"
            end
            if slide == 21 and btn == "Mère" then 
                
                creator.Menu["Héritage"].mother = "female_20"
            end 
        end,

        onSlider = function(self, currentBtn, allButtons,parentSliderSize)

            if self.Data.currentMenu == "Héritage"  then 
                mum = creator.Menu["Héritage"].b[1].slidenum
                dad = creator.Menu["Héritage"].b[2].slidenum
                ressemblance = creator.Menu["Héritage"].b[3].parentSlider
                peau = creator.Menu["Héritage"].b[4].parentSlider
                SetPedHeadBlendData(GetPlayerPed(-1), dad,mum,nil,dad,mum,nil,ressemblance,peau,nil,true)
            end

        end,
},

	Menu = {
		["Création Personnage"] = {
			b = {
			}
        },
        ["Vêtements"] = {
			b = {
                {name = "Hauts" , ask = ">" , askX = true},
                {name = "T-shirts" , ask = ">" , askX = true},
                {name = "Bas" , ask = ">" , askX = true},
                {name = "Bras" , ask = ">" , askX = true},
                {name = "Chaussures" , ask = ">" , askX = true}     
			}
        },
        ["Hauts"] = {
			b = {                
			}
        },
        ["Bas"] = {
			b = {                
			}
        },
        ['T-shirts'] = {
			b = {                
			}
        },
        ["Bras"] = {
			b = {                
			}
        },
        ["Chaussures"] = {
			b = {                
			}
        },
        ["Accessoires"] = {
			b = {    
                {name = "Chapeaux" , ask = ">" , askX = true},
                {name = "Lunettes" , ask = ">" , askX = true},
                {name = "Oreillettes" , ask = ">" , askX = true},
                {name = "Chaînes/Accessoires" , ask = ">" , askX = true},
                {name = "Calques" , ask = ">" , askX = true},           
                {name = "Montres" , ask = ">" , askX = true},
                {name = "Bracelets" , ask = ">" , askX = true},
                {name = "Sacs" , ask = ">" , askX = true},           
			}
        },
        ["Calques"] = {
			b = {                
			}
        },
        ["Chapeaux"] = {
			b = {                
			}
        },
        ["Lunettes"] = {
			b = {                
			}
        },
        ["Oreillettes"] = {
			b = {                
			}
        },
        ["Chaînes/Accessoires"] = {
			b = {                
			}
        },
        ["Montres"] = {
			b = {                
			}
        },
        ["Bracelets"] = {
			b = {                
			}
        },
        ["Sacs"] = {
			b = {                
			}
        },
        
        ["Héritage"] = { extra = true , charCreator = true , father = 'male_0', mother = 'female_0',
            b = { 
                {name = "Mère", slidemax = mum},
                {name = "Père", slidemax = dad},
                {name = "Ressemblance", parentSlider = .25},
                {name = "Peau", parentSlider = .75},
                


            }
        },
        ["Maquillage"] = {extra = true,
            b = { 
                {name = "Maquillage Visage"  , opacity = 0.0 , advSlider = {0,64,0} ,slidemax = 74 },
                {name = "Rouge à lèvres"  , opacity = 0.0 , advSlider = {0,64,0} ,slidemax = 9 },
                {name = "Teint"  , opacity = 0.0 , advSlider = {0,64,0} ,slidemax = 35 },


            }
        }, 
        ["Apparence"] = {extra = true,
            b = { 
                {name = "Cheveux" , slidemax = 74 , advSlider = {0,GetNumMakeupColors(),0}},
                {name = "Sourcils" , slidemax = 33 , advSlider = {0,GetNumMakeupColors(),0} , opacity = 0.1},
                {name = "Couleur des yeux", slidemax = 31 },
                {name = "Pilosité faciale" , slidemax = 29 , opacity = 0.1 , advSlider = {0,64,0}},
                {name = "Problème de peau" , slidemax = 11, opacity = 0.1},
                {name = "Signe de vieillissement", slidemax = 14 , opacity = 0.1},
                {name = "Pilosité torse" , slidemax = 16 , opacity = 0.1 , advSlider = {0,64,0}},
                {name = "Taches cutanées" , slidemax = 23 , opacity = 0.1},
                {name = "Taches de rousseur", slidemax = 10 , opacity = 0.1},
                {name = "Dommage UV", slidemax = 10 , opacity = 0.1},

            }
        },
        ["Traits du Visage"] = {extra = true,
        b = { 
            {name="Largeur nez",advSlider={0,40,20}},
            {name="Hauteur nez",advSlider={0,40,20}},
            {name="Longueur nez",advSlider={0,20,10}},
            {name="Abaissement du nez",advSlider={0,40,20}},
            {name="Torsion du nez",advSlider={0,40,20}},
            {name="Hauteur sourcils",advSlider={0,40,20}},
            {name="Profondeur sourcils",advSlider={0,40,20}},
            {name="Hauteur des pommettes",advSlider={0,40,20}},
            {name="Largeur des pommettes",advSlider={0,40,20}},
            {name="Largeur des joues",advSlider={0,40,20}},
            {name="Ouverture des yeux",advSlider={0,40,20}},
            {name="Épaisseur des lèvres",advSlider={0,40,20}},
            {name="Largeur de la mâchoire",advSlider={0,40,20}},
            {name="Longueur du dos de la mâchoire",advSlider={0,40,20}},
            {name="Abaissement du menton",advSlider={0,20,10}},
            {name="Longueur de l'os du menton",advSlider={0,40,20}},
            {name="Largeur du menton",advSlider={0,40,20}},
            {name="Trou du menton",advSlider={0,40,20}},
            {name="Epaisseur du cou",advSlider={0,40,20}}

            

        }
    },
    ['~g~Identité'] = {
        b = {
            {name="Nom",ask = '' , askX = false},
            {name="Prénom",ask = '' , askX = false},
            {name="Date de Naissance",ask = '' , askX = false},
            {name="Taille",ask = '' , askX = false},
            {name="Sexe",ask = '' , askX = false},
            {name="~g~Valider",ask = '' , askX = true},
        }            
    } 
    }
}


function AnimationIntro()
    RequestAnimDict("mp_character_creation@lineup@male_a")
    Citizen.Wait(100)
    startAnims("mp_character_creation@lineup@male_a", "intro")
    Citizen.Wait(5700)
    RequestAnimDict("mp_character_creation@customise@male_a")
    Citizen.Wait(100)
    TaskPlayAnim(PlayerPedId(), "mp_character_creation@customise@male_a", "loop", 1.0, 1.0, -1, 0, 1, 0, 0, 0)
    Citizen.Wait(2250)
end

TriggerEvent('instance:registerType', 'skin')
TriggerEvent('instance:registerType', 'property')

RegisterNetEvent('c_charact:create')
AddEventHandler('c_charact:create', function()
    creator.Menu["Création Personnage"].b = {}
    table.insert(creator.Menu["Création Personnage"].b,{name = "Sexe", slidemax = {"Homme", "Femme"}})

    for k,v in pairs(boutonprincipale) do
        table.insert(creator.Menu["Création Personnage"].b, {name = v  , ask = ">" , askX = true})
    end
    DisplayRadar(false)
    TriggerEvent('esx_status:setDisplay', 0.0)
    TriggerEvent('instance:create', 'skin')
    --TriggerEvent('skinchanger:change', 'sex', 0)
    TriggerEvent('skinchanger:change', 'tshirt_1', 15)
    TriggerEvent('skinchanger:change', 'torso_1', 15)
    TriggerEvent('skinchanger:change', 'arms', 15)
    TriggerEvent('skinchanger:change', 'pants_1', 14)
    TriggerEvent('skinchanger:change', 'shoes_1', 34)
    isCameraActive = true
    for i = 0, 357 do
        DisableAllControlActions(i)
    end
    CreateCamEnter()
    SpawnCharacter()
    --createcam(true)
    SetEntityCoords(GetPlayerPed(-1), 409.4, -1001.64, -99.0-0.98, 0.0, 0.0, 0.0, 10)
    SetEntityHeading(GetPlayerPed(-1), 2.9283561706543)
    CreateBoard(GetPlayerPed(-1))
    AnimationIntro()
    SetEntityCoords(GetPlayerPed(-1), 408.8, -998.64, -99.0-0.98, 0.0, 0.0, 0.0, 10)
    SetEntityHeading(GetPlayerPed(-1), 268.72219848633)
    --CreateBoard(GetPlayerPed(-1))
    --startAnims("mp_character_creation@customise@male_a", "drop_outro")
    Citizen.Wait(700)
    PrepareMusicEvent("FM_INTRO_DRIVE_START")
    TriggerMusicEvent("FM_INTRO_DRIVE_START")
    CreateMenu(creator)
    FreezeEntityPosition(GetPlayerPed(-1), true)
    incamera = true
    ClearPedTasks(GetPlayerPed(-1))
    DeleteObject(board)
    DeleteObject(overlay)
end)





RegisterNetEvent('instance:onCreate')
AddEventHandler('instance:onCreate', function(instance)
	if instance.type == 'skin' then
		TriggerEvent('instance:enter', instance)
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if isCameraActive then
            if IsControlJustPressed(1, 107) then 
                SetEntityHeading(PlayerPedId(), 0.50)
            elseif IsControlJustPressed(1, 108) then 
                SetEntityHeading(PlayerPedId(), 193.26)
            elseif IsControlJustPressed(1, 112) then 
                SetEntityHeading(PlayerPedId(), 268.72219848633)
            elseif IsControlJustPressed(1, 111) then 
                SetEntityHeading(PlayerPedId(), 91.04)
            end
        end
    end
end)

function changeModel(skin)
	local model = GetHashKey(skin)
    if IsModelInCdimage(model) and IsModelValid(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), model)
        SetPedDefaultComponentVariation(PlayerPedId())

        if skin == 'mp_m_freemode_01' then
            SetPedComponentVariation(GetPlayerPed(-1), 3, 15, 0, 2) -- arms
            SetPedComponentVariation(GetPlayerPed(-1), 11, 15, 0, 2) -- torso
            SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2) -- tshirt
            SetPedComponentVariation(GetPlayerPed(-1), 4, 61, 4, 2) -- pants
            SetPedComponentVariation(GetPlayerPed(-1), 6, 34, 0, 2) -- shoes


        elseif skin == 'mp_f_freemode_01' then
            SetPedComponentVariation(GetPlayerPed(-1), 3, 15, 0, 2) -- arms
            SetPedComponentVariation(GetPlayerPed(-1), 11, 5, 0, 2) -- torso
            SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2) -- tshirt
            SetPedComponentVariation(GetPlayerPed(-1), 4, 57, 0, 2) -- pants
            SetPedComponentVariation(GetPlayerPed(-1), 6, 35, 0, 2) -- shoes

        end


        SetModelAsNoLongerNeeded(model)
    end
end


function round(exact, quantum)
    local quant,frac = math.modf(exact/quantum)
    return quantum * (quant + (frac > 0.5 and 1 or 0))
end
