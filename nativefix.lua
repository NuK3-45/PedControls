-- Fixed struct pointer natives for FiveM by Hummtaro

local function GetIntFromBlob(b, s, o)
	r = 0
	for i=1,s,1 do
		r = r | (string.byte(b,o+i)<<(i-1)*8)
	end
	return r
end

local function GetStringFromBlob(b, s, o)
	r = ''
	for i=1,s,1 do
		if string.byte(b,o+i) ~= 0 then
			r = r .. string.char(string.byte(b,o+i))
		else
			break
		end
	end
	return r
end

function GetDlcVehicleData(dlcVehicleIndex, none)
	blob = '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'
	retval = Citizen.InvokeNative(0x33468EDC08E371F6, dlcVehicleIndex, blob, Citizen.ReturnResultAnyway())
	val1 = GetIntFromBlob(blob,8,0)
	hash = GetIntFromBlob(blob,8,8)
	val3 = GetIntFromBlob(blob,8,16)
	return retval, val1, hash, val3
end

function GetDlcWeaponData(dlcWeaponIndex, none)
	blob = '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'
	retval = Citizen.InvokeNative(0x79923CD21BECE14E, dlcWeaponIndex, blob, Citizen.ReturnResultAnyway())
	emptyCheck = GetIntFromBlob(blob,8,0)
	weaponHash = GetIntFromBlob(blob,8,8)
	val3 = GetIntFromBlob(blob,8,16)
	weaponCost = GetIntFromBlob(blob,8,24)
	ammoCost = GetIntFromBlob(blob,8,32)
	ammoType = GetIntFromBlob(blob,8,40)
	clipSize = GetIntFromBlob(blob,8,48)
	nameLabel = GetStringFromBlob(blob,64,56)
	descLabel = GetStringFromBlob(blob,64,120)
	desc2Label = GetStringFromBlob(blob,64,184)
	upperCaseNameLabel = GetStringFromBlob(blob,64,248)
	return retval, emptyCheck, weaponHash, val3, weaponCost, ammoCost, ammoType, clipSize, nameLabel, descLabel, desc2Label, upperCaseNameLabel
end

function GetDlcWeaponComponentData(dlcWeaponIndex, dlcWeapCompIndex, none)
	blob = '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'
	retval = Citizen.InvokeNative(0x6CF598A2957C2BF8, dlcWeaponIndex, dlcWeapCompIndex, blob, Citizen.ReturnResultAnyway())
	attachBone = GetIntFromBlob(blob,8,0)
	bActiveByDefault = GetIntFromBlob(blob,8,8)
	val3 = GetIntFromBlob(blob,8,16)
	componentHash = GetIntFromBlob(blob,8,24)
	val5 = GetIntFromBlob(blob,8,32)
	componentCost = GetIntFromBlob(blob,8,40)
	nameLabel = GetStringFromBlob(blob,64,48)
	descLabel = GetStringFromBlob(blob,64,112)
	return retval, attachBone, bActiveByDefault, val3, componentHash, val5, componentCost, nameLabel, descLabel
end

function GetWeaponHudStats(weaponHash, none)
	blob = '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'
	retval = Citizen.InvokeNative(0xD92C739EE34C9EBA, weaponHash, blob, Citizen.ReturnResultAnyway())
	hudDamage = GetIntFromBlob(blob,8,0)
	hudSpeed = GetIntFromBlob(blob,8,8)
	hudCapacity = GetIntFromBlob(blob,8,16)
	hudAccuracy = GetIntFromBlob(blob,8,24)
	hudRange = GetIntFromBlob(blob,8,32)
	return retval, hudDamage, hudSpeed, hudCapacity, hudAccuracy, hudRange
end

function GetWeaponComponentHudStats(componentHash, none)
	blob = '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'
	retval = Citizen.InvokeNative(0xB3CAF387AE12E9F8, componentHash, blob, Citizen.ReturnResultAnyway())
	hudDamage = GetIntFromBlob(blob,8,0)
	hudSpeed = GetIntFromBlob(blob,8,8)
	hudCapacity = GetIntFromBlob(blob,8,16)
	hudAccuracy = GetIntFromBlob(blob,8,24)
	hudRange = GetIntFromBlob(blob,8,32)
	return retval, hudDamage, hudSpeed, hudCapacity, hudAccuracy, hudRange
end