function getNearestPlayer(range)
	local nearest
	local nearestDist = math.huge
	for i,v in pairs(game.Players:GetPlayers()) do
		pcall(function()
			if v == game:GetService("Players").LocalPlayer then return end
			if v.Character.Humanoid.health > 0 and (v.Character.PrimaryPart.Position - game:GetService("Players").LocalPlayer.Character.PrimaryPart.Position).Magnitude < nearestDist and (v.Character.PrimaryPart.Position - game:GetService("Players").LocalPlayer.Character.PrimaryPart.Position).Magnitude <= range then
				nearest = v
				nearestDist = (v.Character.PrimaryPart.Position - game:GetService("Players").LocalPlayer.Character.PrimaryPart.Position).Magnitude
			end
		end)
	end
    if nearest then
        return nearest
    else
        return nil
    end
end

local blur = loadstring(game:HttpGet("https://raw.githubusercontent.com/boykisser143/stuff-for-nebola-to-skid/main/blur.lua"))()
local targethud = {}
local ts = game:GetService("TweenService")
local coll = "rgb(12, 222, 204)"

function graaah(yes)
    return {
      R = math.floor(yes.R * 255),
      G = math.floor(yes.G * 255),
      B = math.floor(yes.B * 255)
    }
end

function targethud:setColors(color1, color2)
    local x = graaah(color2)
    coll = "rgb(" .. x.R .. "," .. x.G .. "," .. x.B .. ")"
    targethud.target_health.TextColor3 = color2
    targethud.healthbar_bg.BackgroundColor3 = color2:Lerp(Color3.new(0,0,0), 0.5)
    targethud.uigradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.000, color1),ColorSequenceKeypoint.new(1.000, color2)}
end

function targethud:updateHealth(plr)
    local hltl = math.round(plr.Character.Humanoid.Health)
    ts:Create(targethud.healthbar, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        Size = UDim2.new(targethud.healthbar.Size.X.Scale, 185 * (plr.Character.Humanoid.Health / plr.Character.Humanoid.MaxHealth), targethud.healthbar.Size.Y.Scale, targethud.healthbar.Size.Y.Offset)
    }):Play()
    targethud.target_health.Text = hltl
end

function targethud:resetHealth()
    targethud.healthbar.Size = UDim2.new(targethud.healthbar.Size.X.Scale, 185, targethud.healthbar.Size.Y.Scale, targethud.healthbar.Size.Y.Offset)
    targethud.target_health.Text = "100"
end

function targethud:tweenIn(size, t1)
    ts:Create(targethud.holder, TweenInfo.new(t1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = size}):Play()
    targethud.blur = blur.new(targethud.holder, "Rectangle")
end

function targethud:tweenOut(size, t1)
    local tween = ts:Create(targethud.holder, TweenInfo.new(t1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = size})
    tween:Play()
    task.spawn(function()
        wait(t1 - 0.1)
        targethud.blur:Destroy()
        targethud:resetHealth()
    end)
end

function targethud:setTarget(player)
    targethud.target_image.Image = game:GetService("Players"):GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    targethud.target_name.Text = "Name: <font color=\"" .. coll .. "\">" .. player.Name .. "</font>"
    targethud.target_health.Text = player.Character.Humanoid and player.Character.Humanoid.Health or 0
end

targethud.gui = Instance.new("ScreenGui", game:GetService("CoreGui"))

targethud.holder = Instance.new("Frame", targethud.gui)
targethud.holder.BorderSizePixel = 0
targethud.holder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
targethud.holder.AnchorPoint = Vector2.new(0.5, 0.5)
targethud.holder.Size = UDim2.new(0, 0, 0, 0)
targethud.holder.Position = UDim2.new(0.3511, 0, 0.6472, 0)
targethud.holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
targethud.holder.BackgroundTransparency = 0.5
targethud.holder.ClipsDescendants = true

targethud.uicorner_1 = Instance.new("UICorner", targethud.holder)
targethud.uicorner_1.CornerRadius = UDim.new(0, 18)

targethud.targethud = Instance.new("Frame", targethud.holder)
targethud.targethud.BorderSizePixel = 0
targethud.targethud.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
targethud.targethud.AnchorPoint = Vector2.new(0.5, 0.5)
targethud.targethud.Size = UDim2.new(1, 0, 1, 0)
targethud.targethud.Position = UDim2.new(0.5, 0, 0.5, 0)
targethud.targethud.BorderColor3 = Color3.fromRGB(0, 0, 0)
targethud.targethud.BackgroundTransparency = 1

targethud.target_image = Instance.new("ImageLabel", targethud.targethud)
targethud.target_image.BorderSizePixel = 0
targethud.target_image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
targethud.target_image.Size = UDim2.new(0, 63, 0, 63)
targethud.target_image.BorderColor3 = Color3.fromRGB(0, 0, 0)
targethud.target_image.BackgroundTransparency = 1
targethud.target_image.Image = game.Players:GetUserThumbnailAsync(game.Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)

