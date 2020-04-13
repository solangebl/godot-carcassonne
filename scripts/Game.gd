extends Node2D
class_name Game

var stack
var hud_current_tile
var current_tile

signal end_turn

# Called when the node enters the scene tree for the first time.
func _ready():
	
	connect("end_turn", self, "_on_Game_end_turn")
	
	var TileStack = load("res://scripts/TileStack.gd")
	stack = TileStack.new()
	
	var initial_tile = load('res://scenes/tiles/InitialTile.tscn').instance()
	$Board.place_tile_center(initial_tile)
	
	# Start the first turn
	emit_signal("end_turn")
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		print($Camera2D.zoom)
		print($Camera2D.offset)
		var new_tile = load('res://scenes/tiles/InitialTile.tscn').instance()
		var pos = event.position * $Camera2D.zoom + $Camera2D.offset
		$Board.place_tile(new_tile, event.position)
		emit_signal("end_turn")

func _on_Game_end_turn():
	current_tile = stack.pull_next_tile()
	
	var next_tile = load('res://scenes/tiles/'+current_tile.get_class()+'.tscn').instance()
	for i in $HUD/CurrentTile.get_children():
		i.queue_free()
	$HUD/CurrentTile.add_child(next_tile)
	print("Next turn...")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
