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
	
	var Board = load("res://scripts/Board.gd")
	var board = Board.new()
	
	# Start the first turn
	emit_signal("end_turn")

func _on_Game_end_turn():
	current_tile = stack.pull_next_tile()
	print("Next turn...")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
