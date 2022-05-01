local players = game.Players:GetPlayers()
local debugTesting = true
local debugValue = 2563592335
local durationForJoin = 5
local joinedNotifications = false

local versionNum = "1.2"
local lastUpdate = "4/30/2022"

local check = 
{
	24306216,
	113446572,
	126571986,
	6157007,
	33036969,
	38305488,
	29896927,
	89674737,
	44182782,
	35257650,
	40545786,
	111505144,
	18140170,
	39661500,
	32057167,
	49548557,
	153077340,
	29062348,
	127780,
	22302669,
	64182296,
	69948947,
	31894146,
	32871693,
	25691148,
	48719996,
	135955170,
	5270972,
	40469261,
	31018411,
	6949935,
	31820308,
	6443947,
	7288729,
	799258,
	735798,
	797599
}
-- DEBUG ALERT
if debugTesting == true then
	warn("⚠️ Debug has been enabled!⚠️")
	game.StarterGui:SetCore("SendNotification", {
		Title = "⚠️ Debug Alert ⚠️";
		Text = "Debug has been enabled for the userId of " .. debugValue;
		Duration = 10;
	})
end
--Joined Notification
game.Players.PlayerAdded:Connect(function(user)
	if joinedNotifications == true then
	local Players = game:GetService("Players")
	local player = user
	local userId = player.UserId
	local thumbType = Enum.ThumbnailType.HeadShot
	local thumbSize = Enum.ThumbnailSize.Size420x420
	local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
	
	game.StarterGui:SetCore("SendNotification", {
		Title = "Player Joined";
		Text = user.Name .. " has joined!";
		Icon = content;
		Duration = durationForJoin;
		})
	end
end)
--Loaded Notification
print("✅ Innovation HR Check has been successfully loaded! ✅")
	game.StarterGui:SetCore("SendNotification", {
	Title = "✅ Successfully Loaded ✅";
	Text = "Innovation HR check has been loaded and is now in action.";
	Duration = 5;
})
--Version Notification
game.StarterGui:SetCore("SendNotification", {
	Title = "☄️ Version ☄️";
	Text = "Running version " .. versionNum .. " last updated on " .. lastUpdate;
	Duration = 8;
})
--Player Joined Notification Conformation
function Callback(answer)
	if answer == "Yes" then
		joinedNotifications = true
		print("You WILL recive a notification when a player joins")
	elseif answer == "No" then
		joinedNotifications = false
		print("You will NOT recive a notification when a player joins")
	end
end

local Bindable = Instance.new("BindableFunction")
Bindable.OnInvoke = Callback

game.StarterGui:SetCore("SendNotification", {
	Title = "Notification Conformation";
	Text = "Would you like to recive a notification when a player joins? (off by default)";
	Button1 = "Yes";
	Button2 = "No";
	Duration = 300;
	Callback = Bindable
})
print("------------------------------------------------------------------------")
print("Currently running on version " .. versionNum)
print("Last updated on " .. lastUpdate)
print("------------------------------------------------------------------------")
--Checking
game.Players.PlayerAdded:Connect(function(player)
		for i,v in pairs(check) do
			if player.UserId == v or debugTesting == true and player.UserId == debugValue then
				game.Players.LocalPlayer:Kick("The High Rank " .. player.Name .. " has joined")
		end
	end
end)
