function reanim()
    biggining = true
   nam = game.Players.LocalPlayer.Character.Name
char = game.Workspace:FindFirstChild(nam)
choosencf = char.HumanoidRootPart.CFrame
hum = char:FindFirstChild("Humanoid")
biggining = false

--lp:GetMouse().Button1Down:Connect(fling) --click fling
end
nam = game.Players.LocalPlayer.Character.Name
char = game.Workspace:FindFirstChild(nam)
choosencf=char.HumanoidRootPart.CFrame
function scripte()
--script here


end
function main()
    
    while wait() do
        nam = game.Players.LocalPlayer.Character.Name
char = game.Workspace:FindFirstChild(nam)
choosencf = char.HumanoidRootPart.CFrame

    reanim()
        if char then
           coroutine.wrap(scripte)()
            char.HumanoidRootPart.CFrame = choosencf
            wait(3)
            choosencf = char.HumanoidRootPart.CFrame
            wait()

        end
    end
end

main()