targethud.uicorner_2 = Instance.new("UICorner", targethud.target_image)
targethud.uicorner_2.CornerRadius = UDim.new(0, 16)

targethud.uilistlayout_1 = Instance.new("UIListLayout", targethud.targethud)
targethud.uilistlayout_1.VerticalAlignment = Enum.VerticalAlignment.Center
targethud.uilistlayout_1.SortOrder = Enum.SortOrder.LayoutOrder
targethud.uilistlayout_1.FillDirection = Enum.FillDirection.Horizontal

targethud.uipadding_1 = Instance.new("UIPadding", targethud.targethud)
targethud.uipadding_1.PaddingLeft = UDim.new(0, 5)

targethud.main = Instance.new("Frame", targethud.targethud)
targethud.main.BorderSizePixel = 0
targethud.main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
targethud.main.AnchorPoint = Vector2.new(0.5, 0.5)
targethud.main.Size = UDim2.new(0.75439, 0, 1, 0)
targethud.main.Position = UDim2.new(0.24561, 0, 0, 0)
targethud.main.BorderColor3 = Color3.fromRGB(0, 0, 0)
targethud.main.BackgroundTransparency = 1

targethud.healthbar = Instance.new("Frame", targethud.main)
targethud.healthbar.ZIndex = 2
targethud.healthbar.BorderSizePixel = 0
targethud.healthbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
targethud.healthbar.Size = UDim2.new(0, 185, 0, 10)
targethud.healthbar.BorderColor3 = Color3.fromRGB(0, 0, 0)

targethud.uicorner_3 = Instance.new("UICorner", targethud.healthbar)
targethud.uicorner_3.CornerRadius = UDim.new(0, 18)

targethud.uigradient_1 = Instance.new("UIGradient", targethud.healthbar)
targethud.uigradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(13, 223, 205)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(13, 183, 224))}

targethud.target_name = Instance.new("TextLabel", targethud.healthbar)
targethud.target_name.BorderSizePixel = 0
targethud.target_name.TextXAlignment = Enum.TextXAlignment.Left
targethud.target_name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
targethud.target_name.TextSize = 18
targethud.target_name.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
targethud.target_name.TextColor3 = Color3.fromRGB(255, 255, 255)
targethud.target_name.BackgroundTransparency = 1
targethud.target_name.RichText = true
targethud.target_name.Size = UDim2.new(0, 200, 0, 50)
targethud.target_name.BorderColor3 = Color3.fromRGB(0, 0, 0)

targethud.uipadding_2 = Instance.new("UIPadding", targethud.target_name)
targethud.uipadding_2.PaddingBottom = UDim.new(0, 85)

targethud.target_health = Instance.new("TextLabel", targethud.healthbar)
targethud.target_health.BorderSizePixel = 0
targethud.target_health.TextXAlignment = Enum.TextXAlignment.Left
targethud.target_health.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
targethud.target_health.TextSize = 18
targethud.target_health.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
targethud.target_health.TextColor3 = Color3.fromRGB(13, 223, 205)
targethud.target_health.BackgroundTransparency = 1
targethud.target_health.Size = UDim2.new(0, 200, 0, 50)
targethud.target_health.BorderColor3 = Color3.fromRGB(0, 0, 0)

targethud.uipadding_3 = Instance.new("UIPadding", targethud.target_health)
targethud.uipadding_3.PaddingLeft = UDim.new(0, 190)
targethud.uipadding_3.PaddingBottom = UDim.new(0, 43)

targethud.uipadding_4 = Instance.new("UIPadding", targethud.main)
targethud.uipadding_4.PaddingTop = UDim.new(0, 45)
targethud.uipadding_4.PaddingLeft = UDim.new(0, 10)

targethud.healthbar_bg = Instance.new("Frame", targethud.main)
targethud.healthbar_bg.BorderSizePixel = 0
targethud.healthbar_bg.BackgroundColor3 = Color3.fromRGB(8, 110, 133)
targethud.healthbar_bg.Size = UDim2.new(0, 185, 0, 10)
targethud.healthbar_bg.BorderColor3 = Color3.fromRGB(0, 0, 0)

targethud.uicorner_4 = Instance.new("UICorner", targethud.healthbar_bg)
targethud.uicorner_4.CornerRadius = UDim.new(0, 18)

local autism = false
game:GetService("RunService").RenderStepped:Connect(function()
    local target = getNearestPlayer(28)

    if not autism and target ~= nil then
        autism = true
        targethud:setTarget(target)
        targethud:tweenIn(UDim2.new(0, 310, 0, 70), 0.2)
    elseif autism and target ~= nil then
        targethud:updateHealth(target)
    elseif autism and target == nil then
        autism = false
        targethud:tweenOut(UDim2.new(0, 0, 0, 0), 0.2)
    end
end)
