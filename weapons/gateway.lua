Scale = 1 --general size of the hitbox, ususally kept at 1
SelectionWidth = 70.0 --width of the hitbox. ~25 is a grid square
SelectionHeight = 80 --slightly less than 2 grids, similar to sniper
SelectionOffset = { -35, -80 } --make first number negative half of selectionwidth, and second number negative selectionheight except if you want the weapon to overlap with ground.
RecessionBox =

{
    Size = { 25, 1000 },
    Offset = { 0, -890 },
} --recessionbox is the space in front of or above the weapon that gets changed to background bracing or doors

WeaponMass = 150.0 --weight of weapon
HitPoints = 250.0 --HP until destroyed. 110 is damage from a sniper shot
EnergyProductionRate = 0.0
MetalProductionRate = 0.0
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 1 --for turbines
MaxWindHeight = 0 --for turbines
MaxRotationalSpeed = 0 --for turbines

FireEffect = path .. "/effects/firegateway.lua" --effect that has sprites and sounds when shooting
ConstructEffect = "effects/device_upgrade.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = "effects/sniper_explode.lua"
ShellEffect = "effects/shell_eject_sniper_ap.lua" --plays on every shot, not once like FireEffect
ReloadEffect = "effects/sniper_ap_reload.lua"
ReloadEffectOffset = -.5
Projectile = "gatewaymissile" --shoots the new projectile
BarrelLength = 100.0 --helps to offset the firing arc from the centre of the weapon sprite

ReloadTime = 35 --X seconds of reload time
ReloadTimeIncludesBurst = false --starts reloading while shooting if true
MinFireSpeed = 2000 --projectile speed when shooting. Min is if you aim in the inside of the firing arc
MaxFireSpeed = 3000 --maximum is if you aim at the outmost part of the firing arc. Both FiringSpeeds may be equal
MinVisibility = 0.3--for the system that weapons placed higher up have a bigger arc
MaxVisibilityHeight = 700 --at this (visibility floor on maps) height the weapon has its greatest arc
MinFireAngle = 86
MaxFireAngle = 94
MouseSensitivityFactor = 0.5 --no idea
KickbackMean = 50 --How much your mouse if moved when shooting
KickbackStdDev = 0 --deviation from KickbackMean (between 50-7 & 50+7)
PanDuration = 0 --no idea
FireStdDev = 0.01 --how inaccurate the weapon is
FireStdDevAuto = 0--inaccuracy specifically when pressing "e" on the weapon (autofire)
FireDelay = 0.15 --seconds before the weapon shoots when pressing fire
RoundPeriod = 1.35 --how long a single shot lasts (time after shots, adds to reload time)
Recoil = 400000 --make this number really really high and you will see what it does xD
EnergyFireCost = 4000 --energy cost each time you shoot
MetalFireCost = 50 --same but with metal instead
AutofireCloseDoorTicks = 1.5*25 --How many ticks until the door closes after you fire (25 is one second)
RoundsEachBurst = 1 --how many shots in a burst
RoundPeriod = 0.2 --time between shots in a burst in seconds
DefaultFireAngle = (MinFireAngle + MaxFireAngle)/2
RetriggerFireEffect = true --plays the fire sound effect again when burst shots
IgnitePlatformOnDestruct = true
StructureSplashDamage = 200
StructureSplashDamageMaxRadius = 150

MinFireRadius = 200.0
MaxFireRadius = 20000.0
ForceFireAngle = 90 --important to the missile going straight up before steering to the target
MinFireClearance = 1000
FireClearanceOffsetInner = 40
FireClearanceOffsetOuter = 40
MissileDisruptionMin = 0.5
MissileDisruptionStdDevMin = 400
MissileDisruptionStdDevMax = 600

ShowFireAngle = true
ShowFireSpeed = true

CanOverheat = false --overheats like a machine gun
--HeatPeriod = 5.5 --maximum heat capacity
--CoolPeriod = 1234567890 --seconds until the weapon goes from 100% heat to 0% heat (passively)
--CoolPeriodOverheated = 1234567890 --seconds until the weapon goes from 100% heat to 0% heat (on overheat)

dofile("effects/device_smoke.lua") --effect that shows smoke when the weapon is damaged
SmokeEmitter = StandardDeviceSmokeEmitter --usual smoke on a hurt weapon

Sprites = --defines new sprites that can be used by any weapon
{
    {
        Name = "gatewaybase", --the main part
        States =
        {
            Normal = { Frames = { { texture = path .. "/weapons/gateway/base.png" }, mipmap = true, }, }, --path .. allows you to search within the files of the mod
            Idle = Normal,
        },
    },
    {
        Name = "gatewayhead", --the gun barrel
        States =
        {
            Normal = { Frames = { { texture = path .. "/weapons/gateway/head.png" }, mipmap = true, }, },
            Idle = Normal,
        },
    },
}

Root =
{
    Name = "Gateway", --name doesn't matter
    Angle = 0, --how many degrees it's turned
    Pivot = { 0.25, -0.55 }, --how much offset the sprite has from the centre of the picture
    PivotOffset = { 0, 0 }, --Forts Pivot calculator is in the forts modding discord pinned messages
    Sprite = "gatewaybase", --sprite name DOES matter
    UserData = 0, --when the sprite shows up during building of the weapon. 0 = instantly, 100 = completely finished

    ChildrenInFront = --connected sprites in front
    {
        {
            Name = "Head",
            Angle = 0,
            Pivot = { -0.25, -0.1 },
            PivotOffset = { 0.25, 0.05 }, --how much offset the sprite has from the centre of the previous picture it's connected to
            Sprite = "gatewayhead",
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
