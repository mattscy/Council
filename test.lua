local PLR = game:GetService("Players")

print("script", script:GetFullName())
local tool = script.Parent
tool.RequiresHandle = false

local sg = Instance.new("ScreenGui")
sg.Archivable = false

local frame = Instance.new("ScrollingFrame")
frame.SizeConstraint = Enum.SizeConstraint.RelativeYY
frame.BackgroundColor3 = Color3.fromRGB(13, 17, 23)
frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
frame.Size = UDim2.fromScale(1, 1)

local terminal = Instance.new("TextBox")
terminal.Font = Enum.Font.Code
terminal.BackgroundColor3 = Color3.fromRGB(13, 17, 23)
terminal.TextColor3 = Color3.fromRGB(255, 255, 255)
terminal.BackgroundTransparency = 1
terminal.AutomaticSize = Enum.AutomaticSize.XY

terminal.Parent = frame
frame.Parent = sg

tool.Equipped:Connect(function()
    local player = PLR:GetPlayerFromCharacter(tool.Parent)
    sg.Parent = player.PlayerGui
end)

tool.Unequipped:Connect(function()
    sg.Parent = nil
end)
