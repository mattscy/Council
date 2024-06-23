local PLR = game:GetService("Players")
local LS = game:GetService("LogService")

local tool = script.Parent

local sg = Instance.new("ScreenGui")
sg.Archivable = false

local container = Instance.new("Frame")
container.Size = UDim2.new(1, 100, 1, -150)
container.AnchorPoint = Vector2.new(0.5, 0.5)
container.Position = UDim2.fromScale(0.5, 0.5)
container.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
container.SizeConstraint = Enum.SizeConstraint.RelativeYY

local scroll = Instance.new("ScrollingFrame")
scroll.BackgroundColor3 = Color3.fromRGB(13, 17, 23)
scroll.BorderColor3 = Color3.fromRGB(255, 255, 255)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.XY
scroll.Size = UDim2.new(1, -100, 0.8, 0)

local terminal = Instance.new("TextBox")
terminal.Font = Enum.Font.Code
terminal.TextSize = 20
terminal.ClearTextOnFocus = false
terminal.MultiLine = true
terminal.Text = 'print("Hello Elemento!")'
terminal.BackgroundColor3 = Color3.fromRGB(13, 17, 23)
terminal.TextColor3 = Color3.fromRGB(255, 255, 255)
terminal.BackgroundTransparency = 1
terminal.Size = UDim2.fromScale(1, 1)
terminal.AutomaticSize = Enum.AutomaticSize.XY
terminal.TextXAlignment = Enum.TextXAlignment.Left
terminal.TextYAlignment = Enum.TextYAlignment.Top

local output = Instance.new("TextLabel")
output.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
output.TextColor3 = Color3.fromRGB(255, 255, 255)
output.TextSize = 20
output.Font = Enum.Font.Code
output.TextWrapped = true
output.Size = UDim2.new(1, 0, 0.2, 0)
output.Position = UDim2.new(0, 0, 0.8, 0)
output.TextXAlignment = Enum.TextXAlignment.Left
output.TextYAlignment = Enum.TextYAlignment.Top
output.Text = ""
output.Parent = container

terminal.Parent = scroll
scroll.Parent = container
output.Parent = container
container.Parent = sg

tool.Equipped:Connect(function()
    local player = PLR:GetPlayerFromCharacter(tool.Parent)
    sg.Parent = player.PlayerGui
end)

tool.Unequipped:Connect(function()
    sg.Parent = nil
end)

local execute = Instance.new("TextButton")
execute.Size = UDim2.fromOffset(100, 20)
execute.TextScaled = true
execute.Text = "Execute"
execute.AnchorPoint = Vector2.new(1, 0)
execute.Position = UDim2.fromScale(1, 0)
execute.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
execute.Parent = container

execute.MouseButton1Click:Connect(function()
    local func, err = loadstring(terminal.Text)
    if func then
        func()
    else
        error("Error compiling script: " .. err)
    end
end)

LS.MessageOut:Connect(function(message, messageType)
    output.Text = message .. "\n" .. output.Text
end)
