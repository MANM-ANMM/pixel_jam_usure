extends VehicleWheel3D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if get_skidinfo()<0.1:
	#	wheel_friction_slip = clampf(wheel_friction_slip-delta*0.1, 1, 100)
	print(get_rpm())
