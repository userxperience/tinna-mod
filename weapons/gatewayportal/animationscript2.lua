dofile("scripts/interpolate.lua")

FireEnd = 11
AngleTable = {}
modifier = 0.8
Amplitude = 6 * modifier
Frequency = 0.5 * modifier

local t = 0
local direction = 1 -- To control the direction of motion

while t <= FireEnd do
	local angle = Amplitude * math.sin(Frequency * math.pi * t * direction)
	table.insert(AngleTable, {t, angle})
	t = t + 0.1
	if t >= 5 then
		direction = direction * -1 -- Reverse the direction after 5 seconds
	end
end

Angle = 0
FireTimer = 0

function Update(delta)
	FireTimer = FireTimer + delta
	Angle = InterpolateTable(AngleTable, FireTimer, 2)
	SetNodeAngle("Anim", Angle)
	if FireTimer > FireEnd then
		FireTimer = 0
	end
end

function OnWeaponFired()
	FireTimer = 0
end
