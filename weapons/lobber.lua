Scale = 1 --general size of the hitbox, ususally kept at 1
SelectionWidth = 125.0 --width of the hitbox. ~25 is a grid square
SelectionHeight = 65 --slightly less than 2 grids, similar to sniper
SelectionOffset = { -67.5, -65 } --make first number negative half of selectionwidth, and second number negative selectionheight except if you want the weapon to overlap with ground.
RecessionBox =
{
    Size = { 200, 25 },
    Offset = { -300, -50 },
} --keep this from the template. Experiment if you want to know details.

FireEffect = "effects/fire_cannon.lua" --effect that has sprites and sounds when shooting
ConstructEffect = "effects/device_upgrade.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = "effects/sniper_explode.lua"
ShellEffect = "effects/shell_eject_sniper_ap.lua" --plays on every shot, not once like FireEffect
ReloadEffect = "effects/sniper_ap_reload.lua"
ReloadEffectOffset = -.5
Projectile = "lobbershell" --shoots the new projectile
BarrelLength = 150.0 --helps to offset the firing arc from the centre of the weapon sprite
MinFireClearance = 500 --I dunno what these three do xD
FireClearanceOffsetInner = 20
FireClearanceOffsetOuter = 40
ReloadTime = 35 --X seconds of reload time
ReloadTimeIncludesBurst = false --starts reloading while shooting if true

WeaponMass = 200
HitPoints = 350
EnergyProductionRate = 0
MetalProductionRate = 0
EnergyStorageCapacity = 0
MetalStorageCapacity = 0

MinWindEfficiency = 1
MaxWindHeight = 0
MaxRotationalSpeed = 0

PanDuration = 0

DeviceSplashDamage = 150
DeviceSplashDamageMaxRadius = 400
DeviceSplashDamageDelay = 0.2
StructureSplashDamage = 200
StructureSplashDamageMaxRadius = 250
IncendiaryRadius = 200
IncendiaryRadiusHeated = 250
IgnitePlatformOnDestruct = true

local lobbermultiplier = 3 -- 0.07 to reach a medium ranged map's fort in 1 minute 0.035 for 2 minutes

MinFireSpeed = 1000 * lobbermultiplier
MaxFireSpeed = 3000 * lobbermultiplier
MinAgeTrigger = 1 / lobbermultiplier / 1.2
MaxAgeTrigger = 6 / lobbermultiplier / 1.2
MinFireRadius = 250
MaxFireRadius = 1500
MinFireSpread = 8
MinVisibility = 1
MaxVisibilityHeight = 500
MinFireAngle = -30
MaxFireAngle = 45
KickbackMean = 10
KickbackStdDev = 3
MouseSensitivityFactor = 0.6
FireStdDev = 0
FireStdDevAuto = 0
Recoil = 0

EnergyFireCost = 1000
MetalFireCost = 0
DoorCloseDelay = 8
AutofireCloseDoorTicks = 25
DisruptionBlocksFire = true
ShowFireAngle = true
ShowFireSpeed = true
TriggerProjectileAgeAction = true


Sprites = --defines new sprites that can be used by any weapon
{
    {
        Name = "lobber-base", --the main part
        States =
        {
            Normal = { Frames = { { texture = path .. "/weapons/lobber/base.png" }, mipmap = true, }, }, --path .. allows you to search within the files of the mod
            Idle = Normal,
        },
    },
    {
        Name = "lobber-head", --the gun
        States =
        {
            Normal = { Frames = { { texture = path .. "/weapons/lobber/head.png" }, mipmap = true, }, },
            Idle = Normal,
        },
    },
    {
        Name = "lobber-barrel", --the gun barrel
        States =
        {
            Normal = { Frames = { { texture = path .. "/weapons/lobber/barrel.png" }, mipmap = true, }, },
            Idle = Normal,
        },
    },
}

Root =
{
    Name = "Lobber", --name doesn't matter
    Angle = 0, --how many degrees it's turned
    Pivot = { 0.25, -0.55 }, --how much offset the sprite has from the centre of the picture
    PivotOffset = { 0, 0 }, --Forts Pivot calculator is in the forts modding discord pinned messages
    Sprite = "lobber-base", --sprite name DOES matter
    UserData = 0, --when the sprite shows up during building of the weapon. 0 = instantly, 100 = completely finished

    ChildrenBehind =  --connected sprites in front
    {
        {
            Name = "Head",
            Angle = 0,
            Pivot = { -0.09, -0.1 },
            PivotOffset = { 0.25, 0.05 }, --how much offset the sprite has from the centre of the previous picture it's connected to
            Sprite = "lobber-head",
            UserData = 50, --shows up halfway through building
            ChildrenBehind =
            {
                {
                    Name = "LaserSight", --only works if you use a laser sight (like eagle eye does with most guns)
                    Angle = 90,
                    Pivot = { -0.04, -0.2 },
                    PivotOffset = { 0, 0 },
                },
                {
                    Name = "Chamber",
                    Angle = 0,
                    Pivot = { -0.17, -0.15 },
                    PivotOffset = { 0, 0 },
                },
                {
                    Name = "Barrel",
                    Angle = 0,
                    Pivot = { -0.25, -0.1 },
                    PivotOffset = { 0.25, 0.05 }, --how much offset the sprite has from the centre of the previous picture it's connected to
                    Sprite = "lobber-barrel",
                    UserData = 50, --shows up halfway through building
                    ChildrenInFront =
                    {
                        {
                            Name = "Hardpoint0", --where the projectile is ejected from
                            Angle = 90,
                            Pivot = { -0.04, -0.2 },
                            PivotOffset = { 0, 0 },
                        },
                    },
                },
            },
        },
    },
}
