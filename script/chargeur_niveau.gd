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
	v.position = m.spawn_voiture.position
	var c:= camera.instantiate()
	c.position = m.spawn_camera.position
	c.voit = v
	add_child(c)
	m.path_roulot.add_child(roulot.instantiate())
	


func clean():
	for c in get_children():
		c.remove_child(c)
