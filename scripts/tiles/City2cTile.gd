extends Tile
class_name City2cTile

# Called when the node enters the scene tree for the first time.
func _ready():
	top = CITY;
	right = FIELD;
	bottom = CITY;
	left = FIELD;

func get_class(): return "City2cTile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
