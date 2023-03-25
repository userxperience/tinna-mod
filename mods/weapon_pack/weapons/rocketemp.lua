Scale = 1
SelectionWidth = 40.0
SelectionHeight = 55.75
SelectionOffset = { 0.0, -56.25 }
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

FireEffect = "mods/weapon_pack/effects/emp_launch.lua"
ShellEffect = nil
ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = "mods/weapon_pack/effects/rocketemp_explode.lua"
DestroyUnderwaterEffect = "mods/dlc2/effects/device_explode_submerged.lua"
ReloadEffect = "mods/weapon_pack/effects/reload_emp.lua"
ReloadEffectOffset = -0.5
Projectile = "rocketemp"
BarrelLength = 60.0
MinFireClearance = 500
FireClearanceOffsetInner = 20
FireClearanceOffsetOuter = 40
ReloadTime = 10
ReloadTimeIncludesBurst = false
MinFireSpeed = 500.0
MaxFireSpeed = 500.1
MinFireRadius = 500.0
MaxFireRadius = 1000.0
MinVisibility = 0.5
MaxVisibilityHeight = 500
MinFireAngle = -50
MaxFireAngle = 50
KickbackMean = 15
KickbackStdDev = 3
MouseSensitivityFactor = 0.5
PanDuration = 0
FireDelay = 0
FireStdDev = 0
FireStdDevAuto = 0
Recoil = 20000
EnergyFireCost = 800.0
MetalFireCost = 20
ShowFireAngle = true
RoundsEachBurst = 1
RoundPeriod = 0.0001
BeamDuration = 0.05
ReloadFramePeriod = (ReloadTime + RoundsEachBurst*RoundPeriod)/12
EMPRadius = 140
EMPDuration = 7

dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter