extends Area3D
class_name Checkpoint

func _ready():
	$OmniLight3D.visible = false

func activer():
	$OmniLight3D.visible = true

func desactiver():
	$OmniLight3D.visible = false
