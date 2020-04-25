extends Node2D
class_name Game

const CHURCH_POINTS = 9

var stack
var current_tile
var players
var board

enum PlaySteps {PLACE_TILE=0, PLACE_MEEPLE=1}
var play_step

var current_player_used_meeple

# Called when the node enters the scene tree for the first time.
func _ready():

	stack = TileStack.new()
	board = Board.new($Board2D)
	
	players = Players
	
	for p in players.get_players():
		var player_hud = load('res://scenes/PlayerHUD.tscn').instance()
		var meeple = load('res://assets/meeple_'+p.get_color()+'.png')
		player_hud.get_node("Name").text = p.player_name()
		player_hud.get_node("Meeple").set_texture(meeple)
		p.add_hud(player_hud)
		$HUD/Players.add_child(player_hud)	
		
	players.next_player()
	
	board.place_initial_tile()
	
	play_step = PlaySteps.PLACE_TILE
	current_player_used_meeple = false
	
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
				$HUD/ConfirmButton.visible = true
			else:
				print('DEBUG: edges do not match')
		elif play_step == PlaySteps.PLACE_MEEPLE:
			pass

func pick_tile():
	# restore original rotation
	if is_instance_valid(current_tile):
		$HUD/CurrentTile.rotate(deg2rad(-1*current_tile.get_tile_rotation()*90))
	current_tile = stack.pull_next_tile()
	var current_tile_texture = current_tile.get_texture()
	$HUD/CurrentTile.set_texture(current_tile_texture)
		
func valid_position(tile, pos):
	return board.has_neighbor(pos) and board.matching_edges(tile, pos)
	
func rotate_current_tile():
	current_tile.rotate_clockwise()
	$HUD/CurrentTile.rotate(deg2rad(90))

func cancel_action():
	if play_step == PlaySteps.PLACE_MEEPLE:
		if current_player_used_meeple:
			players.current_player().recover_meeples(1)
		board.remove_last_tile()
		$HUD/RotateButton.visible = true
		$HUD/ConfirmButton.visible = true
		$HUD/CancelButton.visible = false
		play_step = PlaySteps.PLACE_TILE

func confirm_action():
	if play_step == PlaySteps.PLACE_TILE:
		board.place_tile()
		if players.current_player().meeples_left() > 0:
			board.show_meeple_options(players.current_player().get_color())
			play_step = PlaySteps.PLACE_MEEPLE
			$HUD/RotateButton.visible = false
			$HUD/ConfirmButton.visible = true
			$HUD/CancelButton.visible = true
		else:
			end_turn()
	elif play_step == PlaySteps.PLACE_MEEPLE:
		end_turn()
		
func place_meeple(position):
	board.place_meeple(position, players.current_player())
	players.current_player().use_meeple()
	current_player_used_meeple = true
	
func assign_points():
	assign_church_points()
	
func assign_church_points():
	var users = board.calculate_church_points()
	
	for user in users:
		user.add_points(CHURCH_POINTS)


func end_turn():
	# add points if any - to the corresponding players
	assign_points()
	var current_player = players.current_player()
	current_player.get_hud().get_node("Score").text = str(current_player.get_score())
	current_player.get_hud().get_node("Meeples").text = str(current_player.meeples_left())
	# move to next player
	players.next_player()
	$HUD/ConfirmButton.visible = false
	$HUD/CancelButton.visible = false
	$HUD/RotateButton.visible = true
	play_step = PlaySteps.PLACE_TILE
	current_player_used_meeple = false
	pick_tile()
