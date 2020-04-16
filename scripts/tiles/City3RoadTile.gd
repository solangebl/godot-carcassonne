extends Tile
class_name City3RoadTile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.CITY;
	right = Content.CITY;
	bottom = Content.PATH;
	left = Content.CITY;

func get_class(): return "City3RoadTile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
