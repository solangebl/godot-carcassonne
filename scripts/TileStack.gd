extends Node
class_name TileStack

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var stack = []

# Called when the node enters the scene tree for the first time.
func _init():
	
	""" FOR CHURCH TESTS
	"""
	var tiles_amount = {
		'ChurchTile': 40, 
		#'ChurchRoadTile': 10
	}
	"""
	
	var tiles_amount = {'ChurchTile': 4, 
						'ChurchRoadTile': 2,
						'City1Tile': 5,
						'City2aTile': 1,
						'City2aBonusTile': 2,
						'City2bTile': 3,
						'City2bBonusTile': 2,
						'City2cTile': 3,
						'City2dTile': 2,
						'City3Tile': 3,
						'City3BonusTile': 1,
						'City3RoadTile': 1,
						'City3RoadBonusTile': 2,
						'City4BonusTile': 1,
						'Road2City2Tile': 3,
						'Road2City2BonusTile': 2,
						'Road2aTile': 8,
						'Road2aCity1Tile': 3,
						'Road2bTile': 9,
						'Road2bCity1Tile': 3,
						'Road2cCity1Tile': 3,
						'Road3Tile': 4,
						'Road3City1Tile': 3,
						'Road4Tile': 1
	}
	"""
	for key in tiles_amount.keys():
		for i in range(0,tiles_amount[key]):
			var tile = load('res://scripts/tiles/'+key+'.gd').new()
			stack.append(tile)
	
	randomize()
	stack.shuffle()

func pull_next_tile():
	var next_tile = stack.pop_front()
	return next_tile
	
