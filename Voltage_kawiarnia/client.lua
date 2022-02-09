-----------------------------------------
---      Kawiarnia by Wiertarkov       --
-----------------------------------------

ESX                             = nil
local Etap						= nil
local PlayerData                = {}
local JobBlips                  = {}
local dysmenu					= false
local ziarnopaka                = false
local przepalonepaka 			= false
local napisziarno               = false
local napispalenie				= false
local napismagazyn				= false
local napisciasto           	= false
local napispieczenie			= false
local napiswyplata              = false
local bossmenu                  = false
local vaultmenu                 = false
local wyplata23                 = false
local CzyJest                   = false
local ubranierobocze			= false
local autorobocze 				= false
local pieczeniepaka				= false
local magazynpaka 				= false
local wypmenu					= false
local sklmenu					= false
local getzlecenie				= false
local grdmenu					= false
local plate						= nil
local getauto					= false

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShtestaredObjtestect', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	blips()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	deleteBlips()
	blips()
end)

function deleteBlips()
	if JobBlips[1] ~= nil then
		for i=1, #JobBlips, 1 do
		RemoveBlip(JobBlips[i])
		JobBlips[i] = nil
		end
	end
end

CreateThread(function()		
	local blip = AddBlipForCoord(-627.65, 239.08, 80.94)
	SetBlipSprite (blip, 105)
	SetBlipDisplay(blip, 4)
	--SetBlipColour (blip, 31)
	SetBlipScale (blip, 1.25)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Kawiarnia")
	EndTextCommandSetBlipName(blip)
end)

function blips()		
    if PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' then
		for k,v in pairs(Config.szatnia)do
			if v.Type == 365 then
				local blip2 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

				SetBlipSprite (blip2, 366)
				SetBlipDisplay(blip2, 4)
				SetBlipScale  (blip2, 0.8)
				SetBlipColour (blip2, 1)
				SetBlipAsShortRange(blip2, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.Name)
				EndTextCommandSetBlipName(blip2)
				table.insert(JobBlips, blip2)
			end
		end
		
		for k,v in pairs(Config.wyplata)do
			if v.Type == 365 then
				local blip2 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

				SetBlipSprite (blip2, 500)
				SetBlipDisplay(blip2, 4)
				SetBlipScale  (blip2, 0.8)
				SetBlipColour (blip2, 25)
				SetBlipAsShortRange(blip2, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(v.Name)
				EndTextCommandSetBlipName(blip2)
				table.insert(JobBlips, blip2)
			end
		end

		if Etap == 1 then
			for k,v in pairs(Config.ziarna)do
				if v.Type == 402 then
					local blip3 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

					SetBlipSprite (blip3, 501)
					SetBlipDisplay(blip3, 4)
					SetBlipScale  (blip3, 0.8)
					SetBlipColour (blip3, 25)
					SetBlipAsShortRange(blip3, true)

					BeginTextCommandSetBlipName("STRING")
					AddTextComponentString(v.Name)
					EndTextCommandSetBlipName(blip3)
					table.insert(JobBlips, blip3)
				end
			end

			for k,v in pairs(Config.palenie)do
				if v.Type == 402 then
					local blip4 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

					SetBlipSprite (blip4, 501)
					SetBlipDisplay(blip4, 4)
					SetBlipScale  (blip4, 0.8)
					SetBlipColour (blip4, 51)
					SetBlipAsShortRange(blip4, true)

					BeginTextCommandSetBlipName("STRING")
					AddTextComponentString(v.Name)
					EndTextCommandSetBlipName(blip4)
					table.insert(JobBlips, blip4)
				end
			end
		end
		
		if Etap == 2 then
			for k,v in pairs(Config.magazyn)do
				if v.Type == 402 then
					local blip4 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

					SetBlipSprite (blip4, 85)
					SetBlipDisplay(blip4, 4)
					SetBlipScale  (blip4, 0.8)
					SetBlipColour (blip4, 60)
					SetBlipAsShortRange(blip4, true)

					BeginTextCommandSetBlipName("STRING")
					AddTextComponentString(v.Name)
					EndTextCommandSetBlipName(blip4)
					table.insert(JobBlips, blip4)
				end
			end
		end
		
		if Etap == 3 then
			for k,v in pairs(Config.ciasto)do
				if v.Type == 365 then
					local blip4 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

					SetBlipSprite (blip4, 478)
					SetBlipDisplay(blip4, 4)
					SetBlipScale  (blip4, 0.8)
					SetBlipColour (blip4, 7)
					SetBlipAsShortRange(blip4, true)

					BeginTextCommandSetBlipName("STRING")
					AddTextComponentString(v.Name)
					EndTextCommandSetBlipName(blip4)
					table.insert(JobBlips, blip4)
				end
			end
			
			for k,v in pairs(Config.pieczenie)do
				if v.Type == 365 then
					local blip4 = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)

					SetBlipSprite (blip4, 430)
					SetBlipDisplay(blip4, 4)
					SetBlipScale  (blip4, 0.8)
					SetBlipColour (blip4, 37)
					SetBlipAsShortRange(blip4, true)

					BeginTextCommandSetBlipName("STRING")
					AddTextComponentString(v.Name)
					EndTextCommandSetBlipName(blip4)
					table.insert(JobBlips, blip4)
				end
			end
		end
	end
end

function szatnia()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
		TriggerEvent('skinchanger:getSkin', function(skin)	
			if (skin.tshirt_1 == 15 and skin.torso_1 == 125 and skin.sex == 0) or (skin.tshirt_1 == 14 and skin.torso_1 == 3 and skin.sex == 1) then
				ubranierobocze = false
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)		
			else
				ubranierobocze = true
				if skin.sex == 0 then
					local clothesSkin = {
						['tshirt_1'] = 15, ['tshirt_2'] = 0,
						['torso_1'] = 125, ['torso_2'] = 0,
						['arms'] = 17, ['arms_2'] = 0,
						['pants_1'] = 33, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)	
				else
					local clothesSkin = {
						['tshirt_1'] = 14, ['tshirt_2'] = 0,
						['torso_1'] = 3, ['torso_2'] = 4,
						['arms'] = 18,
						['pants_1'] = 32, ['pants_2'] = 0,
						['shoes_1'] = 25, ['shoes_2'] = 0
					}
					TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)	
				end		
			end
		end)
	end)
end

