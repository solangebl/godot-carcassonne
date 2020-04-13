extends Node
class_name Players

var players = []
var current_player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add(player):
	players.append(player)

func next_player():
	var next_player = players.pop_front()
	players.push_back(next_player)
	current_player = next_player
	
	return next_player
	
func current_player():
	return current_player
