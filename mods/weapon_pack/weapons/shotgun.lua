Scale = 1
SelectionWidth = 40.0
SelectionHeight = 58.75
SelectionOffset = { 0.0, -59.25 }
RecessionBox =
{
	Size = { 100, 25 },
	Offset = { -120, -65 },
}

WeaponMass = 80.0
HitPoints = 130.0
EnergyProductionRate = 0.0
MetalProductionRate = 0.0
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 1
MaxWindHeight = 0
MaxRotationalSpeed = 0
IgnitePlatformOnDestruct = true
StructureSplashDamage = 60
StructureSplashDamageMaxRadius = 150

FireEffect = "mods/weapon_pack/effects/fire_shotgun.lua"
ShellEffect = "mods/weapon_pack/effects/shell_eject_shotgun.lua"
ConstructEffect = "effects/device_upgrade.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = "mods/weapon_pack/effects/shotgun_explode.lua"
DestroyUnderwaterEffect = "mods/dlc2/effects/device_explode_submerged.lua"
ReloadEffect = "mods/weapon_pack/effects/reload_shotgun.lua"
ReloadEffectOffset = -0.5
Projectile = "shotgun"
BarrelLength = 60.0
MinFireClearance = 500
FireClearanceOffsetInner = 20
FireClearanceOffsetOuter = 40
ReloadTime = 9
ReloadTimeIncludesBurst = false
MinFireSpeed = 10000.0
MaxFireSpeed = 10000.1
MinFireRadius = 500.0
MaxFireRadius = 1000.0
MinFireSpread = 8
MinVisibility = 0.25
MaxVisibilityHeight = 500
MinFireAngle = -50
MaxFireAngle = 50
KickbackMean = 15
KickbackStdDev = 3
MouseSensitivityFactor = 0.5
PanDuration = 0
FireStdDev = 0.015
FireStdDevAuto = 0.05
Recoil = 20000
EnergyFireCost = 800.0
MetalFireCost = 30
ShowFireAngle = true
RoundsEachBurst = 10
RoundPeriod = 0
UniformSpray = true
BeamDuration = 0.05
ReloadFramePeriod = (ReloadTime + RoundsEachBurst*RoundPeriod)/12

dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter