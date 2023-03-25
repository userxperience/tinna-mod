dofile("scripts/interpolate.lua")

Scale = 1.0
SelectionWidth = 50.0
SelectionHeight = 50.0
SelectionOffset = { 0.0, -50.5 }
RecessionBox =
{
	Size = { 200, 25 },
	Offset = { -230, -60 },
}
CanFlip = false

WeaponMass = 90.0
HitPoints = 180.0
EnergyProductionRate = 0.0
MetalProductionRate = 0.0
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 1
MaxWindHeight = 0
MaxRotationalSpeed = 0

FireEffect = "mods/weapon_pack/effects/fire_firebeam.lua"
ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = "mods/weapon_pack/effects/firebeam_explode.lua"
DestroyUnderwaterEffect = "mods/dlc2/effects/device_explode_submerged_large.lua"
ReloadEffect = "mods/weapon_pack/effects/reload_firebeam.lua"
ReloadEffectOffset = -1
Projectile = "firebeam"
BarrelLength = 58.0
MinFireClearance = 500
FireClearanceOffsetInner = 20
FireClearanceOffsetOuter = 40
AttractZoomOutDuration = 5
RoundsEachBurst = 1
RoundPeriod = 1
ReloadTime = 14.0
ReloadTimeIncludesBurst = false
MinFireSpeed = 10000.0
MaxFireSpeed = 10000.0
MinFireRadius = 600.0
MaxFireRadius = 1200.0
MinVisibility = 0.7
MaxVisibilityHeight = 1000
MinFireAngle = -50
MaxFireAngle = 50
KickbackMean = 0
KickbackStdDev = 0
MouseSensitivityFactor = 0.5
PanDuration = 0
FireDelay = 0
FireStdDev = 0.0
FireStdDevAuto = 0.015
Recoil = 0
BeamDuration = 2.5
EnergyFireCost = 1500/BeamDuration
MetalFireCost = 0.0
BeamEndEffectTime = 2.5
BeamThicknessMultiplier = 1.0
BeamDamageMultiplier = 1.0
BeamPenetrationRotationThreshold = 0.0005
BeamPenetrationDistanceThreshold = 10
IncendiaryRadius = 150
IncendiaryRadiusHeated = 180

ShowFireAngle = true

-- first column is time keypoint
-- second coloumn is thickness at that keypoint
-- third column is damage at that keypoint
--[[
BeamTable =
{
	{ 0,	1,	0, },
	{ 0.25, 3,  0, },
	{ 0.5,	30, 1000, },
	{ 1,	30, 1000, }, -- 1000
	{ 1.5,	0,	0, },
}
]]

function GenerateBeamTable(duration, interval, scale)
	BeamTable = {}
	local count = math.floor(duration/interval)
	for i = 1,count do
		local odd = (i - 1)%2
		local w = scale*(10 + odd*20)
		local t = (i - 1)*interval
		BeamTable[i] = { t, w, }
	end

	BeamTable[1][2] = 0
	BeamTable[2][2] = scale*45
	BeamTable[3][2] = scale*52
	BeamTable[4][2] = scale*55
	BeamTable[5][2] = scale*52
	BeamTable[6][2] = scale*45
	BeamTable[7][2] = scale*40
	BeamTable[8][2] = scale*35
end

GenerateBeamTable(BeamDuration, 0.05, 1)

function BeamThickness(t)
	return InterpolateTable(BeamTable, t, 2)
end

--function BeamDamage(t)
--	return 0
--	return InterpolateTable(BeamTable, t, 3)
--end


dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter

NodeEffects =
{
	{
		NodeName = "ReloadEmitter",
		EffectPath = "mods/weapon_pack/effects/firebeam_overheated.lua",
		Automatic = false,
	},
}