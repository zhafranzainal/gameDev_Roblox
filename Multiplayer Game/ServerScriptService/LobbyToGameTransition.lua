local Players = game:GetService("Players")
local lobbySpawn = game.Workspace.LobbySpawnLoc
local activePlayers = {}

-- 1. Intermission

-- Spawn players in the lobby when they join
Players.PlayerAdded:Connect(function(player)
    player.RespawnLocation = lobbySpawn
end)

-- Waiting for players
repeat

    print("Waiting for players")
    wait(20)
    local totalPlayers = #game.Players:GetPlayers()

until totalPlayers >= 2

print("Ready to start the game!")
wait(5)

-- 2. Teleport Player
for playerKey, player in pairs(Players:GetPlayers()) do

    print("Getting player:", player.Name)

    -- Teleport players to the game area
    table.insert(activePlayers, player)
    player.RespawnLocation = game.Workspace.SpawnLocation
    player:LoadCharacter()

    -- Handle the case when a player dies
    player.Character.Humanoid.Died:Connect(function()

        -- Respawn the dead player to lobby
        player.RespawnLocation = lobbySpawn
        player:LoadCharacter()

        -- Remove the player from the active players list
        for playerKey, player in pairs(activePlayers) do

            if player then
                table.remove(activePlayers, playerKey)
            end

        end

    end)

end
