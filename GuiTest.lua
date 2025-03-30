local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local function addUICorner(uiElement, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = uiElement
end

-- Create the main frame
local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 450, 0, 350) -- Size of the frame
mainFrame.Position = UDim2.new(0.5, -225, 0.3, -10)  -- Center the frame
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  -- Dark background
addUICorner(mainFrame, 15)
mainFrame.Visible = false  -- Initially, set frame to invisible

-- Title for the frame
local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = mainFrame
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Text = "Teleport GUI By Cat"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
titleLabel.TextSize = 20
titleLabel.TextScaled = true
addUICorner(titleLabel, 10)

-- Create the Button to toggle the GUI
local toggleButton = Instance.new("TextButton")
toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0, 100, 0, 50)
toggleButton.Position = UDim2.new(0.95, -110, 0.5, -15)  -- Right middle side position
toggleButton.Text = "Open GUI"
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
addUICorner(toggleButton, 10)

-- Toggle visibility when button is clicked
toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    toggleButton.Visible = not toggleButton.Visible  -- Toggle visibility of the open button
end)

-- Add scroll frame to make it more user-friendly
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Parent = mainFrame
scrollFrame.Size = UDim2.new(1, 0, 1, -40)
scrollFrame.Position = UDim2.new(0, 0, 0, 40)
scrollFrame.CanvasSize = UDim2.new(0, 0, 2, 0)  -- Allows scrolling when content overflows
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 10

-- Add sections and content

-- Teleports Section
local teleportsFrame = Instance.new("Frame")
teleportsFrame.Parent = scrollFrame
teleportsFrame.Size = UDim2.new(1, 0, 0, 250)
teleportsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
addUICorner(teleportsFrame, 10)

local teleportButton1 = Instance.new("TextButton")
teleportButton1.Parent = teleportsFrame
teleportButton1.Size = UDim2.new(0, 300, 0, 40)
teleportButton1.Position = UDim2.new(0.5, -150, 0, 10)
teleportButton1.Text = "Teleport to Starter Island"
teleportButton1.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
teleportButton1.TextColor3 = Color3.fromRGB(255, 255, 255)
addUICorner(teleportButton1, 10)
teleportButton1.MouseButton1Click:Connect(function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0)
end)

local teleportButton2 = Instance.new("TextButton")
teleportButton2.Parent = teleportsFrame
teleportButton2.Size = UDim2.new(0, 300, 0, 40)
teleportButton2.Position = UDim2.new(0.5, -150, 0, 60)
teleportButton2.Text = "Teleport to Slapple Island"
teleportButton2.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
teleportButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
addUICorner(teleportButton2, 10)
teleportButton2.MouseButton1Click:Connect(function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(258, 34, 195)  -- Slapple Island
end)

local teleportButton3 = Instance.new("TextButton")
teleportButton3.Parent = teleportsFrame
teleportButton3.Size = UDim2.new(0, 300, 0, 40)
teleportButton3.Position = UDim2.new(0.5, -150, 0, 110)
teleportButton3.Text = "Teleport to Guide Place"
teleportButton3.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
teleportButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
addUICorner(teleportButton3, 10)
teleportButton3.MouseButton1Click:Connect(function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(10, 20, 30)  -- Guide Place
end)

local teleportButton4 = Instance.new("TextButton")
teleportButton4.Parent = teleportsFrame
teleportButton4.Size = UDim2.new(0, 300, 0, 40)
teleportButton4.Position = UDim2.new(0.5, -150, 0, 160)
teleportButton4.Text = "Teleport to Guide Place Outside"
teleportButton4.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
teleportButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
addUICorner(teleportButton4, 10)
teleportButton4.MouseButton1Click:Connect(function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(100, 50, 200)  -- Guide Place Outside
end)

