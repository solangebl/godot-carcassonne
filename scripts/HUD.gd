extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_RotateButton_pressed():
	get_tree().get_current_scene().rotate_current_tile()
	
