local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local function addUICorner(uiElement, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = uiElement
end

local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 500, 0, 400) -- Wider GUI
mainFrame.Position = UDim2.new(0.5, -250, 0.3, -10)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
addUICorner(mainFrame, 15)

local sections = {"Teleports", "Features", "Settings"}
local buttons = {}
local activeSection = "Teleports"

local sectionFrame = Instance.new("Frame")
sectionFrame.Parent = mainFrame
sectionFrame.Size = UDim2.new(1, 0, 0, 40)
sectionFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

for i, section in ipairs(sections) do
    local btn = Instance.new("TextButton")
    btn.Parent = sectionFrame
    btn.Size = UDim2.new(1 / #sections, 0, 1, 0)
    btn.Position = UDim2.new((i - 1) / #sections, 0, 0, 0)
    btn.Text = section
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    buttons[section] = btn
    
    btn.MouseButton1Click:Connect(function()
        activeSection = section
        for _, child in pairs(mainFrame:GetChildren()) do
            if child:IsA("Frame") and child ~= sectionFrame then
                child.Visible = false
            end
        end
        local targetFrame = mainFrame:FindFirstChild(section)
        if targetFrame then
            targetFrame.Visible = true
        end
    end)
end

local teleportsFrame = Instance.new("Frame")
teleportsFrame.Parent = mainFrame
teleportsFrame.Name = "Teleports"
teleportsFrame.Size = UDim2.new(1, 0, 1, -40)
teleportsFrame.Position = UDim2.new(0, 0, 0, 40)
teleportsFrame.BackgroundTransparency = 1
teleportsFrame.Visible = true

local teleports = {
    {"Guide Place", Vector3.new(17892, -130, -3539)},
    {"Guide Place Outside", Vector3.new(17934, -130, -3600)},  -- Added this line
    {"Starter Island", Vector3.new(0, -4, 0)},
    {"Slapple Island", Vector3.new(-388, 51, -14)},
    {"Cannon Island", Vector3.new(258, 34, 195)}  -- Added this line for Cannon Island teleport
}

for i, tp in ipairs(teleports) do
    local tpButton = Instance.new("TextButton")
    tpButton.Parent = teleportsFrame
    tpButton.Size = UDim2.new(0, 300, 0, 40)
    tpButton.Position = UDim2.new(0.5, -150, 0, (i - 1) * 45)
    tpButton.Text = tp[1]
    tpButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    tpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    addUICorner(tpButton, 10)
    
    tpButton.MouseButton1Click:Connect(function()
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(tp[2])
        end
    end)
end

local featuresFrame = Instance.new("Frame")
featuresFrame.Parent = mainFrame
featuresFrame.Name = "Features"
featuresFrame.Size = UDim2.new(1, 0, 1, -40)
featuresFrame.Position = UDim2.new(0, 0, 0, 40)
featuresFrame.BackgroundTransparency = 1
featuresFrame.Visible = false

-- Anti-Void Button
local antiVoid = Instance.new("TextButton")
antiVoid.Parent = featuresFrame
antiVoid.Size = UDim2.new(0, 300, 0, 40)
antiVoid.Position = UDim2.new(0.5, -150, 0, 0)
antiVoid.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
antiVoid.TextColor3 = Color3.fromRGB(255, 255, 255)
antiVoid.Text = "Activate Anti-Void"
addUICorner(antiVoid, 10)

local antiVoidEnabled = false
antiVoid.MouseButton1Click:Connect(function()
    if antiVoidEnabled then
        -- Disable Anti-Void
        for _, part in pairs(game.Workspace:GetChildren()) do
            if part.Name == "VoidGuard" then
                part:Destroy()
            end
        end
        antiVoid.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Disabled (White/Gray)
        antiVoidEnabled = false
    else
        -- Enable Anti-Void
        local voidGuard = Instance.new("Part")
        voidGuard.Name = "VoidGuard"
        voidGuard.Size = Vector3.new(1000000, 2, 1000000)
        voidGuard.Position = Vector3.new(-82, -12, 87)
        voidGuard.Anchored = true
        voidGuard.CanCollide = true
        voidGuard.Transparency = 0.8
        voidGuard.Parent = game.Workspace
        antiVoid.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Enabled (Green)
        antiVoidEnabled = true
    end
end)

-- Anti-Ragdoll Button
local antiRagdoll = Instance.new("TextButton")
antiRagdoll.Parent = featuresFrame
antiRagdoll.Size = UDim2.new(0, 300, 0, 40)
antiRagdoll.Position = UDim2.new(0.5, -150, 0, 50)
antiRagdoll.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
antiRagdoll.TextColor3 = Color3.fromRGB(255, 255, 255)
antiRagdoll.Text = "Activate Anti-Ragdoll"
addUICorner(antiRagdoll, 10)

local antiRagdollEnabled = false
antiRagdoll.MouseButton1Click:Connect(function()
    if antiRagdollEnabled then
        -- Disable Anti-Ragdoll
        antiRagdoll.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Disabled (White/Gray)
        antiRagdollEnabled = false
    else
        -- Enable Anti-Ragdoll
        antiRagdoll.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Enabled (Green)
        antiRagdollEnabled = true
    end
end)

-- Settings Frame for Speed and Jump Power
local settingsFrame = Instance.new("Frame")
settingsFrame.Parent = mainFrame
settingsFrame.Name = "Settings"
settingsFrame.Size = UDim2.new(1, 0, 1, -40)
settingsFrame.Position = UDim2.new(0, 0, 0, 40)
settingsFrame.BackgroundTransparency = 1
settingsFrame.Visible = false

local speedBox = Instance.new("TextBox")
speedBox.Parent = settingsFrame
speedBox.Size = UDim2.new(0, 150, 0, 40)
speedBox.Position = UDim2.new(0.5, -75, 0, 0)
speedBox.Text = "Enter Speed"
addUICorner(speedBox, 10)

local function setSpeed(value)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = value
    end
end

speedBox.FocusLost:Connect(function()
    local newSpeed = tonumber(speedBox.Text)
    if newSpeed then
        setSpeed(newSpeed)
    end
end)

local jumpBox = Instance.new("TextBox")
jumpBox.Parent = settingsFrame
jumpBox.Size = UDim2.new(0, 150, 0, 40)
jumpBox.Position = UDim2.new(0.5, -75, 0, 50)
jumpBox.Text = "Enter JumpPower"
addUICorner(jumpBox, 10)

local function setJumpPower(value)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.JumpPower = value
    end
end

jumpBox.FocusLost:Connect(function()
    local newJumpPower = tonumber(jumpBox.Text)
    if newJumpPower then
        setJumpPower(newJumpPower)
    end
end)

-- Draggable GUI
local dragging = false
local dragInput, dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

mainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Show GUI
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
