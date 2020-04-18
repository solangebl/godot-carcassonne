extends Tile
class_name Road2bCity1Tile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.CITY;
	right = Content.FIELD;
	bottom = Content.PATH;
	left = Content.PATH;
	
	texture = "road2b_city1.png"

func get_class(): return "Road2bCity1Tile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
