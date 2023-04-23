 if game.Workspace:FindFirstChild("toolsgroup") then
 game.Workspace.toolsgroup:Destroy()

 end
game:GetObjects("rbxassetid://11975526200")[1].Parent = game.Workspace
rdone = false
cdone = false
sdone = false
noswordbriks = false
noswords = false
noradiobriks = false
noradio = false

nocolabriks = false
nocolas = false

-- game.Workspace.toolsgroup.Position = game.Players.LocalPlayer.Character.Torso.Position
function numchange()
    num = 0
    while wait() do
        num = num - .15
        wait(1 / 60)
        num = num + .15
    end
end

coroutine.wrap(numchange)()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local character = LocalPlayer.Character
char = character
backpack = LocalPlayer.Backpack
model = game.Workspace.toolsgroup
thingy = model -- feature model go here
model = thingy
numParts = 0
-- local model = game.Workspace.MyModel
function keeptoolsfloating()
    lol = thingy:FindFirstChildWhichIsA("Part")
    while wait() do
        if noswordbriks == false or noswords == false and noradiobriks == false or noradio == false and nocola == false or nocolabriks == false then
            lol.Anchored = true
           -- print(lol.Name)
        end
        if noswordbriks == true or noswords == true and noradiobriks == true or noradio == true and nocola == true or nocolabriks == true then
            for i, lol1 in pairs(thingy:GetChildren()) do
                 if lol1:IsA 'Part' or lol1:IsA 'Seat' then
                    lol1.CanCollide = true
                    if lol1.Name ~= "Part" then
                    lol1.Anchored = false
                    end
                 end
            end
            for i, lol in pairs(character:GetChildren()) do
                 if lol:IsA 'Tool' then
                    lol.Handle.CanCollide = false
                     lol.Handle.Anchored = false

            end
        end

          --  print(lol.Name .. "ok")
            return
        end
    end
end

coroutine.wrap(keeptoolsfloating)()

for i, part in pairs(thingy:GetChildren()) do
    if part:IsA 'Part' or part:IsA 'Seat' then
        part.CanCollide = false
        part.Massless = true
        if part.Name ~= "Part" then
        part.Anchored=true
        end
--[[        if part.name == "bloxyHandle" then
            part.CanCollide = true
        end]]
        numParts = numParts + 1
    end
end

local UserInputService = game:GetService("UserInputService")
endede = true
player = game.Players.LocalPlayer
oggrav = game.Workspace.Gravity
mouse = player:GetMouse()
mouse.KeyDown:connect(function(k)
    if endede == true then
        endede = false
        if k == "e" then
            char = game.Players.LocalPlayer.Character
            for i, part in pairs(char:GetChildren()) do
                if part:IsA 'Tool' then

                    ogpos = player.Character.HumanoidRootPart.CFrame
                                            print("yaa")
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(part.Handle.Position + Vector3.new(0, 0, 0))
                        part.Parent = backpack
                        wait(.02)
                        part.Parent = char
                        player.Character.HumanoidRootPart.CFrame = ogpos

                end

            end

        end
        endede = true
       -- player.Character.HumanoidRootPart.CFrame = ogpos

    end
end)




print(numParts .. "numberofparts")
-- // run this like 15 times
local loopnum = 5
for i = 1, loopnum do
    task.wait(.8)

    local fart = game.Players.LocalPlayer.Character
    game.Players.LocalPlayer.Backpack.BoomBox.Parent = fart
    fart.BoomBox.Parent = workspace
    game.Players.LocalPlayer.Backpack.Foil.Parent = fart
    fart.Foil.Parent = workspace
    game.Players:Chat("-cola")
    -- game.Players.LocalPlayer.Backpack.BloxyCola.Parent = fart
    task.wait(.5)
    game.Players.LocalPlayer.Character.BloxyCola.Parent = workspace
    -- fart.Foil.Parent = workspace
    wait()
    game.Players:Chat("-re")
end
if loopnum > 0 then
    wait(10)
end

