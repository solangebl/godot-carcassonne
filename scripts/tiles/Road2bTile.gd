extends Tile
class_name Road2bTile

# Called when the node enters the scene tree for the first time.
func _ready():
	top = FIELD;
	right = FIELD;
	bottom = PATH;
	left = PATH;

func get_class(): return "Road2bTile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
