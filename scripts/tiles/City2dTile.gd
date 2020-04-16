extends Tile
class_name City2dTile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.CITY;
	right = Content.CITY;
	bottom = Content.FIELD;
	left = Content.FIELD;

func get_class(): return "City2dTile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
