extends Node2D
class_name Game

var stack
var current_tile
var players
var board

enum PlaySteps {PLACE_TILE=0, PLACE_MEEPLE=1}
var play_step

# Called when the node enters the scene tree for the first time.
func _ready():

	stack = TileStack.new()
	board = Board.new($Board2D)
	
	players = Players.new()
	
	var player1 = Player.new("Pato")
	var player2 = Player.new("Soli")
	
	players.add(player1)
	players.add(player2)
	
	board.place_initial_tile()
	
	play_step = PlaySteps.PLACE_TILE
	
	# Start the first turn
	pick_tile()
	
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		var current_pos = $Camera2D.get_global_mouse_position()
		
		if play_step == PlaySteps.PLACE_TILE:
			if(valid_position(current_tile, current_pos)):
				var new_tile = load('res://scenes/tiles/'+current_tile.get_class()+'.tscn').instance()
				new_tile.rotate(deg2rad(current_tile.get_tile_rotation()*90))
				for i in range(0,current_tile.get_tile_rotation()):
					new_tile.rotate_clockwise()
				board.preview_tile(new_tile, current_pos)
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
	return board.has_neighbor(pos) and board.matching_edges(tile, pos)
	
func rotate_current_tile():
	current_tile.rotate_clockwise()
	$HUD/CurrentTile.rotate(deg2rad(90))
	
func confirm_action():
	if play_step == PlaySteps.PLACE_TILE:
		board.place_tile()
		#play_step = PlaySteps.PLACE_MEEPLE
		end_turn()
	
