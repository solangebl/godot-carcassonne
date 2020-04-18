extends Tile
class_name City2aTile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.FIELD;
	right = Content.CITY;
	bottom = Content.FIELD;
	left = Content.CITY;
	
	texture = "city2a.png"

func get_class(): return "City2aTile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
