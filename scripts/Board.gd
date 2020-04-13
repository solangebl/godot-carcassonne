extends TileMap
class_name Board


const FULL_ITEM_SIZE = 330

# Default dimentions - x will be calculated based on viewport and item size
var board_dimentions = Vector2(30,30)

var scale_perc = 1
var item_size = FULL_ITEM_SIZE

var grid = []

# Called when the node enters the scene tree for the first time.
func _ready():
	# calculate grid item sizes based on viewport size
	item_size = _calculate_item_size()
	_set_dimentions()
	
	set_cell_size(Vector2(item_size, item_size))
	scale_perc = (item_size)/FULL_ITEM_SIZE
	
	# initialize the empty grid
	for x in range(board_dimentions.x):
		grid.append([])
		for y in range(board_dimentions.y):
			grid[x].append(null)

func place_tile_center(tile):
	var center = Vector2((((board_dimentions.x/2)-1)*item_size), ((board_dimentions.y/2)-1)*item_size)
	place_tile(tile, center)
	
func place_tile(tile, pos: Vector2):
	# 1. validate position is empty and within limits
	var p = world_to_map(pos) 
	if(is_valid(p) and is_vacant(p)):
		# 2. add tile to the grid
		grid[p.x][p.y] = tile
		# 3. show tile on board
		show_tile(tile, p)
		return true
	return false
	
func show_tile(tile, pos: Vector2):
	tile.set_scale(Vector2(scale_perc,scale_perc))
	add_child(tile)
	tile.setPos(pos.x*item_size,pos.y*item_size)
	
func is_vacant(pos):
	return grid[pos.x][pos.y] == null

func is_valid(pos):
	return (pos.x >= 0 and pos.x <= board_dimentions.x-1) and (pos.y >= 0 and pos.y <= board_dimentions.y-1)

# Calculates item size based on viewport height and board y dimention
func _calculate_item_size():
	var act_h = get_viewport().size.y
	return float(act_h)/board_dimentions.y
	
func _set_dimentions():
	var act_w = get_viewport().size.x
	var w_items = act_w/item_size
	board_dimentions.x = w_items

# Should decide if a character can be placed at til
