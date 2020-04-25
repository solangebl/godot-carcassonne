extends Node

class_name Board

# Default dimentions - x will be calculated based on viewport and item size

var visualboard

var grid = []

var last_tile
var last_tile_x
var last_tile_y

var temporal_tile
var tmp_tile_x
var tmp_tile_y

func _init(board):
	visualboard = board
	temporal_tile = null
	tmp_tile_x = -1
	tmp_tile_y = -1

	# initialize the empty grid
	for x in range(visualboard.get_board_dimentions().x):
		grid.append([])
		for _y in range(visualboard.get_board_dimentions().y):
			grid[x].append(null)
			
func place_initial_tile():
	var p_center = visualboard.get_center_coordinates()
	var b_center = visualboard.world_to_map(p_center)
	var initial_tile = load('res://scenes/tiles/InitialTile.tscn').instance()
	grid[b_center.x][b_center.y] = initial_tile
	
	visualboard.place_initial_tile(initial_tile)
	
# Wrapper for the _place_tile method
# pos is a world position
func preview_tile(tile, w_pos: Vector2):
	var b_pos = visualboard.world_to_map(w_pos)
	if temporal_tile != null:
		visualboard.remove_tile(temporal_tile)
	temporal_tile = tile
	tmp_tile_x = b_pos.x
	tmp_tile_y = b_pos.y
	
	if(_is_valid(b_pos) and _is_vacant(b_pos)):
		# 3. show tile on board
		visualboard.show_tile_on_board(tile, b_pos)
		return true
	return false
	
func place_tile():
	grid[tmp_tile_x][tmp_tile_y] = temporal_tile
	last_tile = temporal_tile
	last_tile_x = tmp_tile_x
	last_tile_y = tmp_tile_y
	
	temporal_tile = null
	tmp_tile_x = -1
	tmp_tile_y = -1
	
func remove_last_tile():
	grid[last_tile_x][last_tile_y] = null
	
	last_tile_x = -1
	last_tile_y = -1
	visualboard.remove_tile(last_tile)
	last_tile = null
	
func show_meeple_options(color):
	visualboard.show_meeple_options(color, last_tile)
	
func place_meeple(position):
	visualboard.place_meeple(position, last_tile)
	
func _is_vacant(b_pos: Vector2):
	return grid[b_pos.x][b_pos.y] == null

func _is_valid(pos: Vector2):
	var within_board = (pos.x >= 0 and pos.x <= visualboard.get_board_dimentions().x-1) and (pos.y >= 0 and pos.y <= visualboard.get_board_dimentions().y-1)
	return within_board
		
func has_neighbor(pos: Vector2):
	var b_pos = visualboard.world_to_map(pos)
	if(!_is_valid(b_pos)):
		return true
	var p_top = Vector2(b_pos.x,b_pos.y-1)
	var p_right = Vector2(b_pos.x+1,b_pos.y)
	var p_bottom = Vector2(b_pos.x,b_pos.y+1)
	var p_left = Vector2(b_pos.x-1,b_pos.y)
	return !_is_vacant(p_top) or !_is_vacant(p_right) or !_is_vacant(p_bottom) or !_is_vacant(p_left)
	
func matching_edges(tile, pos):
	# get position in board
	var p = visualboard.world_to_map(pos)
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
	
func calculate_road_points():
	return 0

func calculate_church_points():
	return 0
	
func calculate_city_points():
	return 0
