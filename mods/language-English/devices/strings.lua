function Merge(t1, t2) for k, v in pairs(t2) do t1[k] = v end end

Merge(Device,
{
	ammo_kirov = L"Kirov airship",
	ammo_kirovTip2 = L"Slow but fearsome war-zeppelin boasting vast stores of heavy iron bombs",
	ammo_kirovTip3 = L"Requires: Munitions Plant",
}) --TODO: add "ammo for launch site"