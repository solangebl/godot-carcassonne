extends Tile
class_name Road2aTile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.FIELD;
	right = Content.PATH;
	bottom = Content.FIELD;
	left = Content.PATH;

func get_class(): return "Road2aTile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
