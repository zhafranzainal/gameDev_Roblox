-- include this script inside Scoop object

local tool = script.Parent
local scoop = tool.Scoop

local backpack = tool.Parent
local player = backpack.Parent

-- Find leaderboard that is used to store player-specific data
local playerStats = player:FindFirstChild("leaderstats")

-- Find two properties within leaderboard which are Items and Spaces
local playerItems = playerStats:FindFirstChild("Items")
local playerSpaces = playerStats:FindFirstChild("Spaces")

-- When the tool touches item
local function onTouch(partTouched)

	local canHarvest = partTouched.Parent:FindFirstChild("CanHarvest")

    -- Check if the item touched is harvestable
	if canHarvest then

		print("Found an item!")

        -- Check if the item can be harvested and player has enough space in inventory
		if canHarvest.Value == true and playerItems.Value < playerSpaces.Value then

            -- Increase player's item count then prevent item from being harvested again
			playerItems.Value += 1
			canHarvest.Value = false

			-- Make item disappear for 10 seconds
			partTouched.Transparency = 1
			partTouched.CanCollide = false
			wait(10)

			-- Make item reappear then allow item to be harvested again
			partTouched.Transparency = 0
			partTouched.CanCollide = true
			canHarvest.Value = true

		end

	end

end

-- Connect onTouch function to the Touched event of the Scoop (Spoon) object
scoop.Touched:Connect(onTouch)