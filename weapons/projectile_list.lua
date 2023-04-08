dofile("scripts/type.lua")

stop = { Effect = nil, Projectile = { Count = 0, Type = "mortar", Speed = 0, StdDev = 0 }, Splash = false, Terminate = true, }
--"stop" is an example for an age effect, it currently only removes the host projectile :P


table.insert(Projectiles,
		{
			SaveName = "rollingthunderrocket",

			ProjectileType = "mortar", -- necessary to make a trail
			ProjectileSprite = path .."/effects/media/rollingthunderprojectile",
			ProjectileSpriteMipMap = true,
			DrawBlurredProjectile = false, --higher speeds will stretch the sprite
			AntiAirHitpoints = 10,
			ProjectileMass = 16,
			ProjectileDrag = -1, --drag, negative value will make projectile accelerate
			ProjectileIncendiary = true,
			AlwaysIncendiary = true, --use when incendiary projectiles don't work right just in case xD
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
			ProjectileShootDownRadius = 50, --big radius
			Impact = 200000,
			SpeedIndicatorFactor = 1,
			ProjectileDamage = 200, --bracing has 150 HP, armor has 400 HP
			WeaponDamageBonus = 100, --300 damage to weapons. That's almost 3 sniper shots
			DeflectedByTerrain = false, --set to true if you want it to bounce around the map :P
			Gravity = 500,
			MaxAge = 60,
			TrailEffect = path .. "/effects/rollingthunderprojectiletrail.lua", --custom trail effect

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
			{},
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
	crambullet.Gravity = 500
	crambullet.ProjectileDrag = 30 --drag, negative value will make projectile accelerate
	crambullet.ProjectileMass = 16
	crambullet.DrawBlurredProjectile = true
	crambullet.Projectile =
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
end
table.insert(Projectiles, crambullet)

