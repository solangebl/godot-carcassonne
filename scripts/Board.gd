extends Node2D
class_name Board

const BOARD_DIMENTIONS = Vector2(10,10)

# TODO: calculate scale_perc based on screen size?
var scale_perc = 0.5
var item_size = 330*scale_perc

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	generate_tiles()

func generate_tiles():
	# TODO: generate game tiles, randomly save them in a stack to get them one by one
	# TEST
	for x in range(BOARD_DIMENTIONS.x):
		for y in range(BOARD_DIMENTIONS.y):
			var new_tile = load('res://scenes/tiles/ChurchTile.tscn').instance()
			new_tile.set_scale(Vector2(scale_perc,scale_perc))
			add_child(new_tile)
			new_tile.setPos(x*item_size,y*item_size)

# Should decide if a tile can be placed at pos (x,y)

# Should decide if a character can be placed at til

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
