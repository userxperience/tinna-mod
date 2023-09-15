dofile("ui/uihelper.lua")
dofile("scripts/type.lua")

table.insert(Sprites, ButtonSprite("hud-rollingthunder-icon", "HUD/HUD-rollingthunder",
									nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Sprites, ButtonSprite("hud-launchsite-icon", "HUD/HUD-launchsite",
		nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Sprites, ButtonSprite("hud-cram-icon", "HUD/HUD-cram",
		nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Sprites, ButtonSprite("hud-lobber-icon", "HUD/HUD-lobber",
		nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Sprites, ButtonSprite("hud-gateway-icon", "HUD/HUD-gateway",
		nil, ButtonSpriteBottom, nil, nil, path))

table.insert(Weapons, IndexOfWeapon("howitzer") + 1,
		{
			Enabled = true,
			SaveName = "rollingthunder",
			FileName = path .. "/weapons/rollingthunder.lua",
			Icon = "hud-rollingthunder-icon", --bottom HUD (weapon list)
			GroupButton = "hud-group-rocket", --top HUD (weapon groups)
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
			MaxSpotterAssistance = 0.4,
			MaxUpAngle = StandardMaxUpAngle,
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
			Icon = "hud-launchsite-icon",
			FileName = path .. "/weapons/launchsite.lua",

			GroupButton = "hud-group-rocket",
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
			MaxSpotterAssistance = 0.4,
			MaxUpAngle = StandardMaxUpAngle,
			MaxWeaponGroupSize = 3,
			BuildOnGroundOnly = false,
			SelectEffect = "ui/hud/weapons/ui_weapons",

			CompatibleGroupTypes =
			{
				--"cannon",
				--"cannon20mm",
			},
		})

table.insert(Weapons, IndexOfWeapon("firebeam") - 1,
		{
			Enabled = true,
			SaveName = "cram",
			FileName = path .. "/weapons/cram.lua",
			Icon = "hud-cram-icon",
			GroupButton = "hud-group-flak",
			Detail = "hud-detail-flak",
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
			MaxSpotterAssistance = 0.4,
			MaxUpAngle = StandardMaxUpAngle,
			BuildOnGroundOnly = false,
			SelectEffect = "ui/hud/weapons/ui_weapons",
			MaxWeaponGroupSize = 1,
			PopulationCap = 1,
			CompatibleGroupTypes =
			{
			},
		})

table.insert(Weapons, IndexOfWeapon("mortar") + 1,
		{
			Enabled = true,
			SaveName = "lobber",
			FileName = path .. "/weapons/lobber.lua",
			Icon = "hud-lobber-icon",
			GroupButton = "hud-group-rocket",
			Prerequisite = "workshop",
			BuildTimeComplete = 25.0,
			ScrapPeriod = 5,
			MetalCost = 500,
			EnergyCost = 2000,
			MetalRepairCost = 100,
			EnergyRepairCost = 1000,
			MetalReclaimMin = 0.15,
			MetalReclaimMax = 0.4,
			EnergyReclaimMin = 0.15,
			EnergyReclaimMax = 0.45,
			MaxSpotterAssistance = 0.4,
			MaxUpAngle = StandardMaxUpAngle,
			MaxWeaponGroupSize = 3,
			BuildOnGroundOnly = false,
			SelectEffect = "ui/hud/weapons/ui_weapons",

			CompatibleGroupTypes =
			{
			},
		})

table.insert(Weapons, IndexOfWeapon("sniper") + 1,
		{
			RequiresSpotterToFire = true,
			MaxSpotterAssistance = 0,
			MaxUpAngle = 90,
			BuildTimeComplete = 2,
			RequiresLand = true,
			Icon = "hud-missile-icon",
			ScrapPeriod = 2,
			MetalRepairCost = 231.00001525879,
			Enabled = true,
			AlignToCursorNormal = false,
			Detail = "hud-detail-missile",
			AnimationScript = "weapons/missilelauncher_anim.lua",
			GroupButton = "hud-group-missile",
			FileName = path .. "/weapons/gateway.lua",
			SelectEffect = "ui/hud/weapons/ui_weapons",
			MetalCost = 700,
			EnergyCost = 4500,
			SaveName = "gateway",
			CompatibleGroupTypes =
			{
				[1] = "missile",
				[2] = "missileinv",
				[3] = "missile2",
				[4] = "missile2inv",
				[5] = "subswarm",
				[6] = "sublauncher",
			},

			SpotterFactor = 0,
			EnergyRepairCost = 1250,
			InvertedType = "missile2inv",
			BuildOnGroundOnly = true,
		})


--table.insert(Weapons, IndexOfWeapon("sniper") - 1,
--		{
--			Enabled = false,
--			SaveName = "gatewayportal",
--			FileName = path .. "/weapons/gatewayportal/gatewayportal.lua",
--			--Icon = "hud-sbdrunklaser-icon",
--			GroupButton = "hud-group-laser",
--			--Detail = "hud-detail-sbdrunklaser",
--			Prerequisite = "upgrade",
--			BuildTimeComplete = 0.0001,
--			ScrapPeriod = 0.0001,
--			MetalCost = 500,
--			EnergyCost = 5000,
--			MetalRepairCost = 15,
--			EnergyRepairCost = 250,
--			MetalReclaimMin = 0.25,
--			MetalReclaimMax = 0.5,
--			EnergyReclaimMin = 0.1,
--			EnergyReclaimMax = 0.5,
--			MaxSpotterAssistance = 0,
--			MaxUpAngle = StandardMaxUpAngle,
--			dlc2_BuildAnywhere = true,
--			BuildOnGroundOnly = true,
--			SelectEffect = "ui/hud/weapons/ui_weapons",
--		})
--
--
--local gatewayportal1 = FindWeapon("gatewayportal")
--if gatewayportal1 then
--	table.insert(Weapons,
--			InheritType(FindWeapon("gatewayportal"),nil,
--					{
--						SaveName = "gatewayportal1",
--						FileName = path .. "/weapons/gatewayportal/gatewayportal1.lua",
--						AnimationScript = path .. "/weapons/gatewayportal/animationscript1.lua",
--					}
--			)
--	)
--end
--
--local gatewayportal2 = FindWeapon("gatewayportal")
--if gatewayportal2 then
--	table.insert(Weapons,
--			InheritType(FindWeapon("gatewayportal"),nil,
--					{
--						SaveName = "gatewayportal2",
--						FileName = path .. "/weapons/gatewayportal/gatewayportal2.lua",
--						AnimationScript = path .. "/weapons/gatewayportal/animationscript2.lua",
--					}
--			)
--	)
--end