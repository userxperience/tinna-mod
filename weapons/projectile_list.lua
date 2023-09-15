dofile("scripts/type.lua")

table.insert(Projectiles,
		{
			SaveName = "rollingthunderrocket",

			ProjectileType = "mortar",
			ProjectileSprite = path .."/effects/media/rollingthunderprojectile",
			ProjectileSpriteMipMap = true,
			DrawBlurredProjectile = false,
			AntiAirHitpoints = 10,
			ProjectileMass = 16,
			ProjectileDrag = -1,
			ProjectileIncendiary = true,
			AlwaysIncendiary = true,
			DeflectedByShields = false,
			ExplodeOnTouch = true,
			CanBeShotDown = true,

			ProjectileDamage = 200.0,
			ProjectileSplashDamage = 30.0,
			ProjectileSplashDamageMaxRadius = 200.0,
			ProjectileSplashMaxForce = 75000,
			IgnitesBackgroundMaterials = true,
			IgnitesBackgroundMaterialsPassing = true,

			ProjectileThickness = 10,
			ProjectileShootDownRadius = 50,
			Impact = 200000,
			SpeedIndicatorFactor = 1,
			ProjectileDamage = 200,
			WeaponDamageBonus = 100,
			Gravity = 500,
			MaxAge = 60,
			TrailEffect = path .. "/effects/rollingthunderprojectiletrail.lua",

			Projectile =
			{
				Root =
				{
					Name = "rollingthunderprojectile",
					Angle = 0,
					Pivot = { 0, 0.35 },

					ChildrenInFront =
					{
						{
							Name = "Flame",
							Angle = 0,
							Offset = { 0, 0.8 },
							Pivot = { 0, 0.1 },
							PivotOffset = { 0, 0 },
							Sprite = "missile_tail",
						},
					},
				}
			},

			Effects =
			{
				ImpactDevice =
				{
					["sandbags"] = "effects/bullet_sandbag_hit.lua",
				},
				Impact =
				{
					["device"] = "mods/weapon_pack/effects/rocket_structure_hit.lua",
					["antiair"] = "mods/weapon_pack/effects/rocket_structure_hit.lua",
					["foundations"] = "mods/weapon_pack/effects/rocket_structure_hit.lua",
					["rocks01"] = "mods/weapon_pack/effects/rocket_structure_hit.lua",
					["shield"] = "mods/weapon_pack/effects/rocket_structure_hit.lua",
					["default"] = "mods/weapon_pack/effects/rocket_structure_hit.lua",
				},
				Deflect =
				{
					["bracing"] = "effects/bullet_bracing_hit.lua",
					["backbracing"] = "effects/bullet_bracing_hit.lua",
					["armour"] = "effects/bullet_armor_ricochet.lua",
					["door"] = "effects/bullet_armor_ricochet.lua",
					["shield"] = "effects/energy_shield_ricochet.lua",
				},
			},
			DamageMultiplier =
			{
			},
		})



local kirovbomb = DeepCopy(FindProjectile("bomb"))
if kirovbomb then
	kirovbomb.SaveName = "kirovbomb"
	kirovbomb.ProjectileDamage = 0
	kirovbomb.ProjectileSplashDamage = 400.0
	kirovbomb.ProjectileSplashDamageMaxRadius = 250.0
	kirovbomb.ProjectileSplashMaxForce = 75000
	kirovbomb.IgnitesBackgroundMaterials = false
	kirovbomb.IgnitesBackgroundMaterialsPassing = false
	kirovbomb.MagneticModifierFriendly = 0.03
	kirovbomb.AlwaysIncendiary = true
	kirovbomb.Effects.Impact =
	{
		["default"] = "mods/weapon_pack/effects/rocket_structure_hit.lua",
	}
	kirovbomb.Projectile =
	{
		Root =
		{
			Name = "Root",
			Angle = 90,
			Sprite = path .."/effects/media/kirovbombprojectile",
			PivotOffset = {0, 0},
			Scale = 4,
		}
	}
	table.insert(Projectiles, kirovbomb)
