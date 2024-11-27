

print("Hello world!")
local Players = game:GetService("Players")

-- Function to find a player by partial name

local bringz = false
workspace.FallenPartsDestroyHeight=0/0
queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
print("working")
local currentreceiptinfo = {
	action = "receipt",
	message = "blablabla",
	caller = nil,
	id = nil,
	room = nil,
	indicator = nil,
	roomid = nil,
	stomps = nil
}
-- v3

local stompstodo = 100
local originalstomp = 0
if not game:IsLoaded() then game.Loaded:Wait() end


local Stats = game:GetService("Stats")
wait(5)
local function getUserPing()
	local ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
	return ping or 0 --// Divide by 1000 to get exact ping (i think, i dont remember if it returns in ms or numbers)
end

local function glitchcommunication(action2,message2,info)
	local url = "https://giddy-rogue-macaroni.glitch.me/submit"

	local headers = {
		["Content-Type"] = "application/json"
	}

	-- Modify the data table to include both "action" and "message"

	local data = {
		action = action2,
		message = message2
	}
	if action2 == "receipt" then
		data = info
	end
	local jsonData = game:GetService("HttpService"):JSONEncode(data)

	local response = request({
		Url = url,
		Method = "POST",
		Headers = headers,
		Body = jsonData
	})

	if response.StatusCode == 200 then
		print("Data posted successfully:", response.Body)
		return response.Body
	else
		warn("Failed to post data:", response.StatusMessage)
		return false
	end
end

function completereceipt(info)
	glitchcommunication("receipt","blabla",info)
end
local HttpService = game:GetService("HttpService")
local firebaseUrl = "https://snipehanl-default-rtdb.europe-west1.firebasedatabase.app/COMPLETED.json"

function checkforfinished(code)
	local data
	local success,error = pcall(function()
		data = game:HttpGet(firebaseUrl)

	end)

	if error then print(error) end
	if success then print("got data") end
	data = game:GetService("HttpService"):JSONDecode(data)
	print(data)
	local found = false
	for i,v in pairs(data) do  

		if i == code then 
			found = true
			print("found code!!!!!!!!!!!!!!!!!!!!!!!!!!")
		end
	end
	return found
end



local shouldbeattacking = true
local target 
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(-217,-500,181)) * CFrame.Angles(0, 0, 0))
function purchasearmor()
	local armor = game.Workspace.Ignored.Shop:FindFirstChild("[Medium Armor] - $1066")
	game.Players.LocalPlayer.Character.PrimaryPart.CFrame = armor:FindFirstChild("Head").CFrame
	wait(0.5)
	fireclickdetector(armor:FindFirstChild("ClickDetector"))
	wait(0.5)
	game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(-217,-500,181)) * CFrame.Angles(0, 0, 0))
end

function checkforammo()
	if game.Players.LocalPlayer.DataFolder.Inventory["[LMG]"].Value < 2 then
		local lmgAMMO = game.Workspace.Ignored.Shop:FindFirstChild("200 [LMG Ammo] - $318")
		local cd = lmgAMMO:FindFirstChild("ClickDetector")
		game.Players.LocalPlayer.Character.PrimaryPart.CFrame = lmgAMMO.Head.CFrame
		for i = 1,15 do
			game.Players.LocalPlayer.Character.PrimaryPart.CFrame = lmgAMMO.Head.CFrame
			wait(0.1)
			if cd then
				fireclickdetector(cd)
			end
			game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(-217,-500,181)) * CFrame.Angles(0, 0, 0))
			wait(0.05)
		end
	end
end

