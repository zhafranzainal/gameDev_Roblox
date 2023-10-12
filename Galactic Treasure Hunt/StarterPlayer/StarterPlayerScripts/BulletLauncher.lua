local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local launchBullet = ReplicatedStorage:WaitForChild("LaunchBullet")
local pingChecker = ReplicatedStorage:WaitForChild("Ping")
local destroyBullet = ReplicatedStorage:WaitForChild("DestroyBullet")
local destroyEnemy = ReplicatedStorage:WaitForChild("DestroyEnemy")
local bullet = ReplicatedStorage:WaitForChild("Bullet")

local player = Players.LocalPlayer

-- Variable to control the rate at which the player can launch bullets
local canLaunch = true

-- Function to handle bullet launch
local function onLaunch()

    if player.Character and canLaunch then

        -- Prevent rapid firing by scheduling a 1-second delay before allowing the player to shoot again
        canLaunch = false
        spawn(function()
            wait(1)
            canLaunch = true
        end)

        local bulletClone = bullet:Clone()

        -- Get the player's view direction for the bullet's initial position and velocity
        local playerCFrame = player.Character.PrimaryPart.CFrame
        local direction = playerCFrame.LookVector
        bulletClone.Position = playerCFrame.Position + direction * 4
        bulletClone.Velocity = direction * 300

        -- Apply gravity where the force on bulletClone is in the upward direction (Y-axis)
        local mass = bulletClone:GetMass()
        bulletClone.VectorForce.Force = Vector3.new(0, 1, 0) * mass * game.Workspace.Gravity

        -- Make the bullet a child of the game's Workspace
        bulletClone.Parent = game.Workspace

        -- Invoke a server function to handle the bullet on the server side
        local serverBullet = launchBullet:InvokeServer(bulletClone.Position, bulletClone.Velocity)
        serverBullet.LocalTransparencyModifier = 1

        -- Handle interactions when the bullet touches an object
        bulletClone.Touched:Connect(function(other)

            if other.Name == "Enemy" or other.Name == "Wall" then

                -- Destroy the bullet locally and notify the server to destroy it there as well
                bulletClone:Destroy()
                destroyBullet:FireServer(serverBullet)

                -- Notify the server to destroy the enemy and destroy it locally
                destroyEnemy:FireServer(other)
                other:Destroy()

            end

        end)

    end

end

pingChecker.OnClientInvoke = function()
end

-- Bind the "Launch" action to the onLaunch function, triggered when the left mouse button is clicked
ContextActionService:BindAction("Launch", onLaunch, false, Enum.UserInputType.MouseButton1)
