extends Camera3D

@export var voit :VehicleBody3D

var angle_cam := 0
var smooth_x:=100.0

@onready var distance_voit:=distance_2d(voit.position,position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y = 30-voit.linear_velocity.length()*0.2
	
	angle_cam = move_toward(angle_cam, voit.angular_velocity.y, delta*smooth_x)
	
	var dir := Vector3.FORWARD.rotated(Vector3.UP, voit.rotation.y+angle_cam)*distance_voit
	position.x = voit.position.x + dir.x
	position.z = voit.position.z + dir.z
	
	look_at(voit.position)

func distance_2d(a:Vector3, b:Vector3)-> float:
	return Vector2(a.x, a.z).distance_to(Vector2(b.x,b.z))