function attack()
	local activeconnections = {
		A = nil,
		B = nil,
		C = nil,
		D = nil
	}
	local ping = getUserPing()
	local pred = 0

	if ping > 80 and ping < 120 then
		pred = 0.15
	elseif ping > 120 and ping < 250 then
		pred = 0.225
	elseif ping > 200 and ping < 320 then
		pred = 2.5
	elseif ping > 320 then
		pred = 3
	end
	pred = 0

	print("attacking.../")
	local attack = true
	local gun = "[LMG]"
	local player = game.Players.LocalPlayer
	local character = game.Players.LocalPlayer.Character
	function noclipactive()
		for i,v in pairs(character:GetChildren()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	end

	function grabguns()
		local lmg = game.Workspace.Ignored.Shop:FindFirstChild("[LMG] - $3978")
		local lmgAMMO = game.Workspace.Ignored.Shop:FindFirstChild("200 [LMG Ammo] - $318")

		game.Players.LocalPlayer.Character.PrimaryPart.CFrame = lmg.Head.CFrame
		wait(1)
		repeat wait(0.1)
			fireclickdetector(lmg.ClickDetector)
		until not shouldbeattacking or game.Players.LocalPlayer.Backpack:FindFirstChild("[LMG]") or  game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("[LMG]")
		wait(1)
		repeat task.wait()
		until lmgAMMO:FindFirstChild("ClickDetector") or not shouldbeattacking
		local cd = lmgAMMO:FindFirstChild("ClickDetector")
		game.Players.LocalPlayer.Character.PrimaryPart.CFrame = lmgAMMO.Head.CFrame
		for i = 1,15 do
			game.Players.LocalPlayer.Character.PrimaryPart.CFrame = lmgAMMO.Head.CFrame
			wait(0.1)
			if cd then
				fireclickdetector(cd)
			end
			game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(-217,-500,181)) * CFrame.Angles(0, 0, 0))
		end
	end

	if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Framework",true) then
		game.Players.LocalPlayer.PlayerGui:FindFirstChild("Framework",true):Destroy()
	end
	function shoot()
		local args = {
			[1] = "Shoot"
		}

		game:GetService("Players").LocalPlayer.Character:FindFirstChild("[LMG]").RemoteEvent:FireServer(unpack(args))

		local args = {
			[1] = "ShootGun",
			[2] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("[LMG]").Handle,
			[3] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("[LMG]").Handle.Position,
			[4] = target.Character.Head.Position,
			[5] =  target.Character.Head,
			[6] = target.Character.Head.CFrame.LookVector
		}

		game:GetService("ReplicatedStorage"):FindFirstChild("MainEvent"):FireServer(unpack(args))

		game:GetService("Players").LocalPlayer.Character:FindFirstChild("[LMG]").RemoteEvent:FireServer()

	end

	function setupgun()
		if player.Backpack:FindFirstChild(gun) then
			local tool = player.Backpack:FindFirstChild(gun)
			character.Humanoid:EquipTool(tool)
			shoot()
			tool.Ammo.Changed:Connect(function()
				if tool.Ammo.Value < 1 then
					game.ReplicatedStorage.MainEvent:FireServer("Reload",tool)
				else
					shoot()
				end



			end)
		else
			pcall(grabguns)
		end
	end

	function Reload()
		if character:FindFirstChildWhichIsA("Tool") then
			local tool = character:FindFirstChildWhichIsA("Tool")
			if tool:FindFirstChild("Ammo") and tool:FindFirstChild("Ammo").Value == 0 then
				game.ReplicatedStorage.MainEvent:FireServer("Reload",tool)
			end
		end
	end

	function stomp()
		game.ReplicatedStorage.MainEvent:FireServer("Stomp")
	end
	local Distance = 10
	local Character = character
	-- Initialize the global prediction value
	getgenv().VoidxSilent = getgenv().VoidxSilent or {}
	getgenv().VoidxSilent.Prediction = 0  -- Set the original prediction value

	-- Function to get the closest hit point, always returning the HumanoidRootPart
	local function GetClosestHitPoint(targetModel)
		if targetModel then
			local humanoidRootPart = targetModel:FindFirstChild("HumanoidRootPart")
			if humanoidRootPart  then
				return humanoidRootPart, humanoidRootPart.Position
			end
		end
		return nil, nil
	end

	-- Store the original prediction value
	local originalPrediction = getgenv().VoidxSilent.Prediction
	getgenv().VoidxSilent.Resolver = true
	local mybd = character:FindFirstChild("BodyEffects") 
	mybd:FindFirstChild("K.O"):GetPropertyChangedSignal("Value"):Connect(function()
		pcall(function()
			if mybd:FindFirstChild("K.O").Value == true then
				game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
			end
		end)
	end)

	player.CharacterAdded:Connect(function()
		local mybd = character:FindFirstChild("BodyEffects") 
		mybd:FindFirstChild("K.O"):GetPropertyChangedSignal("Value"):Connect(function()
			pcall(function()
				if mybd:FindFirstChild("K.O").Value == true then
					game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
				end
			end)
		end)
	end)
	-- Function to get the velocity of the target's part
	local function GetVelocity(target, partName)
		if target and target.Character then
			local targetPart = target.Character:FindFirstChild(partName)
			if targetPart then
				local velocity = targetPart.Velocity
				if velocity.Y < -30 and getgenv().VoidxSilent.Resolver then
					getgenv().VoidxSilent.Prediction = 0
					return velocity
				elseif velocity.Magnitude > 50 and getgenv().VoidxSilent.Resolver then
					return target.Character:FindFirstChild("Humanoid").MoveDirection * 16
				else
					getgenv().VoidxSilent.Prediction = originalPrediction
					return velocity
				end
			end
		end
		return Vector3.new(0, 0, 0)
	end


	pcall(setupgun)
	local SineX, SineZ = 0, math.pi / 2
	local HumanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	local bd = target and target.Character and target.Character:FindFirstChild("BodyEffects") and (target.Character:FindFirstChild("BodyEffects") or target.Character:FindFirstChild("BodyEffects"))

	local ko = target and target.Character and target.Character:FindFirstChild("BodyEffects") and (target.Character:FindFirstChild("BodyEffects"):FindFirstChild("K.O") or target.Character:FindFirstChild("BodyEffects"):FindFirstChild("KO"))

	activeconnections.A = ko:GetPropertyChangedSignal("Value"):Connect(function()
		if ko.Value then
			character.Humanoid:UnequipTools()
			pcall(function()
				game:GetService('ReplicatedStorage'):WaitForChild('DefaultChatSystemChatEvents'):WaitForChild('SayMessageRequest'):FireServer("dont mess w my boys g", 'All')
			end)
			attack = not ko.Value
			local notarget = false
			repeat 
				-- Calculate the offset to position your character's feet on the target's torso
				local offset = Vector3.new(0, character.PrimaryPart.Size.Y / 2, 0)

				-- Move your character to stand on the target's torso
				if target and target.Character and character then 
					character.PrimaryPart.CFrame = CFrame.new(target.Character.UpperTorso.Position + Vector3.new(0,2,0))
				else

					game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(-217,-500,181)) * CFrame.Angles(0, 0, 0))
					notarget = true


				end
				-- Fire the "Stomp" event
				wait(0.1)

				game.ReplicatedStorage.MainEvent:FireServer("Stomp")

				-- Wait 0.5 seconds before the next iteration

			until not target or bd:FindFirstChild("Dead").Value == true or bd:FindFirstChild("K.O").Value == false or not shouldbeattacking

			-- Move the player's character to a new position after the loop ends
			stompstodo = stompstodo - 1
			game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(-217,-500,181)) * CFrame.Angles(0, 0, 0))
			pcall(purchasearmor)
		end
	end)

	activeconnections.B = target.CharacterAdded:Connect(function()
		wait(1)
		repeat 
			task.wait()
		until not target or not target.Character:FindFirstChildWhichIsA("ForceField") 
		attack = true
		if not target or not target.Character then return end
		local bd = target and target.Character and target.Character:FindFirstChild("BodyEffects") and (target.Character:FindFirstChild("BodyEffects") or target.Character:FindFirstChild("BodyEffects"))

		local ko = target and target.Character and target.Character:FindFirstChild("BodyEffects") and (target.Character:FindFirstChild("BodyEffects"):FindFirstChild("K.O") or target.Character:FindFirstChild("BodyEffects"):FindFirstChild("KO"))

		activeconnections.C = ko:GetPropertyChangedSignal("Value"):Connect(function()
			if ko.Value then

				character.Humanoid:UnequipTools()
				pcall(function()
					game:GetService('ReplicatedStorage'):WaitForChild('DefaultChatSystemChatEvents'):WaitForChild('SayMessageRequest'):FireServer("Dont touch my brudda yeah?", 'All')
				end)
				attack = not ko.Value
				local notarget = false
				repeat 

					if target and target.Character and character then 
						character.PrimaryPart.CFrame = CFrame.new(target.Character.UpperTorso.Position + Vector3.new(0,2,0))
					else

						game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(-217,-500,181)) * CFrame.Angles(0, 0, 0))

						notarget = true

					end
					wait(0.1)
					game.ReplicatedStorage.MainEvent:FireServer("Stomp")

				until  not target or notarget or bd:FindFirstChild("Dead").Value == true  or bd:FindFirstChild("K.O").Value == false or not shouldbeattacking

				game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(-217,-500,181)) * CFrame.Angles(0, 0, 0))
				stompstodo = stompstodo - 1
				pcall(purchasearmor)
			end
		end)

	end)
	local connection
	local disconnectfactor = false
	local function disconnecting()
		if connection then connection:Disconnect() end 
		disconnectfactor = true
		shouldbeattacking = false
		target = nil
		attack = false
		if player.Character then
			player.Character.Humanoid:UnequipTools()
		end
	end

	local function checkdatabase()

		if not target then return false end

		local dictionary
		pcall(function()

			dictionary = loadstring(game:HttpGet("https://giddy-rogue-macaroni.glitch.me"))()
		end) 

		local found = false

		if dictionary and target then 
			for i,v in pairs(dictionary) do 
				if i == tostring(target.UserId) then
					found = true
				end
			end
		end

		if found then
			found = not checkforfinished(currentreceiptinfo.indicator)
			print(found)
			warn("receipt infooooooooo "..tostring(checkforfinished(currentreceiptinfo.indicator)))
		end

		return found
	end


	game.Players.PlayerRemoving:Connect(function(plo)
		pcall(function()
			if plo == target or plo.UserId == target.UserId then
				disconnecting()
			end
		end)
	end)

	local increment = 0
	connection = game:GetService("RunService").RenderStepped:Connect(function()
		if shouldbeattacking and target then 
			increment = increment + 1
			if increment > 300 then
				if  stompstodo < 1 then
					disconnecting()
					return
				end
				increment = 0
			end

			if attack and target and target.Character then
				local Part = target.Character.PrimaryPart
				pcall(noclipactive)
				pcall(shoot)
				pcall(Reload)
				pcall(checkforammo)
				local speaker = game.Players.LocalPlayer
				if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
					speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
				end
				if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Framework",true) then
					game.Players.LocalPlayer.PlayerGui:FindFirstChild("Framework",true):Destroy()
				end

				if not character:FindFirstChildWhichIsA("Tool") then pcall(setupgun) end
				if target and not target.Character then return end
				local s,t = GetClosestHitPoint(target.Character)
				if not s then return end
				local v = GetVelocity(target, s.Name)
				local camera = workspace.CurrentCamera
				if camera and target.Character.PrimaryPart then
					camera.CFrame = CFrame.new(camera.CFrame.Position, target.Character.PrimaryPart.Position)
				end
				--game.ReplicatedStorage.MainEvent:FireServer("UpdateMousePosI2",t+v*getgenv().VoidxSilent.Prediction)

				SineX, SineZ = SineX + 1, SineZ + 1
				local SinX, SinZ = math.sin(SineX), math.sin(SineZ)
				if HumanoidRootPart and character and target.Character then
					HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
					HumanoidRootPart.CFrame = CFrame.new(SinX * Distance, 0, SinZ * Distance) *
						(HumanoidRootPart.CFrame - HumanoidRootPart.CFrame.p) +
						Part.CFrame.p
				end
			end
		else
			disconnecting()
		end
	end)

	while not disconnectfactor do 
		wait(0.1)
	end
	for _,con in pairs(activeconnections) do 
		if con then con:Disconnect() end
	end
	return true 
