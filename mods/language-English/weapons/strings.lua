function Merge(t1, t2) for k, v in pairs(t2) do t1[k] = v end end

Merge(Weapon,
{
	rollingthunder = L"Rolling thunder",--add weapon description for bottom HUD here, follow the format of the other weapons
	rollingthunderTip2 = L"Fires a barrage of high explosive missiles",
	rollingthunderTip3 = L"Requires: Munitions Plant",

	launchsite = L"Launch Site",
	launchsiteTip2 = L"Site required to launch the Kirov airship",
	launchsiteTip3 = L"Requires: Munitions Plant",

	kirovammo = L"Kirov airship",

	cram = L"C-RAM",
	cramTip2 = L"Advanced anti air weapon that fires three bursts before needing to cool down, popcap of 1",
	cramTip3 = L"Requires: Factory",

	lobber = L"Rockeye",
	lobberTip2 = L"Fires cluster shells that release bomblets at the specified range",
	lobberTip3 = L"Requires: Workshop",
}
)
