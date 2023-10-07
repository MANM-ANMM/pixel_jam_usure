extends RigidBody3D

var deviation := 0.0 # sur la direction de base
var vitesse := 100.0


func _integrate_forces(state):
	var rot = Input.get_axis("tourner_gauche", "tourner_droite")
	
	if Input.is_action_pressed("avancer"):
		state.apply_force(Vector3(20, 0,0).rotated(Vector3.UP, rotation.y))
	
	
	if vitesse > 1:
		state.apply_torque(Vector3(0, rot+deviation, 0))
	
	
	vitesse = clampf(vitesse, 0.0, 200)
