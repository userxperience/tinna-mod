function Merge(t1, t2) for k, v in pairs(t2) do t1[k] = v end end

Merge(Weapon,
{
	hullbreaker = L"Hullbreaker",
	hullbreakerTip2 = L"Railgun that's great against armor. Needs replacement after 4 shots.",
	hullbreakerTip3 = L"Required: Tech Silo, Bonus: Double damage against Armor",

	rollingthunder = L"Rolling thunder",--add weapon description for bottom HUD here, follow the format of the other weapons
	rollingthunderTip2 = L"Fires five shells through the air",
	rollingthunderTip3 = L"Requires: Munitions Plant",
}
)
