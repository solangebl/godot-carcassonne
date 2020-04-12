extends Tile
class_name Road4Tile

# Called when the node enters the scene tree for the first time.
func _ready():
	top = PATH;
	right = PATH;
	bottom = PATH;
	left = PATH;

func get_class(): return "Road4Tile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
