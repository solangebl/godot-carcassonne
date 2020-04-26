extends MarginContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_LocalGameButton_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		get_tree().change_scene("res://scenes/menus/LocalGameLobby.tscn")
