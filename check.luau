task.wait(1)
local players = game.Players:GetPlayers()
local debugTesting = false
local debugRole = 0
local durationForJoinNotification = 5
local durationForLeaveNotification = 5
local joinedNotifications = false
local leaveNotifications = false
local groupId = 901313
local bannedRanks = {70,150,175,200,210,230,240,254,255}
local versionNum = "1.8"
local lastUpdate = "5/6/2022"

--NOTIFICATION OPTIONS

--Player Joined Notification Conformation
function Callback(answer)
	if answer == "Yes" then
		joinedNotifications = true
		print("You WILL recive a notification when a player joins (you must rejoin to change this)")
		print("------------------------------------------------------------------------")
	elseif answer == "No" then
		joinedNotifications = false
		print("You will NOT recive a notification when a player joins (you must rejoin to change this)")
		print("------------------------------------------------------------------------")
	end
end

local Bindable = Instance.new("BindableFunction")
Bindable.OnInvoke = Callback

game.StarterGui:SetCore("SendNotification", {
	Title = "Notification Conformation";
	Text = "Would you like to recive a notification when a player joins? (off by default)";
	Button1 = "Yes";
	Button2 = "No";
	Duration = math.huge;
	Callback = Bindable
})
-- DEBUG ALERT
if debugTesting == true then
	warn("Debug has been enabled!")
	game.StarterGui:SetCore("SendNotification", {
		Title = "⚠️ Debug Alert ⚠️";
		Text = "Debug has been enabled for the group role number of " .. debugRole;
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
		Text = user.Name .. " has joined.";
		Icon = content;
		Duration = durationForJoinNotification;
		})
	end
end)

print("------------------------------------------------------------------------")
print("Innovation HR check is currently running on version " .. versionNum .. " last updated on " .. lastUpdate)
print("------------------------------------------------------------------------")
--Loaded Notification
print("Innovation HR Check has been successfully loaded!")
print("------------------------------------------------------------------------")
game.StarterGui:SetCore("SendNotification", {
	Title = "Successfully Loaded";
	Text = "Innovation HR check has been loaded and is now in action.";
	Duration = 8;
})
--Checking
game.Players.PlayerAdded:Connect(function(player)
	for i,v in pairs(bannedRanks) do
		if player:GetRankInGroup(groupId) == v or debugTesting == true and player:GetRankInGroup(groupId) == debugRole then
			game.Players.LocalPlayer:Kick(" \n A person with the rank of " .. player:GetRoleInGroup(groupId) .. " by the name of " .. player.Name .. " has joined the game. \n \n Quick Information: \n \n Name: " .. player.Name .. "\n DisplayName: " .. player.DisplayName .. "\n Rank: " .. player:GetRoleInGroup(groupId) .. "\n UserId: " .. player.UserId)
		end
	end
end)
