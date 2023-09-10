dofile("scripts/type.lua")

table.insert(Devices, IndexOfDevice("mine") + 1,
        InheritType(FindDevice("mine"),nil,
                {
                    SaveName = "clauker",
                    FileName = path .. "/devices/clauker.lua",
                    Icon = "hud-derrick-icon",
                    BuildTimeComplete = 45,
                    MetalCost = 600,
                    EnergyCost = 3000,
                    Enabled = true,
                    Upgrades = {},
                }
        )
)