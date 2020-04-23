extends Node
class_name Player

var score = 0
var color
var player_name
var meeples = 7

var hud

func _init(name):
	player_name = name
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func player_name():
	return player_name
	
func add_points(points):
	score = score + points
	
func get_score():
	return score
	
func set_color(c):
	color = c

func get_color():
	return color
	
func use_meeple():
	meeples = meeples-1
	
func recover_meeples(amount):
	meeples = meeples+amount

func meeples_left():
	return meeples
	
func add_hud(h):
	hud = h
	
func get_hud():
	return hud
