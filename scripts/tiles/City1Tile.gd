extends Tile
class_name City1Tile

# Called when the node enters the scene tree for the first time.
func _ready():
	top = CITY;
	right = FIELD;
	bottom = FIELD;
	left = FIELD;

func get_class(): return "City1Tile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
