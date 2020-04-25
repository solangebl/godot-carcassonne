extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_RotateButton_pressed():
	get_tree().get_current_scene().rotate_current_tile()
	
func _on_ConfirmButton_pressed():
	get_tree().get_current_scene().confirm_action()


func _on_CancelButton_pressed():
	get_tree().get_current_scene().cancel_action()
