Scale = 1 --general size of the hitbox, ususally kept at 1
SelectionWidth = 70.0 --width of the hitbox. ~25 is a grid square
SelectionHeight = 80 --slightly less than 2 grids, similar to sniper
SelectionOffset = { -35, -80 } --make first number negative half of selectionwidth, and second number negative selectionheight except if you want the weapon to overlap with ground.
RecessionBox =

{
    Size = { 200, 25 },
    Offset = { -300, -50 },
} --keep this from the template. Experiment if you want to know details.

WeaponMass = 150.0
HitPoints = 250.0
EnergyProductionRate = 0.0
MetalProductionRate = 0.0
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 1
MaxWindHeight = 0
MaxRotationalSpeed = 0

FireEffect = path .. "/effects/firerollingthunder.lua"
ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = "effects/sniper_explode.lua"
ShellEffect = "effects/shell_eject_sniper_ap.lua"
ReloadEffect = "effects/sniper_ap_reload.lua"
ReloadEffectOffset = -.5
Projectile = "rollingthunderrocket"
BarrelLength = 100.0
MinFireClearance = 500
FireClearanceOffsetInner = 20
FireClearanceOffsetOuter = 40
ReloadTime = 35
ReloadTimeIncludesBurst = false
MinFireSpeed = 2000
MaxFireSpeed = 3000
MinFireRadius = 400
MaxFireRadius = 1099
MinVisibility = 0.3
MaxVisibilityHeight = 700
MinFireAngle = 50
MaxFireAngle = 100
MouseSensitivityFactor = 0.5
KickbackMean = 50
KickbackStdDev = 0
PanDuration = 0
FireStdDev = 0.01
FireStdDevAuto = 0
FireDelay = 0.15
RoundPeriod = 1.35
Recoil = 400000
EnergyFireCost = 4000
MetalFireCost = 50
AutofireCloseDoorTicks = 1.5*25
RoundsEachBurst = 10
RoundPeriod = 0.2
DefaultFireAngle = (MinFireAngle + MaxFireAngle)/2
RetriggerFireEffect = true
IgnitePlatformOnDestruct = true
StructureSplashDamage = 200
StructureSplashDamageMaxRadius = 150

ShowFireAngle = true
ShowFireSpeed = true

CanOverheat = false

dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter

Sprites =
{
    {
        Name = "rollingthunderbase",
        States =
        {
            Normal = { Frames = { { texture = path .. "/weapons/rollingthunder/base.png" }, mipmap = true, }, },
            Idle = Normal,
        },
    },
    {
        Name = "rollingthunderhead",
        States =
        {
            Normal = { Frames = { { texture = path .. "/weapons/rollingthunder/head.png" }, mipmap = true, }, },
            Idle = Normal,
        },
    },
}

Root =
{
    Name = "Rolling thunder",
    Angle = 0,
    Pivot = { 0.25, -0.55 },
    PivotOffset = { 0, 0 },
    Sprite = "rollingthunderbase",
    UserData = 0,

    ChildrenInFront =
    {
        {
            Name = "Head",
            Angle = 0,
            Pivot = { -0.25, -0.1 },
            PivotOffset = { 0.25, 0.05 },
            Sprite = "rollingthunderhead",
            UserData = 50,
            ChildrenInFront =
            {
                {
                    Name = "Hardpoint0",
                    Angle = 90,
                    Pivot = { -0.17, -0.15 },
                    PivotOffset = { 0, 0 },
                },
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
            },
        },
    },
}
