local timePassed = 0
local treasure = script.Parent

-- Function to finish the game
function finish()

    -- Make treasure disappear
    treasure.Transparency = 1
    treasure.CanCollide = false

    print("You found the treasure in " .. timePassed .. " seconds")

    if timePassed <= 15 then
        print("You got a gold medal!")
    elseif timePassed > 15 and timePassed <= 30 then
        print("You got a silver medal!")
    end

end

-- Function to handle when treasure is touched
local function onTouch(otherPart)

    local canHarvest = treasure:FindFirstChild("CanHarvest")

    -- Check if treasure can be harvested
    if canHarvest.Value == true then

        if otherPart.Name == "HumanoidRootPart" or otherPart.Name == "Blaster" then
            local character = otherPart.Parent
            canHarvest.Value = false
            finish()
        end

    end

end

-- Connect onTouch function to the Touched event of the Treasure object
treasure.Touched:Connect(onTouch)

-- Continuously increase the time passed by 1 second
while true do

    wait(1)
    timePassed += 1

end
