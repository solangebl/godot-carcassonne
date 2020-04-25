extends MarginContainer

var players
# Called when the node enters the scene tree for the first time.
func _ready():
	players = get_node("/root/Players") 


func _on_StartGame_gui_input(event):

	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		
		var player1 = Player.new($VBoxContainer/PlayerList/Player1.text)
		var player2 = Player.new($VBoxContainer/PlayerList/Player2.text)
		
		players.add(player1)
		players.add(player2)
		
		get_tree().change_scene("res://scenes/Game.tscn")
