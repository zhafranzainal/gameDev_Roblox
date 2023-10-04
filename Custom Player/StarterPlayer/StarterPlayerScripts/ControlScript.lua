-- Variables
local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local mouse = player:GetMouse()

local PLAYER_SPEED = -48000
local FORWARD_KEY = Enum.KeyCode.W
local forwardForceVector = Vector3.new(0, 0, PLAYER_SPEED)

-- Function for player movement
local function onMove(actionName, inputState)

    -- Check if the input key is pressed
    if inputState == Enum.UserInputState.Begin then

        -- Apply forward force to move the player character
        player.Character.HumanoidRootPart.VectorForce.Force = forwardForceVector

    -- When the key is released
    elseif inputState == Enum.UserInputState.End then

        -- Stop applying force
        player.Character.HumanoidRootPart.VectorForce.Force = Vector3.new(0, 0, 0)

    end

end

-- Function for aiming
local function onAim()

    if player.Character then

        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
        local mouseLocation = Vector3.new(mouse.Hit.X, rootPart.Position.Y, mouse.Hit.Z)

        -- Adjust the character's orientation to face the mouse cursor
        rootPart.CFrame = CFrame.new(rootPart.Position, mouseLocation)

    end

end

-- Event Binding

-- Bind the "Aim" action to the onAim function when there is mouse movement
ContextActionService:BindAction("Aim", onAim, false, Enum.UserInputType.MouseMovement)

-- Bind the "Move" action to the onMove function triggered by "W" as its forward key
ContextActionService:BindAction("Move", onMove, false, FORWARD_KEY)
