Scale = 1
SelectionWidth = 40.0
SelectionHeight = 58.75
SelectionOffset = { 0.0, -59.25 }
RecessionBox =
{
	Size = { 80, 25 },
	Offset = { -100, -60 },
}

WeaponMass = 80.0
HitPoints = 90.0
EnergyProductionRate = 0.0
MetalProductionRate = 0.0
EnergyStorageCapacity = 0.0
MetalStorageCapacity = 0.0
MinWindEfficiency = 1
MaxWindHeight = 0
MaxRotationalSpeed = 0
IgnitePlatformOnDestruct = true
StructureSplashDamage = 50
StructureSplashDamageMaxRadius = 150

FireEffect = "mods/weapon_pack/effects/fire_flak.lua"
ShellEffect = "effects/shell_eject_small.lua"
ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = "mods/weapon_pack/effects/flak_weapon_explode.lua"
DestroyUnderwaterEffect = "mods/dlc2/effects/device_explode_submerged.lua"
ReloadEffect = "mods/weapon_pack/effects/reload_flak.lua"
FireEndEffect = "mods/weapon_pack/effects/cooldown_flak.lua"
ReloadEffectOffset = -1.5
RetriggerFireEffect = true
Projectile = "flak"
BarrelLength = 60.0
MinFireClearance = 500
FireClearanceOffsetInner = 20
FireClearanceOffsetOuter = 40
ReloadTime = 6.75
ReloadTimeIncludesBurst = false
MinFireSpeed = 8000.0
MaxFireSpeed = 8000.1
MaxFireClamp = 0.85
MinFireRadius = 350.0
MaxFireRadius = 1200.0
MinFireSpread = 8
MinVisibility = 1
MaxVisibilityHeight = 500
MinFireAngle = -50
MaxFireAngle = 50
KickbackMean = 15
KickbackStdDev = 3
MouseSensitivityFactor = 0.6
PanDuration = 0
FireStdDev = 0.005
FireStdDevAuto = 0.005
Recoil = 20000
EnergyFireCost = 300.0
MetalFireCost = 30
ShowFireAngle = true
RoundsEachBurst = 4
RoundPeriod = 0.25
BeamDuration = 0.05
ReloadFramePeriod = (ReloadTime + RoundsEachBurst*RoundPeriod)/12
DisruptionBlocksFire = true

TriggerProjectileAgeAction = true
MinAgeTrigger = 0.3
MaxAgeTrigger = 1.1

dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter
