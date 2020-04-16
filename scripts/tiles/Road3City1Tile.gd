extends Tile
class_name Road3City1Tile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.CITY;
	right = Content.PATH;
	bottom = Content.PATH;
	left = Content.PATH;

func get_class(): return "Road3City1Tile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
