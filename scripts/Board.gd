extends TileMap
class_name Board

const BOARD_DIMENTIONS = Vector2(30,30)

var full_item_size = 330
var scale_perc = 1
var item_size = full_item_size

var grid = []

signal end_turn

# Called when the node enters the scene tree for the first time.
func _ready():
	# calculate grid item sizes
	var act_h = get_viewport().size.y
	item_size = float(act_h)/BOARD_DIMENTIONS.y
	scale_perc = (item_size)/full_item_size
	
	# initialize the empty grid
	for x in range(BOARD_DIMENTIONS.x):
		grid.append([])
		for y in range(BOARD_DIMENTIONS.y):
			grid[x].append(null)
	# TODO: move to game generate_tiles()

func place_tile_center(tile):
	var center = Vector2((((BOARD_DIMENTIONS.x/2)-1)*item_size), ((BOARD_DIMENTIONS.y/2)-1)*item_size)
	print(center)
	place_tile(tile, center)
	
func place_tile(tile, pos: Vector2):
	# 1. validate position is empty and within limits
	var p = world_to_map(pos)
	print(is_vacant(p))
	#if(is_vacant(x,y)):
	# 2. add tile to the grid
	grid[p.x][p.y] = "tile"
	# 3. show tile on board
	show_tile(tile, p)
	emit_signal("end_turn")
	
func show_tile(tile, pos: Vector2):
	tile.set_scale(Vector2(scale_perc,scale_perc))
	add_child(tile)
	tile.setPos(pos.x*item_size,pos.y*item_size)
	
func is_vacant(pos):
	return grid[pos.x][pos.y] != null


# Should decide if a tile can be placed at pos (x,y)

# Should decide if a character can be placed at til

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
