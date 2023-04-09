Scale = 1
SelectionWidth = 50.0
SelectionHeight = 80.0
SelectionOffset = { -5, -80 }
RecessionBox =
{
    Size = { 200, 25 },
    Offset = { -300, -50 },
}

WeaponMass = 90.0
HitPoints = 300.0
DestroyProjectile = nil
EnergyProductionRate = 0.0
MetalProductionRate = 0.0
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 1
MaxWindHeight = 0
MaxRotationalSpeed = 0
IgnitePlatformOnDestruct = true
StructureSplashDamage = 100
StructureSplashDamageMaxRadius = 150

FireEffect = path .. "/effects/firecram.lua"
ShellEffect = "effects/shell_eject_small.lua"
ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = "effects/machinegun_explode.lua"
ReloadEffect = "effects/minigun_reload.lua"
ReloadEffectOffset = -0.5
Projectile = "crambullet"
BarrelLength = 90.0
MinFireClearance = 500
FireClearanceOffsetInner = 20
FireClearanceOffsetOuter = 40
ReloadTime = 1
MinFireSpeed = 9000
MaxFireSpeed = 9000
MinFireRadius = 300.0
MaxFireRadius = 600.0
MinVisibility = 0.9
MaxVisibilityHeight = 600
MinFireAngle = -30
MaxFireAngle = 100
KickbackMean = 15
KickbackStdDev = 3
MouseSensitivityFactor = 0.5
PanDuration = 0
FireStdDev = 0.015
FireStdDevAuto = 0.01
Recoil = 20000
EnergyFireCost = 100.0
MetalFireCost = 50
ShowFireAngle = true
RoundsEachBurst = 40
RoundPeriod = 0.04
DoorCloseDelay = 0.75

CanOverheat = true --overheats like a machine gun
HeatPeriod = 3 --maximum heat capacity
CoolPeriod = 60 --seconds until the weapon goes from 100% heat to 0% heat (passively)
CoolPeriodOverheated = 60 --seconds until the weapon goes from 100% heat to 0% heat (on overheat)

dofile("effects/device_smoke.lua") --effect that shows smoke when the weapon is damaged
SmokeEmitter = StandardDeviceSmokeEmitter --usual smoke on a hurt weapon

Sprites = --defines new sprites that can be used by any weapon
{
    {
        Name = "cram-base", --the main part
        States =
        {
            Normal = { Frames = { { texture = path .. "/weapons/cram/base.png" }, mipmap = true, }, }, --path .. allows you to search within the files of the mod
            Idle = Normal,
        },
    },
    {
        Name = "cram-head", --the gun barrel
        States =
        {
            Normal = { Frames = { { texture = path .. "/weapons/cram/head.png" }, mipmap = true, }, },
            Idle = Normal,
        },
    },
}

Root =
{
    Name = "cram", --name doesn't matter
    Angle = 0, --how many degrees it's turned
    Pivot = { 0, -0.5 }, --how much offset the sprite has from the centre of the picture
    PivotOffset = { 0, 0 }, --Forts Pivot calculator is in the forts modding discord pinned messages
    Sprite = "cram-base", --sprite name DOES matter
    UserData = 0, --when the sprite shows up during building of the weapon. 0 = instantly, 100 = completely finished

    ChildrenBehind = --connected sprites in front
    {
        {
            Name = "Head",
            Angle = 0,
            Pivot = { -0.1, -0.4 },
            PivotOffset = { -0.0, 0.1 }, --how much offset the sprite has from the centre of the previous picture it's connected to
            Sprite = "cram-head",
            UserData = 50, --shows up halfway through building
            ChildrenInFront =
            {
                {
                    Name = "Hardpoint0", --where the projectile is ejected from
                    Angle = 90,
                    Pivot = { 0, 0 },
                    PivotOffset = { 0, 0 },
                },
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
            },
        },
    },
}
