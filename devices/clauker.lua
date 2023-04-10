--derrick is taken from base game but enabled
ConstructEffect = "effects/device_construct.lua"
CompleteEffect = "effects/device_complete.lua"
DestroyEffect = "effects/battery_explode.lua"
Scale = 1
SelectionWidth = 160.0
SelectionHeight = 130.0
SelectionOffset = { 0.0, -140.0 }
Mass = 200 --doesnt really matter
HitPoints = 600.0
EnergyProductionRate = -40.0
MetalProductionRate = 22
MinWindEfficiency = 1
MaxWindHeight = 0
MaxRotationalSpeed = 0
NeutralColour = 1
IncendiaryRadius = 300
IncendiaryRadiusHeated = 400

dofile("effects/device_smoke.lua")
SmokeEmitter = StandardDeviceSmokeEmitter

Sprites =
{
    {
        Name = "derrick_anim2",
        InitialState = "Normal",

        States =
        {
            Normal =
            {
                RandomStartFrame = true,
                Frames =
                {
                    { texture = "devices/derrick/DerrickArm01.png" },
                    { texture = "devices/derrick/DerrickArm02.png" },
                    { texture = "devices/derrick/DerrickArm03.png" },
                    { texture = "devices/derrick/DerrickArm04.png" },
                    { texture = "devices/derrick/DerrickArm05.png" },
                    { texture = "devices/derrick/DerrickArm06.png" },
                    { texture = "devices/derrick/DerrickArm07.png" },
                    { texture = "devices/derrick/DerrickArm08.png" },
                    { texture = "devices/derrick/DerrickArm09.png" },
                    { texture = "devices/derrick/DerrickArm08.png" },
                    { texture = "devices/derrick/DerrickArm07.png" },
                    { texture = "devices/derrick/DerrickArm06.png" },
                    { texture = "devices/derrick/DerrickArm05.png" },
                    { texture = "devices/derrick/DerrickArm04.png" },
                    { texture = "devices/derrick/DerrickArm03.png" },
                    { texture = "devices/derrick/DerrickArm02.png" },

                    duration = 0.1,
                    blendColour = false,
                    blendCoordinates = false,
                    mipmap = true,
                },
                NextState = "Normal",
            },
            Idle = Normal,
        },
    },
    {
        Name = "flag_team12",
        InitialState = "Normal",

        States =
        {
            Normal =
            {
                RandomStartFrame = true,
                Frames =
                {
                    { texture = "devices/derrick/FlagBlue01.png" },
                    { texture = "devices/derrick/FlagBlue02.png" },
                    { texture = "devices/derrick/FlagBlue03.png" },
                    { texture = "devices/derrick/FlagBlue04.png" },
                    { texture = "devices/derrick/FlagBlue05.png" },
                    { texture = "devices/derrick/FlagBlue06.png" },

                    duration = 0.1,
                    blendColour = false,
                    blendCoordinates = false,
                    mipmap = true,
                },
                NextState = "Normal",
            },
            Idle = Normal,
        },
    },
    {
        Name = "flag_team22",
        InitialState = "Normal",

        States =
        {
            Normal =
            {
                RandomStartFrame = true,
                Frames =
                {
                    { texture = "devices/derrick/FlagRed01.png" },
                    { texture = "devices/derrick/FlagRed02.png" },
                    { texture = "devices/derrick/FlagRed03.png" },
                    { texture = "devices/derrick/FlagRed04.png" },
                    { texture = "devices/derrick/FlagRed05.png" },
                    { texture = "devices/derrick/FlagRed06.png" },

                    duration = 0.1,
                    blendColour = false,
                    blendCoordinates = false,
                    mipmap = true,
                },
                NextState = "Normal",
            },
            Idle = Normal,
        },
    },
    {
        Name = "derrick-base2",
        States =
        {
            Normal = { Frames = { { texture = "devices/derrick/base.tga" }, mipmap = true, }, },
        },
    },
}

Root =
{
    Name = "Derrick2",
    Angle = 0,
    Pivot = { 0, -0.34 },
    PivotOffset = { 0, 0 },
    Sprite = "derrick-base2",

    ChildrenBehind =
    {
        {
            Name = "Arm",
            Angle = 0,
            Pivot = { -0.2, 0.15 },
            PivotOffset = { 0, 0 },
            Sprite = "derrick_anim2",
        },
        {
            Name = "FlagTeam1",
            Angle = 0,
            Pivot = { 0.25, -0.2 },
            PivotOffset = { 0, 0 },
            Sprite = "flag_team12",
        },
        {
            Name = "FlagTeam2",
            Angle = 0,
            Pivot = { 0.25, -0.2 },
            PivotOffset = { 0, 0 },
            Sprite = "flag_team22",
        },
    },
}
