dofile("scripts/type.lua")

stop = { Effect = nil, Projectile = { Count = 0, Type = "mortar", Speed = 0, StdDev = 0 }, Splash = false, Terminate = true, }
--"stop" is an example for an age effect, it currently only removes the host projectile :P

machinegun = FindProjectile("machinegun") --you can change existing projectiles like this
if machinegun then
	machinegun.AntiAirDamage = 6 --changes the AntiAir Damage of the machinegun
	machinegun.AntiAirHitpoints = 5 --anti air HP system is currently only used for the howitzer and deckgun
	--anti air HP is a valuable system for modded projectiles :)
end

table.insert(Projectiles,
{
	SaveName = "repairshot",
	ProjectileType = "mortar", --type mortar is a better bullet type that allows for trails. Alternatives are: bullet, missile, beam
	ProjectileSprite = path .. "/effects/media/repairshot", --sprite for the projectile
	ProjectileSpriteMipMap = false, --for visuals
	DrawBlurredProjectile = false, --for visuals
	ProjectileMass = 10, --keep above 0. Multiplies with impact and helps determine if it's deflected by armor (non explosive only)
	ProjectileDrag = 0.1, --slows down while in the air
	ProjectileIncendiary = false, --allows for IncendiaryRadius when true
	IncendiaryRadiusHeated = 800, --Heat makes fire grow faster
	Impact = 10000, --makes the hit material shake
	DisableShields = false, --shields shut off when hit if true
	DeflectedByShields = false, --when false, impacts with shields, when true, deflects and deals no damage to shield
	PassesThroughMaterials = false, --ignores materials if yes
	ExplodeOnTouch = false, --Explosive projectiles can't penetrate through materials and collide with non explosive projectiles
--	ProjectileThickness = 10, --sprite size (only for type bullets)
	ProjectileShootDownRadius = 1, --hitbox of the projectile for projectile and beam collisions. See in sandbox with command \set projectile_wireframes 1
	ProjectileDamage = -50.0, --negative damage heals
	ProjectileSplashDamage = -50, --healing splash
	ProjectileSplashDamageMaxRadius = 800.0, --huge radius!
	ProjectileSplashMaxForce = 1000, --tiny shockwave, similar to Impact
	AntiAirHitpoints = 10, --could survive a machinegun shot if it were explosive
	SpeedIndicatorFactor = 0.25, --idk, maybe how the projectile stretches at certain speeds
	Gravity = 800, --Default gravity is 981 or 1000. Rockets have Gravity = 0
	TrailEffect = "mods/weapon_pack/effects/20mmcannon_trail.lua", --works only when Tons of Guns (ToG) is enabled

	Effects =
	{
		Impact =
		{
			["default"] = "effects/impact_light.lua", --standart effect, played when impacting material or device
		},	
		Deflect =
		{ --projectile doesn't reflect so this doesn't matter
			["armour"] = { Effect = "effects/armor_ricochet.lua" },
			["door"] = { Effect = "effects/armor_ricochet.lua" },
			["shield"] = { Effect = "effects/energy_shield_ricochet.lua" },
				-- examples of how to specialise reflection per material/ground surface (when DeflectedByTerrain = true)
				-- Deflect effects default to Terminate = false
				--["shield"] = { Effect = "effects/mortar_air_burst.lua", Reflect = true, SpeedLossFactor = 0 }, -- perfect reflection
				--["armour"] = { Effect = "effects/bullet_bracing_hit.lua", Reflect = false }, -- don't reflect, will cause damage and execute impact effect instead
				--["rocks01"] = { Effect = "effects/ground_hit.lua", Reflect = true, SpeedLossFactor = 0.99, VariationFactor = 1 }, -- customise reflection
				--["foundations"] = { Effect = "effects/ground_hit.lua", Terminate = true }, -- prevent reflection
		},
	},
	DamageMultiplier =
	{
		{ SaveName = "sandbags", Direct = 1.6, Splash = 1.6 }, --heals sandbags more
		{ SaveName = "machinegun", AntiAir = -2 }, --example for healing projectiles
		{ SaveName = "bracing", Direct = 1 }, -- specifics chosen first
		{ SaveName = "structure", Direct = 10 }, -- then category depending on what kind of thing it hits
		{ SaveName = "device", Direct = 0 },
		{ SaveName = "weapon", Direct = 2 },
		{ SaveName = "projectile", AntiAir = -1 }, -- it's possible to 'heal'
		{ SaveName = "default", Direct = 0.5 }, -- if not found then 1.0 is used
	},
})
--flamin :D
local repairshot = FindProjectile("repairshot")
if repairshot then
	repairshot.Effects.Impact["firebeam"] = { Effect = nil, Projectile = { Count = 1, Type = "flamingrepairshot", Speed = 0, StdDev = 0 }, Offset = 0, Terminate = true, }