end


---------------------------------------
function grab(owner)
	local activeconnections = {
		A = nil,
		B = nil,
		C = nil,
		D = nil
	}
	local ping = getUserPing()
	local pred = 0

	if ping > 80 and ping < 120 then
		pred = 0.15
	elseif ping > 120 and ping < 250 then
		pred = 0.225
	elseif ping > 200 and ping < 320 then
		pred = 2.5
	elseif ping > 320 then
		pred = 3
	end
	pred = 0

	print("attacking.../")
	local attack = true
	local gun = "[LMG]"
	local player = game.Players.LocalPlayer
	local character = game.Players.LocalPlayer.Character
	function noclipactive()
		for i,v in pairs(character:GetChildren()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	end

	function grabguns()
		local lmg = game.Workspace.Ignored.Shop:FindFirstChild("[LMG] - $3978")
		local lmgAMMO = game.Workspace.Ignored.Shop:FindFirstChild("200 [LMG Ammo] - $318")

		game.Players.LocalPlayer.Character.PrimaryPart.CFrame = lmg.Head.CFrame
		wait(1)
		repeat wait(0.1)
			fireclickdetector(lmg.ClickDetector)
		until not shouldbeattacking or game.Players.LocalPlayer.Backpack:FindFirstChild("[LMG]") or  game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("[LMG]")
		wait(1)
		repeat task.wait()
		until lmgAMMO:FindFirstChild("ClickDetector") or not shouldbeattacking
		local cd = lmgAMMO:FindFirstChild("ClickDetector")
		game.Players.LocalPlayer.Character.PrimaryPart.CFrame = lmgAMMO.Head.CFrame
		for i = 1,15 do
			game.Players.LocalPlayer.Character.PrimaryPart.CFrame = lmgAMMO.Head.CFrame
			wait(0.1)
			if cd then
				fireclickdetector(cd)
			end
			game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(-217,-500,181)) * CFrame.Angles(0, 0, 0))
		end
	end

	if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Framework",true) then
		game.Players.LocalPlayer.PlayerGui:FindFirstChild("Framework",true):Destroy()
	end
	function shoot()
		local args = {
			[1] = "Shoot"
		}

		game:GetService("Players").LocalPlayer.Character:FindFirstChild("[LMG]").RemoteEvent:FireServer(unpack(args))

		local args = {
			[1] = "ShootGun",
			[2] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("[LMG]").Handle,
			[3] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("[LMG]").Handle.Position,
			[4] = target.Character.Head.Position,
			[5] =  target.Character.Head,
			[6] = target.Character.Head.CFrame.LookVector
		}

		game:GetService("ReplicatedStorage"):FindFirstChild("MainEvent"):FireServer(unpack(args))

		game:GetService("Players").LocalPlayer.Character:FindFirstChild("[LMG]").RemoteEvent:FireServer()

	end

	function setupgun()
		if player.Backpack:FindFirstChild(gun) then
			local tool = player.Backpack:FindFirstChild(gun)
			character.Humanoid:EquipTool(tool)
			shoot()
			tool.Ammo.Changed:Connect(function()
				if tool.Ammo.Value < 1 then
					game.ReplicatedStorage.MainEvent:FireServer("Reload",tool)
				else
					shoot()
				end



			end)
		else
			pcall(grabguns)
		end
	end

	function Reload()
		if character:FindFirstChildWhichIsA("Tool") then
			local tool = character:FindFirstChildWhichIsA("Tool")
			if tool:FindFirstChild("Ammo") and tool:FindFirstChild("Ammo").Value == 0 then
				game.ReplicatedStorage.MainEvent:FireServer("Reload",tool)
			end
		end
	end

	function stomp()
		game.ReplicatedStorage.MainEvent:FireServer("Stomp")
	end
	local Distance = 10
	local Character = character
	-- Initialize the global prediction value
	getgenv().VoidxSilent = getgenv().VoidxSilent or {}
	getgenv().VoidxSilent.Prediction = 0  -- Set the original prediction value

	-- Function to get the closest hit point, always returning the HumanoidRootPart
	local function GetClosestHitPoint(targetModel)
		if targetModel then
			local humanoidRootPart = targetModel:FindFirstChild("HumanoidRootPart")
			if humanoidRootPart  then
				return humanoidRootPart, humanoidRootPart.Position
			end
		end
		return nil, nil
	end

	-- Store the original prediction value
	local originalPrediction = getgenv().VoidxSilent.Prediction
	getgenv().VoidxSilent.Resolver = true
	local mybd = character:FindFirstChild("BodyEffects") 
	mybd:FindFirstChild("K.O"):GetPropertyChangedSignal("Value"):Connect(function()
		pcall(function()
			if mybd:FindFirstChild("K.O").Value == true then
				game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
			end
		end)
	end)

	player.CharacterAdded:Connect(function()
		local mybd = character:FindFirstChild("BodyEffects") 
		mybd:FindFirstChild("K.O"):GetPropertyChangedSignal("Value"):Connect(function()
			pcall(function()
				if mybd:FindFirstChild("K.O").Value == true then
					game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
				end
			end)
		end)
	end)
	-- Function to get the velocity of the target's part
	local function GetVelocity(target, partName)
		if target and target.Character then
			local targetPart = target.Character:FindFirstChild(partName)
			if targetPart then
				local velocity = targetPart.Velocity
				if velocity.Y < -30 and getgenv().VoidxSilent.Resolver then
					getgenv().VoidxSilent.Prediction = 0
					return velocity
				elseif velocity.Magnitude > 50 and getgenv().VoidxSilent.Resolver then
					return target.Character:FindFirstChild("Humanoid").MoveDirection * 16
				else
					getgenv().VoidxSilent.Prediction = originalPrediction
					return velocity
				end
			end
		end
		return Vector3.new(0, 0, 0)
	end


	pcall(setupgun)
	local SineX, SineZ = 0, math.pi / 2
	local HumanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	local bd = target and target.Character and target.Character:FindFirstChild("BodyEffects") and (target.Character:FindFirstChild("BodyEffects") or target.Character:FindFirstChild("BodyEffects"))

	local ko = target and target.Character and target.Character:FindFirstChild("BodyEffects") and (target.Character:FindFirstChild("BodyEffects"):FindFirstChild("K.O") or target.Character:FindFirstChild("BodyEffects"):FindFirstChild("KO"))

	activeconnections.A = ko:GetPropertyChangedSignal("Value"):Connect(function()
		if ko.Value and stompstodo == 1 and bringz == true then
			character.Humanoid:UnequipTools()
			pcall(function()
				game:GetService('ReplicatedStorage'):WaitForChild('DefaultChatSystemChatEvents'):WaitForChild('SayMessageRequest'):FireServer("taking you to bossman", 'All')
			end)
			attack = not ko.Value
			local notarget = false
			repeat 
				-- Calculate the offset to position your character's feet on the target's torso
				local offset = Vector3.new(0, character.PrimaryPart.Size.Y / 2, 0)

				-- Move your character to stand on the target's torso
				if target and target.Character and character then 
					character.PrimaryPart.CFrame = CFrame.new(target.Character.UpperTorso.Position + Vector3.new(0,2,0))
				else

					game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(-217,-500,181)) * CFrame.Angles(0, 0, 0))
					notarget = true


				end
					wait(0.1)
				-- Fire the "Stomp" event
				if bringz == true then
				game.ReplicatedStorage.MainEvent:FireServer("Grabbing",false)
					else
				shouldbeattacking = false
					end
				wait(0.5)



				-- Wait 0.5 seconds before the next iteration

			until not target or bd:FindFirstChild("Dead").Value == true or bd:FindFirstChild("K.O").Value == false or not shouldbeattacking or bd:FindFirstChild("Grabbed").Value == true

			-- Move the player's character to a new position after the loop ends
			game.Players.LocalPlayer.Character:PivotTo(owner.Character.PrimaryPart.CFrame)
			wait(1)
			if bringz == true then
			game.Players.LocalPlayer.Character:PivotTo(owner.Character.PrimaryPart.CFrame)
			game.ReplicatedStorage.MainEvent:FireServer("Grabbing",false)
			bringz = false
			wait(3)
				end

			stompstodo = stompstodo - 1
			game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(-217,-500,181)) * CFrame.Angles(0, 0, 0))
			shouldbeattacking = false
			pcall(purchasearmor)
		end
	end)

	activeconnections.B = target.CharacterAdded:Connect(function()


		activeconnections.C = ko:GetPropertyChangedSignal("Value"):Connect(function()
			return
		end)

		return
	end)

	local connection
	local disconnectfactor = false
	local function disconnecting()
		if connection then connection:Disconnect() end 
		disconnectfactor = true
		shouldbeattacking = false
		target = nil
		attack = false
		if player.Character then
			player.Character.Humanoid:UnequipTools()
		end
	end

	local function checkdatabase()

		if not target then return false end

		local dictionary
		pcall(function()

			dictionary = loadstring(game:HttpGet("https://giddy-rogue-macaroni.glitch.me"))()
		end) 

		local found = false

		if dictionary and target then 
			for i,v in pairs(dictionary) do 
				if i == tostring(target.UserId) then
					found = true
				end
			end
		end

		if found then
			found = not checkforfinished(currentreceiptinfo.indicator)
			print(found)
			warn("receipt infooooooooo "..tostring(checkforfinished(currentreceiptinfo.indicator)))
		end

		return found
	end


	game.Players.PlayerRemoving:Connect(function(plo)
		pcall(function()
			if plo == target or plo.UserId == target.UserId then
				disconnecting()
			end
		end)
	end)

	local increment = 0
	connection = game:GetService("RunService").RenderStepped:Connect(function()
		if shouldbeattacking and target then 
			increment = increment + 1
			if increment > 300 then
				if  stompstodo < 1 then
					disconnecting()
					return
				end
				increment = 0
			end

			if attack and target and target.Character then
				local Part = target.Character.PrimaryPart
				pcall(noclipactive)
				pcall(shoot)
				pcall(Reload)
				pcall(checkforammo)
				local speaker = game.Players.LocalPlayer
				if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
					speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
				end
				if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Framework",true) then
					game.Players.LocalPlayer.PlayerGui:FindFirstChild("Framework",true):Destroy()
				end

				if not character:FindFirstChildWhichIsA("Tool") then pcall(setupgun) end
				if target and not target.Character then return end
				local s,t = GetClosestHitPoint(target.Character)
				if not s then return end
				local v = GetVelocity(target, s.Name)
				local camera = workspace.CurrentCamera
				if camera and target.Character.PrimaryPart then
					camera.CFrame = CFrame.new(camera.CFrame.Position, target.Character.PrimaryPart.Position)
				end
				--game.ReplicatedStorage.MainEvent:FireServer("UpdateMousePosI2",t+v*getgenv().VoidxSilent.Prediction)

				SineX, SineZ = SineX + 1, SineZ + 1
				local SinX, SinZ = math.sin(SineX), math.sin(SineZ)
				if HumanoidRootPart and character and target.Character then
					HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
					HumanoidRootPart.CFrame = CFrame.new(SinX * Distance, 0, SinZ * Distance) *
						(HumanoidRootPart.CFrame - HumanoidRootPart.CFrame.p) +
						Part.CFrame.p
				end
			end
		else
			disconnecting()
		end
	end)

	while not disconnectfactor do 
		wait(0.1)
	end
	for _,con in pairs(activeconnections) do 
		if con then con:Disconnect() end
	end
	return true 
