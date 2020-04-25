extends Tile
class_name InitialTile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.CITY;
	right = Content.PATH;
	bottom = Content.FIELD;
	left = Content.PATH
	
	texture = "road2a_city1.png"

func get_class(): return "InitialTile"

func generate_nodes():
	var nodes = []
	return nodes
