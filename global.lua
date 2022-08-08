local Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
local cmdlp = game.Players.LocalPlayer
local cmdrs = game:GetService("ReplicatedStorage")
local cmdp = game:GetService("Players")
local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()


local pepsi = Library:CreateWindow ({

    Name = "Global - NugzyF - V1.0",
    Themeable = {

        Info = "Made with love <3"

    }

})

local GeneralTAB = pepsi:CreateTab ({

    Name = "General"

})

local MISC  = GeneralTAB:CreateSection({

    Name = "MISC Options"

})

local walkspeed;

MISC:AddSlider({

    Name = "WalkSpeed",
    Value = 16,
    Precise = 1,
    Min = 16,
    Max = 500,
    Callback = function (value)

        walkspeed = value
        
        if cmdlp.Character then
            if value then 

                cmdlp.Character.Humanoid.WalkSpeed = walkspeed

            end
        end

    end

})


--[[MISC:AddLabel({

    Name = "16 is default!"

})--]]

local jumpPower

MISC:AddSlider({

    Name = "JumpPower",
    Value = 50 , 
    Precise = 1 , 
    Min = 50 ,
    Max = 1000 , 
    Callback = function (value)
        jumpPower = value
        if cmdlp.Character then
            if jumpPower then 
                cmdlp.Character.Humanoid.JumpPower = jumpPower
            end
        end
    end

})

--[[MISC:AddLabel({

    Name = "Default is 50!"

})--]] -- ONLY ADD IF MORE EXPLAINABLE

local hipHeight

MISC:AddSlider({

    Name = "HipHeight",
    Value = 1.35 , 
    Precise = 2 , 
    Min = 1.35,
    Max = 2000,
    Callback = function (value)
        hipHeight = value
        if cmdlp.Character then 
            cmdlp.Character.Humanoid.HipHeight = hipHeight
        end 
    end

})

MISC:AddLabel({

    Name = "Might be laggy!"

})

MISC:AddLabel({

    Name = "---------------"

})

local gravitySel

MISC:AddSlider({

    Name = "Gravity",
    Value = 194 , 
    Precise = 1 ,
    Min = 0 , 
    Max = 500,
    Callback = function (value)
        gravitySel = value
        if cmdlp.Character then
            workspace.Gravity = gravitySel 
        end
    end

})

local nickYes = false;

MISC:AddToggle({

    Name = "Hide Nicknames" , 
    Callback = function (bool)
        
        nickYes = bool
        xNamingTb1 = {}
        if nickYes then 
            function clean (cplr)
                if cplr.DisplayName ~= cplr.Name then
                    if cplr.Character then cplr.Character:WaitForChild("Humanoid").DisplayName = cplr.Name end
                    cplr.CharacterAdded:Connect(function(char)
                        char:WaitForChild("Humanoid").DisplayName = "(NICKNAMED)\n" ..cplr.Name
                    end) 
                end
            end

            xNaming = cmdp.PlayerAdded:connect(clean)
            for _,p in pairs(cmdp:GetPlayers())do
                clean(p)
            end
        else 
            xNaming:Disconnect()
        end 
    end

})
local FunSection = GeneralTAB:CreateSection({

    Name = "FUN"

})

FunSection:AddLabel({

    Name = "Reset Player to fix!"

})

FunSection:AddButton({

    Name = "Halve Player",
    Callback = function ()

        cmdlp.Character.UpperTorso.Waist:Destroy()
        cmdlp.Character.UpperTorso.Anchored = true
        
    end

})

FunSection:AddButton({

    Name = "Remove Hands!",
    Callback = function ()
        cmdlp.Character.RightHand:Destroy()
        cmdlp.Character.LeftHand:Destroy()
    end

})

FunSection:AddButton({

    Name = "RemoveFeet" , 
    Callback = function ()
        cmdlp.Character.RightFoot:Destroy()
        cmdlp.Character.LeftFoot:Destroy()
    end

})

FunSection:AddButton({

    Name = "Remove legs",
    Callback = function ()

        cmdlp.Character.LeftUpperLeg:Destroy()
        cmdlp.Character.RightUpperLeg:Destroy()
        
    end

})

FunSection:AddButton({

    Name = "Remove Arms!",
    Callback = function ()
        for _,v in pairs (cmdlp.Character:GetChildren()) do
            if v.Name == "RightUpperArm" or v.Name == "LeftUpperArm" then
                v:Destroy()
            end
        end 
    end

})

FunSection:AddButton({

    Name = "Remove Torso",
    Callback = function ()

        cmdlp.Character.UpperTorso:Destroy()
        
    end

})

FunSection:AddLabel({

    Name = "You might die"

})

