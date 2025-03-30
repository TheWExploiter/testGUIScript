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
mainFrame.Visible = false  -- Initially hidden

-- Create Open GUI Button
local openGuiButton = Instance.new("TextButton")
openGuiButton.Parent = screenGui
openGuiButton.Size = UDim2.new(0, 150, 0, 40)
openGuiButton.Position = UDim2.new(1, -160, 0.5, -20)  -- Right middle and a little up
openGuiButton.Text = "Open GUI"
openGuiButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
openGuiButton.TextColor3 = Color3.fromRGB(255, 255, 255)
addUICorner(openGuiButton, 10)

openGuiButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

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

-- Teleports Section
local teleportsFrame = Instance.new("Frame")
teleportsFrame.Parent = mainFrame
teleportsFrame.Name = "Teleports"
teleportsFrame.Size = UDim2.new(1, 0, 1, -40)
teleportsFrame.Position = UDim2.new(0, 0, 0, 40)
teleportsFrame.BackgroundTransparency = 1
teleportsFrame.Visible = true

local teleports = {
    {"Guide Place", Vector3.new(17892, -130, -3539)},
    {"Guide Place Outside", Vector3.new(17934, -130, -3600)},
    {"Starter Island", Vector3.new(0, -4, 0)},
    {"Slapple Island", Vector3.new(-388, 51, -14)},
    {"Cannon Island", Vector3.new(258, 34, 195)}
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

local voidGuard = nil  -- Declare the variable globally
local isAntiVoidActive = false
antiVoid.MouseButton1Click:Connect(function()
    isAntiVoidActive = not isAntiVoidActive
    if isAntiVoidActive then
        antiVoid.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Green when active
        -- Create the void guard if it doesn't exist
        if not voidGuard then
            voidGuard = Instance.new("Part")
            voidGuard.Size = Vector3.new(1000000, 2, 1000000)
            voidGuard.Position = Vector3.new(-82, -12, 87)
            voidGuard.Anchored = true
            voidGuard.CanCollide = true
            voidGuard.Transparency = 0.8
            voidGuard.Parent = game.Workspace
        end
    else
        antiVoid.BackgroundColor3 = Color3.fromRGB(169, 169, 169)  -- Gray when inactive
        -- Destroy the void guard if it exists
        if voidGuard then
            voidGuard:Destroy()
            voidGuard = nil  -- Set it back to nil so it can be recreated when activated
        end
    end
end)

-- Anti-Ragdoll Button
local antiRagdoll = Instance.new("TextButton")
antiRagdoll.Parent = featuresFrame
antiRagdoll.Size = UDim2.new(0, 300, 0, 40)
antiRagdoll.Position = UDim2.new(0.5, -150, 0, 50)
antiRagdoll.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
antiRagdoll.TextColor3 = Color3.fromRGB(255, 255, 255)
antiRagdoll.Text = "Activate Anti-Ragdoll"
addUICorner(antiRagdoll, 10)

local isAntiRagdollActive = false
antiRagdoll.MouseButton1Click:Connect(function()
    isAntiRagdollActive = not isAntiRagdollActive
    if isAntiRagdollActive then
        antiRagdoll.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Green when active
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)  -- Disable ragdoll physics
        end
    else
        antiRagdoll.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Red when inactive
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)  -- Enable ragdoll physics
        end
    end
end)

-- Settings Section
local settingsFrame = Instance.new("Frame")
settingsFrame.Parent = mainFrame
settingsFrame.Name = "Settings"
settingsFrame.Size = UDim2.new(1, 0, 1, -40)
settingsFrame.Position = UDim2.new(0, 0, 0, 40)
settingsFrame.BackgroundTransparency = 1
settingsFrame.Visible = false

-- Speed Setting
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
        player:SetAttribute("SavedSpeed", newSpeed)
    end
end)

game.Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function(char)
        if p == player then
            local savedSpeed = player:GetAttribute("SavedSpeed")
            if savedSpeed then
                setSpeed(savedSpeed)
            end
        end
    end)
end)

-- Jump Power Setting
local jumpBox = Instance.new("TextBox")
jumpBox.Parent = settingsFrame
jumpBox.Size = UDim2.new(0, 150, 0, 40)
jumpBox.Position = UDim2.new(0.5, -75, 0, 50)
jumpBox.Text = "Enter Jump Power"
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
        player:SetAttribute("SavedJumpPower", newJumpPower)
    end
end)

game.Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function(char)
        if p == player then
            local savedJumpPower = player:GetAttribute("SavedJumpPower")
            if savedJumpPower then
                setJumpPower(savedJumpPower)
            end
        end
    end)
end)