function pobierzpojazdsluzbowy()
	if not getauto then 
		ESX.TriggerServerCallback('esx_kawiarnia:getitemy', function (pieniadze,ziarno, przepaloneziarno, babeczka, paczek, ciasto, sernik)
			if pieniadze >= 100 then
				local model = 'sprinterkawa' --sprinterkawa
				autopozycja1 = {x = -590.06, y = 201.43, z = 70.47}
				if ESX.Game.IsSpawnPointClear(autopozycja1, 6.0) then
					ESX.Game.SpawnVehicle(model, autopozycja1, 92.26, function(vehicle)
						TaskWarpPedIntoVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, -1),  vehicle,  -1)
						plate = 'COFFEE' .. math.random(1, 99)
						SetVehicleNumberPlateText(vehicle, plate)
						TriggerEvent('ls:dodajklucze', GetVehicleNumberPlateText(vehicle))
						TriggerServerEvent('kawiarnia_removeKasa', 100, PlayerData.protect)
						TriggerEvent("pNotify:SendNotification", {text = "Pojazd (Nr. rej. "..plate..") został pobrany!<br>Kaucja 100$ została pobrana!"})
						getauto = true
					end)
				else
					TriggerEvent("pNotify:SendNotification", {text = "Miejsce poboru zajęte!"})
				end		
			else
				local ilebrakujepobierz = math.floor(100 - pieniadze)
				TriggerEvent("pNotify:SendNotification", {text = "Masz niewystarczająco gotówki aby opłacić kaucję!<br>Brakuje ci "..ilebrakujepobierz.."$"})
			end
		end)
	else
		ESX.ShowNotification('Pobrałeś niedawno pojazd służbowy!')
	end
end

function zwrocpojazdsluzbowy(plate)
	vehiclerobocze = GetVehiclePedIsIn(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false)
	tablica = GetVehicleNumberPlateText(vehiclerobocze)
	if (IsVehicleModel(vehiclerobocze, GetHashKey('sprinterkawa'))) then
		ESX.Game.DeleteVehicle(vehiclerobocze)
		Wait(500)
		if plate == tablica then
			TriggerServerEvent('kawiarnia_addKasa', 100, PlayerData.protect)
			TriggerEvent("pNotify:SendNotification", {text = "Pojazd został zwrócony!<br>Kaucja 100$ została zwrócona!"})
		else
			TriggerEvent("pNotify:SendNotification", {text = "Pojazd został zwrócony!<br>Kaucja nie została zwrócona!"})
		end
	else
		TriggerEvent("pNotify:SendNotification", {text = "To nie jest pojazd służbowy!"})
	end
end

RegisterNetEvent('kawiarnia:freezePlayer')
AddEventHandler('kawiarnia:freezePlayer', function(freeze)
	FreezeEntityPosition(Citizen.InvokeNative(0x43A66C31C68491C0, -1), freeze)
end)

function animka2()
	local dict = "mini@repair"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(10)
	end
	TaskPlayAnim(Citizen.InvokeNative(0x43A66C31C68491C0, -1), dict, "fixing_a_ped", 8.0, 8.0, 10000, 1, 0, false, false, false)
end

function animka3()
	local dict = "anim@heists@ornate_bank@grab_cash_heels"
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(10)
	end
	TaskPlayAnim(Citizen.InvokeNative(0x43A66C31C68491C0, -1), dict, "grab", 8.0, 8.0, 10000, 1, 0, false, false, false)
end

function animka4()
	local dict = "amb@prop_human_bum_bin@idle_b"
		RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(10)
	end
	TaskPlayAnim(Citizen.InvokeNative(0x43A66C31C68491C0, -1), dict, "idle_d", 8.0, 8.0, 10000, 1, 0, false, false, false)
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(10)
	end
end

