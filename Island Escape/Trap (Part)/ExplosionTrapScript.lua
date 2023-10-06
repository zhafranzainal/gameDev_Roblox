local trap = script.Parent

local function onTouch(otherPart)

    local humanoid = otherPart.Parent:FindFirstChild("Humanoid")

    -- Check if the one who touches trap is a player (humanoid)
    if humanoid then

        local explosion = Instance.new("Explosion", workspace)

        explosion.Position = trap.Position
        explosion.BlastPressure = 100
        explosion.BlastRadius = 2

        humanoid.Health = 0
        trap:Destroy()

    end

end

trap.Touched:Connect(onTouch)
