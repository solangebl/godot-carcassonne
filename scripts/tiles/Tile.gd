extends Node2D
class_name Tile

# Possible tile contents
enum Content {FIELD=0, CITY=1, PATH=2}

# Tiles have top, right, bottom and left placeholders
# by default a tile is an empty field - each type will specify the contents
var top
var right
var bottom
var left

var has_bonus = false

# Called when the node enters the scene tree for the first time.
func _init():
	pass

# Change tile position
func setPos(x,y):
	# TODO: validate position
	position = Vector2(x, y)

func getPos():
	print(position)
	
func get_right():
	return self.right

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
