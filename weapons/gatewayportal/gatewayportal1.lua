 dofile("scripts/interpolate.lua")

Scale = 1.0
 SelectionWidth = 0.001
 SelectionHeight = 0.001
 SelectionOffset = { 0.0, -0.001 }
 RecessionBox =
 {
	 Size = { 0.001, 0.001 },
	 Offset = { 0.001, -0.001 },
 }
 CanFlip = true

WeaponMass = 90.0
HitPoints = 180.0
EnergyProductionRate = 0.0
MetalProductionRate = 0.0
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 1
MaxWindHeight = 0
MaxRotationalSpeed = 0

 FireEffect = nil
 ConstructEffect = nil
 CompleteEffect = nil
 DestroyEffect = nil
ReloadEffectOffset = -1
Projectile = "gatewaylaser2"
BarrelLength = 58.0
MinFireClearance = 500
FireClearanceOffsetInner = 20
FireClearanceOffsetOuter = 40
AttractZoomOutDuration = 5
RoundsEachBurst = 1
RoundPeriod = 1
ReloadTime = 26.0
MinFireSpeed = 10000.0
MaxFireSpeed = 10000.0
MinFireRadius = 600.0
MaxFireRadius = 1200.0
MinVisibility = 0.7
MaxVisibilityHeight = 1000
MinFireAngle = -35
MaxFireAngle = 35
KickbackMean = 0
KickbackStdDev = 0
MouseSensitivityFactor = 0.5
PanDuration = 0
FireDelay = 0.1
FireStdDev = 0.0
FireStdDevAuto = 0.015
Recoil = 0
BeamDuration = 4.0
EnergyFireCost = 1500/BeamDuration
MetalFireCost = 0.0
BeamEndEffectTime = 2.5
BeamThicknessMultiplier = 1.0
BeamDamageMultiplier = 1.0
BeamPenetrationRotationThreshold = 99999
BeamPenetrationDistanceThreshold = 99999
IncendiaryRadius = 150
IncendiaryRadiusHeated = 180
DoorCloseDelay = 2
AutofireCloseDoorTicks = DoorCloseDelay*25

ShowFireAngle = true

TargetIcon =
{
	Persistent = true,
	Texture = "ui/textures/mouse_target.tga",
	Width = 32,
	Height = 32,
}

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


Root =
{
	Name = "Laser",
	Angle = 0,
	Pivot = { 0.00, -0.43 },
	PivotOffset = { 0, 0 },
--	PivotOffset = { -0.15, 0 },
	Sprite = nil,
	UserData = 0,

	ChildrenInFront =
	{
		{
			Name = "Anim",
			Angle = 0,
			Pivot = { -0.15, 0.0 },
			PivotOffset = { 0, 0 },
			--PivotOffset = { -0.15, 0 },
			Sprite = nil,
			UserData = 0,
			ChildrenInFront =
			{
				{
					Name = "Head",
					Angle = 0,
					Pivot = { -0.15, 0 },
		--			Pivot = { 0, 0 },
					PivotOffset = { 0.25, 0 },
					Sprite = nil,
					UserData = 30,

					ChildrenInFront =
					{
						{
							Name = "Hardpoint0",
							Angle = 90,
		--					Pivot = { 0.47, -0.16 },
							Pivot = { -0.05, -0.05 },
							PivotOffset = { 0, 0 },
						},

						{
							Name = "Chamber",
							Angle = 90,
							Pivot = { 0, -0.16 },
							PivotOffset = { 0, 0 },
						},
					},
				},
			},
		},
	},
}