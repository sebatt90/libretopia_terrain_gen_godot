extends Camera3D

@export var speed = 10

var x_mov = 0
var z_mov = 0


func _process(delta):
	z_mov = Input.get_axis("move_up","move_down")
	x_mov = Input.get_axis("move_left","move_right")
	
	self.position += Vector3(x_mov,0,z_mov).normalized()*speed*delta
