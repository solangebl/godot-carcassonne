extends Node2D
class_name Tile

# Possible tile contents
enum {FIELD, CITY, PATH}

# Tiles have top, right, bottom and left placeholders
# by default a tile is an empty field - each type will specify the contents
var top = FIELD;
var right = FIELD;
var bottom = FIELD;
var left = FIELD;

var has_bonus = false

var tile_pos = Vector2(10,10)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Change tile position
func setPos(x,y):
	# TODO: validate position
	position = Vector2(x, y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
