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
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		var current_pos = $Camera2D.get_global_mouse_position()
		if(valid_position(current_tile, current_pos)):
			var new_tile = load('res://scenes/tiles/'+current_tile.get_class()+'.tscn').instance()
			var placed = $Board.place_tile(new_tile, current_pos)
			if(placed):
				end_turn()
		else:
			print('DEBUG: edges do not match')

func pick_tile():
	current_tile = stack.pull_next_tile()
	var current_tile_texture = current_tile.get_texture()
	$HUD/VBoxContainer/HBoxContainer/CurrentTile.set_texture(current_tile_texture)
	
func end_turn():
	players.next_player()
	pick_tile()	
	print("Next turn..."+players.current_player().player_name())
	
func valid_position(tile, pos):
	return $Board.matching_edges(tile, pos)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
