extends Tile
class_name InitialTile

# Called when the node enters the scene tree for the first time.
func _init():
	top = Content.CITY;
	right = Content.PATH;
	bottom = Content.FIELD;
	left = Content.PATH


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
