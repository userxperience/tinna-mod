Sprites = {}
ConsumeEffect = "mods/dlc2/effects/ammo_consumption.lua"
ConstructEffect = "effects/device_upgrade.lua"
CompleteEffect = "effects/device_complete.lua"
HitPoints = 300
Scale = 1
SelectionWidth = 160
SelectionHeight = 80
SelectionOffset = {	0, -80 }
Root = --kirov ammo structure texture
{
	Sprite = path .. "/devices/ammo/kirovammo.png",
	Name = "ammo_kirov",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.5},
	PivotOffset = {0,0}
}


dofile('ui/uihelper.lua')
--table.insert(Sprites, ButtonSprite("hud-ammo-kirov", "HUD/HUD-kirov", nil, nil, nil, nil, path)) TODO: add custom kirov ammo icon in firing arc
table.insert(Sprites,
		{
			Name = "runwaykirov",
			States =
			{
				Normal = { Frames = { { texture = path .. "/weapons/kirov/baseRunway.png" }, mipmap = true, }, },
				Idle = Normal,
			},
		}
)
dlc2_Ammunition =
{
	{
		AmmoSprites = { { Node = "Head", Sprite = "runwaykirov", }, },
		--Sprite = "hud-ammo-kirov",
		Devices = { {Name = "ammo_kirov", Consume = true}, },
		Weapons = { "launchsite" },
		ReloadTime = 3,
		Projectile = "kirov",
	}
}