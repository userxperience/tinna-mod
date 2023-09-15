Scale = 1
SelectionWidth = 125.0
SelectionHeight = 65
SelectionOffset = { -67.5, -65 }
RecessionBox =
{
    Size = { 200, 25 },
    Offset = { -300, -50 },
}
FireEffect = "effects/fire_cannon.lua"
ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = "effects/sniper_explode.lua"
ShellEffect = "effects/shell_eject_sniper_ap.lua"
ReloadEffect = "effects/sniper_ap_reload.lua"
ReloadEffectOffset = -.5
Projectile = "lobbershell"
BarrelLength = 150.0
MinFireClearance = 500
FireClearanceOffsetInner = 20
FireClearanceOffsetOuter = 40
ReloadTime = 15
ReloadTimeIncludesBurst = false

WeaponMass = 200
HitPoints = 700
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


Sprites =
{
    {
        Name = "lobber-base",
        States =
        {
            Normal = { Frames = { { texture = path .. "/weapons/lobber/base.png" }, mipmap = true, }, },
            Idle = Normal,
        },
    },
    {
        Name = "lobber-head",
        States =
        {
            Normal = { Frames = { { texture = path .. "/weapons/lobber/head.png" }, mipmap = true, }, },
            Idle = Normal,
        },
    },
    {
        Name = "lobber-barrel",
        States =
        {
            Normal = { Frames = { { texture = path .. "/weapons/lobber/barrel.png" }, mipmap = true, }, },
            Idle = Normal,
        },
    },
}

Root =
{
    Name = "Lobber",
    Angle = 0,
    Pivot = { 0.25, -0.55 },
    PivotOffset = { 0, 0 },
    Sprite = "lobber-base",
    UserData = 0,

    ChildrenBehind =
    {
        {
            Name = "Head",
            Angle = 0,
            Pivot = { -0.09, -0.1 },
            PivotOffset = { 0.25, 0.05 },
            Sprite = "lobber-head",
            UserData = 50,
            ChildrenBehind =
            {
                {
                    Name = "LaserSight",
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
                    PivotOffset = { 0.25, 0.05 },
                    Sprite = "lobber-barrel",
                    UserData = 50,
                    ChildrenInFront =
                    {
                        {
                            Name = "Hardpoint0",
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
