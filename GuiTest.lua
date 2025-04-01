local player = game.Players.LocalPlayer local screenGui = Instance.new("ScreenGui") screenGui.ResetOnSpawn = false screenGui.Parent = player:WaitForChild("PlayerGui")

local function addUICorner(uiElement, radius) local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0, radius) corner.Parent = uiElement end

local tweenService = game:GetService("TweenService")

local mainFrame = Instance.new("ScrollingFrame") mainFrame.Parent = screenGui mainFrame.Size = UDim2.new(0, 500, 0, 300) mainFrame.Position = UDim2.new(0.5, -250, 0, -300) mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25) mainFrame.ClipsDescendants = true mainFrame.ScrollBarThickness = 5 addUICorner(mainFrame, 15) mainFrame.Visible = false

local teleports = { {"Guide Place", Vector3.new(17892, -130, -3539)}, {"Guide Place Outside", Vector3.new(17934, -130, -3600)}, {"Starter Island", Vector3.new(0, -4, 0)}, {"Slapple Island", Vector3.new(-388, 51, -14)}, {"Cannon Island", Vector3.new(266, 34, 202)}, {"Default Only Island", Vector3.new(136, 360, -2)}, {"New Platform", Vector3.new(10000, -150, 10000)} }

for i, tp in ipairs(teleports) do local tpButton = Instance.new("TextButton") tpButton.Parent = mainFrame tpButton.Size = UDim2.new(0, 300, 0, 40) tpButton.Position = UDim2.new(0.5, -150, 0, (i - 1) * 45) tpButton.Text = tp[1] tpButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180) tpButton.TextColor3 = Color3.fromRGB(255, 255, 255) addUICorner(tpButton, 10)

tpButton.MouseButton1Click:Connect(function() if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then player.Character.HumanoidRootPart.CFrame = CFrame.new(tp[2]) local tween = tweenService:Create(tpButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 320, 0, 50)}) tween:Play() tween.Completed:Connect(function() tweenService:Create(tpButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 300, 0, 40)}):Play() end) end end) 

end

local antiVoid = Instance.new("TextButton") antiVoid.Parent = mainFrame antiVoid.Size = UDim2.new(0, 300, 0, 40) antiVoid.Position = UDim2.new(0.5, -150, 0, (#teleports + 1) * 45) antiVoid.BackgroundColor3 = Color3.fromRGB(100, 100, 255) antiVoid.TextColor3 = Color3.fromRGB(255, 255, 255) antiVoid.Text = "Activate Anti-Void" addUICorner(antiVoid, 10)

local voidGuard = Instance.new("Part") voidGuard.Size = Vector3.new(10000000, 2, 10000000) voidGuard.Position = Vector3.new(0, -12, 0) voidGuard.Anchored = true voidGuard.CanCollide = true voidGuard.Transparency = 0.7 voidGuard.Parent = game.Workspace voidGuard.Visible = false

local antiVoidEnabled = false antiVoid.MouseButton1Click:Connect(function() antiVoidEnabled = not antiVoidEnabled voidGuard.Visible = antiVoidEnabled antiVoid.Text = antiVoidEnabled and "Deactivate Anti-Void" or "Activate Anti-Void" antiVoid.BackgroundColor3 = antiVoidEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(100, 100, 255) end)

game:GetService("RunService").Stepped:Connect(function() if antiVoidEnabled and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then if player.Character.HumanoidRootPart.Position.Y < -14 then player.Character.HumanoidRootPart.CFrame = CFrame.new(17892, -130, -3539) end end end)

local flyButton = Instance.new("TextButton") flyButton.Parent = mainFrame flyButton.Size = UDim2.new(0, 300, 0, 40) flyButton.Position = UDim2.new(0.5, -150, 0, (#teleports + 2) * 45) flyButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100) flyButton.TextColor3 = Color3.fromRGB(255, 255, 255) flyButton.Text = "Activate Fly GUI" addUICorner(flyButton, 10)

flyButton.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))() end)

local toggleButton = Instance.new("TextButton") toggleButton.Parent = screenGui toggleButton.Size = UDim2.new(0, 100, 0, 50) toggleButton.Position = UDim2.new(0.95, -110, 0.5, -15) toggleButton.Text = "Open GUI" toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255) addUICorner(toggleButton, 10)

toggleButton.MouseButton1Click:Connect(function() local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out) if mainFrame.Visible then local closeTween = tweenService:Create(mainFrame, tweenInfo, {Position = UDim2.new(0.5, -250, 0, -300)}) closeTween:Play() closeTween.Completed:Connect(function() mainFrame.Visible = false end) else mainFrame.Visible = true local openTween = tweenService:Create(mainFrame, tweenInfo, {Position = UDim2.new(0.5, -250, 0, 0)}) openTween:Play() end end)