FunSection:AddButton({

    Name = "Nugget",
    Callback = function ()
        for i,v in pairs(cmdlp.Character:GetChildren()) do
			if v.Name == "RightUpperArm" or v.Name == "LeftUpperArm" or v.Name == "RightUpperLeg" or v.Name == "LeftUpperLeg" then
				v:Destroy()
			end
		end
    end

})

local Player = GeneralTAB:CreateSection({

    Name = "Player",
    Side = "Right"

})

Player:AddLabel({

    Name = "CreatorID"

})
Player:AddButton({

    Name = "Set ID To Creator" , 
    Callback = function ()
        cmdlp.UserId = game.CreatorId
        cmdlp.CharacterAppearanceId = game.CreatorId
    end

})
Player:AddLabel({

    Name = "----------"

})
Player:AddButton({

    Name = "Reset Player",
    Callback = function ()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end

})
Player:AddToggle({

    Name = "Freeze" , 
    Callback = function (bool)
        getgenv().lagen = bool
        if cmdlp.Character then
            lagFun() 
        end
    end

})
Player:AddLabel({

    Name = "This is permanent"

})
Player:AddToggle({

    Name = "GodMode",
    Callback = function (bool)
        getgenv().godmoden = bool
        if cmdlp.Character then
            godmode() 
        end
    end 

})
Player:AddButton({

    Name = "Invisible",
    Callback = function ()
        if cmdlp.Character then
            invisFU() 
        end
    end

})

Player:AddButton({

    Name = "BTools",
    Callback = function ()
    local Clone_T = Instance.new("HopperBin", cmdlp.Backpack)
	Clone_T.BinType = "Clone"
	local Destruct = Instance.new("HopperBin", cmdlp.Backpack)
	Destruct.BinType = "Hammer"
	local Hold_T = Instance.new("HopperBin", cmdlp.Backpack)
	Hold_T.BinType = "Grab"
    end

})

Player:AddToggle({

    Name = "NoClip",
    Callback = function (bool)
        getgenv().noCLIP = bool 
        noclipFU()
    end

})

--[[Player:AddToggle({                     --CRASHING ISSUES

    Name = "ClickDel",
    Callback = function (bool)
        getgenv().clickdelto = bool 

        if cmdlp.Character then 
            clickdel()
        end
    end

})--]]

Player:AddButton({

    Name = "FPS BBoost",
    Callback = function ()
        loadstring(game:HttpGet(('https://github.com/MarsQQ/ScriptHubScripts/blob/master/FPS%20Boost'),true))()
    end

})

local sccriptsec = GeneralTAB:CreateSection(

    {
        Name = "Scripts",
        Side = "Right"
    }

)

sccriptsec:AddLabel({

    Name = "RemoteSpy"

})

sccriptsec:AddButton({

    Name = "Load!",
    Callback = function ()
        loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
    end

})


sccriptsec:AddLabel({

    Name = "DexExplorer"

})

sccriptsec:AddButton({

    Name = "Load!",
    Callback = function ()
        loadstring(game:GetObjects('rbxassetid://2180084478')[1].Source)()
    end

})

sccriptsec:AddLabel({

    Name = "FEX"

})

sccriptsec:AddButton({

    Name = "Load!",
    Callback = function ()
        loadstring(game:GetObjects("rbxassetid://4698064966")[1].Source)()
    end

})

sccriptsec:AddLabel({

    Name = "Aimbot and ESP"

})

sccriptsec:AddButton({

    Name = "Load!",
    Callback = function ()
        loadstring(game:HttpGet(('https://gitlab.com/marsscripts/marsscripts/-/raw/master/CCAimbotV2'),true))()
    end

})

local UilityTab = pepsi:CreateTab({

    Name = "Utility"

}) 

local Strenght = UilityTab:CreateSection({

    Name = "Strenght"

})

local strenghtValue

Strenght:AddSlider({

    Name  = "Strenght",
    Value = 50 , 
    Precise = 1 ,
    Min = 0 ,
    Max = 100 , 
    Callback = function (Value)
        strenghtValue = Value
        if cmdlp.ClassName == "Part" then
            player.CustomPhysicalProperties = PhysicalProperties.new(strenghtValue, 0.3, 0.5)
        end

    end

})

local Ragdoll = UilityTab:CreateSection({

    Name = "Ragdoll",
    Side = "Right"

})

Ragdoll:AddToggle({

    Name = "No Ragdoll",
    Callback = function (bool)
        if cmdlp.Character then
            cmdlp.Character.Humanoid.PlatformStand = bool 
        end
    end

})

local antiAFK = UilityTab:CreateSection({

    Name = "Anti AFK"

})

antiAFK:AddButton({

    Name = "Anti AFK" , 
    Callback = function ()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)

        print("You wwill not get kicked out from being afk anymore!")

    end

})


local AnimTAB = pepsi:CreateTab({

    Name = "Animations"

})

local sneakySEC = AnimTAB:CreateSection({

    Name = "Sneaky"

})

sneakySEC:AddLabel({

    Name = "Reset to fix!"

})

sneakySEC:AddLabel({

    Name = "(FIXING)"

})

sneakySEC:AddButton({

    Name = "Start!",
    Callback = function()
        local Char = cmdlp.Character
		Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1132461372"
		Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1132469004"
		Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1132473842"
		Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1132477671"
		Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1132489853"
		Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1132494274"
		Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=1132500520"
		Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=1132506407"
		Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1132510133"
    end

})
local oldSEC = AnimTAB:CreateSection(({

    Name = "Old",

}))

oldSEC:AddButton({

    Name = "Load!",
    Callback = function()
        local Char = cmdlp.Character
		Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=387947158"
		Char.Animate.idle.Animation1.Weight.Value = "9"
		Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=387947464"
		Char.Animate.idle.Animation2.Weight.Value = "1"
		Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=387947975"
		Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=616092998"
		Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=616094091"
		Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=382460631"
    end

})

local toySEC = AnimTAB:CreateSection({

    Name = "Toy"

})

toySEC:AddButton({

    Name = "Load!",
    Callback = function()
        local Char = cmdlp.Character
		Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
		Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
		Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
		Char.Animate.idle.Animation1.Weight.Value = "9"
		Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
		Char.Animate.idle.Animation2.Weight.Value = "1"
		Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
		Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
		Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=782844582"
		Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=782845186"
		Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
    end

})

local pirateSEC = AnimTAB:CreateSection({

    Name = "Pirate"

})

pirateSEC:AddButton({

    Name = "Load!",
    Callback = function ()
        local Char = cmdlp.Character
		Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
		Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
		Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
		Char.Animate.idle.Animation1.Weight.Value = "9"
		Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
		Char.Animate.idle.Animation2.Weight.Value = "1"
		Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
		Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
		Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=750784579"
		Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=750785176"
		Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
    end

})

local knightSEC = AnimTAB:CreateSection({

    Name = "Knight"

})

knightSEC:AddButton({

    Name = "Load!",
    Callback = function()
        local Char = cmdlp.Character
		Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
		Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
		Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
		Char.Animate.idle.Animation1.Weight.Value = "9"
		Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
		Char.Animate.idle.Animation2.Weight.Value = "1"
		Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
		Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
		Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=657560551"
		Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=657557095"
		Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"local Char = cmdlp.Character
		Char.Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
		Char.Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
		Char.Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
		Char.Animate.idle.Animation1.Weight.Value = "9"
		Char.Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
		Char.Animate.idle.Animation2.Weight.Value = "1"
		Char.Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
		Char.Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
		Char.Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=657560551"
		Char.Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=657557095"
		Char.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
    end

})

