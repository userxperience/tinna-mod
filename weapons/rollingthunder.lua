Scale = 1 --general size of the hitbox, ususally kept at 1
SelectionWidth = 70.0 --width of the hitbox. ~25 is a grid square
SelectionHeight = 45 --slightly less than 2 grids, similar to sniper
SelectionOffset = { -40.0, -45.5 } --first number is for width, second for height. Make the second number always 0.5 greater and usually keep the first number from the template. Experiment a bit!
RecessionBox =
{
    Size = { 200, 25 },
    Offset = { -300, -50 },
} --keep this from the template. Experiment if you want to know details.

WeaponMass = 50.0 --weight of weapon
HitPoints = 100.0 --HP until destroyed. 110 is damage from a sniper shot
EnergyProductionRate = 0.0
MetalProductionRate = 0.0
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 1 --for turbines
MaxWindHeight = 0 --for turbines
MaxRotationalSpeed = 0 --for turbines

FireEffect = "mods/weapon_pack/effects/fire_20mmcannon.lua" --effect that has sprites and sounds when shooting
ConstructEffect = "effects/device_upgrade.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = "effects/sniper_explode.lua"
ShellEffect = "effects/shell_eject_sniper_ap.lua" --plays on every shot, not once like FireEffect
ReloadEffect = "effects/sniper_ap_reload.lua"
ReloadEffectOffset = -.5
Projectile = "hullbreaker" --shoots the new projectile
BarrelLength = 100.0 --helps to offset the firing arc from the centre of the weapon sprite
MinFireClearance = 500 --I dunno what these three do xD
FireClearanceOffsetInner = 20
FireClearanceOffsetOuter = 40
ReloadTime = 18 --X seconds of reload time
ReloadTimeIncludesBurst = false --starts reloading while shooting if true
MinFireSpeed = 4000 --projectile speed when shooting. Min is if you aim in the inside of the firing arc
MaxFireSpeed = 4500 --maximum is if you aim at the outmost part of the firing arc. Both FiringSpeeds may be equal
MinFireRadius = 420 --size of the firing arc (start)
MaxFireRadius = 1069--size of the firing arc (end)
MinVisibility = 0.3--for the system that weapons placed higher up have a bigger arc
MaxVisibilityHeight = 700 --at this (visibility floor on maps) height the weapon has its greatest arc
MinFireAngle = -10 --bottom fire angle
MaxFireAngle = 10 --top fire angle
MouseSensitivityFactor = 0.6 --no idea
KickbackMean = 50 --How much your mouse if moved when shooting
KickbackStdDev = 7 --deviation from KickbackMean (between 50-7 & 50+7)
PanDuration = 0 --no idea
FireStdDev = 0 --how inaccurate the weapon is
FireStdDevAuto = 0--inaccuracy specifically when pressing "e" on the weapon (autofire)
FireDelay = 0.15 --seconds before the weapon shoots when pressing fire
RoundPeriod = 1.35 --how long a single shot lasts (time after shots, adds to reload time)
Recoil = 70000 --make this number really really high and you will see what it does xD
EnergyFireCost = 500 --energy cost each time you shoot
MetalFireCost = 1 --same but with metal instead
AutofireCloseDoorTicks = 1.5*25 --How many ticks until the door closes after you fire (25 is one second)

CanOverheat = true --overheats like a machine gun
HeatPeriod = 5.5 --maximum heat capacity
CoolPeriod = 1234567890 --seconds until the weapon goes from 100% heat to 0% heat (passively)
CoolPeriodOverheated = 1234567890 --seconds until the weapon goes from 100% heat to 0% heat (on overheat)

dofile("effects/device_smoke.lua") --effect that shows smoke when the weapon is damaged
SmokeEmitter = StandardDeviceSmokeEmitter --usual smoke on a hurt weapon

Sprites = --defines new sprites that can be used by any weapon
{
    {
        Name = "rollingthunder-base", --the main part
        States =
        {
            Normal = { Frames = { { texture = path .. "/weapons/hullbreaker/base.tga" }, mipmap = true, }, }, --path .. allows you to search within the files of the mod
            Idle = Normal,
        },
    },
    {
        Name = "rollingthunder-head", --the gun barrel
        States =
        {
            Normal = { Frames = { { texture = path .. "/weapons/hullbreaker/head.tga" }, mipmap = true, }, },
            Idle = Normal,
        },
    },
    {
        Name = "rollingthunder-arm", --the reload effect
        States =
        {
            Normal = { Frames = { { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim01.png" }, mipmap = true, }, },
            Idle = Normal,
            Reload =
            {
                Frames =
                {
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim01.png", duration = 0.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim02.png", duration = 0.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim03.png", duration = 0.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim04.png", duration = 0.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim05.png", duration = 0.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim06.png", duration = 0.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim07.png", duration = 0.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim08.png", duration = 0.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim09.png", duration = 0.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim10.png", duration = 3.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim11.png", duration = 0.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim12.png", duration = 0.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim13.png", duration = 0.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim14.png", duration = 0.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim15.png", duration = 0.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim16.png", duration = 0.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim17.png", duration = 0.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim18.png", duration = 0.1 },
                    { texture = path .. "/weapons/hullbreaker/Sniper-ReloadAnim19.png", duration = 1 },
                    mipmap = true,
                    duration = 0.2,
                },
                NextState = "Normal",
            },
        },
    },
}

Root =
{
    Name = "Sniper", --name doesn't matter
    Angle = 0, --how many degrees it's turned
    Pivot = { 0.25, -0.55 }, --how much offset the sprite has from the centre of the picture
    PivotOffset = { 0, 0 }, --Forts Pivot calculator is in the forts modding discord pinned messages
    Sprite = "rollingthunder-base", --sprite name DOES matter
    UserData = 0, --when the sprite shows up during building of the weapon. 0 = instandly, 100 = completely finished

    ChildrenInFront = --connected sprites infront of hullbreaker-base
    {
        {
            Name = "Head",
            Angle = 0,
            Pivot = { -0.25, -0.1 },
            PivotOffset = { 0.25, 0.05 }, --how much offset the sprite has from the centre of the previous picture it's connected to
            Sprite = "hullbreaker-head",
            UserData = 50, --shows up halfway through building

            ChildrenInFront =
            {
                {
                    Name = "Arm", --reload animation
                    Angle = 0,
                    Pivot = { -0.185, -0.08 },
                    Sprite = "hullbreaker-arm",
                    PivotOffset = { 0, 0 },
                    UserData = 100,
                },
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
                    Name = "Chamber", --Something else importand...
                    Angle = 0,
                    Pivot = { -0.17, -0.15 },
                    PivotOffset = { 0, 0 },
                },
            },
        },
    },
}
