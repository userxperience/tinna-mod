dofile("ui/uihelper.lua")
dofile("scripts/type.lua")
--sprite Table for HUD
--hullbreaker

table.insert(Sprites, ButtonSprite("hud-rollingthunder-icon", "HUD/HUD-rollingthunder",
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
			MetalCost = 900,
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