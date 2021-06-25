--Create a local variable for our lava (parent object)
local lava = script.Parent

--Create our kill player function
local function killPlayer(otherPart)
	--Create a reference to the touched parts parent
	local partParent = otherPart.Parent
	--Create a humanoid reference to the parts root
	local humanoid = partParent:FindFirstChild("Humanoid")
	--Check if the humanoid was found / valid
	if humanoid then
		--Set the players health to 0 / kill the player
		humanoid.Health = 0
	end
end

--Connect an OnTouched event to our function
lava.Touched:Connect(killPlayer)