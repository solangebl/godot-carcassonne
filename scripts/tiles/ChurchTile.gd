extends Tile
class_name ChurchTile

# Called when the node enters the scene tree for the first time.
func _ready():
	top = FIELD;
	right = FIELD;
	bottom = FIELD;
	left = FIELD;

func get_class(): return "ChurchTile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
