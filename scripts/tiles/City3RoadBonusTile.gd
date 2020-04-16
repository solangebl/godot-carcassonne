extends Tile
class_name City3RoadBonusTile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.CITY;
	right = Content.CITY;
	bottom = Content.FIELD;
	left = Content.CITY;

func get_class(): return "City3RoadBonusTile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
