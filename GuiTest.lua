local player = game.Players.LocalPlayer local screenGui = Instance.new("ScreenGui") screenGui.ResetOnSpawn = false screenGui.Parent = player:WaitForChild("PlayerGui")

local function addUICorner(uiElement, radius) local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0, radius) corner.Parent = uiElement end

local mainFrame = Instance.new("Frame") mainFrame.Parent = screenGui mainFrame.Size = UDim2.new(0, 400, 0, 500) mainFrame.Position = UDim2.new(0.5, -200, 0.3, -10) mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25) addUICorner(mainFrame, 15)

local scrollFrame = Instance.new("ScrollingFrame") scrollFrame.Parent = mainFrame scrollFrame.Size = UDim2.new(1, 0, 1, 0) scrollFrame.CanvasSize = UDim2.new(0, 0, 4, 0) scrollFrame.ScrollBarThickness = 10 scrollFrame.BackgroundTransparency = 1

local speedTextBox = Instance.new("TextBox") speedTextBox.Parent = scrollFrame speedTextBox.Size = UDim2.new(0, 300, 0, 40) speedTextBox.Position = UDim2.new(0.5, -150, 0.05, -10) speedTextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255) speedTextBox.TextColor3 = Color3.fromRGB(0, 0, 0) speedTextBox.PlaceholderText = "Enter Speed" addUICorner(speedTextBox, 10)

local speedButton = Instance.new("TextButton") speedButton.Parent = scrollFrame speedButton.Size = UDim2.new(0, 300, 0, 40) speedButton.Position = UDim2.new(0.5, -150, 0.12, -10) speedButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255) speedButton.TextColor3 = Color3.fromRGB(255, 255, 255) speedButton.Text = "Set Speed" addUICorner(speedButton, 10)

speedButton.MouseButton1Click:Connect(function() local speedValue = tonumber(speedTextBox.Text) if speedValue and player.Character and player.Character:FindFirstChild("Humanoid") then player.Character.Humanoid.WalkSpeed = speedValue end end)

player.CharacterAdded:Connect(function(character) character:WaitForChild("Humanoid").WalkSpeed = tonumber(speedTextBox.Text) or 16 end)

local antiVoid = Instance.new("TextButton") antiVoid.Parent = scrollFrame antiVoid.Size = UDim2.new(0, 300, 0, 40) antiVoid.Position = UDim2.new(0.5, -150, 0.2, -10) antiVoid.BackgroundColor3 = Color3.fromRGB(100, 100, 255) antiVoid.TextColor3 = Color3.fromRGB(255, 255, 255) antiVoid.Text = "Activate Anti-Void" addUICorner(antiVoid, 10)

antiVoid.MouseButton1Click:Connect(function() local voidGuard = Instance.new("Part") voidGuard.Size = Vector3.new(1000000, 2, 1000000) voidGuard.Position = Vector3.new(-82, -8, 87) voidGuard.Anchored = true voidGuard.Transparency = 0.8 voidGuard.Parent = game.Workspace end)

local tpButton1 = Instance.new("TextButton") tpButton1.Parent = scrollFrame tpButton1.Size = UDim2.new(0, 300, 0, 40) tpButton1.Position = UDim2.new(0.5, -150, 0.3, -10) tpButton1.BackgroundColor3 = Color3.fromRGB(70, 130, 180) tpButton1.TextColor3 = Color3.fromRGB(255, 255, 255) tpButton1.Text = "Teleport: Guide Place" addUICorner(tpButton1, 10)

tpButton1.MouseButton1Click:Connect(function() if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then player.Character.HumanoidRootPart.CFrame = CFrame.new(17892, -130, -3539) end end)

local slapAura = Instance.new("TextButton") slapAura.Parent = scrollFrame slapAura.Size = UDim2.new(0, 300, 0, 40) slapAura.Position = UDim2.new(0.5, -150, 0.4, -10) slapAura.BackgroundColor3 = Color3.fromRGB(255, 0, 0) slapAura.TextColor3 = Color3.fromRGB(255, 255, 255) slapAura.Text = "Activate Slap Farm" addUICorner(slapAura, 10)

slapAura.MouseButton1Click:Connect(function() if player.Backpack:FindFirstChild("Mace") then local fakePlayer = Instance.new("Part") fakePlayer.Size = Vector3.new(2, 6, 2) fakePlayer.Position = Vector3.new(17934, -130, -3600) fakePlayer.Anchored = true fakePlayer.Parent = game.Workspace

local mace = player.Backpack:FindFirstChild("Mace") mace.Parent = player.Character while mace and fakePlayer do mace:Activate() task.wait(1) end end 

end)

-- Made by ImCatTrust
