extends Tile
class_name Road4Tile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.PATH;
	right = Content.PATH;
	bottom = Content.PATH;
	left = Content.PATH;
	
	texture = "road4.png"

func get_class(): return "Road4Tile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
