extends Node2D
class_name Game

var stack
var hud
var current_tile


# Called when the node enters the scene tree for the first time.
func _ready():
	
	var TileStack = load("res://scripts/TileStack.gd")
	stack = TileStack.new()
	current_tile = stack.pull_next_tile()
	
	hud = get_node("HUD")
	var tile_scene = load("res://scenes/tiles/"+current_tile.get_class()+".tscn")
	hud.add_child(tile_scene.instance())
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
