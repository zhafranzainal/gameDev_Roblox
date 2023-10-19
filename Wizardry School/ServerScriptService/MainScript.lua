-- The ModuleScript which is ServerStorage\StoryManager won't run until it is
-- explicitly called by a script in ServerScriptService (e.g., this MainScript)
local StoryManager = require(game:GetService("ServerStorage"):WaitForChild("StoryManager"))
StoryManager.startStory()
