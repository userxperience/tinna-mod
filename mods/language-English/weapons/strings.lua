function Merge(t1, t2) for k, v in pairs(t2) do t1[k] = v end end

Merge(Weapon,
{
	hullbreaker = L"Hullbreaker",
	hullbreakerTip2 = L"Railgun that's great against armor. Needs replacement after 4 shots.",
	hullbreakerTip3 = L"Required: Tech Silo, Bonus: Double damage against Armor",
})
