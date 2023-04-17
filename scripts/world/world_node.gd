extends Node3D

@export var size_x : int
@export var size_y : int
@export var offset : int
@export var seed : int

@export var ground_tile : PackedScene
@export var water_tile : PackedScene

var noise

func _ready():
	noise = FastNoiseLite.new()
	noise.set_seed(seed)
	noise.set_noise_type(FastNoiseLite.TYPE_PERLIN)
	
	generate()
	pass

func generate():
	var pos_x = 0
	var pos_y = 0
	
	for x in size_x:
		pos_x+=1
		pos_y=0
		for y in size_y:
			var type = round(abs(noise.get_noise_2d(x,y))*100)
			var tile_inst = TileGround.new(pos_x, pos_y, type, ground_tile) if type >= 5 else TileWater.new(pos_x, pos_y, type, water_tile)
			self.add_child(tile_inst)
			
			pos_y+=1
			
			pass