character = game.Players.LocalPlayer.Character
-- character["Right Arm"]:Destroy()
function moveall()

    local sword = backpack:FindFirstChild("Foil")

    if sword then
        character = game.Players.LocalPlayer.Character
        -- sword.Handle.Mesh:Destroy()
        sword.Name = "used"
        local firstswordpart = model:FindFirstChild("fHandle")
        if firstswordpart then
            -- firstswordpart.CanCollide = false
            firstswordpart.Name = "used"
            firstswordpart.Transparency = .75
            firstswordpart.CanCollide = false
            sword.Name = "used"
            sword.Handle.CanCollide = true
            sword.Parent = character
          --  sword.Handle.CanCollide = true
            -- wait(10)
            sword.Handle.Mesh:Destroy()
            sword.Handle.Massless = true
            -- sword.Handle.Anchored = true

           -- task.wait(0.5)
            if character:FindFirstChild("Right Arm") then
                print("lol")
                character["Right Arm"]:Destroy()

            end
            num = 0
            wait(.1)
            sword.Handle.CanCollide = true
            -- sword.Handle.Anchored = false
            game:GetService("RunService").Heartbeat:Connect(function()

                sword.Handle.CFrame = firstswordpart.CFrame * CFrame.new(num, num, -num)
                -- firstradiopart.CFrame = firstradiopart.CFrame * CFrame.new(0,num * 3,0)
                sword.Handle.Velocity = Vector3.new(0, (num * 120) + 160, 0)

            end)
            sdone = true
        else
            noswordbriks = true
        end
    else
        noswords = true
    end
    local cola = backpack:FindFirstChild("BloxyCola")
    if cola and cola:IsA("Tool") then
        character = game.Players.LocalPlayer.Character
        -- cola.Handle.Mesh:Destroy()
        cola.Name = "used"
        local firstcolapart = model:FindFirstChild("bloxyHandle")
        if firstcolapart then
            firstcolapart.Name = "used"
            firstcolapart.CanCollide = false
            firstcolapart.Transparency = .75
            cola.Name = "used"
            cola.Parent = character
            cola.Handle.Mesh:Destroy()
            cola.Handle.Massless = true
            cola.Handle.Anchored = false
            cola.Handle.CanCollide = true
           -- task.wait(0.5)
            if character:FindFirstChild("Right Arm") then
                print("lol")
                character["Right Arm"]:Destroy()

            end
            num = 0
           wait(.1)
            cola.Handle.CanCollide = true
            game:GetService("RunService").Heartbeat:Connect(function()

                cola.Handle.CFrame = firstcolapart.CFrame * CFrame.new(num, num, -num)
                -- firstradiopart.CFrame = firstradiopart.CFrame * CFrame.new(0,num * 3,0)
                cola.Handle.Velocity = Vector3.new(0, (num * 120) + 160, 0)

            end)
            cdone = true
        else
            nocolabriks = true
        end
    else
        nocola = true
    end
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local character = LocalPlayer.Character
    backpack = LocalPlayer.Backpack
    local radio = backpack:FindFirstChild("BoomBox")
    if radio and radio:IsA("Tool") then

        local firstradiopart = model:FindFirstChild("bHandle")
        if firstradiopart then
            firstradiopart.CanCollide = false
            firstradiopart.Name = "used"
            firstradiopart.Transparency = .75
            radio.Name = "used"
            radio.Parent = character
            radio.Handle.Mesh:Destroy()
            radio.Handle.Massless = true
            radio.Handle.Anchored = false
            radio.Handle.CanCollide = true
            --task.wait(0)
            if character:FindFirstChild("Right Arm") then
                print("lol")
                character["Right Arm"]:Destroy()

            end
            num = 0
            wait(.1)
            radio.Handle.CanCollide = true
            game:GetService("RunService").Heartbeat:Connect(function()
                if radio:FindFirstChild("Handle") then
                    radio.Handle.CFrame = firstradiopart.CFrame * CFrame.new(num, num, -num)
                    -- firstradiopart.CFrame = firstradiopart.CFrame * CFrame.new(0,num * 3,0)
                    radio.Handle.Velocity = Vector3.new(0, (num * 120) + 100, 0)
                end
            end)
            rdone = true
        else
            noradiobriks = true
        end
    else
        noradio = true
    end
end

while true do
    wait()
    -- repeat wait() until rdone == true and cdone == true and sdone==true

    moveall()
    coroutine.wrap(keeptoolsfloating)()
end
