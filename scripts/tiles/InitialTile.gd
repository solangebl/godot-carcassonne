extends Tile
class_name InitialTile

# Called when the node enters the scene tree for the first time.
func _ready():
	top = CITY;
	right = PATH;
	bottom = FIELD;
	left = PATH;


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
