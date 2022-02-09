-----------------------------------------
---      Kawiarnia by Wiertarkov       --
-----------------------------------------

ESX = nil
TriggerEvent('esx:getShtestaredObjtestect', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'kawiarnia', 'kawiarnia', 'society_kawiarnia', 'society_kawiarnia', 'society_kawiarnia', {type = 'public'})

ESX.RegisterServerCallback('esx_kawiarnia:getitemy', function(source, cb)	
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local pieniadze = xPlayer.getMoney()
	local ziarno = xPlayer.getInventoryItem('ziarnokawy').count 
	local przepaloneziarno = xPlayer.getInventoryItem('przepaloneziarno').count
	local babeczka = xPlayer.getInventoryItem('kbabeczka').count
	local paczek = xPlayer.getInventoryItem('kpaczek').count
	local ciasto = xPlayer.getInventoryItem('kciasto').count
	local sernik = xPlayer.getInventoryItem('ksernik').count
	cb(pieniadze,ziarno, przepaloneziarno, babeczka, paczek, ciasto, sernik)
end)

RegisterServerEvent('kawiarnia_addItem')
AddEventHandler('kawiarnia_addItem', function(item, ilosc, detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	if xPlayer.canCarryItem(item, ilosc) then
		xPlayer.addInventoryItem(item, ilosc)
	else
		xPlayer.showNotification('Nie możesz więcej unieść')
	end
end)

RegisterServerEvent('kawiarnia_removeItem')
AddEventHandler('kawiarnia_removeItem', function(item, ilosc, detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	xPlayer.removeInventoryItem(item, ilosc)
end)

RegisterServerEvent('kawiarnia_addKasa')
AddEventHandler('kawiarnia_addKasa', function(ilosc, detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	xPlayer.addMoney(ilosc)
end)

RegisterServerEvent('kawiarnia_removeKasa')
AddEventHandler('kawiarnia_removeKasa', function(ilosc, detect)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	xPlayer.removeMoney(ilosc)
end)

ESX.RegisterServerCallback('esx_mrp:canCarryItem', function(source, cb, item, count)	
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.canCarryItem(item, count) then
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('esx_kawiarnia:startwyplata')
AddEventHandler('esx_kawiarnia:startwyplata', function(what, detect)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local kawiarniaprzepalone = xPlayer.getInventoryItem('przepaloneziarno').count
	local kawiarniapaczki = xPlayer.getInventoryItem('kpaczek').count
	local kawiarniababeczka = xPlayer.getInventoryItem('kbabeczka').count
	local kawiarniasernik = xPlayer.getInventoryItem('ksernik').count
	local societyAccount
	
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_kawiarnia', function(account)
		societyAccount = account
	end)
	
	if xPlayer.protect ~= detect then
		TriggerEvent('DAWIJMDAWIJD8945J09J9GEJG90JE5490', xPlayer.source, 'ban', 'Event Detect', GetCurrentResourceName())
		return
	end
	
	if what == 'ziarna' then
		if kawiarniaprzepalone >= 1 then
			local wyplata = math.floor(Config.wyplatakasaziarna * kawiarniaprzepalone)
			local wyplatafirma = math.floor(wyplata * Config.procent / 100)
			xPlayer.removeInventoryItem('przepaloneziarno', kawiarniaprzepalone)

			MySQL.Async.fetchAll('SELECT kawa FROM users WHERE identifier = @identifier',{
			['@identifier'] = xPlayer.identifier
			}, function(result)	
				if result[1] ~= nil then
					local wynik = result[1]
					local twojstarypijany = wynik.kawa
					xPlayer.addMoney(wyplata)
					if twojstarypijany <= 149 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 0<br>Otrzymałeś 0$ premii',
						})
					elseif twojstarypijany >= 150 and twojstarypijany <= 299 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 1<br>Otrzymałeś 150$ premii',
						})
						xPlayer.addMoney(150)
					elseif twojstarypijany >= 300 and twojstarypijany <= 599 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 2<br>Otrzymałeś 300$ premii',
						})
						xPlayer.addMoney(300)
					elseif twojstarypijany >= 600 and twojstarypijany <= 999 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 3<br>Otrzymałeś 600$ premii',
						})
						xPlayer.addMoney(600)
					elseif twojstarypijany >= 1000 and twojstarypijany <= 1499 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 4<br>Otrzymałeś 1000$ premii',
						})
						xPlayer.addMoney(1000)
					elseif twojstarypijany >= 1500 and twojstarypijany <= 2099 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 5<br>Otrzymałeś 1500$ premii',
						})
						xPlayer.addMoney(1500)
					elseif twojstarypijany >= 2100 and twojstarypijany <= 2799 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 6<br>Otrzymałeś 2100$ premii',
						})
						xPlayer.addMoney(2100)
					elseif twojstarypijany >= 2800 and twojstarypijany <= 3599 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 7<br>Otrzymałeś 2800$ premii',
						})
						xPlayer.addMoney(2800)
					elseif twojstarypijany >= 3600 and twojstarypijany <= 4499 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 8<br>Otrzymałeś 3600$ premii',
						})
						xPlayer.addMoney(3600)
					elseif twojstarypijany >= 4500 and twojstarypijany <= 5499 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 9<br>Otrzymałeś 4500$ premii',
						})
						xPlayer.addMoney(4500)
					elseif twojstarypijany >= 5500 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 10<br>Otrzymałeś 5500$ premii',
						})
						xPlayer.addMoney(5500)
					end
					
					Wait(500)
					
					MySQL.Async.execute('UPDATE users SET kawa = @kawa WHERE identifier = @identifier', {
						['@identifier'] = xPlayer.identifier,
						['@kawa'] = twojstarypijany + 1
					})
				end
			end)
			
			Wait(100)
			
			societyAccount.addMoney(wyplatafirma)
		else
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 	'Masz niewystarczająco przepalonych ziaren kawy!',
			})
		end
	elseif what == 'paczki' then
		if kawiarniapaczki >= 1 then
			local wyplata = math.floor(Config.wyplatakasawyroby * kawiarniapaczki)
			local wyplatafirma = math.floor(wyplata * Config.procent / 100)
			xPlayer.removeInventoryItem('kpaczek', kawiarniapaczki)

			MySQL.Async.fetchAll('SELECT kawa FROM users WHERE identifier = @identifier',{
			['@identifier'] = xPlayer.identifier
			}, function(result)	
				if result[1] ~= nil then
					local wynik = result[1]
					local twojstarypijany = wynik.kawa
					xPlayer.addMoney(wyplata)
					if twojstarypijany <= 149 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 0<br>Otrzymałeś 0$ premii',
						})
					elseif twojstarypijany >= 150 and twojstarypijany <= 299 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 1<br>Otrzymałeś 500$ premii',
						})
						xPlayer.addMoney(500)
					elseif twojstarypijany >= 300 and twojstarypijany <= 599 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 2<br>Otrzymałeś 1000$ premii',
						})
						xPlayer.addMoney(1000)
					elseif twojstarypijany >= 600 and twojstarypijany <= 999 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 3<br>Otrzymałeś 1500$ premii',
						})
						xPlayer.addMoney(1500)
					elseif twojstarypijany >= 1000 and twojstarypijany <= 1499 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 4<br>Otrzymałeś 2000$ premii',
						})
						xPlayer.addMoney(2000)
					elseif twojstarypijany >= 1500 and twojstarypijany <= 2099 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 5<br>Otrzymałeś 2500$ premii',
						})
						xPlayer.addMoney(2500)
					elseif twojstarypijany >= 2100 and twojstarypijany <= 2799 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 6<br>Otrzymałeś 3000$ premii',
						})
						xPlayer.addMoney(3000)
					elseif twojstarypijany >= 2800 and twojstarypijany <= 3599 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 7<br>Otrzymałeś 3500$ premii',
						})
						xPlayer.addMoney(3500)
					elseif twojstarypijany >= 3600 and twojstarypijany <= 4499 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 8<br>Otrzymałeś 4000$ premii',
						})
						xPlayer.addMoney(4000)
					elseif twojstarypijany >= 4500 and twojstarypijany <= 5499 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 9<br>Otrzymałeś 4500$ premii',
						})
						xPlayer.addMoney(4500)
					elseif twojstarypijany >= 5500 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 10<br>Otrzymałeś 5000$ premii',
						})
						xPlayer.addMoney(5000)
					end
					
					Wait(500)
					
					MySQL.Async.execute('UPDATE users SET kawa = @kawa WHERE identifier = @identifier', {
						['@identifier'] = xPlayer.identifier,
						['@kawa'] = twojstarypijany + 1
					})
				end
			end)
			
			Wait(100)
			
			societyAccount.addMoney(wyplatafirma)
		else
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Masz niewystarczająco pączków!',
			})
		end
	elseif what == 'babeczki' then
		if kawiarniababeczka >= 1 then
			local wyplata = math.floor(Config.wyplatakasawyroby * kawiarniababeczka)
			local wyplatafirma = math.floor(wyplata * Config.procent / 100)
			xPlayer.removeInventoryItem('kbabeczka', kawiarniababeczka)

			MySQL.Async.fetchAll('SELECT kawa FROM users WHERE identifier = @identifier',{
			['@identifier'] = xPlayer.identifier
			}, function(result)	
				if result[1] ~= nil then
					local wynik = result[1]
					local twojstarypijany = wynik.kawa
					xPlayer.addMoney(wyplata)
					if twojstarypijany <= 149 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 0<br>Otrzymałeś 0$ premii',
						})
					elseif twojstarypijany >= 150 and twojstarypijany <= 299 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 1<br>Otrzymałeś 500$ premii',
						})
						xPlayer.addMoney(500)
					elseif twojstarypijany >= 300 and twojstarypijany <= 599 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 2<br>Otrzymałeś 1000$ premii',
						})
						xPlayer.addMoney(1000)
					elseif twojstarypijany >= 600 and twojstarypijany <= 999 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 3<br>Otrzymałeś 1500$ premii',
						})
						xPlayer.addMoney(1500)
					elseif twojstarypijany >= 1000 and twojstarypijany <= 1499 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 4<br>Otrzymałeś 2000$ premii',
						})
						xPlayer.addMoney(2000)
					elseif twojstarypijany >= 1500 and twojstarypijany <= 2099 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 5<br>Otrzymałeś 2500$ premii',
						})
						xPlayer.addMoney(2500)
					elseif twojstarypijany >= 2100 and twojstarypijany <= 2799 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 6<br>Otrzymałeś 3000$ premii',
						})
						xPlayer.addMoney(3000)
					elseif twojstarypijany >= 2800 and twojstarypijany <= 3599 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 7<br>Otrzymałeś 3500$ premii',
						})
						xPlayer.addMoney(3500)
					elseif twojstarypijany >= 3600 and twojstarypijany <= 4499 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 8<br>Otrzymałeś 4000$ premii',
						})
						xPlayer.addMoney(4000)
					elseif twojstarypijany >= 4500 and twojstarypijany <= 5499 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 9<br>Otrzymałeś 4500$ premii',
						})
						xPlayer.addMoney(4500)
					elseif twojstarypijany >= 5500 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 10<br>Otrzymałeś 5000$ premii',
						})
						xPlayer.addMoney(5000)
					end
					
					Wait(500)
					
					MySQL.Async.execute('UPDATE users SET kawa = @kawa WHERE identifier = @identifier', {
						['@identifier'] = xPlayer.identifier,
						['@kawa'] = twojstarypijany + 1
					})
				end
			end)
			
			Wait(100)
			
			societyAccount.addMoney(wyplatafirma)
		else
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Masz niewystarczająco babeczek!',
			})
		end
	elseif what == 'sernik' then
		if kawiarniasernik >= 1 then
			local wyplata = math.floor(Config.wyplatakasasernik * kawiarniasernik)
			local wyplatafirma = math.floor(wyplata * Config.procent / 100)
			xPlayer.removeInventoryItem('ksernik', kawiarniasernik)

			MySQL.Async.fetchAll('SELECT kawa FROM users WHERE identifier = @identifier',{
			['@identifier'] = xPlayer.identifier
			}, function(result)	
				if result[1] ~= nil then
					local wynik = result[1]
					local twojstarypijany = wynik.kawa
					xPlayer.addMoney(wyplata)
					if twojstarypijany <= 149 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 0<br>Otrzymałeś 0$ premii',
						})
					elseif twojstarypijany >= 150 and twojstarypijany <= 299 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 1<br>Otrzymałeś 500$ premii',
						})
						xPlayer.addMoney(500)
					elseif twojstarypijany >= 300 and twojstarypijany <= 599 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 2<br>Otrzymałeś 1000$ premii',
						})
						xPlayer.addMoney(1000)
					elseif twojstarypijany >= 600 and twojstarypijany <= 999 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 3<br>Otrzymałeś 1500$ premii',
						})
						xPlayer.addMoney(1500)
					elseif twojstarypijany >= 1000 and twojstarypijany <= 1499 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 4<br>Otrzymałeś 2000$ premii',
						})
						xPlayer.addMoney(2000)
					elseif twojstarypijany >= 1500 and twojstarypijany <= 2099 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 5<br>Otrzymałeś 2500$ premii',
						})
						xPlayer.addMoney(2500)
					elseif twojstarypijany >= 2100 and twojstarypijany <= 2799 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 6<br>Otrzymałeś 3000$ premii',
						})
						xPlayer.addMoney(3000)
					elseif twojstarypijany >= 2800 and twojstarypijany <= 3599 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 7<br>Otrzymałeś 3500$ premii',
						})
						xPlayer.addMoney(3500)
					elseif twojstarypijany >= 3600 and twojstarypijany <= 4499 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 8<br>Otrzymałeś 4000$ premii',
						})
						xPlayer.addMoney(4000)
					elseif twojstarypijany >= 4500 and twojstarypijany <= 5499 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 9<br>Otrzymałeś 4500$ premii',
						})
						xPlayer.addMoney(4500)
					elseif twojstarypijany >= 5500 then
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = 'Otrzymałeś '..wyplata..'$<br>Twoja firma zarobiła '..wyplatafirma..'$<br>Twój poziom: 10<br>Otrzymałeś 5000$ premii',
						})
						xPlayer.addMoney(5000)
					end
					
					Wait(500)
					
					MySQL.Async.execute('UPDATE users SET kawa = @kawa WHERE identifier = @identifier', {
						['@identifier'] = xPlayer.identifier,
						['@kawa'] = twojstarypijany + 1
					})
				end
			end)
			
			Wait(100)
			
			societyAccount.addMoney(wyplatafirma)
		else
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Masz niewystarczająco serników!',
			})
		end
	end
