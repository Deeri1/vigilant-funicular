local Players = game:GetService("Players")
name = "2Johan29"
target = game.Players[name].Character
while wait() do
for i, v in pairs(target:GetDescendants()) do
        if v:IsA("Part") then
            sethiddenproperty(v, "NetworkIsSleeping", true)
       if v.Parent.Name ~= name then
                print(v.Parent.Name)
            else
        print(v.Name)
       end
        end
    end
end


name = "2Johan29"
target = game.Workspace
Players = game.Players
lplayer = game.Players.LocalPlayer
mouse = lplayer:GetMouse()
mouse.Button1Down:Connect(function()
    part = mouse.Hit
    if part:IsA("Part") or part:IsA("Accessory")  then
        while wait() do
        if part:IsA("Part") then
        lplayer.Character.HumanoidRootPart.CFrame = part.CFrame
        end
        if part:IsA("Accessory") then
        lplayer.Character.HumanoidRootPart.CFrame = part.Handle.CFrame
        end
        mouse.Button1Down:Connect(function()
            return
        end)
    end
    end
end)
while wait() do
    for i, v in pairs(target:GetDescendants()) do
        if v:IsA("Part") and v.Parent.Parent:IsA("Model") or v.Parent.Parent:IsA("Model")  then
            sethiddenproperty(v, "NetworkIsSleeping", true)
            if v.Parent.Name ~= name then
                print(v.Parent.Name)
            else
                print(v.Name)
            end
        end
    end
end
