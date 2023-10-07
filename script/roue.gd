extends VehicleWheel3D

var distance_parcourue := 0.0 # en tour
@onready var base_friction := wheel_friction_slip * 0.6

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	distance_parcourue += delta * get_rpm() / 60.0
	
	print(distance_parcourue)
	