RegisterNetEvent('prop:pudelko1')
AddEventHandler('prop:pudelko1', function()
	local ad = "anim@heists@box_carry@"
	local anim = "idle"
	local player = PlayerPedId()

	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			usunproppudelek()
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			pudlo1 = Citizen.InvokeNative(0x509D5878EB39E842, GetHashKey("prop_coolbox_01"), 0, 0, 0, true, true, true)
			AttachEntityToEntity(pudlo1, Citizen.InvokeNative(0x43A66C31C68491C0, -1), GetPedBoneIndex(Citizen.InvokeNative(0x43A66C31C68491C0, -1), 28422), 0, -0.2, -0.2, 0, 0, 0, true, true, false, true, 1, true)
			Citizen.Wait(50)
			TaskPlayAnim( player, ad, anim, 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
		end
	end
end)

RegisterNetEvent('prop:pudelko2')
AddEventHandler('prop:pudelko2', function()
	local ad = "anim@heists@box_carry@"
	local anim = "idle"
	local player = PlayerPedId()

	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			usunproppudelek()
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			pudlo1 = Citizen.InvokeNative(0x509D5878EB39E842, GetHashKey("hei_prop_heist_box"), 0, 0, 0, true, true, true)
			AttachEntityToEntity(pudlo1, Citizen.InvokeNative(0x43A66C31C68491C0, -1), GetPedBoneIndex(Citizen.InvokeNative(0x43A66C31C68491C0, -1), 28422), 0, -0.2, -0.2, 0, 0, 0, true, true, false, true, 1, true)
			Citizen.Wait(50)
			TaskPlayAnim( player, ad, anim, 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
		end
	end
end)

function usunboxpudelek()
    DeleteEntity(pudlo1)
    DeleteEntity(pudlo2)
    ClearPedSecondaryTask(PlayerPedId())
    pudlo1 = nil
    pudlo2 = nil
end

function usunproppudelek()
    DeleteEntity(pudlo1)
    DeleteEntity(pudlo2)
end

RegisterNetEvent('kawiarnia:ziarno')
AddEventHandler('kawiarnia:ziarno', function()
	napisziarno = true
	TriggerEvent('kawiarnia:freezePlayer', true)					
	animka3()					
	Wait(10000)
	TriggerEvent('prop:pudelko2')
	ziarnopaka = true
	TriggerEvent('kawiarnia:freezePlayer', false)
	ESX.ShowNotification('Wrzuć pudełko na pake pojazdu służbowego')
	Wait(2500)
	napisziarno = false
end)

RegisterNetEvent('kawiarnia:przepaloneziarno')
AddEventHandler('kawiarnia:przepaloneziarno', function()
	napispalenie = true
	TriggerEvent('kawiarnia:freezePlayer', true)					
	animka4()					
	Wait(10000)
	TriggerEvent('prop:pudelko1')
	przepalonepaka = true
	TriggerEvent('kawiarnia:freezePlayer', false)
	ESX.ShowNotification('Wrzuć pudełko na pake pojazdu służbowego')
	Wait(2500)
	napispalenie = false
end)

RegisterNetEvent('kawiarnia:magazyn')
AddEventHandler('kawiarnia:magazyn', function()
	napismagazyn = true
	TriggerEvent('kawiarnia:freezePlayer', true)					
	animka4()					
	Wait(10000)
	TriggerEvent('prop:pudelko1')
	magazynpaka = true
	TriggerEvent('kawiarnia:freezePlayer', false)
	ESX.ShowNotification('Wrzuć pudełko na pake pojazdu służbowego')
	Wait(2500)
	napismagazyn = false
end)

RegisterNetEvent('kawiarnia:pieczenie')
AddEventHandler('kawiarnia:pieczenie', function()
	napispieczenie = true
	TriggerEvent('kawiarnia:freezePlayer', true)					
	animka2()					
	Wait(10000)
	TriggerEvent('prop:pudelko2')
	pieczeniepaka = true
	TriggerEvent('kawiarnia:freezePlayer', false)
	ESX.ShowNotification('Wrzuć pudełko na pake pojazdu służbowego')
	Wait(2500)
	napispieczenie = false
end)

RegisterNetEvent('kawiarnia:ciasto')
AddEventHandler('kawiarnia:ciasto', function()
	napisciasto = true
	TriggerEvent('kawiarnia:freezePlayer', true)
	animka4()					
	Wait(10000)
	TriggerEvent('kawiarnia:freezePlayer', false)
	Wait(2500)
	napisciasto = false
end)

function procent(time)
	TriggerEvent('kawiarnia:procenty')
	TimeLeft = 0
	repeat
	TimeLeft = TimeLeft + 1
	Citizen.Wait(time)
	until(TimeLeft == 100)
	CzyJest = false
end

RegisterNetEvent('kawiarnia:procenty')
AddEventHandler('kawiarnia:procenty', function()
	CzyJest = true
	while (CzyJest) do
		Citizen.Wait(10)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		DrawText3D(coords.x, coords.y, coords.z, '~b~'.. TimeLeft .. '%', 0.4)
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(7)
		local autorobocze1 = GetVehiclePedIsIn(Citizen.InvokeNative(0x43A66C31C68491C0, -1), true)
		tablica = GetVehicleNumberPlateText(autorobocze1)
		if IsPedInAnyVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false) then
			if plate == tablica then
				autorobocze = true
			else
				autorobocze = false
			end
		else
			Citizen.Wait(2500)
		end
	end
end)

CreateThread(function()
	local timer = GetGameTimer()
	while true do
		Citizen.Wait(7)
			
			local coords = GetEntityCoords(Citizen.InvokeNative(0x43A66C31C68491C0, -1))
			
			if not IsPedInAnyVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false) then
				if #(coords - vec3(-633.57, 235.27, 80.95)) <= 10.0 then
					DrawMarker(1, -633.57, 235.27, 81.95 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
					if #(coords - vec3(-633.57, 235.27, 80.95)) <= 1.5 then
						ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~otworzyć ~s~menu kawiarnii')
						ESX.ShowFloatingHelpNotification('~b~ SKLEP', vec3(-633.57, 235.27, 81.95))
						if IsControlJustReleased(0, 38) and timer < GetGameTimer() then	
							procent(1)
							sklmenu = true
							sklep()
						
							timer = GetGameTimer() + 500
						end
					end
				end
			end
			
			if #(coords - vec3(-633.57, 235.27, 80.95)) >= 2.0 then
				if sklmenu == true then
					ESX.UI.Menu.CloseAll()
					sklmenu = false
				end
			end

			if PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' then		
				
				work_truck = GetVehiclePedIsIn(Citizen.InvokeNative(0x43A66C31C68491C0, -1), true)
				local trunk = GetEntityCoords(work_truck, false)
				plyCoords = GetEntityCoords(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false)
				if ziarnopaka == true or przepalonepaka == true or pieczeniepaka == true or magazynpaka == true then
					dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, trunk.x , trunk.y, trunk.z)
					if dist <= 2.0 then
						ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~wrzucić ~s~ pudełko do pojazdu')
						ESX.ShowFloatingHelpNotification('~b~ WRZUĆ PUDEŁKO', vec3(trunk.x , trunk.y, trunk.z))
						DrawMarker(1, trunk.x, trunk.y, trunk.z - 0.5, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
						if IsControlJustReleased(0, 38) then
							usunboxpudelek()
							ziarnopaka = false
							przepalonepaka = false
							magazynpaka = false
							pieczeniepaka = false
						end
						timer = GetGameTimer() + 500
					end
				end		
				
				if #(coords - vec3(-612.84, 208.94, 73.23)) >= 2.0 then
					if dysmenu == true then
						ESX.UI.Menu.CloseAll()
						dysmenu = false
					end
				end

				if IsPedInAnyVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false) then
					
					if #(coords - vec3(-590.06, 201.43, 70.58)) <= 10.0 then
						DrawMarker(27, -590.06, 201.43, 71.58 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.5, 3.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
						if #(coords - vec3(-590.06, 201.43, 70.58)) <= 2.0 then
						ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~schować ~s~pojazd')
						ESX.ShowFloatingHelpNotification('~b~ ZWROT POJAZDU', vec3(-590.06, 201.43, 71.58))
							if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
								zwrocpojazdsluzbowy(plate)
									
								timer = GetGameTimer() + 500
							end
						end
					end
				end
				
				if not IsPedInAnyVehicle(Citizen.InvokeNative(0x43A66C31C68491C0, -1), false) then
				
					if Etap == 1 then
					
						if #(coords - vec3(-95.92, 1911.62, 195.86)) <= 10.0 and napisziarno == false and ubranierobocze == true then
							DrawMarker(1, -95.92, 1911.62, 196.86 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(-95.92, 1911.62, 195.86)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zbierać ~s~ziarna kawy')
								ESX.ShowFloatingHelpNotification('~b~ ZBIERANIE ZIAREN KAWY', vec3(-95.92, 1911.62, 196.86))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startziarna()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
										
									timer = GetGameTimer() + 500
								end
							end
						end
						
						if #(coords - vec3(-96.00, 1908.41, 196.15)) <= 10.0 and napisziarno == false and ubranierobocze == true then
							DrawMarker(1, -96.00, 1908.41, 197.15 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(-96.00, 1908.41, 196.15)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zbierać ~s~ziarna kawy')
								ESX.ShowFloatingHelpNotification('~b~ ZBIERANIE ZIAREN KAWY', vec3(-96.00, 1908.41, 197.15))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startziarna()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
										
									timer = GetGameTimer() + 500
								end
							end
						end
						
						if #(coords - vec3(839.46, 2176.68, 51.33)) <= 10.0 and napispalenie == false and ubranierobocze == true then
							DrawMarker(1, 839.46, 2176.68, 52.33 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(839.46, 2176.68, 51.33)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~przepalić ~s~ziarna kawy')
								ESX.ShowFloatingHelpNotification('~b~ PALENIE ZIAREN KAWY', vec3(839.46, 2176.68, 52.33))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startpalenie()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
										
									timer = GetGameTimer() + 500
								end
							end
						end
						
					elseif Etap == 2 then
					
						if #(coords - vec3(-84.36, 6497.88, 30.54)) <= 10.0 and napismagazyn == false and ubranierobocze == true then
							DrawMarker(1, -84.36, 6497.88, 31.54 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(-84.36, 6497.88, 30.54)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~odebrać ~s~paczkę z wyrobami cukierniczymi')
								ESX.ShowFloatingHelpNotification('~b~ OBIÓR PACZKI', vec3(-84.36, 6497.88, 31.54))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startmagazyn()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
										
									timer = GetGameTimer() + 500
								end
							end
						end
				
					elseif Etap == 3 then
					
						if #(coords - vec3(1707.42, 4730.66, 41.21)) <= 10.0 and napisciasto == false and ubranierobocze == true then
							DrawMarker(1, 1707.42, 4730.66, 42.21 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(1707.42, 4730.66, 41.21)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~wyrobić ~s~ciasto na sernik')
								ESX.ShowFloatingHelpNotification('~b~ WYRABIANIE CIASTA', vec3(1707.42, 4730.66, 42.21))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startciasto()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
									
									timer = GetGameTimer() + 500
								end
							end
						end
						
						if #(coords - vec3(2889.99, 4391.57, 49.38)) <= 10.0 and napispieczenie == false and ubranierobocze == true then
							DrawMarker(1, 2889.99, 4391.57, 50.38 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(2889.99, 4391.57, 49.38)) <= 1.5 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~upiec ~s~sernik')
								ESX.ShowFloatingHelpNotification('~b~ PIECZENIE SERNIKA', vec3(2889.99, 4391.57, 50.38))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									if autorobocze == true then
										startpieczenie()
									else
										ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
									end
									
									timer = GetGameTimer() + 500
								end
							end
						end
					end
					
					if #(coords - vec3(-620.07, 208.97, 73.25)) <= 10.0 and napiswyplata == false and ubranierobocze == true then				
						DrawMarker(1, -620.07, 208.97, 74.25 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
						if #(coords - vec3(-620.07, 208.97, 73.25)) <= 1.5 then
							ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~odebrać ~s~wypłatę')
							ESX.ShowFloatingHelpNotification('~b~ ODBIÓR WYPŁATY', vec3(-620.07, 208.97, 74.25))
							if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
								if autorobocze == true then
									wyplata()
								else
									ESX.ShowNotification('Nie przyjechałeś tutaj pojazdem firmowym!')
								end
									
								timer = GetGameTimer() + 500
							end
						end
					end
				
					if #(coords - vec3(-634.71, 209.22, 73.30)) <= 10.0 then
						DrawMarker(1, -634.71, 209.22, 74.30 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
						if #(coords - vec3(-634.71, 209.22, 73.30)) <= 2.0 then
							ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zmienić ~s~strój')
							ESX.ShowFloatingHelpNotification('~b~ SZATNIA', vec3(-634.71, 209.22, 74.30))
							if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
								procent(1)
								szatnia()

								timer = GetGameTimer() + 500
							end
						end
					end
					
					if #(coords - vec3(-612.84, 208.94, 73.23)) <= 10.0 then
						DrawMarker(1, -612.84, 208.94, 74.23 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
						if #(coords - vec3(-612.84, 208.94, 73.23)) <= 1.5 then
							ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~połączyć się ~s~z dyspozytornią')
							ESX.ShowFloatingHelpNotification('~b~ DYSPOZYTORNIA', vec3(-612.84, 208.94, 74.23))
							if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
								if ubranierobocze == true then
									procent(1)
									dyspozytornia()
								else
									ESX.ShowNotification('Przebierz się w strój roboczy!')
								end
							end
						end
					end
					
					if PlayerData.job.grade >= 3 then
						if #(coords - vec3(-634.56, 225.57, 80.93)) <= 10.0 then
							DrawMarker(1, -634.56, 225.57, 81.93 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(-634.56, 225.57, 80.93)) <= 2.0 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~przebrać ~s~się')
								ESX.ShowFloatingHelpNotification('~b~ GARDEROBA', vec3(-634.56, 225.57, 81.93))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									grdmenu = true
									OpenChangingRoomMenu()
									
									timer = GetGameTimer() + 500
								end
							end
						end
					end
					
					if PlayerData.job.grade_label == 'Wlasciciel' then
						if #(coords - vec3(-634.41, 228.11, 80.93)) <= 10.0 then
							DrawMarker(1, -634.41, 228.11, 81.93 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(-634.41, 228.11, 80.93)) <= 2.0 then
								ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~zarządzać ~s~firmą')
								ESX.ShowFloatingHelpNotification('~b~ BIURO', vec3(-634.41, 228.11, 81.93))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									bossmenu = true
									bossmenuu()
									
									timer = GetGameTimer() + 500
								end
							end
						end
					end

					if (PlayerData.job.grade_label == 'Kelner' or PlayerData.job.grade_label == 'Kierownik' or PlayerData.job.grade_label == 'Wlasciciel') then
						if #(coords - vec3(-631.94, 228.05, 80.93)) <= 10.0 then
							DrawMarker(1, -631.94, 228.05, 81.93 - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 158, 189, 100, false, true, 2, false, false, false, false)
							if #(coords - vec3(-631.94, 228.05, 80.93)) <= 2.0 then
							ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby ~y~otworzyć ~s~schowek')
							ESX.ShowFloatingHelpNotification('~b~ SCHOWEK', vec3(-631.94, 228.05, 81.93))
								if IsControlJustReleased(0, 38) and timer < GetGameTimer() then
									vaultmenu = true
									OpenVaultMenu()
									
									timer = GetGameTimer() + 500
								end	
							end
						end
					end
					
					if #(coords - vec3(-634.41, 228.11, 80.93)) >= 2.0 then
						if bossmenu == true then
							ESX.UI.Menu.CloseAll()
							bossmenu = false
						end
					end
					
					if #(coords - vec3(-634.56, 225.57, 80.93)) >= 2.0 then
						if grdmenu == true then
							ESX.UI.Menu.CloseAll()
							grdmenu = false
						end
					end
					
					if #(coords - vec3(-631.94, 228.05, 80.93)) >= 2.0 then
						if vaultmenu == true then
							ESX.UI.Menu.CloseAll()
							vaultmenu = false
						end
					end
					
					if #(coords - vec3(-620.07, 208.97, 73.25)) >= 2.0 then
						if wypmenu == true then
							ESX.UI.Menu.CloseAll()
							wypmenu = false
						end
					end
				end
			end
	end
end)

CreateThread(function()
	local timer = GetGameTimer()
	while true do
		Citizen.Wait(10000)
			if getzlecenie then
				Wait(60 * 1000 * 15)
				getzlecenie = false
			end
	end
end)

CreateThread(function()
	local timer = GetGameTimer()
	while true do
		Citizen.Wait(10000)
			if getauto then
				Wait(60 * 1000 * 15)
				getauto = false
			end
	end
end)

function bossmenuu()

	local elements = {
		{label = 'Lista pracowników', value = 'lista'},
		{label = 'Zarządzanie firmą', value = 'manage'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tako', {
		title    = 'Biuro Kawiarnii',
		align    = 'center',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'lista' then
			ESX.TriggerServerCallback('esx_kawiarnia:getEmployees', function(employees)
			local elements2 = {
				head = {'Pracownik', 'Stopień', 'Ilość kursów'},
				rows = {}
			}
				
				for i=1, #employees, 1 do
					local gradeLabel = (employees[i].job.grade_label == '' and employees[i].job.label or employees[i].job.grade_label)

					table.insert(elements2.rows, {
						data = employees[i],
						cols = {
							employees[i].name,
							gradeLabel,
							employees[i].kawa
						}
					})
				end
				
		ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'employee_list_', elements2, function(data, menu)
			local employee = data.data
		end, function(data, menu)
			menu.close()
		end)

			end)
		elseif data.current.value == 'manage' then	
			local opcje = {
				wash = false,
			}
			TriggerEvent('esx_society:openBostestsMenu', 'kawiarnia', function(data, menu)
				menu.close()								
			end, opcje)
		end

	end, function(data, menu)
		menu.close()
	end)
end 

function zlecenie()
	if not getzlecenie then 
		TriggerEvent("pNotify:SendNotification", {text = "Nowe zlecenie dostępne za 15 minut!"})
		if PlayerData.job.grade_label == 'Stazysta' then
			losowanko = math.random(1,2)
			getzlecenie = true
			if losowanko == 1 then
				Etap = 1
				deleteBlips()
				blips()
				ESX.ShowAdvancedNotification('Centrala Kawiarnii', '', 'Twoje zadanie na dziś: ~b~Zbieranie i przepalanie ziaren kawy', 'CHAR_MP_ARMY_CONTACT', 8)
			elseif losowanko == 2 then
				Etap = 2
				deleteBlips()
				blips()
				ESX.ShowAdvancedNotification('Centrala Kawiarnii', '', 'Twoje zadanie na dziś: ~b~Dostawa wyrobów cukierniczych z hurtownii', 'CHAR_MP_ARMY_CONTACT', 8)
			end
		elseif PlayerData.job.grade_label == 'Pracownik' then
			losowanko = math.random(1,3)
			getzlecenie = true
			if losowanko == 1 then
				Etap = 1
				deleteBlips()
				blips()
				ESX.ShowAdvancedNotification('Centrala Kawiarnii', '', 'Twoje zadanie na dziś: ~b~Zbieranie i przepalanie ziaren kawy', 'CHAR_MP_ARMY_CONTACT', 8)
			elseif losowanko == 2 then
				Etap = 2
				deleteBlips()
				blips()
				ESX.ShowAdvancedNotification('Centrala Kawiarnii', '', 'Twoje zadanie na dziś: ~b~Dostawa wyrobów cukierniczych z hurtownii', 'CHAR_MP_ARMY_CONTACT', 8)
			elseif losowanko == 3 then
				Etap = 3
				deleteBlips()
				blips()
				ESX.ShowAdvancedNotification('Centrala Kawiarnii', '', 'Twoje zadanie na dziś: ~b~Pieczenie sernika', 'CHAR_MP_ARMY_CONTACT', 8)
			end
		elseif PlayerData.job.grade_label == 'St. Pracownik' then
			losowanko = math.random(2,3)
			getzlecenie = true
			if losowanko == 2 then
				Etap = 2
				deleteBlips()
				blips()
				ESX.ShowAdvancedNotification('Centrala Kawiarnii', '', 'Twoje zadanie na dziś: ~b~Dostawa wyrobów cukierniczych z hurtownii', 'CHAR_MP_ARMY_CONTACT', 8)
			elseif losowanko == 3 then
				Etap = 3
				deleteBlips()
				blips()
				ESX.ShowAdvancedNotification('Centrala Kawiarnii', '', 'Twoje zadanie na dziś: ~b~Pieczenie sernika', 'CHAR_MP_ARMY_CONTACT', 8)
			end
		elseif PlayerData.job.grade_label == 'Kelner' then
			losowanko = math.random(2,3)
			getzlecenie = true
			if losowanko == 2 then
				Etap = 2
				deleteBlips()
				blips()
				ESX.ShowAdvancedNotification('Centrala Kawiarnii', '', 'Twoje zadanie na dziś: ~b~Dostawa wyrobów cukierniczych z hurtownii', 'CHAR_MP_ARMY_CONTACT', 8)
			elseif losowanko == 3 then
				Etap = 3
				deleteBlips()
				blips()
				ESX.ShowAdvancedNotification('Centrala Kawiarnii', '', 'Twoje zadanie na dziś: ~b~Pieczenie sernika', 'CHAR_MP_ARMY_CONTACT', 8)
			end
		elseif PlayerData.job.grade >= 4 then
			getzlecenie = true
			Etap = 3
			deleteBlips()
			blips()
			ESX.ShowAdvancedNotification('Centrala Kawiarnii', '', 'Twoje zadanie na dziś: ~b~Pieczenie sernika', 'CHAR_MP_ARMY_CONTACT', 8)
		end
	else
		ESX.ShowAdvancedNotification('Centrala Kawiarnii', '', '~r~Już otrzymałeś zadanie na dziś!', 'CHAR_MP_ARMY_CONTACT', 8)
	end
end

function startziarna()
	ESX.TriggerServerCallback('esx_kawiarnia:getitemy', function (pieniadze, ziarno, przepaloneziarno, babeczka, paczek, ciasto, sernik)
		if ziarnopaka == false then
			ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
				if can then
					TriggerEvent('kawiarnia:ziarno')
					procent(100)
					TriggerServerEvent('kawiarnia_addItem', 'ziarnokawy', 10, PlayerData.protect)
				else
					ESX.ShowNotification('Nie możesz więcej unieść')
				end
			end, 'ziarnokawy', 10)
		else
			ESX.ShowNotification('Najpierw odłóż to pudełko z ziarnami!')
		end
	end)
end

function startpalenie()
	ESX.TriggerServerCallback('esx_kawiarnia:getitemy', function (pieniadze,ziarno, przepaloneziarno, babeczka, paczek, ciasto, sernik)
		if przepalonepaka == false then
			ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
				if can then
					if ziarno >= 10 then
						TriggerEvent('kawiarnia:przepaloneziarno')
						procent(100)
						TriggerServerEvent('kawiarnia_removeItem', 'ziarnokawy', 10, PlayerData.protect)
						TriggerServerEvent('kawiarnia_addItem', 'przepaloneziarno', 10, PlayerData.protect)
					else
						ESX.ShowNotification('Masz niewystarczająco ziaren kawy!')
					end
				else
					ESX.ShowNotification('Nie możesz więcej unieść')
				end
			end, 'przepaloneziarno', 10)
		else
			ESX.ShowNotification('Najpierw odłóż to pudełko z przepalonymi ziarnami!')
		end
	end)
end

function startmagazyn()
	ESX.TriggerServerCallback('esx_kawiarnia:getitemy', function (pieniadze,ziarno, przepaloneziarno, babeczka, paczek, ciasto, sernik)
		if magazynpaka == false then
			losowanko = math.random(1,2)
			if losowanko == 1 then
				ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
					if can then
						TriggerEvent('kawiarnia:magazyn')
						procent(100)
						TriggerServerEvent('kawiarnia_addItem', 'kbabeczka', 10, PlayerData.protect)
					else
						ESX.ShowNotification('Nie możesz więcej unieść')
					end
				end, 'kbabeczka', 10)
			else
				ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
					if can then
						TriggerEvent('kawiarnia:magazyn')
						procent(100)
						TriggerServerEvent('kawiarnia_addItem', 'kpaczek', 10, PlayerData.protect)
					else
						ESX.ShowNotification('Nie możesz więcej unieść')
					end
				end, 'kpaczek', 10)
			end
		else
			ESX.ShowNotification('Najpierw odłóż to pudełko z wyrobami cukierniczymi!')
		end
	end)
end

function startciasto()
	ESX.TriggerServerCallback('esx_kawiarnia:getitemy', function (pieniadze,ziarno, przepaloneziarno, babeczka, paczek, ciasto, sernik)	
		ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
			if can then
				TriggerEvent('kawiarnia:ciasto')
				procent(100)			
				TriggerServerEvent('kawiarnia_addItem', 'kciasto', 10, PlayerData.protect)
			else
				ESX.ShowNotification('Nie możesz więcej unieść')
			end
		end, 'kciasto', 10)
	end)
end

function startpieczenie()
	ESX.TriggerServerCallback('esx_kawiarnia:getitemy', function (pieniadze,ziarno, przepaloneziarno, babeczka, paczek, ciasto, sernik)
		if pieczeniepaka == false then
			if ciasto >= 10 then
				ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
					if can then
						TriggerEvent('kawiarnia:pieczenie')
						procent(100)
						TriggerServerEvent('kawiarnia_removeItem', 'kciasto', 10, PlayerData.protect)
						TriggerServerEvent('kawiarnia_addItem', 'ksernik', 5, PlayerData.protect)
					else
						ESX.ShowNotification('Nie możesz więcej unieść')
					end
				end, 'ksernik', 5)
			else
				ESX.ShowNotification('Masz niewystarczająco ciasta!')
			end
		else
			ESX.ShowNotification('Najpierw odłóż to pudełko z wyrobami cukierniczymi!')
		end
	end)
end

function sklep()
	
	sklmenu = true

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'sklepmenu',
		{
			title    = "KAWIARNIA SKLEP",
			align    = 'bottom-right',
			elements = (PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' and (PlayerData.job.grade_label == 'Kelner' or PlayerData.job.grade_label == 'Kierownik' or PlayerData.job.grade_label == 'Wlasciciel') and {
				{label = "Kawa <span style='color: green;'>(25$)", value = 'kawa'},
				{label = "Capuccino <span style='color: green;'>(50$)", value = 'kapuczino'},
				{label = "Podwójne espresso <span style='color: green;'>(100$)", value = 'espreso'},
				{label = "Pączek <span style='color: green;'>(10$)", value = 'paczek'},
				{label = "Babeczka <span style='color: green;'>(10$)", value = 'babeczka'},
				{label = "Sernik <span style='color: green;'>(10$)", value = 'sernik'},
				{label = "Brownie <span style='color: green;'>(12$)", value = 'brownie'},
				{label = "Szarlotka <span style='color: green;'>(8$)", value = 'szarlotka'},
				{label = "Czekolada do picia <span style='color: green;'>(15$)", value = 'czekolada'},
				{label = "Herbata <span style='color: green;'>(10$)", value = 'herbata'},
				{label = "Croisant <span style='color: green;'>(5$)", value = 'croisant'},
				{label = "Rogalik <span style='color: green;'>(5$)", value = 'rogalik'},
				{label = "Kawa mrożona <span style='color: green;'>(30$)", value = 'mrozona'},
			} or {
				{label = "Kawa <span style='color: green;'>(50$)", value = 'kawa'},
				{label = "Capuccino <span style='color: green;'>(100$)", value = 'kapuczino'},
				{label = "Podwójne espresso <span style='color: green;'>(200$)", value = 'espreso'},
				{label = "Pączek <span style='color: green;'>(20$)", value = 'paczek'},
				{label = "Babeczka <span style='color: green;'>(20$)", value = 'babeczka'},
				{label = "Sernik <span style='color: green;'>(20$)", value = 'sernik'},
				{label = "Brownie <span style='color: green;'>(25$)", value = 'brownie'},
				{label = "Szarlotka <span style='color: green;'>(16$)", value = 'szarlotka'},
				{label = "Czekolada do picia <span style='color: green;'>(30$)", value = 'czekolada'},
				{label = "Herbata <span style='color: green;'>(20$)", value = 'herbata'},
				{label = "Croisant <span style='color: green;'>(10$)", value = 'croisant'},
				{label = "Rogalik <span style='color: green;'>(10$)", value = 'rogalik'},
				{label = "Kawa mrożona <span style='color: green;'>(60$)", value = 'mrozona'},
			})
		},
		function(data, menu)

			if data.current.value == 'kawa' then
				ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
					if can then
						if PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' and (PlayerData.job.grade_label == 'Kelner' or PlayerData.job.grade_label == 'Kierownik' or PlayerData.job.grade_label == 'Wlasciciel') then
							TriggerServerEvent('esx_kawiarnia:sklep', 'kawa', 25)
						else
							TriggerServerEvent('esx_kawiarnia:sklep', 'kawa', 50)
						end
					else
						ESX.ShowNotification('Nie możesz więcej unieść')
					end
				end, 'kkawa', 1)
			end

			if data.current.value == 'kapuczino' then
				ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
					if can then
						if PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' and (PlayerData.job.grade_label == 'Kelner' or PlayerData.job.grade_label == 'Kierownik' or PlayerData.job.grade_label == 'Wlasciciel') then
							TriggerServerEvent('esx_kawiarnia:sklep', 'kapuczino', 50)
						else
							TriggerServerEvent('esx_kawiarnia:sklep', 'kapuczino', 100)
						end
					else
						ESX.ShowNotification('Nie możesz więcej unieść')
					end
				end, 'kkapuczino', 1)
			end
			
			if data.current.value == 'espreso' then
				ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
					if can then
						if PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' and (PlayerData.job.grade_label == 'Kelner' or PlayerData.job.grade_label == 'Kierownik' or PlayerData.job.grade_label == 'Wlasciciel') then
							TriggerServerEvent('esx_kawiarnia:sklep', 'espreso', 200)
						else
							TriggerServerEvent('esx_kawiarnia:sklep', 'espreso', 100)
						end
					else
						ESX.ShowNotification('Nie możesz więcej unieść')
					end
				end, 'kespreso', 1)
			end
			
			if data.current.value == 'paczek' then
				ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
					if can then
						if PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' and (PlayerData.job.grade_label == 'Kelner' or PlayerData.job.grade_label == 'Kierownik' or PlayerData.job.grade_label == 'Wlasciciel') then
							TriggerServerEvent('esx_kawiarnia:sklep', 'paczek', 10)
						else
							TriggerServerEvent('esx_kawiarnia:sklep', 'paczek', 20)
						end
					else
						ESX.ShowNotification('Nie możesz więcej unieść')
					end
				end, 'kpaczek1', 1)
			end
			
			if data.current.value == 'babeczka' then
				ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
					if can then
						if PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' and (PlayerData.job.grade_label == 'Kelner' or PlayerData.job.grade_label == 'Kierownik' or PlayerData.job.grade_label == 'Wlasciciel') then
							TriggerServerEvent('esx_kawiarnia:sklep', 'babeczka', 10)
						else
							TriggerServerEvent('esx_kawiarnia:sklep', 'babeczka', 20)
						end
					else
						ESX.ShowNotification('Nie możesz więcej unieść')
					end
				end, 'kbabeczka1', 1)
			end
			
			if data.current.value == 'sernik' then
				ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
					if can then
						if PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' and (PlayerData.job.grade_label == 'Kelner' or PlayerData.job.grade_label == 'Kierownik' or PlayerData.job.grade_label == 'Wlasciciel') then
							TriggerServerEvent('esx_kawiarnia:sklep', 'sernik', 10)
						else
							TriggerServerEvent('esx_kawiarnia:sklep', 'sernik', 20)
						end
					else
						ESX.ShowNotification('Nie możesz więcej unieść')
					end
				end, 'ksernik1', 1)
			end
			
			if data.current.value == 'brownie' then
				ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
					if can then
						if PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' and (PlayerData.job.grade_label == 'Kelner' or PlayerData.job.grade_label == 'Kierownik' or PlayerData.job.grade_label == 'Wlasciciel') then
							TriggerServerEvent('esx_kawiarnia:sklep', 'brownie', 12)
						else
							TriggerServerEvent('esx_kawiarnia:sklep', 'brownie', 25)
						end
					else
						ESX.ShowNotification('Nie możesz więcej unieść')
					end
				end, 'kbrownie', 1)
			end
			
			if data.current.value == 'szarlotka' then
				ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
					if can then
						if PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' and (PlayerData.job.grade_label == 'Kelner' or PlayerData.job.grade_label == 'Kierownik' or PlayerData.job.grade_label == 'Wlasciciel') then
							TriggerServerEvent('esx_kawiarnia:sklep', 'szarlotka', 8)
						else
							TriggerServerEvent('esx_kawiarnia:sklep', 'szarlotka', 16)
						end
					else
						ESX.ShowNotification('Nie możesz więcej unieść')
					end
				end, 'kszarlotka', 1)
			end
			
			if data.current.value == 'czekolada' then
				ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
					if can then
						if PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' and (PlayerData.job.grade_label == 'Kelner' or PlayerData.job.grade_label == 'Kierownik' or PlayerData.job.grade_label == 'Wlasciciel') then
							TriggerServerEvent('esx_kawiarnia:sklep', 'czekolada', 15)
						else
							TriggerServerEvent('esx_kawiarnia:sklep', 'czekolada', 30)
						end
					else
						ESX.ShowNotification('Nie możesz więcej unieść')
					end
				end, 'kczekolada', 1)
			end
			
			if data.current.value == 'herbata' then
				ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
					if can then
						if PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' and (PlayerData.job.grade_label == 'Kelner' or PlayerData.job.grade_label == 'Kierownik' or PlayerData.job.grade_label == 'Wlasciciel') then
							TriggerServerEvent('esx_kawiarnia:sklep', 'herbata', 10)
						else
							TriggerServerEvent('esx_kawiarnia:sklep', 'herbata', 20)
						end
					else
						ESX.ShowNotification('Nie możesz więcej unieść')
					end
				end, 'kherbata', 1)
			end
			
			if data.current.value == 'croisant' then
				ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
					if can then
						if PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' and (PlayerData.job.grade_label == 'Kelner' or PlayerData.job.grade_label == 'Kierownik' or PlayerData.job.grade_label == 'Wlasciciel') then
							TriggerServerEvent('esx_kawiarnia:sklep', 'croisant', 5)
						else
							TriggerServerEvent('esx_kawiarnia:sklep', 'croisant', 10)
						end
					else
						ESX.ShowNotification('Nie możesz więcej unieść')
					end
				end, 'kcroisant', 1)
			end
			
			if data.current.value == 'rogalik' then
				ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
					if can then
						if PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' and (PlayerData.job.grade_label == 'Kelner' or PlayerData.job.grade_label == 'Kierownik' or PlayerData.job.grade_label == 'Wlasciciel') then
							TriggerServerEvent('esx_kawiarnia:sklep', 'rogalik', 5)
						else
							TriggerServerEvent('esx_kawiarnia:sklep', 'rogalik', 10)
						end
					else
						ESX.ShowNotification('Nie możesz więcej unieść')
					end
				end, 'krogalik', 1)
			end
			
			if data.current.value == 'mrozona' then
				ESX.TriggerServerCallback('esx_mrp:canCarryItem', function(can)
					if can then
						if PlayerData.job ~= nil and PlayerData.job.name == 'kawiarnia' and (PlayerData.job.grade_label == 'Kelner' or PlayerData.job.grade_label == 'Kierownik' or PlayerData.job.grade_label == 'Wlasciciel') then
							TriggerServerEvent('esx_kawiarnia:sklep', 'mrozona', 30)
						else
							TriggerServerEvent('esx_kawiarnia:sklep', 'mrozona', 60)
						end
					else
						ESX.ShowNotification('Nie możesz więcej unieść')
					end
				end, 'kmrozona', 1)
			end

		end,
      
		function(data, menu)
			menu.close()
		end
    )

