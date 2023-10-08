extends PathFollow3D

signal touche()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress += delta


func _on_roulot_body_entered(body):
	print("touche")
	emit_signal("touche")
