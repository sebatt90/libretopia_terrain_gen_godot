extends Tile
class_name TileGround

var tile_res : Node3D

var res_root : String
var res : Array

func _init(x: int, y: int, seed: int, gfx: PackedScene):
	super(x,y,seed,gfx)
	
	res_root = "res://actors/elements/"
	res = [
		"tree",
		"mountain"
	]

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var i = rng.randi_range(-(len(res)+5), len(res)-1)
	
	if(i<0):
		return
	
	tile_res = load(res_root+res[i]+".tscn").instantiate()
	tile_res.set_position(Vector3(0,0.5,0))
	self.add_child(tile_res)
