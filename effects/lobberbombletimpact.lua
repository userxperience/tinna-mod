--  age (in seconds) at which the explosion actor deletes itself
--  make sure this exceedes the age of all effects

LifeSpan = 10.0

Effects =
{
    {
        Type = "sound",
        TimeToTrigger = 0,
        LocalPosition = { x = 0, y = 0, z = 0 },
        Sound = path .. "/effects/sounds/lobberbombletimpact.wav",
        Volume = 0.4,
    },
    {
        --DUST CLOUDS
        Type = "sparks",
        TimeToTrigger = 0,
        SparkCount = 6,
        BurstPeriod = 50,
        SparksPerBurst = 16,
        Additive = true,
        LocalPosition = { x = 0, y = 0 },	-- how to place the origin relative to effect position and direction (0, 0)
        Texture = "effects/media/smoke",

        Gravity = 0,						-- gravity applied to particle (981 is earth equivalent)

        EvenDistribution =					-- distribute sparks evenly between two angles with optional variation
        {
            Min = -10,						-- minimum angle in degrees (e.g. -180, 45, 0)
            Max = 10,						-- maximum angle in degrees (e.g. -180, 45, 0)
            StdDev = 5,						-- standard deviation at each iteration in degrees (zero will make them space perfectly even)
        },

        Keyframes =
        {
            {
                Angle = 0,
                RadialOffsetMin = 0,
                RadialOffsetMax = 20,
                ScaleMean = 3,
                ScaleStdDev = 0.35,
                SpeedStretch = 0,
                SpeedMean = 250,
                SpeedStdDev = 100,
                Drag = 1,
                RotationMean = 0,
                RotationStdDev = 45,
                RotationalSpeedMean = 5,
                RotationalSpeedStdDev = 0,
                AgeMean = 1.5,
                AgeStdDev = 0.5,
                AlphaKeys = { 0.5, 0.5 },
                ScaleKeys = { 0.1, 0.5 },
            },
        },
    },
}
