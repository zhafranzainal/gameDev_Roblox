local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local launchBullet = ReplicatedStorage:WaitForChild("LaunchBullet")
local pingChecker = ReplicatedStorage:WaitForChild("Ping")
local destroyBullet = ReplicatedStorage:WaitForChild("DestroyBullet")
local destroyEnemy = ReplicatedStorage:WaitForChild("DestroyEnemy")

local bullet = ReplicatedStorage.Bullet
local currentPing = {}

launchBullet.OnServerInvoke = function(player, position, velocity)

    local bulletClone = bullet:Clone()
    bulletClone.Velocity = velocity
    local ping = 0

    if currentPing[player] then
        ping = currentPing[player]
    end

    local offset = ping * velocity * 1.5
    bulletClone.Position = position + offset

    local mass = bulletClone:GetMass()
    bulletClone.VectorForce.Force = Vector3.new(0, 1, 0) * mass * game.Workspace.Gravity

    bulletClone.Parent = game.Workspace
    bulletClone:SetNetworkOwner(nil)

    return bulletClone

end

local function onDestroyBullet(player, bullet)
    bullet:Destroy()
end

local function onDestroyEnemy(player, enemy)

    enemy:Destroy()

    local enemyStat = player.leaderstats:WaitForChild("Score")
    enemyStat.Value = enemyStat.Value + 1

end

local function onPlayerAdded(player)

    while player and wait(2) do

        local start = tick()
        pingChecker:InvokeClient(player)
        local ping = tick() - start
        currentPing[player] = ping

    end

end

local function onPlayerRemoving(player)
    currentPing[player] = nil
end

destroyBullet.OnServerEvent:Connect(onDestroyBullet)
destroyEnemy.OnServerEvent:Connect(onDestroyEnemy)
Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)
