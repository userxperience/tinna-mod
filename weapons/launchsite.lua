Scale = 1
SelectionWidth = 210
SelectionHeight = 125
SelectionOffset = { -105, -125 }
RecessionBox =
{
    Size = { 200, 25 },
    Offset = { -300, -50 },
}
ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = "effects/cannon_explode.lua"
FireEffect = path .. "/effects/firerollingthunder.lua"

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

local kirovmultiplier = 0.035 -- 0.07 to reach a medium ranged map's fort in 1 minute 0.035 for 2 minutes

MinFireClearance = 3000
BarrelLength = 50.0
FireClearanceOffsetInner = 50
FireClearanceOffsetOuter = 800
RoundsEachBurst = 1
RoundPeriod = 0.04
ReloadTime = 0.7
MinFireSpeed = 1000 * kirovmultiplier
MaxFireSpeed = 3000 * kirovmultiplier
MaxFireClamp = 0.1 / kirovmultiplier
MinFireRadius = 250
MaxFireRadius = 3500
MinFireSpread = 8
MinVisibility = 1
MaxVisibilityHeight = 500
MinFireAngle = -5
MaxFireAngle = 15
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

TriggerProjectileAgeAction = true
MinAgeTrigger = 1 / kirovmultiplier * 2
MaxAgeTrigger = 6 / kirovmultiplier * 2


Sprites =
{
    {
        Name = "launchsite-base",
        States =
        {
            Normal = { Frames = { { texture = path .. "/weapons/launchsite/base.png" }, mipmap = true, }, }, --path .. allows you to search within the files of the mod
            Idle = Normal,
        },
    },
    {
        Name = "launchsite-head",
        States =
        {
            Normal = { Frames = { { texture = path .. "/weapons/launchsite/head-kirov.png" }, mipmap = true, }, },
            Idle = Normal,
        },
    },
}

Root =
{
    Name = "Launch site", --name doesn't matter
    Angle = 0, --how many degrees it's turned
    Pivot = { 0.25, -0.55 }, --how much offset the sprite has from the centre of the picture
    PivotOffset = { 0, 0 }, --Forts Pivot calculator is in the forts modding discord pinned messages
    Sprite = "launchsite-base", --sprite name DOES matter
    UserData = 0, --when the sprite shows up during building of the weapon. 0 = instantly, 100 = completely finished
    Scale = 1.4, --how much bigger or smaller the sprite is
    ChildrenBehind = --connected sprites in front
    {
        {
            Name = "Head",
            Angle = 0,
            Pivot = { -0.25, -0.1 },
            PivotOffset = { 0.25, 0.05 }, --how much offset the sprite has from the centre of the previous picture it's connected to
            Sprite = "launchsite-head",
            UserData = 50, --shows up halfway through building
            ChildrenInFront =
            {
                {
                    Name = "Hardpoint0", --where the projectile is ejected from
                    Angle = 90,
                    Pivot = { -0.17, -0.15 },
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
