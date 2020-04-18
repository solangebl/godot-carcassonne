extends Tile
class_name Road2City2BonusTile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.CITY;
	right = Content.CITY;
	bottom = Content.PATH;
	left = Content.PATH;
	
	texture = "road2_city2_bonus.png"

func get_class(): return "Road2City2BonusTile"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
