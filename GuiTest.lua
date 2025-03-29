-- Updated GUI with working teleport buttons, slap aura (hitbox extension + auto slap), and anti-void functionality.

local Gui = Instance.new("ScreenGui") Gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame") Frame.Size = UDim2.new(0.3, 0, 0.5, 0) Frame.Position = UDim2.new(0.35, 0, 0.25, 0) Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) Frame.Parent = Gui

local Title = Instance.new("TextLabel") Title.Size = UDim2.new(1, 0, 0.1, 0) Title.Text = "Teleport GUI Made by Cat" Title.TextColor3 = Color3.fromRGB(255, 255, 255) Title.Parent = Frame

local function createButton(name, pos, callback) local Button = Instance.new("TextButton") Button.Size = UDim2.new(0.9, 0, 0.1, 0) Button.Position = UDim2.new(0.05, 0, pos, 0) Button.Text = name Button.TextColor3 = Color3.fromRGB(255, 255, 255) Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50) Button.Parent = Frame Button.MouseButton1Click:Connect(callback) end

createButton("Guide Place", 0.2, function() game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(17892, -130, -3539)) end)

createButton("Guide Place Outside", 0.3, function() game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(17934, -130, -3600)) end)

createButton("Starter Island", 0.4, function() game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-6, -5, 0)) end)

createButton("Slap Aura", 0.5, function() local character = game.Players.LocalPlayer.Character if character then local glove = character:FindFirstChild("Glove") if glove then local hitbox = Instance.new("Part") hitbox.Size = Vector3.new(10, 10, 10) -- Extends hitbox hitbox.Transparency = 1 hitbox.CanCollide = false hitbox.Anchored = true hitbox.Parent = character hitbox.CFrame = character.PrimaryPart.CFrame

hitbox.Touched:Connect(function(hit) local enemy = hit.Parent if enemy and enemy:FindFirstChild("Humanoid") then game.ReplicatedStorage.SlapEvent:FireServer(enemy) end end) end end 

end)

local AntiVoid = Instance.new("Part") AntiVoid.Size = Vector3.new(1000000, 1, 1000000) AntiVoid.Position = Vector3.new(-82, -12, 87) AntiVoid.Anchored = true AntiVoid.Transparency = 0.8 AntiVoid.CanCollide = true AntiVoid.Parent = game.Workspace
