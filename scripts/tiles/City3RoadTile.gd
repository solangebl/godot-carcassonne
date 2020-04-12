extends Tile
class_name City3RoadTile

# Called when the node enters the scene tree for the first time.
func _ready():
	top = CITY;
	right = CITY;
	bottom = PATH;
	left = CITY;

func get_class(): return "City3RoadTile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
