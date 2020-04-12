extends TileMap
class_name Board

const BOARD_DIMENTIONS = Vector2(30,30)

var full_item_size = 330
var scale_perc = 1
var item_size = full_item_size

var grid = []

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

func generate_tiles():
	# TODO: generate game tiles, randomly save them in a stack to get them one by one
	
	# place initial tile at the center of the board
	var initial_tile = load('res://scenes/tiles/InitialTile.tscn').instance()
	initial_tile.set_scale(Vector2(scale_perc,scale_perc))
	add_child(initial_tile)
	initial_tile.setPos(((BOARD_DIMENTIONS.x/2)-1)*item_size,((BOARD_DIMENTIONS.y/2)-1)*item_size)
	
func place_tile(tile, x, y):
	# 1. validate position is empty and within limits
	print(is_vacant(x,y))
	#if(is_vacant(x,y)):
	# 2. add tile to the grid
	grid[x][y] = "tile"
	# 3. show tile on board
	show_tile(tile, x, y)
	
func show_tile(tile, x, y):
	tile.set_scale(Vector2(scale_perc,scale_perc))
	add_child(tile)
	tile.setPos(x*item_size,y*item_size)
	
func is_vacant(x,y):
	return grid[x][y] != null
	
func _input(event):
	# Mouse in viewport coordinates
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		# translate position to board
		var new_pos = world_to_map((event.position))
		var new_tile = load('res://scenes/tiles/InitialTile.tscn').instance()
		place_tile(new_tile, new_pos.x, new_pos.y)
		# place a tile at computed position 

# Should decide if a tile can be placed at pos (x,y)

# Should decide if a character can be placed at til

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