end

function wyplata()
	
	wypmenu = true
	
    local elements = {
		{label = "Przepalone ziarna kawy", value = 'ziarna'},
		{label = "Wyroby cukiernicze", value = 'wyroby'},
		{label = "Sernik", value = 'sernik'}
    } 

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'wyplatamenu',
		{
			title    = "Odbiór wypłaty",
			align    = 'bottom-right',
			elements = elements,
		},
		function(data, menu)

			if data.current.value == 'ziarna' then
				TriggerServerEvent('esx_kawiarnia:startwyplata', 'ziarna', PlayerData.protect)
			end

			if data.current.value == 'wyroby' then
				TriggerServerEvent('esx_kawiarnia:startwyplata', 'paczki', PlayerData.protect)
				Wait(100)
				TriggerServerEvent('esx_kawiarnia:startwyplata', 'babeczki', PlayerData.protect)
			end
			
			if data.current.value == 'sernik' then
				TriggerServerEvent('esx_kawiarnia:startwyplata', 'sernik', PlayerData.protect)
			end

		end,
      
		function(data, menu)
			menu.close()
		end
    )

end

function dyspozytornia()
	
	dysmenu = true
	
    local elements = {
		{label = "Zlecenie", value = 'zlecenie'},
		{label = "Pojazd służbowy", value = 'pojazd'}
    } 

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'dyspozytorniamenu',
		{
			title    = "Dyspozytronia",
			align    = 'bottom-right',
			elements = elements,
		},
		function(data, menu)

			if data.current.value == 'zlecenie' then
				zlecenie()
			end

			if data.current.value == 'pojazd' then
				pobierzpojazdsluzbowy()
				menu.close()
			end

		end,
      
		function(data, menu)
			menu.close()
		end
    )

