dofile("scripts/type.lua")
--globals
SBBA_PATH = path

table.insert(Sprites, ButtonSprite("hud-kirov-icon", "HUD/HUD-kirov", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("ammo_nighthawk") + 1,
        InheritType(FindDevice("ammo_nighthawk"),nil,
                {
                    SaveName = "ammo_kirov",
                    FileName = path .. "/devices/ammo_kirov.lua",
                    dlc2_BuildQueue = "dlc2_runway",
                    Icon = "hud-kirov-icon",
                    BuildTimeComplete = 85,
                    MetalCost = 600,
                    EnergyCost = 6000,
                    Prerequisite = "munitions",
                    Enabled = true,
                }
        )
)