function Merge(t1, t2) for k, v in pairs(t2) do t1[k] = v end end

Merge(Device,
{
	Loan_mine = L"Loan",
	Loan_mineTip2 = L"Immediatly gain 200 metal.",
	Loan_mineTip3 = L"Metal generation is offline for a minute, wich would be worth 240 metal.",

	tech_silo = L"Tech Silo",
	tech_siloTip2 = L"Unlocks: Hullbreaker",
	tech_siloTip3 = L"Placed on the ground like a mine",
})