ConstructEffect = "effects/device_upgrade.lua"
CompleteEffect = "effects/device_complete.lua"
Scale = 0.75
SelectionWidth = 80.0
SelectionHeight = 120
SelectionOffset = { 0.0, 29.33 }
Mass = 40
HitPoints = 250
EnergyProductionRate = -12
MetalProductionRate = 7
EnergyStorageCapacity = 0
MetalStorageCapacity = 0
MinWindEfficiency = 1
MaxWindHeight = 0
MaxRotationalSpeed = 0
DestroyEffect = path.. "/effects/tech_silo_destroyed.lua"

dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter

Sprites =
{
	{
		Name = "miner_anim_techsilo",
		InitialState = "Normal",

		States =
		{
			Normal =
			{
				RandomStartFrame = true,
				Frames =
				{
					{ texture = path .. "/devices/tech_silo/MinerAnim01.tga" },
					{ texture = path .. "/devices/tech_silo/MinerAnim02.tga" },
					{ texture = path .. "/devices/tech_silo/MinerAnim03.tga" },
					{ texture = path .. "/devices/tech_silo/MinerAnim04.tga" },
					{ texture = path .. "/devices/tech_silo/MinerAnim05.tga" },
					{ texture = path .. "/devices/tech_silo/MinerAnim06.tga" },
					{ texture = path .. "/devices/tech_silo/MinerAnim07.tga" },
					{ texture = path .. "/devices/tech_silo/MinerAnim08.tga" },
					{ texture = path .. "/devices/tech_silo/MinerAnim09.tga" },
					{ texture = path .. "/devices/tech_silo/MinerAnim10.tga" },
					{ texture = path .. "/devices/tech_silo/MinerAnim11.tga" },

					duration = 0.1,
					blendColour = false,
					blendCoordinates = false,
					mipmap = true,
				},
				NextState = "Normal",
			},
			Idle =
			{
				Frames =
				{
					{ texture = path .. "/devices/tech_silo/MinerAnim01.tga", colour = { 1, 1, 1, 0 } },
					mipmap = true,
				},
				NextState = "Idle",
			},
		},
	},
	{
		Name = "wheel_anim_techsilo",
		InitialState = "Normal",

		States =
		{
			Normal =
			{
				RandomStartFrame = true,
				Frames =
				{
					{ texture = path .. "/devices/tech_silo/Mine01.tga" },
					{ texture = path .. "/devices/tech_silo/Mine02.tga" },
					{ texture = path .. "/devices/tech_silo/Mine03.tga" },
					{ texture = path .. "/devices/tech_silo/Mine04.tga" },
					{ texture = path .. "/devices/tech_silo/Mine05.tga" },
					{ texture = path .. "/devices/tech_silo/Mine06.tga" },
					{ texture = path .. "/devices/tech_silo/Mine07.tga" },
					{ texture = path .. "/devices/tech_silo/Mine08.tga" },
					{ texture = path .. "/devices/tech_silo/Mine09.tga" },
					{ texture = path .. "/devices/tech_silo/Mine10.tga" },

					duration = 0.1,
					blendColour = false,
					blendCoordinates = false,
					mipmap = true,
				},
				NextState = "Normal",
			},
			Idle =
			{
				Frames =
				{
					{ texture = path .. "/devices/tech_silo/Mine10.tga" },
					mipmap = true,
				},
				NextState = "Idle",
			},
		},
	},
	{
		Name = "tech_silo-base",
		States =
		{
			Normal = { Frames = { { texture = path .. "/devices/tech_silo/base.tga" }, mipmap = true, }, },
		},
	},
}

NodeEffects =
{
	{
		NodeName = "Miner",
		EffectPath = "effects/mine_ambient.lua",
	},
}

Root =
{
	Name = "tech_silo",
	Angle = 0,
	Pivot = { 0, 0.055 },
	PivotOffset = { 0, 0 },
	Sprite = "tech_silo-base",

	ChildrenBehind =
	{
		{
			Name = "Wheel",
			Angle = 0,
			Pivot = { 0.07, -0.33 },
			PivotOffset = { 0, 0 },
			Sprite = "wheel_anim_techsilo",
		},
	},

	ChildrenInFront =
	{
		{
			Name = "Miner",
			Angle = 0,
			Pivot = { 0.17, 0.33 },
			PivotOffset = { 0, 0 },
			Sprite = "miner_anim_techsilo",
		},
		{
			Name = "Miner2",
			Angle = 0,
			Pivot = { 0.1, 0.33 },
			PivotOffset = { 0, 0 },
			MirrorLeaf = true,
			Sprite = "miner_anim_techsilo",
		},
	},
}