end)

RegisterServerEvent('esx_kawiarnia:sklep')
AddEventHandler('esx_kawiarnia:sklep', function(what, kasa)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local pieniadze = xPlayer.getMoney()
	local societyAccount
	
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_kawiarnia', function(account)
		societyAccount = account
	end)

	if what == 'kawa' then
		if pieniadze >= kasa then
			xPlayer.addInventoryItem('kkawa', 1)
			xPlayer.removeMoney(kasa)
			Wait(100)
			societyAccount.addMoney(kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Zakupiłeś x1 Kawa za '..kasa..'$',
			})
		else
			local brakuje = math.floor(pieniadze - kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Masz niewystarczająco pieniędzy! Brakuje ci '..brakuje..'$',
			})
		end
	elseif what == 'kapuczino' then
		if pieniadze >= kasa then
			xPlayer.addInventoryItem('kkapuczino', 1)
			xPlayer.removeMoney(kasa)
			Wait(100)
			societyAccount.addMoney(kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Zakupiłeś x1 Capuccino za '..kasa..'$',
			})
		else
			local brakuje = math.floor(pieniadze - kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Masz niewystarczająco pieniędzy! Brakuje ci '..brakuje..'$',
			})
		end
	elseif what == 'espreso' then
		if pieniadze >= kasa then
			xPlayer.addInventoryItem('kespreso', 1)
			xPlayer.removeMoney(kasa)
			Wait(100)
			societyAccount.addMoney(kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Zakupiłeś x1 Podwójne espresso za '..kasa..'$',
			})
		else
			local brakuje = math.floor(pieniadze - kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Masz niewystarczająco pieniędzy! Brakuje ci '..brakuje..'$',
			})
		end
	elseif what == 'paczek' then
		if pieniadze >= kasa then
			xPlayer.addInventoryItem('kpaczek1', 1)
			xPlayer.removeMoney(kasa)
			Wait(100)
			societyAccount.addMoney(kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Zakupiłeś x1 Pączek za '..kasa..'$',
			})
		else
			local brakuje = math.floor(pieniadze - kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Masz niewystarczająco pieniędzy! Brakuje ci '..brakuje..'$',
			})
		end
	elseif what == 'babeczka' then
		if pieniadze >= kasa then
			xPlayer.addInventoryItem('kbabeczka1', 1)
			xPlayer.removeMoney(kasa)
			Wait(100)
			societyAccount.addMoney(kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Zakupiłeś x1 Babeczka za '..kasa..'$',
			})
		else
			local brakuje = math.floor(pieniadze - kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Masz niewystarczająco pieniędzy! Brakuje ci '..brakuje..'$',
			})
		end
	elseif what == 'sernik' then
		if pieniadze >= kasa then
			xPlayer.addInventoryItem('ksernik1', 1)
			xPlayer.removeMoney(kasa)
			Wait(100)
			societyAccount.addMoney(kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Zakupiłeś x1 Sernik za '..kasa..'$',
			})
		else
			local brakuje = math.floor(pieniadze - kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Masz niewystarczająco pieniędzy! Brakuje ci '..brakuje..'$',
			})
		end
	elseif what == 'brownie' then
		if pieniadze >= kasa then
			xPlayer.addInventoryItem('kbrownie', 1)
			xPlayer.removeMoney(kasa)
			Wait(100)
			societyAccount.addMoney(kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Zakupiłeś x1 Brownie za '..kasa..'$',
			})
		else
			local brakuje = math.floor(pieniadze - kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Masz niewystarczająco pieniędzy! Brakuje ci '..brakuje..'$',
			})
		end
	elseif what == 'szarlotka' then
		if pieniadze >= kasa then
			xPlayer.addInventoryItem('kszarlotka', 1)
			xPlayer.removeMoney(kasa)
			Wait(100)
			societyAccount.addMoney(kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Zakupiłeś x1 Szarlotka za '..kasa..'$',
			})
		else
			local brakuje = math.floor(pieniadze - kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Masz niewystarczająco pieniędzy! Brakuje ci '..brakuje..'$',
			})
		end
	elseif what == 'czekolada' then
		if pieniadze >= kasa then
			xPlayer.addInventoryItem('kczekolada', 1)
			xPlayer.removeMoney(kasa)
			Wait(100)
			societyAccount.addMoney(kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Zakupiłeś x1 Czekolada do picia za '..kasa..'$',
			})
		else
			local brakuje = math.floor(pieniadze - kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Masz niewystarczająco pieniędzy! Brakuje ci '..brakuje..'$',
			})
		end
	elseif what == 'herbata' then
		if pieniadze >= kasa then
			xPlayer.addInventoryItem('kherbata', 1)
			xPlayer.removeMoney(kasa)
			Wait(100)
			societyAccount.addMoney(kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Zakupiłeś x1 Herbata za '..kasa..'$',
			})
		else
			local brakuje = math.floor(pieniadze - kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Masz niewystarczająco pieniędzy! Brakuje ci '..brakuje..'$',
			})
		end
	elseif what == 'croisant' then
		if pieniadze >= kasa then
			xPlayer.addInventoryItem('kcroisant', 1)
			xPlayer.removeMoney(kasa)
			Wait(100)
			societyAccount.addMoney(kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Zakupiłeś x1 Croisant za '..kasa..'$',
			})
		else
			local brakuje = math.floor(pieniadze - kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Masz niewystarczająco pieniędzy! Brakuje ci '..brakuje..'$',
			})
		end
	elseif what == 'rogalik' then
		if pieniadze >= kasa then
			xPlayer.addInventoryItem('krogalik', 1)
			xPlayer.removeMoney(kasa)
			Wait(100)
			societyAccount.addMoney(kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Zakupiłeś x1 Rogalik za '..kasa..'$',
			})
		else
			local brakuje = math.floor(pieniadze - kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Masz niewystarczająco pieniędzy! Brakuje ci '..brakuje..'$',
			})
		end
	elseif what == 'mrozona' then
		if pieniadze >= kasa then
			xPlayer.addInventoryItem('kmrozona', 1)
			xPlayer.removeMoney(kasa)
			Wait(100)
			societyAccount.addMoney(kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Zakupiłeś x1 Kawę mrożoną za '..kasa..'$',
			})
		else
			local brakuje = math.floor(pieniadze - kasa)
			TriggerClientEvent("pNotify:SendNotification", _source, {
				text = 'Masz niewystarczająco pieniędzy! Brakuje ci '..brakuje..'$',
			})
		end
	end