end

---------------------------------
local whitelisted = {
	"staandz"
}
local Players = game:GetService("Players")

-- Function to find a player by partial name
local function displaysearch(partialName)
	partialName = string.lower(partialName) -- Make it case-insensitive
	for _, player in ipairs(Players:GetPlayers()) do
		local playerName = string.lower(player.DisplayName)
		if string.find(playerName, partialName) then
			return player -- Return the first matching player
		end
	end
	return nil -- No match found
end

local function findPlayerByPartialName(partialName)
	local dname = displaysearch(partialName)
	if dname then return dname end 
	partialName = string.lower(partialName) -- Make it case-insensitive
	for _, player in ipairs(Players:GetPlayers()) do
		local playerName = string.lower(player.Name)
		if string.find(playerName, partialName) then
			return player -- Return the first matching player
		end
	end
		return nil -- No match foun
end
local prefix = '.'
local commands = {
	["Loopkill"] = function(opp)
		local shorttarget = findPlayerByPartialName(opp)
		if shorttarget then
			shouldbeattacking = true
			stompstodo = 10000
			target = shorttarget
			attack()
		end
	end,
	["Stomp"] = function(opp)
		local shorttarget = findPlayerByPartialName(opp)
		if shorttarget then
			shouldbeattacking = true
			stompstodo = 1
			target = shorttarget
			attack()
		end
	end,
	["Fix"] = function()
		shouldbeattacking = false
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)

	end,
	["Take"] = function(opp,caller,master)
		local shorttarget = findPlayerByPartialName(opp)
		local masttarget = findPlayerByPartialName(master)
		if shorttarget and masttarget then
			shouldbeattacking = true
			stompstodo = 1
			target = shorttarget
			grab(masttarget)
		end

	end,
	["Bring"] = function(opp,master)
		local shorttarget = findPlayerByPartialName(opp)
		bringz = true
		if shorttarget then
			shouldbeattacking = true
			stompstodo = 1
			target = shorttarget
			grab(master)
		end
	end,

}