end

function OpenVaultMenu()
	
    local elements = {
      {label = "Weź przedmiot", value = 'get_stock'},
      {label = "Włóź przedmiot", value = 'put_stock'}
    }
    

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'vault',
      {
        title    = "Sejf",
        align    = 'bottom-right',
        elements = elements,
      },
      function(data, menu)

        if data.current.value == 'put_stock' then
           OpenPutStocksMenu()
        end

        if data.current.value == 'get_stock' then
           OpenGetStocksMenu()
        end

      end,
      
      function(data, menu)

        menu.close()
      end
    )

end

function OpenPutStocksMenu()

	ESX.TriggerServerCallback('esx_kawiarnia:getPlayerInventory', function(inventory)
		local elements = {}

		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = "Brudne pieniądze: <span style='color: yellow;'>"..ESX.Math.GroupDigits(inventory.blackMoney).."$",
				type  = 'item_account',
				value = 'black_money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type  = 'item_standard',
					value = item.name
				})
			end
		end

		for i=1, #inventory.weapons, 1 do
			local weapon = inventory.weapons[i]

			table.insert(elements, {
				label = weapon.label..' ['..weapon.ammo..']',
				type  = 'item_weapon',
				value = weapon.name,
				ammo  = weapon.ammo
			})
		end



		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = "Sejf",
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)

			if data.current.type == 'item_weapon' then
				menu.close()
				TriggerServerEvent('esx_kawiarnia:putStockItems', data.current.type, data.current.value, data.current.ammo)

				ESX.SetTimeout(300, function()
					OpenPutStocksMenu()
				end)
			else
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
					title = "Ilość"
				}, function(data2, menu2)
					local count = tonumber(data2.value)

					if count == nil then
						ESX.ShowNotification("Nieprawidłowa ilość")
					else
						menu2.close()
						menu.close()
						TriggerServerEvent('esx_kawiarnia:putStockItems', data.current.type, data.current.value, count)
						Citizen.Wait(500)
						OpenPutStocksMenu()
					end
				end, function(data2, menu2)
					menu2.close()
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end


