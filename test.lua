local PLR = game:GetService("Players")

local tool = script.Parent

local sg = Instance.new("ScreenGui")
sg.Archivable = false

local container = Instance.new("Frame")
container.Size = UDim2.new(1, 50, 1, -50)
container.AnchorPoint = Vector2.new(0.5, 0.5)
container.Position = UDim2.fromScale(0.5, 0.5)
container.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

local scroll = Instance.new("ScrollingFrame")
scroll.SizeConstraint = Enum.SizeConstraint.RelativeYY
scroll.BackgroundColor3 = Color3.fromRGB(13, 17, 23)
scroll.BorderColor3 = Color3.fromRGB(255, 255, 255)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.XY
scroll.Size = UDim2.fromScale(1, 1)

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

terminal.Parent = scroll
scroll.Parent = container
container.Parent = sg

tool.Equipped:Connect(function()
    local player = PLR:GetPlayerFromCharacter(tool.Parent)
    sg.Parent = player.PlayerGui
end)

tool.Unequipped:Connect(function()
    sg.Parent = nil
end)

local execute = Instance.new("TextButton")
execute.Size = UDim2.fromOffset(50, 20)
execute.TextScaled = true
execute.Text = "Execute"
execute.AnchorPoint = Vector2.new(1, 0)
execute.Position = UDim2.fromScale(1, 0)
execute.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
execute.Parent = container

execute.MouseButton1Click:Connect(function()
    local func, err = loadstring(terminal.text)
    if func then
        func()
    else
        error("Error compiling script: " .. err)
    end
end)
