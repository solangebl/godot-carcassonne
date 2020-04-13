extends Node2D
class_name Game

var stack
var hud_current_tile
var current_tile

# Called when the node enters the scene tree for the first time.
func _ready():
	
	connect("end_turn", self, "_on_Game_end_turn")
	
	var TileStack = load("res://scripts/TileStack.gd")
	stack = TileStack.new()
	
	var initial_tile = load('res://scenes/tiles/InitialTile.tscn').instance()
	$Board.place_tile_center(initial_tile)
	
	# Start the first turn
	end_turn()
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		var new_tile = load('res://scenes/tiles/'+current_tile.get_class()+'.tscn').instance()
		var placed = $Board.place_tile(new_tile, $Camera2D.get_global_mouse_position())
		if(placed):
			end_turn()

func end_turn():
	current_tile = stack.pull_next_tile()
	
	var next_tile = load('res://scenes/tiles/'+current_tile.get_class()+'.tscn').instance()
	for i in $HUD/CurrentTile.get_children():
		i.queue_free()
	$HUD/CurrentTile.add_child(next_tile)
	print("Next turn...")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
