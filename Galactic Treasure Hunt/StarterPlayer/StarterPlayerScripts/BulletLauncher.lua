local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local launchBullet = ReplicatedStorage:WaitForChild("LaunchBullet")
local destroyBullet = ReplicatedStorage:WaitForChild("DestroyBullet")
local destroyEnemy = ReplicatedStorage:WaitForChild("DestroyEnemy")
local pingChecker = ReplicatedStorage:WaitForChild("Ping")
local bullet = ReplicatedStorage:WaitForChild("Bullet")

local player = Players.LocalPlayer
local canLaunch = true

local function onLaunch()

    if player.Character and canLaunch then

        canLaunch = false

        spawn(function()
            wait(1)
            canLaunch = true
        end)

        local bulletClone = bullet:Clone()

        local playerCFrame = player.Character.PrimaryPart.CFrame
        local direction = playerCFrame.LookVector
        bulletClone.Position = playerCFrame.Position + direction * 4
        bulletClone.Velocity = direction * 40

        local mass = bulletClone:GetMass()
        bulletClone.VectorForce.Force = Vector3.new(0, 1, 0) * mass * game.Workspace.Gravity
        bulletClone.Parent = game.Workspace

        local serverBullet = launchBullet:InvokeServer(bulletClone.Position, bulletClone.Velocity)
        serverBullet.LocalTransparencyModifier = 1

        bulletClone.Touched:Connect(function(other)

            if other.Name == "Enemy" or other.Name == "Wall" then

                bulletClone:Destroy()
                destroyBullet:FireServer(serverBullet)

                destroyEnemy:FireServer(other)
                other:Destroy()

            end

        end)

    end

end

pingChecker.OnClientInvoke = function() end

ContextActionService:BindAction("Launch", onLaunch, false, Enum.UserInputType.MouseButton1)
