ShootableProjectile["ShootableProjectileName"] = true

data.AntiAirErrorStdDev["AntiAirWeaponName"] = Balance(0, 0)
data.AntiAirOpenDoor["AntiAirWeaponName"] = { ["mortar"] = true, ["mortar2"] = true, }
data.AntiAirFireProbability["AntiAirWeaponName"] = Balance(0.92, 0.99)

AntiAirFireProbabilityHumanAssist["AntiAirWeaponName"] = data.AntiAirFireProbability["AntiAirWeaponName"]

FireErrorStdDev["AntiAirWeaponName"] = Balance(0, 0)


data.OffensiveFireProbability["AntiAirWeaponName"] = Balance(0, 0)


data.FireDuringRebuildProbability["AntiAirWeaponName"] = Balance(0.5, 0.8)

data.ProjectileHitpoints["AntiAirWeaponName"] = 1

data.IgnoreProtectionProbability["AntiAirWeaponName"] = 0

data.WeaponTargetStructureAttempts["AntiAirWeaponName"] = 0

-- add grouping affinities to existing weapons with new weapons


function InsertAheadOf(prioritiesTable, saveName, aheadOfSaveName)
	for k,v in ipairs(prioritiesTable) do
		if v == aheadOfSaveName then
			table.insert(prioritiesTable, k, saveName)
			break
		end
	end
end