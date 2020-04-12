extends Node2D
class_name Board

const BOARD_DIMENTIONS = Vector2(10,10)

var full_h = 1080
var full_item_size = 330
var scale_perc = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	var act_h = get_viewport().size.y
	scale_perc = float(act_h)/full_h
	generate_tiles()

func generate_tiles():
	var item_size = full_item_size*scale_perc
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
