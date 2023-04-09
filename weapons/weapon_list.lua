dofile("ui/uihelper.lua")
dofile("scripts/type.lua")
--sprite Table for HUD

table.insert(Sprites, ButtonSprite("hud-rollingthunder-icon", "HUD/HUD-rollingthunder",
									nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Sprites, ButtonSprite("hud-launchsite-icon", "HUD/HUD-launchsite",
		nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Sprites, ButtonSprite("hud-cram-icon", "HUD/HUD-cram",
		nil, ButtonSpriteBottom, nil, nil, path))

table.insert(Weapons, IndexOfWeapon("howitzer") + 1,
		{
			Enabled = true,
			SaveName = "rollingthunder",
			FileName = path .. "/weapons/rollingthunder.lua",
			Icon = "hud-rollingthunder-icon", --bottom HUD (weapon list) --TODO: add better custom HUD button
			GroupButton = "hud-group-rocket", --top HUD (weapon groups)
			--Detail = "hud-detail-rollingthunder", --left HUD (cost preview)
			Prerequisite = "munitions",
			BuildTimeComplete = 40.0,
			ScrapPeriod = 5,
			MetalCost = 1200,
			EnergyCost = 2000,
			MetalRepairCost = 100,
			EnergyRepairCost = 1000,
			MetalReclaimMin = 0.15,
			MetalReclaimMax = 0.4,
			EnergyReclaimMin = 0.15,
			EnergyReclaimMax = 0.45,
			MaxSpotterAssistance = 0.4, -- great benefit from spotters
			MaxUpAngle = StandardMaxUpAngle, --add *2.5, for steeper angles
			MaxWeaponGroupSize = 3,
			BuildOnGroundOnly = false,
			SelectEffect = "ui/hud/weapons/ui_weapons",

			CompatibleGroupTypes =
			{
			},
		})

table.insert(Weapons, IndexOfWeapon("howitzer") + 1,
		{
			Enabled = true,
			SaveName = "launchsite",
			Icon = "hud-launchsite-icon", --bottom HUD (weapon list)
			FileName = path .. "/weapons/launchsite.lua",

			GroupButton = "hud-group-rocket", --top HUD (weapon groups)
			--Detail = "hud-detail-rollingthunder", --left HUD (cost preview)
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
			MaxUpAngle = StandardMaxUpAngle, --add *2.5, for steeper angles
			MaxWeaponGroupSize = 3,
			BuildOnGroundOnly = false,
			SelectEffect = "ui/hud/weapons/ui_weapons",

			CompatibleGroupTypes =
			{ --can be grouped with cannons and 20mm cannons
				--"cannon",
				--"cannon20mm",
			},
		})

table.insert(Weapons, IndexOfWeapon("firebeam") - 1,
		{
			Enabled = true,
			SaveName = "cram",
			FileName = path .. "/weapons/cram.lua",
			Icon = "hud-cram-icon", --bottom HUD (weapon list)
			GroupButton = "hud-group-flak", --top HUD (weapon groups)
			Detail = "hud-detail-flak", --left HUD (cost preview)
			Prerequisite = "factory",
			BuildTimeComplete = 40.0,
			ScrapPeriod = 5,
			MetalCost = 500,
			EnergyCost = 5000,
			MetalRepairCost = 100,
			EnergyRepairCost = 1000,
			MetalReclaimMin = 0.15,
			MetalReclaimMax = 0.4,
			EnergyReclaimMin = 0.15,
			EnergyReclaimMax = 0.45,
			MaxSpotterAssistance = 0.4, -- great benefit from spotters
			MaxUpAngle = StandardMaxUpAngle, --add *2.5, for steeper angles
			BuildOnGroundOnly = false,
			SelectEffect = "ui/hud/weapons/ui_weapons",
			MaxWeaponGroupSize = 1,
			PopulationCap = 1,
			CompatibleGroupTypes =
			{
			},
		})