local humanoid = script.Parent.Humanoid

-- Define state type as swimming where state refers to the activity the player performs
local swimming = Enum.HumanoidStateType.Swimming

-- Connect a function to the StateChanged event of the character
humanoid.StateChanged:Connect(function()

    -- Check if the character's current state is swimming
    while humanoid:GetState() == swimming do

        -- Make the character take damage of 10 units
        humanoid:TakeDamage(10)

        -- Wait for 1 second before taking damage again
        wait(1)

    end

end)

