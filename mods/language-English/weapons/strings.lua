function Merge(t1, t2) for k, v in pairs(t2) do t1[k] = v end end

Merge(Weapon,
{
	rollingthunder = L"Rolling thunder",--add weapon description for bottom HUD here, follow the format of the other weapons
	rollingthunderTip2 = L"Fires a barrage of high explosive missiles",
	rollingthunderTip3 = L"Requires: Munitions Plant",
}
)