end
table.insert(Projectiles,
{
	SaveName = "Metalpack", --check "scripts.lua" in the Template Mod for context ;)
	ProjectileType = "mortar",
	ProjectileSprite = path .."/effects/media/metalpack",
	ProjectileSpriteMipMap = false,
	DrawBlurredProjectile = false,
	ProjectileMass = 10,
	ProjectileDrag = 0.1,
	ProjectileIncendiary = false,
	IncendiaryRadiusHeated = 80,
	Impact = 10000,
	DisableShields = false,
	DeflectedByShields = false,
	PassesThroughMaterials = false,
	ExplodeOnTouch = false,
	ProjectileThickness = 2,
	ProjectileShootDownRadius = 1,
	BeamTileRate = 0.02,
	BeamScrollRate = 0.0,
	ProjectileDamage = 0.0,
	ProjectileSplashMaxForce = 1000, -- tiny shockwave
	AntiAirHitpoints = 10,
	SpeedIndicatorFactor = 0.25,
	Gravity = 800,

	TrailEffect = "mods/weapon_pack/effects/20mmcannon_trail.lua",

	Effects =
	{
		Impact =
		{

			["default"] = "effects/impact_light.lua",
		},	
		Deflect =
		{
			["armour"] = { Effect = "effects/armor_ricochet.lua" },
			["door"] = { Effect = "effects/armor_ricochet.lua" },
			["shield"] = { Effect = "effects/energy_shield_ricochet.lua" },
		},
	},
})
--flamin :D
local Metalpack = FindProjectile("Metalpack")
if Metalpack then
	Metalpack.Effects.Impact["firebeam"] = { Effect = nil, Projectile = { Count = 1, Type = "flamingMetalpack", Speed = 0, StdDev = 0 }, Offset = 0, Terminate = true, }
end
	table.insert(Projectiles,
	{
		SaveName = "hullbreaker",

		ProjectileType = "mortar", -- necessary to make a trail
		ProjectileSprite = path .."/effects/media/hullbreaker",
		ProjectileSpriteMipMap = true,
		DrawBlurredProjectile = true, --higher speeds will stretch the sprite
		AntiAirHitpoints = 50,
		ProjectileMass = 20,
		ProjectileDrag = -15, --ACCELERATES WHEN FLYING! :O
		ProjectileIncendiary = true,
		AlwaysIncendiary = true, --use when incendiary projectiles don't work right just in case xD
		DeflectedByShields = false,
		ExplodeOnTouch = false,
		ProjectileThickness = 10,
		ProjectileShootDownRadius = 75, --big radius
		Impact = 120000,
		ProjectileDamage = 200, --bracing has 150 HP, armor has 400 HP
		WeaponDamageBonus = 100, --300 damage to weapons. That's almost 3 sniper shots
		DeflectedByTerrain = false, --set to true if you want it to bounce around the map :P
		Gravity = 0, --0 grav
		MinAge = 1,
		MaxAge = 2, --tiny age never reached because of the age effect
		TrailEffect = path .."/effects/hullbreakertrail.lua", --custom trail effect
		Effects =
		{
			ImpactDevice =
			{
				["sandbags"] = "effects/bullet_sandbag_hit.lua",
			},
			Impact =
			{--releases a mortar on hit
				["default"] = { Effect = "effects/mortar_air_burst.lua", Projectile = { Count = 1, Type = "mortar", Speed = -300, StdDev = 0.1 }, Terminate = true, },
				["firebeam"] = { Effect = "effects/bullet_armor_ricochet.lua", Projectile = { Count = 1, Type = "flaminghullbreaker", Speed = 0, StdDev = 0 }, Terminate = true, }
			},--beam interactions can be placed in the Impact table. Also works with "laser" and "magnabeam"
			Deflect =
			{
				["bracing"] = "effects/bullet_bracing_hit.lua",
				["backbracing"] = "effects/bullet_bracing_hit.lua",
				["armour"] = "effects/bullet_armor_ricochet.lua",
				["door"] = "effects/bullet_armor_ricochet.lua",
				["shield"] = "effects/energy_shield_ricochet.lua",
			},
--			Penetrate =
--			{ --for an AP sniper situation ;)
--			},
			Age = 
			{ 
				t250 = { Effect = "effects/impact_light.lua", Projectile = { Count = 1, Type = "hullbreaker", Speed = 3000, StdDev = 0 }, Terminate = true, },
			}, --t1000 = 1 second. Every 250 ms this effect is played to reset the projectile. The speed here replaces the launch speed from the weapon :)
		},
		DamageMultiplier =
		{
			{ SaveName = "armour", Direct = 2, Splash = 1 }, --double damage to metal!
			{ SaveName = "door", Direct = 2, Splash = 1 }, --400 damage! Oneshots!
		},
	})
