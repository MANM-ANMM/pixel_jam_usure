extends Node3D

@export var map:PackedScene
@export var voiture:PackedScene
@export var roulot:PackedScene
@export var camera:PackedScene

func start():
	var m :Map= map.instantiate()
	add_child(m)
	var v:=voiture.instantiate()
	add_child(v)
	v.position = m.spawn_voiture.global_position
	var c:= camera.instantiate()
	add_child(c)
	c.position = m.spawn_camera.global_position
	c.voit = v
	c.distance_voit = c.distance_2d(m.spawn_camera.global_position, v.global_position)
	m.path_roulot.add_child(roulot.instantiate())
	


func clean():
	for c in get_children():
		c.remove_child(c)
