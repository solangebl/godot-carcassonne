extends Node2D
class_name Game

var stack
var current_tile
var players

# Called when the node enters the scene tree for the first time.
func _ready():

	stack = TileStack.new()
	
	players = Players.new()
	
	var player1 = Player.new("Pato")
	var player2 = Player.new("Soli")
	
	players.add(player1)
	players.add(player2)
	
	var initial_tile = load('res://scenes/tiles/InitialTile.tscn').instance()
	$Board.place_tile_center(initial_tile)
	
	# Start the first turn
	pick_tile()
	
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		var current_pos = $Camera2D.get_global_mouse_position()
		if(valid_position(current_tile, current_pos)):
			var new_tile = load('res://scenes/tiles/'+current_tile.get_class()+'.tscn').instance()
			new_tile.rotate(deg2rad(current_tile.get_tile_rotation()*90))
			for i in range(0,current_tile.get_tile_rotation()):
				new_tile.rotate_clockwise()
			var placed = $Board.place_tile(new_tile, current_pos)
			if(placed):
				end_turn()
		else:
			print('DEBUG: edges do not match')

func pick_tile():
	# restore original rotation
	if is_instance_valid(current_tile):
		$HUD/CurrentTile.rotate(deg2rad(-1*current_tile.get_tile_rotation()*90))
	current_tile = stack.pull_next_tile()
	var current_tile_texture = current_tile.get_texture()
	$HUD/CurrentTile.set_texture(current_tile_texture)
	
func end_turn():
	players.next_player()
	pick_tile()
	
func valid_position(tile, pos):
	return $Board.has_neighbor(pos) and  $Board.matching_edges(tile, pos)
	
func rotate_current_tile():
	current_tile.rotate_clockwise()
	print(current_tile.get_tile_rotation())
	$HUD/CurrentTile.rotate(deg2rad(90))
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
