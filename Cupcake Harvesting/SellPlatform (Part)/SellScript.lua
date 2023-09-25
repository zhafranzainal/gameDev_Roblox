local sellPlatform = script.Parent

-- Function to sell items and update player's gold
local function sellItem(playerItems, playerGold)

	-- Get 100 gold for each sold item
	local totalSell = playerItems.Value * 100
	playerGold.Value += totalSell

	-- After selling items, reset player's items to 0
	playerItems.Value = 0

end

-- Function to handle when the selling platform is touched
local function onTouch(partTouched)

	-- Get the character that touched the selling platform
	local character = partTouched.Parent

	-- Check if the character has a "Humanoid" object (a common indicator of a player character)
	local humanoid = character:FindFirstChildWhichIsA("Humanoid")

	if humanoid then

		-- Find the player associated with the character
		local player = game.Players:GetPlayerFromCharacter(humanoid.Parent)

		-- Find the player's leaderboard
		local playerStats = player:FindFirstChild("leaderstats")

		-- Find two properties within leaderboard which are Items and Gold
		local playerItems = playerStats:FindFirstChild("Items")
		local playerGold = playerStats:FindFirstChild("Gold")

		print("A player touched the selling platform")

		sellItem(playerItems, playerGold)

	end

end

-- Connect onTouch function to the Touched event of the selling platform
sellPlatform.Touched:Connect(onTouch)