end
--credit to SamsterBirdies for kirov code
local kirov = DeepCopy(FindProjectile("nighthawk")) --TODO: display kirov HP somehow
if kirov then
	kirov.AlwaysIncendiary = true
	kirov.SaveName = "kirov"
	kirov.AntiAirHitpoints = 2500 --cannon does 700 damage plus 40 slash damage
	kirov.MaxAge = 50000
	kirov.dlc2_Bombs = nil
	kirov.TrailEffect = path .. "/effects/kirovprojectiletrail.lua"
	kirov.Projectile =
	{
		Root =
		{
			Name = "Root",
			Angle = -90,
			Sprite = path .. "/weapons/kirov/base.png",
			PivotOffset = {0, 0},
			Scale = 1.1,
		}
	}
	kirov.Effects.Age = { ['t40'] = { Effect = nil, Projectile = { Count = 1, Type = "kirovP2", StdDev = 0 }, Terminate = true, Splash = false,}}
	--phase 2, bomb dropping
	local kirovP2 = DeepCopy(kirov)
	if kirovP2 then
		kirovP2.SaveName = "kirovP2"
		kirovP2.Effects.Impact =
		{
			['default'] = "mods/dlc2/effects/nighthawk_explode.lua",
			['antiair'] = "mods/dlc2/effects/nighthawk_explode.lua",
		}
		--age effects
		kirovP2.Effects.Age = {}
		local bombCount = 10
		local bombPeriod = 1000
		for i = 0, bombPeriod*bombCount, bombPeriod do
			kirovP2.Effects.Age['t' .. tostring(i)] = { Effect = "mods/dlc2/effects/bomb_release.lua", Projectile = { Count = 1, Type = "kirovbomb", StdDev = 0, Speed = 1}, Terminate = false, Splash = false,}
		end
		kirovP2.Effects.Age['t' .. tostring(1000*(bombCount + 1))] = {Effect = path .. "/effects/kirov_bank.lua", Terminate = true, Splash = false,}
	end
	table.insert(Projectiles, kirovP2)
	table.insert(Projectiles, kirov)
end
 --TODO: add kirov crashing

local crambullet = DeepCopy(FindProjectile("machinegun"))
if crambullet then
	crambullet.SaveName = "crambullet"
	crambullet.Gravity = 1000
	crambullet.ProjectileDrag = 10
	crambullet.ProjectileMass = 16
	crambullet.DrawBlurredProjectile = true
	crambullet.MaxAge = 2.5
	crambullet.DamageMultiplier =
	{	{	Direct = 0,	Fire = 0,	SaveName = "reactor",	Splash = 0,	},
	{	SaveName = "bracing",	Direct = 0.2,},
	{	SaveName = "armour",	Direct = 0.2,},
	{	SaveName = "door",	Direct = 0.2,},
	{	SaveName = "device", Direct = 0.2 },
	{	SaveName = "weapon", Direct = 0.2 },
	{	SaveName = "portal",	Direct = 0.2,},	}
end
table.insert(Projectiles, crambullet)




lobbershellbaseimpact = { Effect = "effects/mortar_air_burst.lua", Projectile = { Count = 1, Type = "mortar2", Speed = 8000, StdDev = 0 }, Splash = false, Offset = 0, Terminate = true }
lobbershellairdetonation = { Effect = path .. "/effects/lobbershellairdetonation.lua", Projectile = nil, Terminate = true, Splash = false,} --projectiles are released with script

