--Create a local variable for our platform
local platform = script.Parent

--Create a boolean to track if this has been interacted with already
local bIsTouched = false

--Creat a local function to fade on touch
local function fade()
	--Check if this has been interacted with already
	if not bIsTouched then
		--Set this as interacted with
		bIsTouched = true
		--Creat a for loop to loop 10 times
		for count = 1, 10, 1 do		--SAME AS: for(int i = 0; i < 10; i++ / i+=1) in C++/C#
			--Increment the transparency each loop
			platform.Transparency = count / 10
			--Invoke a wait command
			wait(0.3)
		end
		--Disable Collision
		platform.CanCollide = false
		--Invoke a wait command
		wait(3)
		--Reset our platform
		platform.CanCollide = true
		platform.Transparency = 0
		bIsTouched = false
	end

end

--Connect an OnTouched event to our function
platform.Touched:Connect(fade)