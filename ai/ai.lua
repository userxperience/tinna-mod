ShootableProjectile["rollingthunderrocket"] = true
ShootableProjectile["kirov"] = true
ShootableProjectile["kirovbomb"] = true
ShootableProjectile["kirovP2"] = true

data.AntiAirErrorStdDev["cram"] = Balance(2, 1)
data.AntiAirOpenDoor["cram"] = { ["mortar"] = true, ["mortar2"] = true, }
data.AntiAirFireProbability["cram"] = Balance(0.8, 0.9)
data.Antiairperiod = 0.01

AntiAirFireProbabilityHumanAssist["cram"] = data.AntiAirFireProbability["cram"]