local lobbershell = DeepCopy(FindProjectile("cannon"))
if lobbershell then
	lobbershell.SaveName = "lobbershell"
	lobbershell.ProjectileMass = 16
	lobbershell.ProjectileDrag = 0.5
	lobbershell.Impact = 20000
	lobbershell.DeflectedByShields = false
	lobbershell.PassesThroughMaterials = false
	lobbershell.ProjectileThickness = 12.5
	lobbershell.BeamTileRate = 0.02
	lobbershell.BeamScrollRate = 0.0
	lobbershell.ProjectileDamage = 0.0
	lobbershell.ProjectileSplashDamage = 0.0
	lobbershell.ProjectileSplashDamageMaxRadius = 165.0
	lobbershell.ProjectileSplashMaxForce = 10000
	lobbershell.CanBeShotDown = true
	lobbershell.SpeedIndicatorFactor = 0.25
	lobbershell.DrawBlurredProjectile = false
	lobbershell.Projectile =
	{
	Root =
	{
	Name = "Root",
	Angle = 90,
	Sprite = path .. "/effects/media/lobbershellprojectile.tga",
	PivotOffset = {0, 0},
	Scale = 4,
	}
	}


lobbershell.Effects =
	{
	Impact =
	{
	["device"] = lobbershellbaseimpact,
	["antiair"] = lobbershellbaseimpact,
	["foundations"] = lobbershellbaseimpact,
	["rocks01"] = lobbershellbaseimpact,
	["shield"] = lobbershellbaseimpact,
	["default"] = lobbershellbaseimpact,
	},
	AirDestroy =
	{
	["shield1"] = lobbershellbaseimpact,
	},
	Deflect =
	{
	["armour"] = "effects/armor_ricochet.lua",
	["door"] = "effects/armor_ricochet.lua",
	["shield"] = "effects/energy_shield_ricochet.lua",
	},
	Age =
	{
		['t40'] = lobbershellairdetonation
	}
	}

end
table.insert(Projectiles, lobbershell)

local lobberbomblet = DeepCopy(FindProjectile("mortar2"))
if lobberbomblet then
	lobberbomblet.SaveName = "lobberbomblet"
	lobberbomblet.ProjectileMass = 500
	lobberbomblet.ProjectileDrag = 300
	lobberbomblet.ProjectileDamage = 5
	lobberbomblet.ProjectileSplashDamage = 10
	lobberbomblet.Impact = 0
	lobberbomblet.TrailEffect = path .. "/effects/lobberbomblettrail.lua"

	lobberbomblet.DamageMultiplier =
	{	{	Direct = 1,	Fire = 1,
			  SaveName = "reactor",	Splash = 1,	},
		 {	SaveName = "weapon", Direct = 2 },
		 {	SaveName = "portal",	Direct = 2,},	}

	lobberbomblet.Effects = {
		Impact = {
			["default"] = "effects/impact_medium.lua",
		}
	}
    end
    table.insert(Projectiles, lobberbomblet)
--
--local gatewaymissile = DeepCopy(FindProjectile("missile2"))
--if gatewaymissile then
--	gatewaymissile.SaveName = "gatewaymissile"
--	Missile =
--	{
--		ThrustAngleExtent = 90,
--		ErraticAngleExtentStdDev = 0.01,
--		ErraticAngleExtentMax = 0.01,
--		MaxSteerPerSecond = 500,
--		MaxSteerPerSecondErratic = 0.001,
--		ErraticAnglePeriodMean = 0,
--		ErraticAnglePeriodStdDev = 0.001,
--		RocketThrust = 10000000,
--		RocketThrustChange = 6000,
--		ErraticThrust = 1.4,
--		CruiseTargetDistance = 300,
--		CruiseTargetDuration = .5,
--		TargetRearOffsetDistance = 100000,
--		MinTargetUpdateDistance = 10,
--}
--	gatewaymissile.Effects =
--	{
--		Age =
--		{
--			['t400'] = { Effect = nil, Projectile = nil, Terminate = true, Splash = false,}
--		}
--	}
--end
--table.insert(Projectiles, gatewaymissile)
--
--
--
--local gatewaylasermain = DeepCopy(FindProjectile("laser"))
--if gatewaylasermain then
--	gatewaylasermain.SaveName = "gatewaylasermain"
--
--end
--table.insert(Projectiles, gatewaylasermain)
--
--
--local gatewaylaser2 = DeepCopy(FindProjectile("firebeam"))
--if gatewaylaser2 then
--	gatewaylaser2.SaveName = "gatewaylaser2"
--end
--table.insert(Projectiles, gatewaylaser2)
