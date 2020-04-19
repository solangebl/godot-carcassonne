extends Node
class_name Players

var colors = ['red', 'blue', 'green', 'yellow', 'gray', 'pink']

var players = []
var current_player

# Called when the node enters the scene tree for the first time.
func _init():
	randomize()
	colors.shuffle()

func add(player):
	player.set_color(colors.pop_front())
	players.append(player)

func next_player():
	var next_player = players.pop_front()
	players.push_back(next_player)
	current_player = next_player
	
	return next_player
	
func current_player():
	return current_player
