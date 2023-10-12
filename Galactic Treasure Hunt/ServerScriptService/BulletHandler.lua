local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local launchBullet = ReplicatedStorage:WaitForChild("LaunchBullet")
local pingChecker = ReplicatedStorage:WaitForChild("Ping")
local destroyBullet = ReplicatedStorage:WaitForChild("DestroyBullet")
local destroyEnemy = ReplicatedStorage:WaitForChild("DestroyEnemy")
local bullet = ReplicatedStorage.Bullet

-- Initialize a table to store player pings
local currentPing = {}

-- Server-side function for launching bullets
launchBullet.OnServerInvoke = function(player, position, velocity)

    local bulletClone = bullet:Clone()
    bulletClone.Velocity = velocity
    local ping = 0

    -- Check if the player has a recorded ping
    if currentPing[player] then
        ping = currentPing[player]
    end

    -- Calculate an offset based on the ping
    local offset = ping * velocity * 1.5
    bulletClone.Position = position + offset

    -- Apply gravity to the bullet
    local mass = bulletClone:GetMass()
    bulletClone.VectorForce.Force = Vector3.new(0, 1, 0) * mass * game.Workspace.Gravity

    bulletClone.Parent = game.Workspace

    -- Clear network ownership
    bulletClone:SetNetworkOwner(nil)

    return bulletClone

end

-- Function to destroy a bullet
local function onDestroyBullet(player, bullet)
    bullet:Destroy()
end

-- Function to destroy an enemy
local function onDestroyEnemy(player, enemy)

    enemy:Destroy()

    local enemyStat = player.leaderstats:WaitForChild("Score")
    enemyStat.Value += 1

end

-- Function to handle player added event
local function onPlayerAdded(player)

    while player and wait(2) do

        local start = tick()
        pingChecker:InvokeClient(player)
        local ping = tick() - start
        currentPing[player] = ping

    end

end

-- Function to handle player removing event
local function onPlayerRemoving(player)
    currentPing[player] = nil
end

-- Connect server functions to corresponding events and signals
destroyBullet.OnServerEvent:Connect(onDestroyBullet)
destroyEnemy.OnServerEvent:Connect(onDestroyEnemy)
Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)