end)

ESX.RegisterServerCallback('esx_kawiarnia:getStockItems', function(source, cb)
	local blackMoney = 0
	local items      = {}
	local weapons    = {}

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_kawiarnia_black', function(account)
		blackMoney = account.money
	end)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_kawiarnia', function(store)
		weapons = store.get('weapons')
		if weapons == nil then
			weapons = {}
		end
	end)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_kawiarnia', function(inventory)
		for i=1, #inventory.items, 1 do
			if inventory.items[i].count > 0 then
				table.insert(items, inventory.items[i])
			end
		end	
	end)

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = weapons
	})
end)

RegisterServerEvent('esx_kawiarnia:getStockItem')
AddEventHandler('esx_kawiarnia:getStockItem', function(type, itemName, count)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer ~= nil then
		if type == 'item_standard' then
			local sourceItem = xPlayer.getInventoryItem(item)
			TriggerEvent('esx_addoninventory:getSharedInventory', 'society_kawiarnia', function(inventory)
				local item = inventory.getItem(itemName)
				local sourceItem = xPlayer.getInventoryItem(itemName)

				if count > 0 and item.count >= count then
					
					if xPlayer.canCarryItem(itemName, count) then
						inventory.removeItem(itemName, count)
						xPlayer.addInventoryItem(itemName, count)
						TriggerClientEvent('esx:showNotification', xPlayer.source, "Pobrałeś x"..count..' '..item.label)					
					else
						xPlayer.showNotification('Nie możesz więcej unieść')
					end
				else
					TriggerClientEvent('esx:showNotification', xPlayer.source, "Nieprawidłowa ilość")
				end
			end)

		elseif type == 'item_account' then

			TriggerEvent('esx_addonaccount:getSharedAccount', "society_kawiarnia_black", function(account)
				local AccountMoney = account.money

				if AccountMoney >= count then
					account.removeMoney(count)
					xPlayer.addAccountMoney(itemName, count)
					--sendToDiscordkawiarnia('LSE | Playboy', xPlayer.name ..' wyciągnął z sejfu '.. itemName .. ' w ilości '.. count..'$' ,8421504)
				else
					TriggerClientEvent('esx:showNotification', _source, "Nieprawidłowa ilość")
				end
			end)

		elseif type == 'item_weapon' then

			TriggerEvent('esx_datastore:getSharedDataStore', 'society_kawiarnia', function(store)
				local storeWeapons = store.get('weapons') or {}
				local weaponName   = nil
				local ammo         = nil

				if not xPlayer.hasWeapon(itemName) then
					for i=1, #storeWeapons, 1 do
						if storeWeapons[i].name == itemName then
							weaponName = storeWeapons[i].name
							ammo       = storeWeapons[i].ammo
							table.remove(storeWeapons, i)
							break
						end
					end
					store.set('weapons', storeWeapons)
					xPlayer.addWeapon(weaponName, ammo)
				else
					xPlayer.showNotification('Posiadas już tą broń')
				end
			end)
		end
	end
end)

