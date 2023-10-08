extends Node3D

signal niveau_termine

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
	v.rotation.y = m.spawn_voiture.rotation.y
	var c:= camera.instantiate()
	add_child(c)
	c.global_position = m.spawn_camera.global_position
	c.voit = v
	c.distance_voit = c.distance_2d(m.spawn_camera.global_position, v.global_position)
	
	var r:=roulot.instantiate()
	m.path_roulot.add_child(r)
	r.connect("touche", fin_niveau)
	r.progress_ratio = m.starting_roulot
	
	m.gestionnaire_checkpoint.connect("fin_tour", fin_niveau)


func fin_niveau():
	clean()
	emit_signal("niveau_termine")

func clean():
	for c in get_children():
		c.queue_free()
