-- Laser Bot Toggle UI
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local toggleEvent = ReplicatedStorage:WaitForChild("ToggleLaserBot")

local isEnabled = false

-- ScreenGui 생성
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LaserBotControlUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- 메인 프레임
local frame = Instance.new("Frame")
frame.Name = "ControlPanel"
frame.Size = UDim2.new(0, 210, 0, 95)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(25, 27, 34)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = frame

local frameStroke = Instance.new("UIStroke")
frameStroke.Color = Color3.fromRGB(60, 65, 80)
frameStroke.Thickness = 1.5
frameStroke.Parent = frame

-- 제목 텍스트
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -20, 0, 28)
titleLabel.Position = UDim2.new(0, 10, 0, 8)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "레이저 봇 제어"
titleLabel.TextColor3 = Color3.fromRGB(240, 240, 245)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 15
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = frame

-- ON / OFF 토글 버튼
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, -20, 0, 42)
toggleButton.Position = UDim2.new(0, 10, 0, 42)
toggleButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
toggleButton.Text = "상태: OFF (클릭하여 켜기)"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 14
toggleButton.AutoButtonColor = true
toggleButton.Parent = frame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = toggleButton

-- UI 디자인 업데이트 함수
local function updateUI()
	if isEnabled then
		toggleButton.BackgroundColor3 = Color3.fromRGB(46, 180, 90)
		toggleButton.Text = "상태: ON (작동 중)"
	else
		toggleButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
		toggleButton.Text = "상태: OFF (정지됨)"
	end
end

updateUI()

-- 버튼 클릭 이벤트
toggleButton.MouseButton1Click:Connect(function()
	isEnabled = not isEnabled
	updateUI()
	toggleEvent:FireServer(isEnabled)
end)
