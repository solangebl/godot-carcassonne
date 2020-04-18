extends Tile
class_name City2aBonusTile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.FIELD;
	right = Content.CITY;
	bottom = Content.FIELD;
	left = Content.CITY;
	has_bonus = true
	
	texture = "city2a_bonus.png"

func get_class(): return "City2aBonusTile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