RegisterServerEvent('esx_kawiarnia:putStockItems')
AddEventHandler('esx_kawiarnia:putStockItems', function(type, itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer ~= nil then
		if type == 'item_standard' then
			local playerItemCount = xPlayer.getInventoryItem(itemName).count

			TriggerEvent('esx_addoninventory:getSharedInventory', 'society_kawiarnia', function(inventory)
				local item = inventory.getItem(itemName)
				local playerItemCount = xPlayer.getInventoryItem(itemName).count

				if item.count >= 0 and count <= playerItemCount then
					xPlayer.removeInventoryItem(itemName, count)
					inventory.addItem(itemName, count)
					--sendToDiscordkawiarnia('LSE | Playboy', xPlayer.name ..' zdeponował do sejfu '.. item.label .. ' w ilości '.. count ,16744192)
				else
					TriggerClientEvent('esx:showNotification', xPlayer.source, "Nieprawidłowa ilość")
				end
				TriggerClientEvent('esx:showNotification', xPlayer.source, "Schowałeś x"..count..' '..item.label)
			end)

		elseif type == 'item_account' then

			local playerAccountMoney = xPlayer.getAccount(itemName).money
			if playerAccountMoney >= count and count > 0 then
				xPlayer.removeAccountMoney(itemName, count)
				--sendToDiscordkawiarnia('LSE | Playboy', xPlayer.name ..' zdeponował do sejfu '.. itemName .. ' w ilości '.. count..'$',8421504)

				TriggerEvent('esx_addonaccount:getSharedAccount', "society_kawiarnia_black", function(account)
					account.addMoney(count)
				end)
			else
				TriggerClientEvent('esx:showNotification', _source, "Nieprawidłowa ilość")
			end

		elseif type == 'item_weapon' then

			TriggerEvent('esx_datastore:getSharedDataStore', "society_kawiarnia", function(store)
				local storeWeapons = store.get('weapons') or {}

				table.insert(storeWeapons, {
					name = itemName,
					ammo = count
				})

				store.set('weapons', storeWeapons)
				xPlayer.removeWeapon(itemName, count)
				--sendToDiscordkawiarnia('LSE | Playboy', xPlayer.name ..' zdeponował do sejfu '.. itemName .. ' z ilością naboi '.. count ,16711680)
			end)
		end
	end
end)

ESX.RegisterServerCallback('esx_kawiarnia:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
		local blackMoney = xPlayer.getAccount('black_money').money
		local items      = xPlayer.inventory

		cb({
			blackMoney = blackMoney,
			items      = items,
			weapons    = xPlayer.getLoadout()
		})
	end
end)