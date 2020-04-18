extends Tile
class_name City3BonusTile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.CITY;
	right = Content.CITY;
	bottom = Content.FIELD;
	left = Content.CITY;
	
	texture = "city3b_bonus.png"

func get_class(): return "City3BonusTile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
