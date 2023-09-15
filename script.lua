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
        HandleGatewayMissileDestruction(saveName, destroyType, nodeId, teamId)
    end
    end

function HandleGatewayMissileDestruction(saveName, destroyType, nodeId, teamId)
        local portalIds = {"gatewayportal", "gatewayportal1", "gatewayportal2"}
        for index, portalId in ipairs(portalIds) do
            EnableWeapon(portalId, true, 1)
            local target = GetGatewayProjectileTarget(nodeId)
            local pos = NodePosition(nodeId)

            -- Adjust the Y-coordinate for portal1 and portal2
            if index == 2 then
                pos.y = pos.y + 10  -- Increase Y-coordinate by 10 pixels for gatewayportal1
            elseif index == 3 then
                pos.y = pos.y - 10  -- Decrease Y-coordinate by 10 pixels for gatewayportal2
            end

            local deviceId = dlc2_CreateFloatingDevice(teamId, portalId, pos, 90)
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
            --Log("Gatewaymissile fired - Projectile Node ID: " .. projectileNodeId .. ", Target: (" .. target.x .. ", " .. target.y .. ")")
        else
            --Log("Warning: Gatewaymissile fired, but no target found.")
        end
    end
end

function OnWeaponFiredEnd(teamId, saveName, weaponId)
    local portalIds = {"gatewayportal", "gatewayportal1", "gatewayportal2"}

    for _, portalId in ipairs(portalIds) do
        if saveName == portalId then
            DestroyDeviceById(weaponId)
        end
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