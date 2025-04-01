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
mainFrame.Size = UDim2.new(0, 500, 0, 300) -- Wider GUI
mainFrame.Position = UDim2.new(0.5, -250, 0, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
addUICorner(mainFrame, 15)

local sections = {"Teleports", "Features"}
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
    {"Guide Place Outside", Vector3.new(17934, -130, -3600)},
    {"Starter Island", Vector3.new(-0, -4, -0)},
    {"Slapple Island", Vector3.new(-388, 51, -14)},
    {"Cannon Island", Vector3.new(266, 34, 202)},
    {"Default Only Island", Vector3.new(136, 360, -2)}
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

-- Anti-Void Toggle Button
local antiVoid = Instance.new("TextButton")
antiVoid.Parent = featuresFrame
antiVoid.Size = UDim2.new(0, 300, 0, 40)
antiVoid.Position = UDim2.new(0.5, -150, 0, 0)
antiVoid.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
antiVoid.TextColor3 = Color3.fromRGB(255, 255, 255)
antiVoid.Text = "Activate Anti-Void"
addUICorner(antiVoid, 10)

local voidGuard = nil
local antiVoidEnabled = false
local antiVoidHeight = -14  -- Height under which teleport occurs (Y position)
local antiVoidRange = 1     -- 1-meter range from the Anti-Void part

-- Monitor player position for Anti-Void teleport
local function checkAntiVoid()
    if antiVoidEnabled and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local charPos = player.Character.HumanoidRootPart.Position
        local voidPos = voidGuard.Position
        
        -- Check if the player is within 1 meter of the Anti-Void and below the threshold height
        if (charPos.Y < antiVoidHeight) and (charPos - voidPos).Magnitude < antiVoidRange then
            -- Teleport player to Starter Island
            player.Character.HumanoidRootPart.CFrame = CFrame.new(teleports[3][2]) -- Starter Island position
        end
    end
end

antiVoid.MouseButton1Click:Connect(function()
    antiVoidEnabled = not antiVoidEnabled
    if antiVoidEnabled then
        antiVoid.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        antiVoid.Text = "Deactivate Anti-Void"
        voidGuard = Instance.new("Part")
        voidGuard.Size = Vector3.new(1000000, 2, 1000000)
        voidGuard.Position = Vector3.new(0, antiVoidHeight, 0)  -- Height at which the Anti-Void part is
        voidGuard.Anchored = true
        voidGuard.CanCollide = true
        voidGuard.Transparency = 0.8
        voidGuard.Parent = game.Workspace
        
        -- Start monitoring the player's position
        while antiVoidEnabled do
            wait(0.1)
            checkAntiVoid()
        end
    else
        antiVoid.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
        antiVoid.Text = "Activate Anti-Void"
        if voidGuard then
            voidGuard:Destroy()
            voidGuard = nil
        end
    end
end)

-- Toggle Button to Open/Close GUI
local toggleButton = Instance.new("TextButton")
toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0, 100, 0, 50)
toggleButton.Position = UDim2.new(0.95, -110, 0.5, -15)
toggleButton.Text = "Open GUI"
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
addUICorner(toggleButton, 10)

toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)
