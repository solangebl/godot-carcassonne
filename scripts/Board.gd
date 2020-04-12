extends Node2D
class_name Board

const BOARD_DIMENTIONS = Vector2(30,30)

var full_item_size = 330
var scale_perc = 1
var item_size = full_item_size

# Called when the node enters the scene tree for the first time.
func _ready():
	var act_h = get_viewport().size.y
	print(act_h)
	item_size = float(act_h)/BOARD_DIMENTIONS.y
	print(item_size)
	scale_perc = (item_size)/full_item_size
	print(scale_perc)
	generate_tiles()

func generate_tiles():
	# TODO: generate game tiles, randomly save them in a stack to get them one by one
	
	# place initial tile at the center of the board
	var initial_tile = load('res://scenes/tiles/InitialTile.tscn').instance()
	initial_tile.set_scale(Vector2(scale_perc,scale_perc))
	add_child(initial_tile)
	initial_tile.setPos((BOARD_DIMENTIONS.x/2)*item_size,(BOARD_DIMENTIONS.y/2)*item_size)
	
func place_tile(x,y):
	pass

# Should decide if a tile can be placed at pos (x,y)

# Should decide if a character can be placed at til

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
