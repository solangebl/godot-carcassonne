extends Tile
class_name ChurchTile

var abbot = null

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.FIELD;
	right = Content.FIELD;
	bottom = Content.FIELD;
	left = Content.FIELD;
	
	texture = "church.png"

func get_class(): return "ChurchTile"

func is_church():
	return true
