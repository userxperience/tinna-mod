--unedited
Scale = 1
SelectionWidth = 90
SelectionHeight = 55
SelectionOffset = { -18, -55.5 }
RecessionBox =
{
	Size = { 200, 25 },
	Offset = { -300, -60 },
}
CanFlip = false

WeaponMass = 100.0
HitPoints = 200.0
EnergyProductionRate = 0.0
MetalProductionRate = 0.0
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 1
MaxWindHeight = 0
MaxRotationalSpeed = 0
DeviceSplashDamage = 100
DeviceSplashDamageMaxRadius = 400
DeviceSplashDamageDelay = 0.2
IgnitePlatformOnDestruct = true
IncendiaryRadius = 100
IncendiaryRadiusHeated = 120
StructureSplashDamage = 160
StructureSplashDamageMaxRadius = 150

FireEffect = "mods/weapon_pack/effects/fire_20mmcannon.lua"
ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = "mods/weapon_pack/effects/20mmcannon_explode.lua"
DestroyUnderwaterEffect = "mods/dlc2/effects/device_explode_submerged_large.lua"
ShellEffect = "mods/weapon_pack/effects/shell_eject_20mmcannon.lua"
ReloadEffect = "mods/weapon_pack/effects/reload_20mmcannon.lua"
FireEndEffect = "mods/weapon_pack/effects/cooldown_20mmcannon.lua"
RetriggerFireEffect = true
ReloadEffectOffset = -2
Projectile = "cannon20mm"
BarrelLength = 100.0
MinFireClearance = 500
FireClearanceOffsetInner = 20
FireClearanceOffsetOuter = 40
AttractZoomOutDuration = 5
ReloadTime = 28.8
ReloadTimeIncludesBurst = false
MinFireSpeed = 6000.0
MaxFireSpeed = 6000.1
MinFireRadius = 600.0
MaxFireRadius = 1200.0
MinVisibility = 0.7
MaxVisibilityHeight = 1000
MinFireAngle = -40
MaxFireAngle = 40
KickbackMean = 40
KickbackStdDev = 5
MouseSensitivityFactor = 0.5
PanDuration = 0
FireStdDev = 0.02
FireStdDevAuto = 0.02
Recoil = 400000
EnergyFireCost = 2000
MetalFireCost = 40
RoundsEachBurst = 9
RoundPeriod = 0.32

ShowFireAngle = true

BarrelRecoilLimit = -0.15
BarrelRecoilSpeed = -1.5
BarrelReturnForce = 1

dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter