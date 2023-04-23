--fix2


_G.reanimatedended = false
if fling == nil then
    fling = true
end
function r6reanimate()
--resubmit 2
    local player = game:GetService("Players").LocalPlayer.Character
    char = player.Character
    Character= char
    Character["Torso"]:FindFirstChild("Right Shoulder"):Destroy()
Character["Torso"]:FindFirstChild("Left Shoulder"):Destroy()
Character["Torso"]:FindFirstChild("Right Hip"):Destroy()
Character["Torso"]:FindFirstChild("Left Hip"):Destroy()
Character["HumanoidRootPart"]:FindFirstChild("RootJoint"):Destroy()


local aligns = {}
local hataligns = {}
function fgvbhnjmi(number)
    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", number)
end
game:GetService("RunService").Heartbeat:Connect(function()
        ve = Vector3.new(30, 0, 0)
if player:FindFirstChild("Head") then
    player["Head"].Velocity = ve
  player["Torso"].Velocity = ve
  player["Left Arm"].Velocity = ve
  player["Right Arm"].Velocity = ve
  player["Left Leg"].Velocity = ve
  player["Right Leg"].Velocity = ve
  player["Torso"].CanCollide = false
  player["Left Arm"].CanCollide = false
  player["Right Arm"].CanCollide = false
  player["Left Leg"].CanCollide = false
  player["Right Leg"].CanCollide = false
end
for i,v in pairs(player:GetDescendants()) do
    if v:IsA("Accessory") then
        v.Handle.Velocity = Vector3.new(90,0,0)
    end
end
end)

wait(0.1)
		settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
		settings().Physics.AllowSleep = false
game.Players.LocalPlayer.ReplicationFocus = player
local Player = game.Players.LocalPlayer
local Character = Player.Character
local RespawnTime = 10
Character.Archivable = true

    _G.reanimatedended = true

end

if _G.r6reanim == true then
coroutine.wrap(r6reanimate)()
end