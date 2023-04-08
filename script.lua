dofile("scripts/forts.lua") --needed for scripts

function Load(gameStart)
    data.projectiles = {}
end

function OnRestart()
    data.projectiles = {}
end

--team 1 and 2 are AI sides, 101 and 102 are player sides

function OnWeaponFired(teamId, saveName, weaponId, projectileNodeId, projectileNodeIdFrom)
    Log(tostring(AA_NodeVelocity(projectileNodeId) ) )
    if saveName == "cram" then
        for i = 20,1,-1
            do
            local newVec3x = AA_NodeVelocity(projectileNodeId).x + (i * 100) - 1000
            local newVec3 = Vec3(newVec3x,AA_NodeVelocity(projectileNodeId).y,0)
            ScheduleCall(0.002 + (i / 10), dlc2_CreateProjectile, "crambullet", "cramscript", teamId, GetWeaponHardpointPosition(weaponId), newVec3, 50)
        end
    end
end


function OnProjectileDestroyed(nodeId, teamId, saveName, structureIdHit)
    -- forget destroyed projectiles
    for k, v in ipairs(data.projectiles) do
        if v == nodeId then
            table.remove(data.projectiles, k)
            break
        end
    end
end

function Update(frame)
    -- how many projectiles are there currently?
    --Log(frame .. " has " .. #data.projectiles .. " in flight")
end

function FindTrackedProjectile(id)
    for k,v in ipairs(data.TrackedProjectiles) do
        if v.ProjectileNodeId == id then
            return v
        end
    end
    return nil
end

function TrackProjectile(nodeId)
    local nodeTeamId = NodeTeam(nodeId) -- returns TEAM_ANY if non-existent
    if nodeTeamId%MAX_SIDES == enemyTeamId then -- node may have changed team since firing
        table.insert(data.TrackedProjectiles, { ProjectileNodeId = nodeId, AntiAirWeapons = {}, Claims = {} })
    end
end

function AA_NodeVelocity(id)
    if id < 0 then return FindTrackedProjectile(id).Vel end
    return NodeVelocity(id)
end