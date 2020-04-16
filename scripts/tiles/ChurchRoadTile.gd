extends Tile
class_name ChurchRoadTile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.FIELD;
	right = Content.FIELD;
	bottom = Content.PATH;
	left = Content.FIELD;

func get_class(): return "ChurchRoadTile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
