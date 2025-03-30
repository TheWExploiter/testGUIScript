local player = game.Players.LocalPlayer local screenGui = Instance.new("ScreenGui") screenGui.ResetOnSpawn = false screenGui.Parent = player:WaitForChild("PlayerGui")

local function addUICorner(uiElement, radius) local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0, radius) corner.Parent = uiElement end

local mainFrame = Instance.new("Frame") mainFrame.Parent = screenGui mainFrame.Size = UDim2.new(0, 500, 0, 300) mainFrame.Position = UDim2.new(0.5, -250, 0, 0) mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25) mainFrame.Visible = false addUICorner(mainFrame, 15)

local sections = {"Teleports", "Features", "Settings"} local buttons = {} local activeSection = "Teleports" local sectionFrame = Instance.new("Frame") sectionFrame.Parent = mainFrame sectionFrame.Size = UDim2.new(1, 0, 0, 40) sectionFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

for i, section in ipairs(sections) do local btn = Instance.new("TextButton") btn.Parent = sectionFrame btn.Size = UDim2.new(1 / #sections, 0, 1, 0) btn.Position = UDim2.new((i - 1) / #sections, 0, 0, 0) btn.Text = section btn.TextColor3 = Color3.fromRGB(255, 255, 255) btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60) buttons[section] = btn addUICorner(btn, 10) end

 local teleportLocations = { {"Cannon Island", Vector3.new(266, 34, 202)}, {"Default Only Island", Vector3.new(136, 360, -2)}, {"Guide Inside", Vector3.new(150, 35, 150)}, {"Guide Outside", Vector3.new(180, 35, 180)}, {"Slapple Island", Vector3.new(300, 40, 250)}, {"Starter Island", Vector3.new(100, 30, 100)} }

local teleportFrame = Instance.new("Frame") teleportFrame.Parent = mainFrame teleportFrame.Size = UDim2.new(1, 0, 1, -40) teleportFrame.Position = UDim2.new(0, 0, 0, 40) teleportFrame.Visible = true

for _, data in ipairs(teleportLocations) do local tpBtn = Instance.new("TextButton") tpBtn.Parent = teleportFrame tpBtn.Size = UDim2.new(1, 0, 0, 30) tpBtn.Text = data[1] tpBtn.TextColor3 = Color3.fromRGB(255, 255, 255) tpBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80) tpBtn.MouseButton1Click:Connect(function() if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then player.Character.HumanoidRootPart.CFrame = CFrame.new(data[2]) end end) addUICorner(tpBtn, 10) end

 local settingsFrame = Instance.new("Frame") settingsFrame.Parent = mainFrame settingsFrame.Size = UDim2.new(1, 0, 1, -40) settingsFrame.Position = UDim2.new(0, 0, 0, 40) settingsFrame.Visible = false

local speedBox = Instance.new("TextBox") speedBox.Parent = settingsFrame speedBox.Size = UDim2.new(1, 0, 0, 30) speedBox.Text = "Enter Speed" addUICorner(speedBox, 10) speedBox.FocusLost:Connect(function() local speed = tonumber(speedBox.Text) if speed then player.Character.Humanoid.WalkSpeed = speed end end)

local jumpBox = Instance.new("TextBox") jumpBox.Parent = settingsFrame jumpBox.Size = UDim2.new(1, 0, 0, 30) jumpBox.Text = "Enter Jump Power" addUICorner(jumpBox, 10) jumpBox.FocusLost:Connect(function() local jumpPower = tonumber(jumpBox.Text) if jumpPower then player.Character.Humanoid.JumpPower = jumpPower end end)

local toggleButton = Instance.new("TextButton") toggleButton.Parent = screenGui toggleButton.Size = UDim2.new(0, 100, 0, 50) toggleButton.Position = UDim2.new(0.95, -110, 0.5, -15) toggleButton.Text = "Open GUI" toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255) addUICorner(toggleButton, 10)

toggleButton.MouseButton1Click:Connect(function() mainFrame.Visible = not mainFrame.Visible end)

