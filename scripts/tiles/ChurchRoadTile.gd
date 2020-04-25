extends Tile
class_name ChurchRoadTile

var abbot = null

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.FIELD
	right = Content.FIELD
	bottom = Content.PATH
	left = Content.FIELD
	
	texture = "church_road.png"

func get_class(): return "ChurchRoadTile"

func is_church():
	return true
