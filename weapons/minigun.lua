dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbStandard2", "context/HUD-lead", nil, nil, nil, nil, path)) --TODO: remove reference to context/HUD-lead
if not dlc2_Ammunition then dlc2_Ammunition = 
	{
		{
			Sprite = "hud-ammo-sbStandard2",
			StringId = "Weapon.ammo_sbStandard",
		}
	} 
end