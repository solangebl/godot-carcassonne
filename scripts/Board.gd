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
	var within_board = (pos.x >= 0 and pos.x <= board_dimentions.x-1) and (pos.y >= 0 and pos.y <= board_dimentions.y-1)
	return within_board

# Calculates item size based on viewport height and board y dimention
func _calculate_item_size():
	var act_h = get_viewport().size.y
	return float(act_h)/board_dimentions.y
	
func _set_dimentions():
	var act_w = get_viewport().size.x
	var w_items = act_w/item_size
	board_dimentions.x = w_items
	
func matching_edges(tile, pos):
	# get position in board
	var p = world_to_map(pos)
	if(!is_valid(p)):
		return false
	# compare each edge to current board tiles
	var t_matches = matching_bottom_top(tile, p)
	var r_matches = matching_left_right(tile, p)
	var b_matches = matching_top_bottom(tile, p)
	var l_matches = matching_right_left(tile, p)
	return t_matches and r_matches and b_matches and l_matches

# Checks if existing bottom matches potential top
func matching_bottom_top(tile, board_pos):
	var pos_up = Vector2(board_pos.x,board_pos.y-1) 
	if(is_valid(pos_up) and !is_vacant(pos_up)):
		print('existing bottom: '+str(grid[pos_up.x][pos_up.y].get('bottom')))
		print('new top: '+str(tile.get('top')))
		return grid[pos_up.x][pos_up.y].get('bottom') == tile.get('top')
	return true
	
# Checks if existing left matches potential right
func matching_left_right(tile, board_pos):
	var e_right = Vector2(board_pos.x+1,board_pos.y) 
	if(is_valid(e_right) and !is_vacant(e_right)):
		print('existing left: '+str(grid[e_right.x][e_right.y].get('left')))
		print('new right: '+str(tile.get('right')))
		return grid[e_right.x][e_right.y].get('left') == tile.get('right')
	return true
	
# Checks if existing top matches potential bottom
func matching_top_bottom(tile, board_pos):
	var e_bottom = Vector2(board_pos.x,board_pos.y+1) 
	if(is_valid(e_bottom) and !is_vacant(e_bottom)):
		print('existing top: '+str(grid[e_bottom.x][e_bottom.y].get('top')))
		print('new bottom: '+str(tile.get('bottom')))
		return grid[e_bottom.x][e_bottom.y].get('top') == tile.get('bottom')
	return true

# Checks if existing right matches potential left
func matching_right_left(tile, board_pos):
	var e_left = Vector2(board_pos.x-1,board_pos.y) 
	if(is_valid(e_left) and !is_vacant(e_left)):
		print('existing right: '+str(grid[e_left.x][e_left.y].get('right')))
		print('new left: '+str(tile.get('left')))
		return grid[e_left.x][e_left.y].get('right') == tile.get('left')
	return true
