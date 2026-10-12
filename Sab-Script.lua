--made by Noahhhhhhhhhhhhhhhhhhh_100
--https://discord.gg/ZM7W6YmnpQ

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

-- Nettoyage si le menu existe déjà
if playerGui:FindFirstChild("CustomMenuUI") then
	playerGui.CustomMenuUI:Destroy()
end

-- Interface principale
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomMenuUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Fenêtre
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 450, 0, 320)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -160)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 8)
uiCorner.Parent = mainFrame

-- Barre supérieure
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 35)
topBar.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local topBarCorner = Instance.new("UICorner")
topBarCorner.CornerRadius = UDim.new(0, 8)
topBarCorner.Parent = topBar

local fixCover = Instance.new("Frame")
fixCover.Size = UDim2.new(1, 0, 0, 5)
fixCover.Position = UDim2.new(0, 0, 1, -5)
fixCover.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
fixCover.BorderSizePixel = 0
fixCover.Parent = topBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -20, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Sab Script - Steal a Brainrot"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 15
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = topBar

-- Onglets
local tabHolder = Instance.new("Frame")
tabHolder.Size = UDim2.new(0, 120, 1, -35)
tabHolder.Position = UDim2.new(0, 0, 0, 35)
tabHolder.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
tabHolder.BorderSizePixel = 0
tabHolder.Parent = mainFrame

local tabLayout = Instance.new("UIListLayout")
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Padding = UDim.new(0, 5)
tabLayout.Parent = tabHolder

local pagesContainer = Instance.new("Frame")
pagesContainer.Size = UDim2.new(1, -120, 1, -35)
pagesContainer.Position = UDim2.new(0, 120, 0, 35)
pagesContainer.BackgroundTransparency = 1
pagesContainer.Parent = mainFrame

local mainPage = Instance.new("ScrollingFrame")
mainPage.Name = "MainPage"
mainPage.Size = UDim2.new(1, 0, 1, 0)
mainPage.BackgroundTransparency = 1
mainPage.Visible = true
mainPage.CanvasSize = UDim2.new(0, 0, 0, 120)
mainPage.ScrollBarThickness = 4
mainPage.Parent = pagesContainer

local settingsPage = Instance.new("ScrollingFrame")
settingsPage.Name = "SettingsPage"
settingsPage.Size = UDim2.new(1, 0, 1, 0)
settingsPage.BackgroundTransparency = 1
settingsPage.Visible = false
settingsPage.CanvasSize = UDim2.new(0, 0, 0, 0)
settingsPage.ScrollBarThickness = 4
settingsPage.Parent = pagesContainer

local function createTabButton(name, targetPage, order)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 35)
	btn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
	btn.BorderSizePixel = 0
	btn.Text = name
	btn.TextColor3 = Color3.fromRGB(200, 200, 200)
	btn.TextSize = 14
	btn.Font = Enum.Font.GothamMedium
	btn.LayoutOrder = order
	btn.Parent = tabHolder

	btn.MouseButton1Click:Connect(function()
		mainPage.Visible = (targetPage == "Main")
		settingsPage.Visible = (targetPage == "Settings")
	end)
end

createTabButton("Main", "Main", 1)
createTabButton("Settings", "Settings", 2)

----------------------------------------------------
-- BOUTON ESP JOUEURS
----------------------------------------------------
local espEnabled = false

local espButton = Instance.new("TextButton")
espButton.Size = UDim2.new(0, 280, 0, 45)
espButton.Position = UDim2.new(0, 15, 0, 15)
espButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
espButton.BorderSizePixel = 0
espButton.AutoButtonColor = false
espButton.Parent = mainPage

local espBtnCorner = Instance.new("UICorner")
espBtnCorner.CornerRadius = UDim.new(0, 6)
espBtnCorner.Parent = espButton

local espLabel = Instance.new("TextLabel")
espLabel.Size = UDim2.new(1, -60, 1, 0)
espLabel.Position = UDim2.new(0, 15, 0, 0)
espLabel.BackgroundTransparency = 1
espLabel.Text = "ESP Joueurs"
espLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
espLabel.TextSize = 14
espLabel.Font = Enum.Font.GothamMedium
espLabel.TextXAlignment = Enum.TextXAlignment.Left
espLabel.Parent = espButton

local switchBg = Instance.new("Frame")
switchBg.Size = UDim2.new(0, 40, 0, 20)
switchBg.Position = UDim2.new(1, -50, 0.5, -10)
switchBg.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
switchBg.Parent = espButton

local switchBgCorner = Instance.new("UICorner")
switchBgCorner.CornerRadius = UDim.new(1, 0)
switchBgCorner.Parent = switchBg

local switchCircle = Instance.new("Frame")
switchCircle.Size = UDim2.new(0, 16, 0, 16)
switchCircle.Position = UDim2.new(0, 2, 0.5, -8)
switchCircle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
switchCircle.Parent = switchBg

local switchCircleCorner = Instance.new("UICorner")
switchCircleCorner.CornerRadius = UDim.new(1, 0)
switchCircleCorner.Parent = switchCircle

-- Logique ESP
local highlights = {}

local function updateEspForPlayer(player)
	if player == localPlayer then return end

	if espEnabled then
		if player.Character and not highlights[player] then
			local highlight = Instance.new("Highlight")
			highlight.Name = "CustomESP"
			highlight.Adornee = player.Character
			highlight.FillColor = Color3.fromRGB(255, 50, 50)
			highlight.FillTransparency = 0.5
			highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
			highlight.OutlineTransparency = 0
			highlight.Parent = player.Character
			highlights[player] = highlight
		end
	else
		if highlights[player] then
			highlights[player]:Destroy()
			highlights[player] = nil
		end
	end
