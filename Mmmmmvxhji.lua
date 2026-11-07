-- Создаем интерфейс
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local SaveButton = Instance.new("TextButton")
local TpButton = Instance.new("TextButton")

-- Настройки интерфейса (чтобы не мешал)
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Position = UDim2.new(0, 20, 0, 200)
Frame.Size = UDim2.new(0, 150, 0, 110)
Frame.BorderSizePixel = 0

-- Кнопка "Save"
SaveButton.Parent = Frame
SaveButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
SaveButton.Position = UDim2.new(0, 10, 0, 10)
SaveButton.Size = UDim2.new(0, 130, 0, 40)
SaveButton.Text = "Save Position"
SaveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveButton.TextSize = 16
SaveButton.Font = Enum.Font.SourceSansBold

-- Кнопка "TP"
TpButton.Parent = Frame
TpButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
TpButton.Position = UDim2.new(0, 10, 0, 60)
TpButton.Size = UDim2.new(0, 130, 0, 40)
TpButton.Text = "Teleport"
TpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TpButton.TextSize = 16
TpButton.Font = Enum.Font.SourceSansBold

-- Переменная для хранения координат
local savedPosition = nil

-- Логика кнопки Save
SaveButton.MouseButton1Click:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        savedPosition = char.HumanoidRootPart.CFrame
        SaveButton.Text = "Saved!"
        wait(1)
        SaveButton.Text = "Save Position"
    end
end)

-- Логика кнопки TP
TpButton.MouseButton1Click:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        if savedPosition then
            char.HumanoidRootPart.CFrame = savedPosition
            TpButton.Text = "Teleported!"
            wait(1)
            TpButton.Text = "Teleport"
        else
            TpButton.Text = "No saved pos!"
            wait(1)
            TpButton.Text = "Teleport"
        end
    end
end)
