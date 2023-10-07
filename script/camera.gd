extends Camera3D

@onready var voit :VehicleBody3D= get_parent()

var cible_x:= 0
var smooth_x:=10.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cible_x = (-voit.angular_velocity.y-voit.steering)*5
	position.x = move_toward(position.x, cible_x, smooth_x*delta)
	position.y = 30-voit.linear_velocity.length()*0.2
	look_at(voit.position)