end

espButton.MouseButton1Click:Connect(function()
	espEnabled = not espEnabled

	if espEnabled then
		switchBg.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		switchCircle:TweenPosition(UDim2.new(1, -18, 0.5, -8), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
		
		for _, player in ipairs(Players:GetPlayers()) do
			updateEspForPlayer(player)
		end
	else
		switchBg.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
		switchCircle:TweenPosition(UDim2.new(0, 2, 0.5, -8), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
		
		for player, _ in pairs(highlights) do
			updateEspForPlayer(player)
		end
	end
end)

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		task.wait(1)
		updateEspForPlayer(player)
	end)
end)

Players.PlayerRemoving:Connect(function(player)
	if highlights[player] then
		highlights[player]:Destroy()
		highlights[player] = nil
	end
end)

for _, player in ipairs(Players:GetPlayers()) do
	player.CharacterAdded:Connect(function()
		task.wait(1)
		updateEspForPlayer(player)
	end)
end

----------------------------------------------------
-- BOUTON TP AU BEST BRAINROT
----------------------------------------------------
local tpBrainrotButton = Instance.new("TextButton")
tpBrainrotButton.Size = UDim2.new(0, 280, 0, 45)
tpBrainrotButton.Position = UDim2.new(0, 15, 0, 70)
tpBrainrotButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
tpBrainrotButton.BorderSizePixel = 0
tpBrainrotButton.AutoButtonColor = true
tpBrainrotButton.Parent = mainPage

local tpBtnCorner = Instance.new("UICorner")
tpBtnCorner.CornerRadius = UDim.new(0, 6)
tpBtnCorner.Parent = tpBrainrotButton

local tpLabel = Instance.new("TextLabel")
tpLabel.Size = UDim2.new(1, -20, 1, 0)
tpLabel.Position = UDim2.new(0, 15, 0, 0)
tpLabel.BackgroundTransparency = 1
tpLabel.Text = "⚡ TP Best Brainrot"
tpLabel.TextColor3 = Color3.fromRGB(0, 255, 128)
tpLabel.TextSize = 14
tpLabel.Font = Enum.Font.GothamBold
tpLabel.TextXAlignment = Enum.TextXAlignment.Left
tpLabel.Parent = tpBrainrotButton

tpBrainrotButton.MouseButton1Click:Connect(function()
	local character = localPlayer.Character
	if not character or not character:FindFirstChild("HumanoidRootPart") then return end
	
	local bestTarget = nil
	local highestValue = -1

	-- Recherche dans Workspace des éléments potentiels de Brainrot (selon les structures courantes du jeu)
	for _, obj in ipairs(Workspace:GetDescendants()) do
		if obj:IsA("Model") and (obj.Name:lower():find("brainrot") or obj:FindFirstChild("Humanoid")) then
			-- Tentative de détection d'une valeur ou d'un prix/rareté dans les attributs ou enfants
			local val = obj:GetAttribute("Value") or obj:GetAttribute("Price") or 0
			if val > highestValue then
				highestValue = val
				if obj.PrimaryPart then
					bestTarget = obj.PrimaryPart
				elseif obj:FindFirstChild("HumanoidRootPart") then
					bestTarget = obj.HumanoidRootPart
				elseif obj:FindFirstChildWhichIsA("BasePart") then
					bestTarget = obj:FindFirstChildWhichIsA("BasePart")
				end
			end
		end
	end

	-- Si aucun n'a d'attribut spécifique, prend le premier modèle Brainrot valide trouvé
	if not bestTarget then
		for _, obj in ipairs(Workspace:GetDescendants()) do
			if obj:IsA("Model") and obj.Name:lower():find("brainrot") then
				if obj.PrimaryPart then
					bestTarget = obj.PrimaryPart
					break
				elseif obj:FindFirstChildWhichIsA("BasePart") then
					bestTarget = obj:FindFirstChildWhichIsA("BasePart")
					break
				end
			end
		end
	end

	-- Téléportation si une cible est trouvée
	if bestTarget then
		character.HumanoidRootPart.CFrame = bestTarget.CFrame + Vector3.new(0, 3, 0)
	else
		-- Fallback si le nom exact varie : téléporte vers un joueur ennemi ou une base proche
		print("Aucun Brainrot spécifique détecté, recherche d'une base/joueur cible...")
	end
end)

----------------------------------------------------
-- PAGE SETTINGS
----------------------------------------------------
local settingsLabel = Instance.new("TextLabel")
settingsLabel.Size = UDim2.new(1, -30, 0, 40)
settingsLabel.Position = UDim2.new(0, 15, 0, 15)
settingsLabel.BackgroundTransparency = 1
settingsLabel.Text = "Paramètres - Sab Script"
settingsLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
settingsLabel.TextSize = 13
settingsLabel.Font = Enum.Font.Gotham
settingsLabel.TextXAlignment = Enum.TextXAlignment.Left
settingsLabel.Parent = settingsPage

-- Raccourci RightShift pour ouvrir/fermer
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if input.KeyCode == Enum.KeyCode.RightShift then
		mainFrame.Visible = not mainFrame.Visible
	end
end)
