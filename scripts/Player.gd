extends Node
class_name Player

var score = 0
var player_name

func _init(name):
	player_name = name
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func player_name():
	return player_name
