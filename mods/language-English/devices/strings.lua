function Merge(t1, t2) for k, v in pairs(t2) do t1[k] = v end end

Merge(Device,
{
	ammo_kirov = L"Kirov airship",
	ammo_kirovTip2 = L"Slow but fearsome war-zeppelin boasting vast stores of heavy iron bombs",
	ammo_kirovTip3 = L"Requires: Munitions Plant",

	clauker = L"Clauker",
	claukerTip2 = L"Bulky, explosive, and expensive mine capable of producing vast amounts of metal",
	claukerTip3 = L"Not upgradeable",
}) --TODO: add "ammo for launch site"