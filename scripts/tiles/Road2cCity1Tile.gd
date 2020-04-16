extends Tile
class_name Road2cCity1Tile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.CITY;
	right = Content.PATH;
	bottom = Content.PATH;
	left = Content.FIELD;

func get_class(): return "Road2cCity1Tile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