-- Added Cannon Island Teleport
local teleportButton5 = Instance.new("TextButton")
teleportButton5.Parent = teleportsFrame
teleportButton5.Size = UDim2.new(0, 300, 0, 40)
teleportButton5.Position = UDim2.new(0.5, -150, 0, 210)
teleportButton5.Text = "Teleport to Cannon Island"
teleportButton5.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
teleportButton5.TextColor3 = Color3.fromRGB(255, 255, 255)
addUICorner(teleportButton5, 10)
teleportButton5.MouseButton1Click:Connect(function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(258, 34, 195)  -- Cannon Island (Use your specific coordinates)
end)

-- Features Section
local featuresFrame = Instance.new("Frame")
featuresFrame.Parent = scrollFrame
featuresFrame.Size = UDim2.new(1, 0, 0, 150)
featuresFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
addUICorner(featuresFrame, 10)

-- Anti-Ragdoll (Anchor HumanoidRootPart)
local antiRagdollButton = Instance.new("TextButton")
antiRagdollButton.Parent = featuresFrame
antiRagdollButton.Size = UDim2.new(0, 300, 0, 40)
antiRagdollButton.Position = UDim2.new(0.5, -150, 0, 10)
antiRagdollButton.Text = "Toggle Anti-Ragdoll"
antiRagdollButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
antiRagdollButton.TextColor3 = Color3.fromRGB(255, 255, 255)
addUICorner(antiRagdollButton, 10)
antiRagdollButton.MouseButton1Click:Connect(function()
    local character = player.Character
    if character then
        if character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = character.HumanoidRootPart
            humanoidRootPart.Anchored = not humanoidRootPart.Anchored
            antiRagdollButton.BackgroundColor3 = humanoidRootPart.Anchored and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        end
    end
end)

-- Anti-Void
local antiVoidButton = Instance.new("TextButton")
antiVoidButton.Parent = featuresFrame
antiVoidButton.Size = UDim2.new(0, 300, 0, 40)
antiVoidButton.Position = UDim2.new(0.5, -150, 0, 60)
antiVoidButton.Text = "Toggle Anti-Void"
antiVoidButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
antiVoidButton.TextColor3 = Color3.fromRGB(255, 255, 255)
addUICorner(antiVoidButton, 10)
antiVoidButton.MouseButton1Click:Connect(function()
    -- Anti-Void logic here (create a void guard to prevent falling)
    local voidGuard = Instance.new("Part")
    voidGuard.Size = Vector3.new(1000000, 2, 1000000)
    voidGuard.Position = Vector3.new(-82, -12, 87)
    voidGuard.Anchored = true
    voidGuard.CanCollide = true
    voidGuard.Transparency = 0.8
    voidGuard.Parent = game.Workspace
end)

-- Settings Section (Speed and JumpPower)
local settingsFrame = Instance.new("Frame")
settingsFrame.Parent = scrollFrame
settingsFrame.Size = UDim2.new(1, 0, 0, 150)
settingsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
addUICorner(settingsFrame, 10)

-- Speed and JumpPower Textboxes
local speedBox = Instance.new("TextBox")
speedBox.Parent = settingsFrame
speedBox.Size = UDim2.new(0, 150, 0, 40)
speedBox.Position = UDim2.new(0.5, -75, 0, 10)
speedBox.Text = "Enter Speed"
addUICorner(speedBox, 10)

local jumpBox = Instance.new("TextBox")
jumpBox.Parent = settingsFrame
jumpBox.Size = UDim2.new(0, 150, 0, 40)
jumpBox.Position = UDim2.new(0.5, -75, 0, 60)
jumpBox.Text = "Enter JumpPower"
addUICorner(jumpBox, 10)

-- Set Speed and JumpPower when user enters values
    local function setSpeedAndJumpPower()
        local newSpeed = tonumber(speedBox.Text)
        local newJumpPower = tonumber(jumpBox.Text)
        if newSpeed then
            player.Character.Humanoid.WalkSpeed = newSpeed
        end
        if newJumpPower then
            player.Character.Humanoid.JumpPower = newJumpPower
        end
    end

    -- Connect textbox update to the settings
    speedBox.FocusLost:Connect(function()
        setSpeedAndJumpPower()
    end)

    jumpBox.FocusLost:Connect(function()
        setSpeedAndJumpPower()
    end)

-- Made By Cat
