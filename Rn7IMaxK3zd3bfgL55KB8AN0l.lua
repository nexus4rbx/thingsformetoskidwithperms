local blur = loadstring(game:HttpGet("https://raw.githubusercontent.com/boykisser143/stuff-for-nebola-to-skid/main/blur.lua"))()

local playersService = game:GetService("Players")
local MakeDarker = {["Enabled"] = true}
local Blurr = {["Enabled"] = true}
local Padding = {["Value"] = 3}
local Rounding = {["Value"] = 12}

local color1 = Color3.fromRGB(93, 63, 211)
local color2 = Color3.fromRGB(93, 63, 211)

function hotbarMods()
    repeat task.wait() until playersService.LocalPlayer.PlayerGui and playersService.LocalPlayer.PlayerGui:FindFirstChild("hotbar") and playersService.LocalPlayer.PlayerGui:FindFirstChild("hotbar"):FindFirstChild("1")
    for i,v in pairs(playersService.LocalPlayer.PlayerGui.hotbar["1"].ItemsHotbar:GetChildren()) do
        if v:IsA("UIListLayout") then v.Padding = UDim.new(0, Padding["Value"]) end
        if v:FindFirstChildOfClass("ImageButton") then
            local ImageButton = v:FindFirstChildOfClass("ImageButton")
            ImageButton.BorderSizePixel = 0
            ImageButton.BackgroundColor3 = MakeDarker["Enabled"] and color2:lerp(Color3.new(0, 0, 0), 0.65) or color2

            if Blurr["Enabled"] and not game:GetService("Workspace"):FindFirstChild("Lobby") then
                blur.new(ImageButton, "Rectangle")
            end

            local UICorner = Instance.new("UICorner", ImageButton)
            if UICorner then UICorner.CornerRadius = UDim.new(0, Rounding["Value"]) end
            
            local UIStroke = Instance.new("UIStroke", ImageButton)
            if UIStroke then UIStroke.Color = color1 end

            local TextLabel = ImageButton:FindFirstChildOfClass("TextLabel")
            if TextLabel.Text ~= "<b>3</b>" and TextLabel.Text ~= "<b>6</b>" then
                TextLabel.Position = UDim2.new(-0.01, 0, -0.01, 0)
            else
                TextLabel.Position = UDim2.new(-0.005, 0, -0.01, 0)
            end

            TextLabel.BackgroundColor3 = color1
            TextLabel:GetPropertyChangedSignal("BackgroundColor3"):Connect(function()
                TextLabel.BackgroundColor3 = color1
            end)
        end
    end
end

hotbarMods()
playersService.LocalPlayer.CharacterAdded:Connect(function()
    hotbarMods()
end)
