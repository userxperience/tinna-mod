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

    if saveName == "kirov" or saveName == "kirovP2" then
        local kirovPos = NodePosition(nodeId)
        Log("creating projectile")
        dlc2_CreateProjectile("kirovCrashing", "kirovcrashscript", teamId, kirovPos, Vec3(100, 0, 0), 10)
    end

    end
