--  age (in seconds) at which the explosion actor deletes itself
--  make sure this exceedes the age of all effects

LifeSpan = 10.0

Effects =
{
    {
        Type = "sound",
        TimeToTrigger = 0,
        LocalPosition = { x = 0, y = 0, z = 0 },
        Sound = path .. "/effects/sounds/firerollingthunder.wav",
        Volume = 0.4,
    },
}
