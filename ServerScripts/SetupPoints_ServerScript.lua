--Create a variable for players
local Players = game:GetService("Players")

--Creat a function that is called when a character is loaded in
local function onCharacterAdded(character, player)
	--Set isAlive to true
	player:SetAttribute("isAlive", true)
	--Create a variable to wait for the humanoid child
	local humanoid = character:WaitForChild("Humanoid")
	--Connect an Anonymous Function to the characters Died Event
	humanoid.Died:Connect(function()
		--Create a variable called points to access the players points
		local points = player.leaderstats.Points
		--Set the value to 0
		points.Value = 0
		player:SetAttribute("isAlive", false)
	end)
end

--Create a function that is called when a new player joins the game
local function onPlayerAdded(player)
	--Create a new folder object
	local leaderstats = Instance.new("Folder")
	--Set the name to leaderstats
	leaderstats.Name = "leaderstats"
	--Parent leaderstats to player
	leaderstats.Parent = player
	
	--Create a new variable, of type IntValue to hold the players points
	local points = Instance.new("IntValue")
	--Set the name to points
	points.Name = "Points"
	--Default the value to 0
	points.Value = 0
	--Parent points to leaderstats
	points.Parent = leaderstats
	
	--Create a new ATTRIBUTE called isAlive
	player:SetAttribute("isAlive", false)
	
	--Pass the character anonymous function
	player.CharacterAdded:Connect(function(character)
		onCharacterAdded(character, player)
	end)
end

--Connect the onPlayerAdded fucntion to PlayerAdded Event
Players.PlayerAdded:Connect(onPlayerAdded)

--Create a loop, to make the player gain points while alive
while true do
	--Invoke wait command
	wait(1)
	--Store the result of GetPlayers in a variable
	local playerList = Players:GetPlayers()
	--Creat a for loop, starting at 1, and an end value of #playerList (#prefix = Length)
	for currentPlayer = 1, #playerList do
		--Store the current player in a local variable
		local player = playerList[currentPlayer]
		
		--Check if the player is alive
		if player:GetAttribute("isAlive") then
			--Store the players points in a local variable
			local points = player.leaderstats.Points
			--Increment the points
			points.Value = points.Value + 1
		end
	end
end
