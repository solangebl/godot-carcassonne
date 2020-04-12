extends Tile
class_name Road2aCity1Tile

# Called when the node enters the scene tree for the first time.
func _ready():
	top = CITY;
	right = PATH;
	bottom = FIELD;
	left = PATH;

func get_class(): return "Road2aCity1Tile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
