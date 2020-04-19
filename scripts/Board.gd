extends TileMap
class_name Board

const FULL_ITEM_SIZE = 330

# Default dimentions - x will be calculated based on viewport and item size
var board_dimentions = Vector2(30,30)

var scale_perc = 1
var item_size = FULL_ITEM_SIZE

var grid = []

var temporal_tile
var tmp_tile_x
var tmp_tile_y

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
		for _y in range(board_dimentions.y):
			grid[x].append(null)

func place_initial_tile():
	var center = Vector2((((board_dimentions.x/2)-1)*item_size), ((board_dimentions.y/2)-1)*item_size)
	var initial_tile = load('res://scenes/tiles/InitialTile.tscn').instance()
	var p_center = world_to_map(center)
	grid[p_center.x][p_center.y] = initial_tile
	_show_tile_on_board(initial_tile, p_center)
	
# Wrapper for the _place_tile method
# pos is a world position
func preview_tile(tile, w_pos: Vector2):
	var p = world_to_map(w_pos) 
	if temporal_tile != null:
		remove_child(temporal_tile)
	temporal_tile = tile
	tmp_tile_x = p.x
	tmp_tile_y = p.y
	
	if(_is_valid(p) and _is_vacant(p)):
		# 3. show tile on board
		_show_tile_on_board(tile, p)
		return true
	return false
	
func place_tile():
	grid[tmp_tile_x][tmp_tile_y] = temporal_tile
	temporal_tile = null
	tmp_tile_x = -1
	tmp_tile_y = -1
	
func _show_tile_on_board(tile, b_pos: Vector2):
	tile.set_scale(Vector2(scale_perc,scale_perc))
	add_child(tile)
	tile.setPos(b_pos.x*item_size+(item_size/2),b_pos.y*item_size+(item_size/2))
	
func _is_vacant(b_pos: Vector2):
	return grid[b_pos.x][b_pos.y] == null

func _is_valid(pos: Vector2):
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
	
func has_neighbor(pos: Vector2):
	pos = world_to_map(pos)
	return _has_neighbor(pos)
	
func _has_neighbor(b_pos: Vector2):
	if(!_is_valid(b_pos)):
		return true
	var p_top = Vector2(b_pos.x,b_pos.y-1)
	var p_right = Vector2(b_pos.x+1,b_pos.y)
	var p_bottom = Vector2(b_pos.x,b_pos.y+1)
	var p_left = Vector2(b_pos.x-1,b_pos.y)
	return !_is_vacant(p_top) or !_is_vacant(p_right) or !_is_vacant(p_bottom) or !_is_vacant(p_left)
	
func matching_edges(tile, pos):
	# get position in board
	var p = world_to_map(pos)
	if(!_is_valid(p)):
		return false
	# compare each edge to current board tiles
	var t_matches = _matching_bottom_top(tile, p)
	var r_matches = _matching_left_right(tile, p)
	var b_matches = _matching_top_bottom(tile, p)
	var l_matches = _matching_right_left(tile, p)
	return t_matches and r_matches and b_matches and l_matches

# Checks if existing bottom matches potential top
func _matching_bottom_top(tile, board_pos):
	var pos_up = Vector2(board_pos.x,board_pos.y-1) 
	if(_is_valid(pos_up) and !_is_vacant(pos_up)):
		return grid[pos_up.x][pos_up.y].get('bottom') == tile.get('top')
	return true
	
# Checks if existing left matches potential right
func _matching_left_right(tile, board_pos):
	var e_right = Vector2(board_pos.x+1,board_pos.y) 
	if(_is_valid(e_right) and !_is_vacant(e_right)):
		return grid[e_right.x][e_right.y].get('left') == tile.get('right')
	return true
	
# Checks if existing top matches potential bottom
func _matching_top_bottom(tile, board_pos):
	var e_bottom = Vector2(board_pos.x,board_pos.y+1) 
	if(_is_valid(e_bottom) and !_is_vacant(e_bottom)):
		return grid[e_bottom.x][e_bottom.y].get('top') == tile.get('bottom')
	return true

# Checks if existing right matches potential left
func _matching_right_left(tile, board_pos):
	var e_left = Vector2(board_pos.x-1,board_pos.y) 
	if(_is_valid(e_left) and !_is_vacant(e_left)):
		return grid[e_left.x][e_left.y].get('right') == tile.get('left')
	return true
