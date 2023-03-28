dofile("scripts/forts.lua") --needed for scripts

--function to add metal to a team that got hit by a specific projectile
function OnProjectileDestroyed(nodeId, teamId, saveName, structureIdHit) --checks when a projectile is destroyed and wich team it hit
    if saveName == "Metalpack" and structureIdHit ~= 0 then --if the projectile is "metalpack" and hit a fort owned by a team:
        local teamHit = GetStructureTeam(structureIdHit)--checks what team got hit
        AddResources(teamHit , { metal = 200, energy = 10}, true, Vec3(0,0)) --the fort of that team gets these bonus ressources
    end
    if saveName == "flamingMetalpack" and structureIdHit ~= 0 then --every projectile needs to be individually defined
        local teamHit = GetStructureTeam(structureIdHit)
        AddResources(teamHit , { metal = 100, energy = 5}, true, Vec3(0,0))
		Log("100 metal received") --you can also log when a projectile gets destroyed. I used this for "Buggos Invasion" wave system
    end
end