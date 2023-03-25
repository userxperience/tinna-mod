local shield = FindMaterial("shield") --find material is the equivelant to FindDevice
if shield then
	shield.BuildTime = shield.BuildTime*0.6 --builds 40% faster
	shield.MetalBuildCost = shield.MetalBuildCost*0.95 --5% cheaper
end
local rope = FindMaterial("rope")
if rope then 
	rope.ConductsPower = true --makes disconnected structures connected (like a bracing would)
	rope.SupportsDevices = true --allows you to build devices on the rope, very funny honestly :)
end