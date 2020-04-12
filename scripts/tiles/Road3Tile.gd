extends Tile
class_name Road3Tile

# Called when the node enters the scene tree for the first time.
func _ready():
	top = FIELD;
	right = PATH;
	bottom = PATH;
	left = PATH;

func get_class(): return "Road3Tile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
