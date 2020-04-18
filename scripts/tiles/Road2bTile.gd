extends Tile
class_name Road2bTile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.FIELD;
	right = Content.FIELD;
	bottom = Content.PATH;
	left = Content.PATH;
	
	texture = "road2b.png"

func get_class(): return "Road2bTile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