--local hullbreaker = FindProjectile("hullbreaker")
--if hullbreaker then
--	hullbreaker.Effects.Impact["firebeam"] = { Effect = "effects/bullet_armor_ricochet.lua", Projectile = { Count = 1, Type = "flaminghullbreaker", Speed = 0, StdDev = 0 }, Terminate = true, }
--end
table.insert(Projectiles,
{
	SaveName = "flamingrepairshot", --spawned at the firebeam interaction

	ProjectileType = "mortar",
	ProjectileSprite = path .."/effects/media/flamingrepairshot",
	ProjectileSpriteMipMap = false,
	DrawBlurredProjectile = false,
	ProjectileMass = 9,
	ProjectileDrag = 0.1,
	ProjectileIncendiary = true,
	IncendiaryRadius = 80,
	Impact = 10000,
	DisableShields = false,
	DeflectedByShields = false,
	PassesThroughMaterials = false,
	ExplodeOnTouch = false,
	ProjectileThickness = 14.20, --nice 420 lol
	ProjectileShootDownRadius = 1,
	BeamTileRate = 0.02,
	BeamScrollRate = 0.0,
	ProjectileDamage = -100.0,
	ProjectileSplashDamage = -100,
	ProjectileSplashDamageMaxRadius = 800.0,
	ProjectileSplashMaxForce = 1000, -- tiny shockwave
	AntiAirHitpoints = 10,
	SpeedIndicatorFactor = 0.25,
	Gravity = 750,
	TrailEffect = "mods/weapon_pack/effects/flaming_trail.lua", --standart flaming trail
	Effects =
	{
		Impact =
		{

			["default"] = "effects/impact_light.lua",
		},	
		Deflect =
		{
			["armour"] = { Effect = "effects/armor_ricochet.lua" },
			["door"] = { Effect = "effects/armor_ricochet.lua" },
			["shield"] = { Effect = "effects/energy_shield_ricochet.lua" },
		},
	},

	DamageMultiplier =
	{
		{ SaveName = "sandbags", Direct = 1.6, Splash = 1.6 },
	},
})
Metalpack = FindProjectile("Metalpack") --DEEPCOPY, alternate way to make a projectile
flamingMetalpack = DeepCopy(Metalpack) --"flamingMetalpack" is now a variable that copies the entire entrys from "Metalpack" in the projectile list
flamingMetalpack.SaveName = "flamingMetalpack" --Keep the SaveName equal to the variable to avoid confusion (for yourself)
flamingMetalpack.ProjectileIncendiary = true --remember that deepcopys don't use a "," after an entry
flamingMetalpack.IncendiaryRadius = 80 --everything can be changed, the rest is defaulted by the base projectile "Metalpack"
flamingMetalpack.MaxAge = 1 --projectile burns up after a second
flamingMetalpack.TrailEffect = "mods/weapon_pack/effects/flaming_trail.lua" --standart projectile
table.insert(Projectiles, flamingMetalpack) --adds the projectile, make sure to match the SaveName with your variable to avoid confusion.

table.insert(Projectiles,
{
	SaveName = "flaminghullbreaker", --example of a stronger and more useful projectile thanks to the firebeam

	ProjectileType = "mortar", -- necessary to make a trail
	ProjectileSprite = path .."/effects/media/flaminghullbreaker",
	ProjectileSpriteMipMap = true,
	DrawBlurredProjectile = true,

	AntiAirHitpoints = 20,
	ProjectileMass = 20,
	ProjectileDrag = -15,
	ProjectileIncendiary = true,
	AlwaysIncendiary = true,
	IncendiaryRadius = 100,
	DeflectedByShields = false,
	ExplodeOnTouch = false, --can penetrate through destroyed materials and devices
	ProjectileShootDownRadius = 75,
	Impact = 120000,
	ProjectileDamage = 200*1.5, --50% stronger
	WeaponDamageBonus = 100,
	SpeedIndicatorFactor = 0.05,
	DeflectedByTerrain = false,
	Gravity = 0,
	MinAge = 1,
	MaxAge = 2,

	TrailEffect = "mods/weapon_pack/effects/flaming_trail.lua",

	Effects =
	{
		ImpactDevice =
		{
			["sandbags"] = "effects/bullet_sandbag_hit.lua",
		},
		Impact =
		{
			["default"] = { Effect = "effects/mortar_air_burst.lua", Projectile = { Count = 1, Type = "flamingmortar2", Speed = -300, StdDev = 0.1 }, Terminate = true, },
		}, --stronger effect
		Deflect =
		{
			["bracing"] = "effects/bullet_bracing_hit.lua",
			["backbracing"] = "effects/bullet_bracing_hit.lua",
			["armour"] = "effects/bullet_armor_ricochet.lua",
			["door"] = "effects/bullet_armor_ricochet.lua",
			["shield"] = "effects/energy_shield_ricochet.lua",
		},
		Penetrate =
		{
			["bracing"] = "effects/bullet_bracing_hit.lua",
			["armour"] = "effects/bullet_armor_hit.lua",
			["door"] = "effects/bullet_armor_hit.lua",
			["shield"] = "effects/energy_shield_ricochet.lua",
		},
		Age = 
		{ 
			t175 = { Effect = "effects/impact_light.lua", Projectile = { Count = 1, Type = "flaminghullbreaker", Speed = 3500, StdDev = 0 }, Terminate = true, },
		}, --moves more often with a higher starting speed
	},
	DamageMultiplier =
	{
		{ SaveName = "armour", Direct = 1.6, Splash = 1 }, --still deals 400 damage to metal
		{ SaveName = "door", Direct = 1.6, Splash = 1 }, --basically deals better overall damage while keeping the same anti armor damage
	},
})--the end!
--SDG