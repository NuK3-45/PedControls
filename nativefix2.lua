-- Fixed struct pointer natives example by Hummtaro

Citizen.CreateThread(function()

	for i=1,GetNumDlcWeapons(),1 do
		_,emptyCheck,weaponHash,_,weaponCost,ammoCost,ammoType,clipSize,nameLabel,descLabel = GetDlcWeaponData(i-1)
		
		if emptyCheck then
			Citizen.Trace("nameLabel: " .. nameLabel)
			Citizen.Trace("descLabel: " .. descLabel)
			Citizen.Trace(string.format("weaponHash: %x",weaponHash))
			Citizen.Trace("weaponCost: " .. weaponCost)
			Citizen.Trace("ammoCost: " .. ammoCost)
			Citizen.Trace(string.format("ammoType: %x",ammoType))
			Citizen.Trace("clipSize: " .. clipSize)
	
			_,hudDamage,hudSpeed,hudCapacity,hudAccuracy,hudRange = GetWeaponHudStats(weaponHash)
			Citizen.Trace("hudDamage: " .. hudDamage)
			Citizen.Trace("hudSpeed: " .. hudSpeed)
			Citizen.Trace("hudCapacity: " .. hudCapacity)
			Citizen.Trace("hudAccuracy: " .. hudAccuracy)
			Citizen.Trace("hudRange: " .. hudRange)
			Citizen.Trace(" ")
		end
	end
end)