function findplr(args, tbl)
	if tbl == nil then
		local tbl = cmdp:GetPlayers()
		if args == "me" then
			return cmdlp
		elseif args == "random" then 
			return tbl[math.random(1,#tbl)]
		elseif args == "new" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if v.AccountAge < 30 and v ~= cmdlp then
					vAges[#vAges+1] = v
				end
			end
			return vAges[math.random(1,#vAges)]
		elseif args == "old" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if v.AccountAge > 30 and v ~= cmdlp then
					vAges[#vAges+1] = v
				end
			end
			return vAges[math.random(1,#vAges)]
		elseif args == "bacon" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if v.Character:FindFirstChild("Pal Hair") or v.Character:FindFirstChild("Kate Hair") and v ~= cmdlp then
					vAges[#vAges+1] = v
				end
			end
			return vAges[math.random(1,#vAges)]
		elseif args == "friend" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if v:IsFriendsWith(cmdlp.UserId) and v ~= cmdlp then
					vAges[#vAges+1] = v
				end
			end
			return vAges[math.random(1,#vAges)]
		elseif args == "notfriend" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if not v:IsFriendsWith(cmdlp.UserId) and v ~= cmdlp then
					vAges[#vAges+1] = v
				end
			end
			return vAges[math.random(1,#vAges)]
		elseif args == "ally" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if v.Team == cmdlp.Team and v ~= cmdlp then
					vAges[#vAges+1] = v
				end
			end
			return vAges[math.random(1,#vAges)]
		elseif args == "enemy" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if v.Team ~= cmdlp.Team then
					vAges[#vAges+1] = v
				end
			end
			return vAges[math.random(1,#vAges)]
		elseif args == "near" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if v ~= cmdlp then
					local math = (v.Character:FindFirstChild("HumanoidRootPart").Position - cmdlp.Character.HumanoidRootPart.Position).magnitude
					if math < 30 then
						vAges[#vAges+1] = v
					end
				end
			end
			return vAges[math.random(1,#vAges)]
		elseif args == "far" then
			local vAges = {} 
			for _,v in pairs(tbl) do
				if v ~= cmdlp then
					local math = (v.Character:FindFirstChild("HumanoidRootPart").Position - cmdlp.Character.HumanoidRootPart.Position).magnitude
					if math > 30 then
						vAges[#vAges+1] = v
					end
				end
			end
			return vAges[math.random(1,#vAges)]
		else 
			for _,v in pairs(tbl) do
				if v.Name:lower():find(args:lower()) or v.DisplayName:lower():find(args:lower()) then
					return v
				end
			end
		end
	else
		for _, plr in pairs(tbl) do
			if plr.UserName:lower():find(args:lower()) or plr.DisplayName:lower():find(args:lower()) then
				return plr
			end
		end
	end
end

getgenv().lagen = false;

function lagFun()
    if lagen == true then
        cmdlp.Character.HumanoidRootPart.Anchored = false
		wait(0.1)
		cmdlp.Character.HumanoidRootPart.Anchored = true
		wait(0.1)
    else
        wait(.3)
        cmdlp.Character.HumanoidRootPart.Anchored = false
    end 
end

getgenv().godmoden = false;

function godmode()

    if godmoden == true then
    local Cam = workspace.CurrentCamera
	local Pos, Char = Cam.CFrame, cmdlp.Character
	local Human = Char and Char.FindFirstChildWhichIsA(Char, "Humanoid")
	local nHuman = Human.Clone(Human)
	nHuman.Parent, cmdlp.Character = Char, nil
	nHuman.SetStateEnabled(nHuman, 15, false)
	nHuman.SetStateEnabled(nHuman, 1, false)
	nHuman.SetStateEnabled(nHuman, 0, false)
	nHuman.BreakJointsOnDeath, Human = true, Human.Destroy(Human)
	cmdlp.Character, Cam.CameraSubject, Cam.CFrame = Char, nHuman, wait() and Pos
	nHuman.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	local Script = Char.FindFirstChild(Char, "Animate")
	if Script then
		Script.Disabled = true
		wait()
		Script.Disabled = false
	end
	nHuman.Health = nHuman.MaxHealth 
else
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end

end

getgenv().invisRunning = false

function invisFU ()

    for i,m in pairs(cmdlp.Character:GetChildren()) do
		if m:IsA("Part") or m:IsA("MeshPart") then
			if m.Name ~= "HumanoidRootPart" and m.Name ~= "Handle" or m:IsA("Part") then
				m.Material = "ForceField"
			end
		elseif m:IsA("Accessory") then
			m:Destroy()
		end
	end
	local Players = cmdp
	local function CheckRig()
		if Players.LocalPlayer.Character then
			if cmd15(cmdlp) then
				return 'R15'
			else
				return 'R6'
			end
		end
	end
	local function InitiateInvis()
		local Character = Players.LocalPlayer.Character
		local StoredCF = Character.PrimaryPart.CFrame
		local Part = Instance.new('Part',workspace)
		Part.Size = Vector3.new(5,0,5)
		Part.Anchored = true
		--Part.CFrame = CFrame.new(Vector3.new(9999,9999,9999))
		Character.PrimaryPart.CFrame = Part.CFrame*CFrame.new(0,3,0)
		wait(3)
		Part:Destroy()
		if CheckRig() == 'R6' then
			local Clone = Character.HumanoidRootPart:Clone()
			Character.HumanoidRootPart:Destroy()
			Clone.Parent = Character
		else
			local Clone = Character.LowerTorso.Root:Clone()
			Character.LowerTorso.Root:Destroy()
			Clone.Parent = Character.LowerTorso
		end
	end
	InitiateInvis()

end

getgenv().noCLIP = false;

function noclipFU()

    if cmdlp.Character then 
            game:GetService('RunService').Stepped:connect(function()
                if noCLIP then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                end
                end)
                plr = game.Players.LocalPlayer
                mouse = plr:GetMouse()
                mouse.KeyDown:connect(function(key)
                
                if key == "e" then
                noCLIP = not noCLIP
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                end
                end)
        end        
end

getgenv().clickdelto = false

function clickdel()

    while clickdelto == true do
        Mouse.Button1Down:connect(function()
            if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
            if not Mouse.Target then return end
            Mouse.Target:Destroy()
            end)
    end

end
