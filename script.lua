-- necessary to access script functions, plus basic functions, types and variables
dofile("scripts/forts.lua")

--custom lobber bomblet release script
function OnProjectileDestroyed(nodeId, teamId, saveName, structureIdHit, destroyType)
    if saveName == "lobbershell" and (destroyType == 9 or destroyType == 2 or destroyType ==3)  then
        for i = 15,1,-1 do --TODO: refactor to its own function
            local velX = NodeVelocity(nodeId).x + GetRandomInteger(-800, -200, "random deviation")
            local velY = NodeVelocity(nodeId).y+  GetRandomInteger(-1000, -200, "random deviation")
            local posX = NodePosition(nodeId).x
            local posY = NodePosition(nodeId).y
            -- Create Vec3 objects with the obtained values
            local newVelVec3 = Vec3(velX, velY, 0)
            local newPosVec3 = Vec3(posX, posY, 0)

            -- Call dlc2_CreateProjectile with the new Vec3 objects
            dlc2_CreateProjectile("lobberbomblet", "lobberscript", teamId, newPosVec3, newVelVec3, 10)
        end
    end

    --gateway script
    if saveName == "gatewaymissile" and (destroyType == 9 or destroyType == 2 or destroyType ==3)  then
        EnableWeapon("gatewayportal", true, 1)
        EnableWeapon("gatewayportal", true, 2)
        --local manualorigin = Vec3(-1300, -132 , 0)
        --local manualtarget = Vec3(2226, 427 , 0)
        local target = GetGatewayProjectileTarget(nodeId)
        local pos = NodePosition(nodeId)
        local clientId = GetProjectileClientId(nodeId)
        local deviceId = dlc2_CreateFloatingDevice(teamId, "gatewayportal", pos, 90)
        --SetWeaponClientId(deviceId, clientId)
        Log("attempting to fire weapon " .. tostring(deviceId) .. " at " .. tostring(target) ..  " ")
        ScheduleCall(0.5, FireWeapon, deviceId, target, 0.0, FIREFLAG_NORMAL)
    end
    end


function OnWeaponFired(teamId, saveName, weaponId, projectileNodeId, projectileNodeIdFrom)
    if saveName == "gateway" then
        local target = GetMissileTarget(projectileNodeId)
        if target ~= nil then
            -- Use the setter function to store the target information in the projectileTargets table
            SetGatewayProjectileTarget(projectileNodeId, target)

            -- Log the target information
            Log("Gatewaymissile fired - Projectile Node ID: " .. projectileNodeId .. ", Target: (" .. target.x .. ", " .. target.y .. ")")
        else
            Log("Warning: Gatewaymissile fired, but no target found.")
        end
    end
end

function OnWeaponFiredEnd(teamId, saveName, weaponId)
    if saveName == "gatewayportal" then
        DestroyDeviceById(weaponId)
    end
end

local gatewayProjectileTargets = {}

-- Setter function to set a target for a specific projectileNodeId
function SetGatewayProjectileTarget(projectileNodeId, target)
    gatewayProjectileTargets[projectileNodeId] = target
end

-- Getter function to get the target for a specific projectileNodeId
function GetGatewayProjectileTarget(projectileNodeId)
    Log("accessed index " .. projectileNodeId .. "")
    Log("returned " .. gatewayProjectileTargets[projectileNodeId] .. "")
    return gatewayProjectileTargets[projectileNodeId]
end







--dofile("scripts/forts.lua")
--
--function Load(gameStart)
--    data.missleTargets = {}
--end
--
--function OnWeaponFired(teamId, saveName, weaponId, projectileNodeId, projectileNodeIdFrom)
--    if GetNodeProjectileType(projectileNodeId) then
--        local targetNodeId = FindNodeOnStructure(GetMissileTarget(projectileNodeId), 0, false)
--        data.missleTargets[projectileNodeId] = targetNodeId
--    end
--end
--
--function OnProjectileDestroyed(nodeId, teamId, saveName, structureIdHit)
--    if GetNodeProjectileType(nodeId) then
--        data.missleTargets[nodeId] = nil
--    end
--end
--
--function Update(frame)
--    for projectileId, targetNodeId in pairs(data.missleTargets) do
--        SetMissileTarget(projectileId, NodePosition(targetNodeId))
--    end
--end

--DESTROYTYPE_NONE (0)
--DESTROYTYPE_UNKNOWN (1)
--DESTROYTYPE_HITPROJECTILE (2)
--DESTROYTYPE_HITBEAM (3)
--DESTROYTYPE_HITTERRAIN (4)
--DESTROYTYPE_HITSTRUCTURE (5)
--DESTROYTYPE_HITDEVICE (6)
--DESTROYTYPE_OUTOFWORLD (7)
--DESTROYTYPE_EXPIRED (8)
--DESTROYTYPE_AGEEFFECT (9)
--DESTROYTYPE_DEBRISCLEANUP (10)