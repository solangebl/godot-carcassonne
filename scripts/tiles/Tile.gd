extends Node2D
class_name Tile

const CHURCH = 'Church'

# Possible tile contents
enum Content {FIELD=0, CITY=1, PATH=2}

# Tiles have top, right, bottom and left placeholders
# by default a tile is an empty field - each type will specify the contents
var top
var right
var bottom
var left

var texture
var tile_rotation = 0

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
	
func get_texture_name():
	return texture
	
func get_texture():
	var text_object = load("res://assets/tiles/"+get_texture_name())
	return text_object
	
func get_tile_rotation():
	return tile_rotation
	
func rotate_clockwise():
	var old_top = top
	top = left
	left = bottom
	bottom = right
	right = old_top
	tile_rotation = (get_tile_rotation()+1) % 4
	
func place_meeple(position, player):
	if(position.get("name")==CHURCH):
		add_abbot(player)
	
func add_abbot(player):
	if(self.is_church()):
		self.abbot = player
		
func remove_abbot():
	self.abbot = null
		
func is_church():
	return false
	
func get_abbot():
	if self.is_church():
		return self.abbot
	

