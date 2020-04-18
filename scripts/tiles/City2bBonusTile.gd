extends Tile
class_name City2bBonusTile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.CITY;
	right = Content.CITY;
	bottom = Content.FIELD;
	left = Content.FIELD;
	
	texture = "city2b_bonus.png"

func get_class(): return "City2bBonusTile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
