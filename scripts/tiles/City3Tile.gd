extends Tile
class_name City3Tile

# Called when the node enters the scene tree for the first time.
func _ready():
	top = CITY;
	right = CITY;
	bottom = FIELD;
	left = CITY;

func get_class(): return "City3Tile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
