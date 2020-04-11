extends Node2D
class_name Board

const BOARD_DIMENTIONS = Vector2(10,10)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	generate_tiles()

func generate_tiles():
	for x in range(BOARD_DIMENTIONS.x):
		for y in range(BOARD_DIMENTIONS.y):
			var new_tile = load('res://scenes/BoardTile.tscn').instance()
			add_child(new_tile)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
