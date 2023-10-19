-- This is a ModuleScript
-- Define a module for managing a game story
local StoryManager = {}

local DialogueEvent = game:GetService("ReplicatedStorage").GuiEvents.DialogueEvent

-- Reference to the NPC model
local npcModel = game.Workspace.Wulfric
local npcImage = "rbxassetid://8856044080"
local npcName = npcModel.Name

-- Send signal as server
local function task1()
    DialogueEvent:FireAllClients(npcImage, npcName, "Welcome to Wizardry School!")
    wait(5)
end

function StoryManager.startStory()
    wait(10)
    task1()
    wait(30)
end

-- Return the StoryManager module for external use
return StoryManager
