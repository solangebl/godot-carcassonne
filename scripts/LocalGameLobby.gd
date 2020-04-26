extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_StartGame_gui_input(event):

	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		
		var player1 = Player.new($Menu/PlayerList/Player1.text)
		var player2 = Player.new($Menu/PlayerList/Player2.text)
		
		Players.add(player1)
		Players.add(player2)
		
		get_tree().change_scene("res://scenes/Game.tscn")
