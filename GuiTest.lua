local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Function to add UI corner (round corners) to UI elements
local function addUICorner(uiElement, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = uiElement
end

-- Main frame setup
local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 500, 0, 350)  -- Adjusted size for better fit
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)  -- Centered
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
addUICorner(mainFrame, 20)
mainFrame.Visible = false  -- Make the frame hidden initially

-- Title for the frame
local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = mainFrame
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Text = "Teleport GUI By Cat"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
titleLabel.TextSize = 24
titleLabel.TextStrokeTransparency = 0.8
titleLabel.Font = Enum.Font.SourceSansBold
addUICorner(titleLabel, 10)

-- Scroll frames for each section
local sections = {"Teleports", "Features", "Settings"}
local sectionFrames = {}
local buttons = {}
local activeSection = "Teleports"

-- Frame for buttons to switch sections
local sectionFrame = Instance.new("Frame")
sectionFrame.Parent = mainFrame
sectionFrame.Size = UDim2.new(1, 0, 0, 40)
sectionFrame.Position = UDim2.new(0, 0, 0, 40)
sectionFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
addUICorner(sectionFrame, 10)

-- Create buttons for each section
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
        local targetFrame = sectionFrames[section]
        if targetFrame then
            targetFrame.Visible = true
        end
    end)
end

-- Teleports Section
local teleportsFrame = Instance.new("Frame")
teleportsFrame.Parent = mainFrame
teleportsFrame.Name = "Teleports"
teleportsFrame.Size = UDim2.new(1, 0, 1, -80)
teleportsFrame.Position = UDim2.new(0, 0, 0, 80)
teleportsFrame.BackgroundTransparency = 1
teleportsFrame.Visible = true
sectionFrames["Teleports"] = teleportsFrame

local teleports = {
    {"Guide Place", Vector3.new(17892, -130, -3539)},
    {"Guide Place Outside", Vector3.new(17934, -130, -3600)},
    {"Starter Island", Vector3.new(0, -4, 0)},
    {"Cannon Island", Vector3.new(258, 34, 195)},
    {"Slapple Island", Vector3.new(1950, -120, -500)}
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

-- Features Section
local featuresFrame = Instance.new("Frame")
featuresFrame.Parent = mainFrame
featuresFrame.Name = "Features"
featuresFrame.Size = UDim2.new(1, 0, 1, -80)
featuresFrame.Position = UDim2.new(0, 0, 0, 80)
featuresFrame.BackgroundTransparency = 1
featuresFrame.Visible = false
sectionFrames["Features"] = featuresFrame

local antiVoidButton = Instance.new("TextButton")
antiVoidButton.Parent = featuresFrame
antiVoidButton.Size = UDim2.new(0, 300, 0, 40)
antiVoidButton.Position = UDim2.new(0.5, -150, 0, 0)
antiVoidButton.Text = "Toggle Anti-Void"
antiVoidButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
antiVoidButton.TextColor3 = Color3.fromRGB(255, 255, 255)
addUICorner(antiVoidButton, 10)

local antiRagdollButton = Instance.new("TextButton")
antiRagdollButton.Parent = featuresFrame
antiRagdollButton.Size = UDim2.new(0, 300, 0, 40)
antiRagdollButton.Position = UDim2.new(0.5, -150, 0, 50)
antiRagdollButton.Text = "Toggle Anti-Ragdoll"
antiRagdollButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
antiRagdollButton.TextColor3 = Color3.fromRGB(255, 255, 255)
addUICorner(antiRagdollButton, 10)

-- Settings Section
local settingsFrame = Instance.new("Frame")
settingsFrame.Parent = mainFrame
settingsFrame.Name = "Settings"
settingsFrame.Size = UDim2.new(1, 0, 1, -80)
settingsFrame.Position = UDim2.new(0, 0, 0, 80)
settingsFrame.BackgroundTransparency = 1
settingsFrame.Visible = false
sectionFrames["Settings"] = settingsFrame

-- Speed Textbox
local speedTextbox = Instance.new("TextBox")
speedTextbox.Parent = settingsFrame
speedTextbox.Size = UDim2.new(0, 150, 0, 40)
speedTextbox.Position = UDim2.new(0.5, -75, 0, 0)
speedTextbox.Text = "Enter Speed"
addUICorner(speedTextbox, 10)

-- JumpPower Textbox
local jumpTextbox = Instance.new("TextBox")
jumpTextbox.Parent = settingsFrame
jumpTextbox.Size = UDim2.new(0, 150, 0, 40)
jumpTextbox.Position = UDim2.new(0.5, -75, 0, 50)
jumpTextbox.Text = "Enter JumpPower"
addUICorner(jumpTextbox, 10)

-- Function to set Speed
local function setSpeed(value)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = value
    end
end

-- Function to set JumpPower
local function setJumpPower(value)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.JumpPower = value
    end
end

-- Update speed and jump power when textboxes lose focus
speedTextbox.FocusLost:Connect(function()
    local newSpeed = tonumber(speedTextbox.Text)
    if newSpeed then
        setSpeed(newSpeed)
    end
end)

jumpTextbox.FocusLost:Connect(function()
    local newJump = tonumber(jumpTextbox.Text)
    if newJump then
        setJumpPower(newJump)
    end
end)

-- Functionality for toggling anti-void and anti-ragdoll
local antiVoidEnabled = false
local antiRagdollEnabled = false

antiVoidButton.MouseButton1Click:Connect(function()
    antiVoidEnabled = not antiVoidEnabled
    if antiVoidEnabled then
        antiVoidButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    else
        antiVoidButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

antiRagdollButton.MouseButton1Click:Connect(function()
    antiRagdollEnabled = not antiRagdollEnabled
    if antiRagdollEnabled then
        antiRagdollButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    else
        antiRagdollButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

-- Anchor HumanoidRootPart when slapped, and un-anchor after 1.5 seconds (Anti-Ragdoll)
local function anchorHumanoidRootPart()
    local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        humanoidRootPart.Anchored = true
        wait(1.5)
        humanoidRootPart.Anchored = false
    end
end

-- Listen for when the player is slapped (using a function)
game.ReplicatedStorage.SlapEvent.OnClientEvent:Connect(function()
    anchorHumanoidRootPart()
end)

-- Open GUI Button (toggle visibility of the frame)
local openGuiButton = Instance.new("TextButton")
openGuiButton.Parent = screenGui
openGuiButton.Size = UDim2.new(0, 120, 0, 40)
openGuiButton.Position = UDim2.new(1, -130, 0.5, -70)  -- Positioned at the right-middle and a little bit up
openGuiButton.Text = "Open GUI"
openGuiButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
openGuiButton.TextColor3 = Color3.fromRGB(255, 255, 255)
addUICorner(openGuiButton, 10)

openGuiButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    openGuiButton.Visible = not openGuiButton.Visible  -- Toggle visibility of the open button
end)