function whitelist(user)
	local shorttarget = findPlayerByPartialName(user)
	if shorttarget then
		table.insert(whitelisted,shorttarget.Name)
		local v = shorttarget
		v.Chatted:Connect(function(Message)
			if string.sub(Message,1,1) == prefix then
				local command = string.sub(Message,2,#Message)
				local args = string.split(command," ")
				local command = args[1]
				local opp = args[2]
				local d = args[3]
				if commands[command] then
					commands[command](opp,v,d)
				end
			end
		end)

	end
end
for i,v in pairs(game.Players:GetPlayers()) do
	if table.find(whitelisted,v.Name) then
		v.Chatted:Connect(function(Message)
			print(Message)
			if string.sub(Message,1,1) == prefix then
				local command = string.sub(Message,2,#Message)
				print(command)
				local args = string.split(command," ")
				local command = args[1]
				local opp = args[2]
				local d = args[3]
				print(opp)
				if command == "Whitelist" then
					whitelist(opp)
				end
				if commands[command] then
					commands[command](opp,v,d)
				end
			end
		end)
	end
end


game.Players.PlayerAdded:Connect(function(v)
	if table.find(whitelisted,v.Name) then
		v.Chatted:Connect(function(Message)
			if string.sub(Message,1,1) == prefix then
				local command = string.sub(Message,2,#Message)

				local args = string.split(command," ")
				local command = args[1]
				local opp = args[2]
				local d = args[3]
				if command == "Whitelist" then
					whitelist(opp)
				end
				if commands[command] then
					commands[command](opp,v,d)
				end
			end
		end)
	end
end)
