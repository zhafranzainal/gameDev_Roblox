local function onPlayerJoin(player)

    --[[
		Folder must be specifically named as 'leaderstats' with all lowercase letters,
		otherwise Roblox won't add player to leaderboard
	]]
    -- Create a new folder to store leaderboard data for the player
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    -- Add Gold to Leaderboard
    local gold = Instance.new("IntValue")
    gold.Name = "Gold"
    gold.Value = 0
    gold.Parent = leaderstats

    -- Add Item to Leaderboard
    local items = Instance.new("IntValue")
    items.Name = "Items"
    items.Value = 0
    items.Parent = leaderstats

    -- Add Space to Leaderboard
    local spaces = Instance.new("IntValue")
    spaces.Name = "Spaces"
    spaces.Value = 2
    spaces.Parent = leaderstats

end

-- When player enters the game, onPlayerjoin function will be executed
game.Players.PlayerAdded:Connect(onPlayerJoin)
