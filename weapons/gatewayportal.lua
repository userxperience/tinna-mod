dofile("weapons/minigun.lua")
Sprites = {}
SelectionWidth = 10
SelectionHeight = 10
HitPoints = 1
FireEffect = path .. "/effects/fire_hail.lua"
RetriggerFireEffect = true
ReloadEffect = nil
FireEndEffect = nil
Projectile = "rollingthunderrocket"
ConstructEffect = nil
CompleteEffect = nil
RoundsEachBurst = 1
ForceFireAngle = nil
MinFireSpeed = 3000.0
MaxFireSpeed = 3000.1
MinFireAngle = -175
MaxFireAngle = 175
EnergyFireCost = 0
MetalFireCost = 0
ReloadTime = 1
FireDelay = 0
ShowAimingGizmo = true
ShowFireAngle = true
MaxFireRadius = 2000
FireStdDev = 0.0000001