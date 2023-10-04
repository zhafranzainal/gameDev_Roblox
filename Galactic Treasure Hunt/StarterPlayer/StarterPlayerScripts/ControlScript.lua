-- Variables

-- To bind actions to specified function when there is specific input
local ContextActionService = game:GetService("ContextActionService")

--  To get information about players in the game then get local player
local player = game:GetService("Players").LocalPlayer

-- Represents player's mouse
local mouse = player:GetMouse()

local PLAYER_SPEED = 48000
local FORWARD_KEY = Enum.KeyCode.W
local SPACE_KEY = Enum.KeyCode.Space

-- x-axis: left and right, y-axis: downward and upward, z-axis: forward and backward
local forwardForceVector = Vector3.new(0, 0, -PLAYER_SPEED)
local upForceVector = Vector3.new(0, PLAYER_SPEED, 0)

-- Function for player movement
local function onMove(actionName, inputState)

    -- Check if the input key is pressed
    if inputState == Enum.UserInputState.Begin then

        if actionName == "MoveForward" then
            player.Character.HumanoidRootPart.VectorForce.Force = forwardForceVector
        elseif actionName == "MoveUpward" then
            player.Character.HumanoidRootPart.VectorForce.Force = upForceVector
        end

    elseif inputState == Enum.UserInputState.End then

        -- Stop applying force when the key is released
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

-- Bind the "MoveForward" action to the onMove function triggered by "W" as its forward key
ContextActionService:BindAction("MoveForward", onMove, false, FORWARD_KEY)

-- Bind the "MoveUpward" action to the onMove function triggered by spacebar
ContextActionService:BindAction("MoveUpward", onMove, false, SPACE_KEY)
