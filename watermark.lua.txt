local Watermark = {}

Watermark.gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
Watermark.gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Watermark.gui.ResetOnSpawn = false

Watermark.watermarkFrame = Instance.new("Frame", Watermark.gui)
Watermark.watermarkFrame.BorderSizePixel = 0
Watermark.watermarkFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Watermark.watermarkFrame.Size = UDim2.new(0, 344, 0, 25)
Watermark.watermarkFrame.Position = UDim2.new(0.002, 0, 0.05, 0)
Watermark.watermarkFrame.BorderSizePixel = 0
Watermark.watermarkFrame.Name = [[watermark]]
Watermark.watermarkFrame.BackgroundTransparency = 0.5

Watermark.watermarkText1 = Instance.new("TextLabel", Watermark.watermarkFrame)
Watermark.watermarkText1.ZIndex = 99950
Watermark.watermarkText1.BorderSizePixel = 0
Watermark.watermarkText1.TextXAlignment = Enum.TextXAlignment.Left
Watermark.watermarkText1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Watermark.watermarkText1.TextSize = 16
Watermark.watermarkText1.FontFace = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Watermark.watermarkText1.TextColor3 = Color3.fromRGB(255, 255, 255)
Watermark.watermarkText1.BackgroundTransparency = 1
Watermark.watermarkText1.RichText = true
Watermark.watermarkText1.Size = UDim2.new(1, 0, 1, 0)
Watermark.watermarkText1.BorderSizePixel = 0
Watermark.watermarkText1.Text = [[]]
Watermark.watermarkText1.Name = [[text]]

Watermark.padding = Instance.new("UIPadding", Watermark.watermarkText1)
Watermark.padding.PaddingTop = UDim.new(0, 4)
Watermark.padding.PaddingRight = UDim.new(0, 4)
Watermark.padding.PaddingLeft = UDim.new(0, 4)
Watermark.padding.PaddingBottom = UDim.new(0, 4)

Watermark.gwadient = Instance.new("Frame", Watermark.watermarkFrame)
Watermark.gwadient.ZIndex = 12
Watermark.gwadient.BorderSizePixel = 0
Watermark.gwadient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Watermark.gwadient.Size = UDim2.new(1, 0, 0, 1)
Watermark.gwadient.Position = UDim2.new(0, 0, -0.036, 0)
Watermark.gwadient.BorderSizePixel = 0
Watermark.gwadient.Name = [[gwadient]]

Watermark.gradient = Instance.new("UIGradient", Watermark.gwadient)
Watermark.gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(235, 35, 66)),ColorSequenceKeypoint.new(0.320, Color3.fromRGB(252, 183, 13)),ColorSequenceKeypoint.new(0.640, Color3.fromRGB(252, 183, 13)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(235, 35, 66))}

Watermark.watermarkText2 = Instance.new("TextLabel", Watermark.watermarkFrame)
Watermark.watermarkText2.ZIndex = 99950
Watermark.watermarkText2.BorderSizePixel = 0
Watermark.watermarkText2.TextXAlignment = Enum.TextXAlignment.Left
Watermark.watermarkText2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Watermark.watermarkText2.TextSize = 16
Watermark.watermarkText2.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
Watermark.watermarkText2.TextColor3 = Color3.fromRGB(255, 255, 255)
Watermark.watermarkText2.BackgroundTransparency = 1
Watermark.watermarkText2.RichText = true
Watermark.watermarkText2.Size = UDim2.new(1, 0, 1, 0)
Watermark.watermarkText2.BorderSizePixel = 0
Watermark.watermarkText2.Text = [[]]
Watermark.watermarkText2.Name = [[name]]

Watermark.padding2 = Instance.new("UIPadding", Watermark.watermarkText2)
Watermark.padding2.PaddingTop = UDim.new(0, 4)
Watermark.padding2.PaddingRight = UDim.new(0, 4)
Watermark.padding2.PaddingLeft = UDim.new(0, 4)
Watermark.padding2.PaddingBottom = UDim.new(0, 4)

