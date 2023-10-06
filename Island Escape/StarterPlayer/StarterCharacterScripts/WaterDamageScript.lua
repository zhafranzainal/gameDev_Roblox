local humanoid = script.Parent:WaitForChild("Humanoid")
local swimming = Enum.HumanoidStateType.Swimming

-- When player's activity changes
humanoid.StateChanged:Connect(function()

    if humanoid:GetState() == swimming then

        wait(1)

        if humanoid:GetState() == swimming then
            humanoid.Health = 0
        end

    end

end)
