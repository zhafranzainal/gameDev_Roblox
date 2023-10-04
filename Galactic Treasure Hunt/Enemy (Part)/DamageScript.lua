local enemy = script.Parent

-- Function to handle when Enemy is touched
local function onTouch(otherPart)

    -- Check if the touched part is the player's character
    if otherPart.Name == "HumanoidRootPart" or otherPart.Name == "Blaster" then

        local character = otherPart.Parent

        -- Move character to the ReplicatedStorage, temporarily
        character.Parent = game:GetService("ReplicatedStorage")

        -- Create an explosion at the character's position and wait for 3 seconds before continuing
        local explosion = Instance.new("Explosion", workspace)
        explosion.Position = character:GetPivot().p
        wait(3)

        -- Restore the character to the workspace
        character.Parent = workspace

        -- Stop the character's motion
        character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        character.HumanoidRootPart.VectorForce.Force = Vector3.new(0, 0, 0)

    end

end

-- Connect onTouch function to the Touched event of the Enemy object
enemy.Touched:Connect(onTouch)
