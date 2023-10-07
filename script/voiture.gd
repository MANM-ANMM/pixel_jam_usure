extends VehicleBody3D

var deviation := 0.0 # sur la direction de base

const STEER_SPEED = 0.05
const STEER_LIMIT = PI/16

@export var engine_force_value = 40
@export var max_engine_force = 1000

@export var max_brake := 20
@onready var actual_max_brake := max_brake
@onready var min_brake := max_brake /8
@export var brake_accel:=10

var steer_target = 0


func _physics_process(delta):

	steer_target = Input.get_action_strength("tourner_gauche") - Input.get_action_strength("tourner_droite")
	steer_target *= STEER_LIMIT

	var speed = linear_velocity.length()
	if Input.is_action_pressed("avancer"):
		# Increase engine force at low speeds to make the initial acceleration faster.
		if speed < 5 and speed != 0:
			engine_force = clamp(engine_force_value * 5 / speed, 0, max_engine_force)
		else:
			engine_force = engine_force_value
	else:
		engine_force = 0

	if Input.is_action_pressed("freiner"):
		var dir = (linear_velocity.dot(Vector3.FORWARD.rotated(Vector3.UP, rotation.y)))
		if dir < -0.01:
			brake = move_toward(brake, actual_max_brake, delta*brake_accel)
			actual_max_brake -= speed*speed*delta*0.001
			actual_max_brake = clampf(actual_max_brake, min_brake, max_brake)
		else:
			if speed < 5 and speed != 0:
				engine_force = -clamp(engine_force_value * 5 / speed, 0, max_engine_force)
			else:
				engine_force = -engine_force_value
	else:
		brake = 0.0
	
	
	steering = move_toward(steering, steer_target, STEER_SPEED * delta)

func _integrate_forces(state):
	if Input.is_action_just_pressed("klaxoner"):
		state.apply_torque_impulse(Vector3(0,0, sign(steering)*1000))