Watermark.gradient2 = Instance.new("UIGradient", Watermark.watermarkText2)
Watermark.gradient2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(235, 35, 66)),ColorSequenceKeypoint.new(0.320, Color3.fromRGB(252, 183, 13)),ColorSequenceKeypoint.new(0.640, Color3.fromRGB(252, 183, 13)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(235, 35, 66))}

Watermark.shadoe = Instance.new("ImageLabel", G2L["c"])
Watermark.shadoe.ZIndex = 0
Watermark.shadoe.BorderSizePixel = 0
Watermark.shadoe.SliceCenter = Rect.new(49, 49, 450, 450)
Watermark.shadoe.ScaleType = Enum.ScaleType.Slice
Watermark.shadoe.ImageTransparency = 0.5
Watermark.shadoe.ImageColor3 = Color3.fromRGB(0, 0, 0)
Watermark.shadoe.ImageCAnchorPointolor3 = Vector2.new(0.5, 0.5)
Watermark.shadoe.Image = [[rbxassetid://6014261993]]
Watermark.shadoe.Size = UDim2.new(1, 30, 1, 30)
Watermark.shadoe.BorderSizePixel = 0
Watermark.shadoe.BackgroundTransparency = 1
Watermark.shadoe.Name = [[DropShadow]]
Watermark.shadoe.Position = UDim2.new(0.5, 0, 0.5, 0)

game:GetService("RunService").RenderStepped:Connect(function()
    Watermark.watermarkText2.Text = "Novoline"
    Watermark.watermarkText1.Text = ' | ' .. game.Players.LocalPlayer.Name .. ' | ' .. game.Name .. ' | ' .. math.round(game.Players.LocalPlayer:GetNetworkPing() * 2000) .. 'ms'
    Watermark.watermarkText1.Position = UDim2.new(0, Watermark.watermarkText2.TextBounds.X - 2, 0, 0)
    Watermark.watermarkFrame.Size = UDim2.new(0, (Watermark.watermarkText2.TextBounds.X + (Watermark.watermarkText1.TextBounds.X)) + 4, 0, 25)
end)

task.spawn(function()
    while true do
        local gradient = Watermark.gradient
        local ts = game:GetService("TweenService")
        local ti = TweenInfo.new(2.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
        local offset1 = {Offset = Vector2.new(-1, 0)}
        local create1 = ts:Create(gradient, ti, offset1)
        local startPos = Vector2.new(1, 0)
        local rot = 180
        if rot == 0 then
            gradient.Rotation = 180
            gradient.Offset = startPos
            create1:Play()
            create1.Completed:Wait()
            if rot == 0 then rot = 180 elseif rot == 180 then rot = 0 end
        elseif rot == 180 then
            gradient.Rotation = 0
            gradient.Offset = startPos
            create1:Play()
            create1.Completed:Wait()
            if rot == 0 then rot = 180 elseif rot == 180 then rot = 0 end
        end
    end
end)

task.spawn(function()
    while true do
        local gradient = Watermark.gradient2
        local ts = game:GetService("TweenService")
        local ti = TweenInfo.new(2.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
        local offset1 = {Offset = Vector2.new(-1, 0)}
        local create1 = ts:Create(gradient, ti, offset1)
        local startPos = Vector2.new(1, 0)
        local rot = 180
        if rot == 0 then
            gradient.Rotation = 180
            gradient.Offset = startPos
            create1:Play()
            create1.Completed:Wait()
            if rot == 0 then rot = 180 elseif rot == 180 then rot = 0 end
        elseif rot == 180 then
            gradient.Rotation = 0
            gradient.Offset = startPos
            create1:Play()
            create1.Completed:Wait()
            if rot == 0 then rot = 180 elseif rot == 180 then rot = 0 end
        end
    end
end)
