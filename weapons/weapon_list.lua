dofile("ui/uihelper.lua")
dofile("scripts/type.lua")
--sprite Table for HUD
--hullbreaker
table.insert(Sprites, ButtonSprite("hud-group-hullbreaker", "groups/Group-hullbreaker",
GroupButtonSpriteBottom, GroupButtonSpriteBottom, nil, nil, path))
table.insert(Sprites, ButtonSprite("hud-hullbreaker-icon", "HUD/HUD-hullbreaker",
									nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Sprites, DetailSprite("hud-detail-hullbreaker", "HUD-Details-hullbreaker", path))

	table.insert(Weapons, IndexOfWeapon("cannon") - 1,
	{
		Enabled = true,
		SaveName = "hullbreaker",
		FileName = path .. "/weapons/hullbreaker.lua",
		Icon = "hud-hullbreaker-icon", --bottom HUD (weapon list)
		GroupButton = "hud-group-hullbreaker", --top HUD (weapon groups)
		Detail = "hud-detail-hullbreaker", --left HUD (cost preview)
		Prerequisite = "arsenal_lab",
		BuildTimeComplete = 40.0,
		ScrapPeriod = 5,
		MetalCost = 500,
		EnergyCost = 2000,
		MetalRepairCost = 100,
		EnergyRepairCost = 1000,
		MetalReclaimMin = 0.15,
		MetalReclaimMax = 0.4,
		EnergyReclaimMin = 0.15,
		EnergyReclaimMax = 0.45,
		MaxSpotterAssistance = 0.4, -- great benefit from spotters
		MaxUpAngle = StandardMaxUpAngle*2.5, --steep angles possible
		MaxWeaponGroupSize = 2,
		BuildOnGroundOnly = false,
		SelectEffect = "ui/hud/weapons/ui_weapons",

		CompatibleGroupTypes =
		{ --can be grouped with cannons and 20mm cannons if you want that for some reason xD
			"cannon",
			"cannon20mm",
		},
	})

table.insert(Weapons, IndexOfWeapon("cannon") + 1,
		{
			Enabled = true,
			SaveName = "rollingthunder.lua",
			FileName = path .. "/weapons/rollingthunder.lua",
			Icon = "hud-hullbreaker-icon", --bottom HUD (weapon list)
			GroupButton = "hud-group-hullbreaker", --top HUD (weapon groups)
			Detail = "hud-detail-hullbreaker", --left HUD (cost preview)
			Prerequisite = "munitions",
			BuildTimeComplete = 40.0,
			ScrapPeriod = 5,
			MetalCost = 500,
			EnergyCost = 2000,
			MetalRepairCost = 100,
			EnergyRepairCost = 1000,
			MetalReclaimMin = 0.15,
			MetalReclaimMax = 0.4,
			EnergyReclaimMin = 0.15,
			EnergyReclaimMax = 0.45,
			MaxSpotterAssistance = 0.4, -- great benefit from spotters
			MaxUpAngle = StandardMaxUpAngle*2.5, --steep angles possible
			MaxWeaponGroupSize = 2,
			BuildOnGroundOnly = false,
			SelectEffect = "ui/hud/weapons/ui_weapons",

			CompatibleGroupTypes =
			{ --can be grouped with cannons and 20mm cannons if you want that for some reason xD
				"cannon",
				"cannon20mm",
			},
		})