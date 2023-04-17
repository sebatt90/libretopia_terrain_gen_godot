extends Node3D
class_name Tile

var gfx : Node3D
var seed: int

func _init(x: int, y: int, seed: int, gfx: PackedScene):
	self.set_position(Vector3(x,0,y))
	self.gfx = gfx.instantiate()
	self.seed = seed
	self.add_child(self.gfx)
