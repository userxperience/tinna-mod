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

WeaponMass = 90
HitPoints = 18000000
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
Projectile = "gatewaylasermain"

ReloadTime = 0.001
MinFireSpeed = 10000.0
MaxFireSpeed = 10000.0
MinFireRadius = 600.0
MaxFireRadius = 1200.0
MinFireAngle = -35
MaxFireAngle = 35
BeamDuration = 4.0
EnergyFireCost = 1500/BeamDuration
BeamEndEffectTime = 2.5
BeamThicknessMultiplier = 1.0
BeamDamageMultiplier = 1.0
BeamPenetrationRotationThreshold = 99999
BeamPenetrationDistanceThreshold = 99999

Sprites =
{
	{
		Name = "gatewayportal-base",
		States =
		{
			Normal = { Frames = { { texture = path .. "/weapons/gatewayportal/base.tga" }, mipmap = true, }, },
			Idle = Normal,
		},
	},
	{
		Name = "gatewayportal-head",
		States =
		{
			Normal = { Frames = { { texture = path .. "/weapons/gatewayportal/head.tga" }, mipmap = true, }, },
			Idle = Normal,
		},
	},
}

Root =
{
	Name = "Laser",
	Angle = 0,
	Pivot = { 0.00, -0.43 },
	PivotOffset = { 0, 0 },
--	PivotOffset = { -0.15, 0 },
	Sprite = "gatewayportal-base",
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
					Sprite = "gatewayportal-head",
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