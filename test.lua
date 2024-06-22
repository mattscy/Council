local PLR = game:GetService("Players")

local tool = Instance.new("Tool")
tool.RequiresHandle = false

local sg = Instance.new("ScreenGui")
local terminal = Instance.new("TextBox")
terminal.Font = Enum.Font.Code
terminal.BackgroundColor3 = Color3.fromRGB(13, 17, 23)
terminal.TextColor3 = Color3.fromRGB(255, 255, 255)
terminal.SizeConstraint = Enum.SizeConstraint.RelativeYY
terminal.Size = UDim2.fromScale(1, 1)
terminal.Parent = sg

tool.Equipped:Connect(function()
    local player = PLR:GetPlayerFromCharacter(tool.Parent)
    sg.Parent = player.PlayerGui
end)

tool.Unequipped:Connect(function()
    sg.Parent = nil
end)
