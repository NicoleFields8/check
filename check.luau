local players = game.Players:GetPlayers()

local check = {
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
	139829012,
	797599
}

game.StarterGui:SetCore("SendNotification", {
	Title = "Successfully Loaded";
	Text = "Innovation HR check has been loaded and is now in action.";
})

game.Players.PlayerAdded:Connect(function(player)
	for i,v in pairs(check) do
		if player.UserId == v then
		game.Players.LocalPlayer:Kick("The HR/EX, " .. player.Name .. " has joined")
	end
	game.StarterGui:SetCore("SendNotification", {
		Title = "Player Joined";
		Text = "Thw non HR " .. player.Name .. " has joined!";
	})
	end
end)