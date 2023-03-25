table.insert(Sprites, ButtonSprite("hud-tech_silo-icon", "HUD/HUD-tech_silo", nil, ButtonSpriteBottom, nil, nil, path)) --HUD sprites
table.insert(Sprites, DetailSprite("hud-detail-tech_silo", "HUD-Details-tech_silo", path)) --Detail on the left side of the HUD
table.insert(Sprites, ButtonSprite("hud-upgrade_loan", "context/upgrade_loan", nil, nil, nil, nil, path)) --Button for upgrades

table.insert(Devices, IndexOfDevice("workshop"), --where to find the new device
{
	Enabled = true, --set to false to disable. Default is true
	SaveName = "tech_silo", --name within the files
	FileName = path .. "/devices/tech_silo.lua", --where to find the file to define what the device is
	Icon = "hud-tech_silo-icon", --HUD pictures
	Detail = "hud-detail-tech_silo", --detail picture
	BuildTimeComplete = 120, --seconds until build
	ScrapPeriod = 10, --seconds until deleted
	MetalCost = 900, --build cost. Used to calculate sellback, not used for actual cost if the device is an upgrade
	EnergyCost = 6000,
	MetalRepairCost = 250, --total cost of repair from 1 HP to max HP
	EnergyRepairCost = 1500,
	MetalReclaimMin = 0.45, --multiplier of "MetalCost" of how much metal is regained from deleting. 1=100%
	MetalReclaimMax = 0.8, --max means if it's at max HP, min means if it's at 1 HP
	EnergyReclaimMin = 0.2,
	EnergyReclaimMax = 0.6, --make sure to have max greater than min, but never above "1"
	MaxUpAngle = StandardMaxUpAngle, --input 90 if you want to be able to put your device at ANY ANGLE
	PopulationCap = 1, --how many are allowed to be build (1 for tech)
	BuildOnGroundOnly = true, --true if mine, false if build on bracing
	IgnitePlatformOnDestruct = true, --not really importand, can be defined in the devicename.lua file
	SelectEffect = "ui/hud/technology/ui_technology", --what sound it makes when selecting
	Tech = true, --device(false) or tech(true)
})

local mine = FindDevice("mine") --finds the "mine" from the code
if mine then --adds something to specifically the mine
    table.insert(mine.Upgrades, --adds an entry to the mines upgrade table. Only works of "mine" currently has upgrades
        {
            Enabled = true, --true = can be used, set to false if you want to deactivate the upgrade without removing the code
            SaveName = "Loan_mine", --name of the device you upgrade into
            MetalCost = -200, --metal cost of the upgrade, independant to the actual device cost. Make sure you keep that in mind to match them correctly
			EnergyCost = 300,
			Button = "hud-upgrade_loan", --only use if you have designed your own upgrade button
        })
end --ends "if mine then"

table.insert(Devices, IndexOfDevice("mine") - 1,
{
	Enabled = false, --false because upgrade
	SaveName = "Loan_mine",
	FileName = path.. "/devices/Loan_mine.lua", --it's the same device as a mine, but has a differant save name (and thus upgrades)
	Icon = "hud-mine-icon", --you can use base HUD sprites, recommended for beginners
	Detail = "hud-detail-mine",
	BuildTimeComplete = 60.0, --240 metal is lost during the upgrade time (4 per second)
	ScrapPeriod = 18,
	MetalCost = 300,
	EnergyCost = 2000,
	MetalRepairCost = 200,
	EnergyRepairCost = 1500,
	MetalReclaimMin = 0.25,
	MetalReclaimMax = 0.5,
	EnergyReclaimMin = 0.1,
	EnergyReclaimMax = 0.5,
--	MaxUpAngle = 30, --max slant the ground can have that you build this on. Because it's an upgrade, it doesn't matter.
	BuildOnOreOnly = true, --needs metal ground to be build, it's an upgrade so its place is already defined, so BuildOnGroundOnly also works :)
	AlignToCursorNormal = false,
	SelectEffect = "ui/hud/devices/ui_devices",

	Upgrades = --adds an upgrade table to your device directly
	{
		["mine2"] = --the upgrade is called "mine2"
		{
			Enabled = true,
			SaveName = "mine2", --level 2 base mine
			Prerequisite = "upgrade", --requires the upgrade centre (its literally called "upgrade")
			MetalCost = 75,
			EnergyCost = 2500,
			--standart upgrade button
		},
		["Loan_mine"] =
		{
			Enabled = true,
			SaveName = "Loan_mine", --can loan again
			MetalCost = -200,
			EnergyCost = 300,
			Button = "hud-upgrade_loan", --custom upgrade button
		},
	},
})