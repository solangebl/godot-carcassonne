extends Tile
class_name City4BonusTile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.CITY;
	right = Content.CITY;
	bottom = Content.CITY;
	left = Content.CITY;
	
	texture = "city4_bonus.png"

func get_class(): return "City4BonusTile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
