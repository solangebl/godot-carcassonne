extends TileMap

const FULL_ITEM_SIZE = 330

var scale_perc = 1
var item_size = FULL_ITEM_SIZE

var board_dimentions = Vector2(30,30)

# Called when the node enters the scene tree for the first time.
func _ready():
	# calculate grid item sizes based on viewport size
	item_size = _calculate_item_size()
	_set_dimentions()
	
	set_cell_size(Vector2(item_size, item_size))
	
	scale_perc = (item_size)/FULL_ITEM_SIZE
	print(item_size)
	print(scale_perc)
	print(get_viewport().size)
	
func get_board_dimentions():
	return board_dimentions

func get_center_coordinates():
	return Vector2((((get_board_dimentions().x/2)-1)*item_size), ((get_board_dimentions().y/2)-1)*item_size)
	
func place_initial_tile( initial_tile):
	var center = get_center_coordinates()
	var p_center = world_to_map(center)
	show_tile_on_board(initial_tile, p_center)
	
func show_tile_on_board(tile, b_pos: Vector2):
	tile.set_scale(Vector2(scale_perc,scale_perc))
	add_child(tile)
	tile.setPos(b_pos.x*item_size+(item_size/2),b_pos.y*item_size+(item_size/2))
	
func remove_tile(tile):
	remove_child(tile)
	
func show_meeple_options(options, color, tile):
	for n in options:
		var m = load('res://scenes/Meeple.tscn').instance()
		m.get_node('Button').set_normal_texture(load("res://assets/meeple_"+color+".png"))
		m.set_rotation(deg2rad(-1*tile.get_tile_rotation()*90))
		m.modulate = Color(1,1,1,0.5)
		n.add_child(m)

func hide_meeple_options(tile):
	for p in tile.get_children():
		if p is Position2D:
			for c in p.get_children():
				p.remove_child(c)
				p.queue_free()

func remove_meeple(tile, feature):
	for f in tile.get_children():
		if f is Position2D and f.get_name() == feature:
			for c in f.get_children():
				f.remove_child(c)
				f.queue_free()
					
func place_meeple(position, tile):
	for p in tile.get_children():
		if p is Position2D:
			if p != position:
				for c in p.get_children():
					p.remove_child(c)
					p.queue_free()
			else:
				for c in p.get_children():
					c.modulate = Color(1,1,1,1)

# Calculates item size based on viewport height and board y dimention
func _calculate_item_size():
	var act_h = ProjectSettings.get_setting("display/window/size/height")
	return float(act_h)/get_board_dimentions().y
	
func _set_dimentions():
	var act_w = ProjectSettings.get_setting("display/window/size/width")
	var w_items = act_w/item_size
	board_dimentions.x = w_items
		