function OpenGetStocksMenu()

	ESX.TriggerServerCallback('esx_kawiarnia:getStockItems', function(inventory)
		local elements = {}
		local menutitle = "Sejf"

		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = "Brudne pieniądze: <span style='color: yellow;'>"..ESX.Math.GroupDigits(inventory.blackMoney).."$",
				type = 'item_account',
				value = 'black_money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		for i=1, #inventory.weapons, 1 do
			local weapon = inventory.weapons[i]

			table.insert(elements, {
				label = ESX.GetWeaponLabel(weapon.name)..' ['..weapon.ammo..']',
				type  = 'item_weapon',
				value = weapon.name,
				ammo  = weapon.ammo
			})
		end



		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = "Sejf",
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)

			if data.current.type == 'item_weapon' then
				menu.close()
				TriggerServerEvent('esx_kawiarnia:getStockItem', data.current.type, data.current.value, data.current.ammo)
				ESX.SetTimeout(300, function()
					OpenGetStocksMenu()
				end)
			else
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
					title = "Ilość"
				}, function(data2, menu2)
					local count = tonumber(data2.value)

					if count == nil then
						ESX.ShowNotification("Nieprawidłowa ilość")
					else
						menu2.close()
						menu.close()
						TriggerServerEvent('esx_kawiarnia:getStockItem', data.current.type, data.current.value, count)
						Citizen.Wait(500)
						OpenGetStocksMenu()
					end
				end, function(data2, menu2)
					menu2.close()
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenChangingRoomMenu()

	ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
		local elements = {}

		for i=1, #dressing, 1 do
			table.insert(elements, {
				label = dressing[i],
				value = i
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing',
		{
			title    = 'GARDEROBA',
			align    = 'bottom-right',
			elements = elements
		}, function(data2, menu2)

			TriggerEvent('skinchanger:getSkin', function(skin)
				ESX.TriggerServerCallback('esx_property:getPlayerOutfit', function(clothes)
					TriggerEvent('skinchanger:loadClothes', skin, clothes)
					TriggerEvent('esx_skin:setLastSkin', skin)

					TriggerEvent('skinchanger:getSkin', function(skin)
						TriggerServerEvent('esx_skin:save', skin)
					end)
				end, data2.current.value)
			end)

			end, function(data2, menu2)
				menu2.close()
		end)
	end)
end

function DrawText3D(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 255)
	SetTextOutline()
	AddTextComponentString(text)
	DrawText(_x, _y)
	local factor = (string.len(text)) / 270
	--DrawRect(_x, _y + 0.015, 0.005 + factor, 0.03, 31, 31, 31, 155)
end