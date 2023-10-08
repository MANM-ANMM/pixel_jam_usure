extends Node3D

@onready var chargeurNiveau:=$chargeurNiveau

@export var maps : Array[PackedScene]

func _on_desert_pressed():
	chargeurNiveau.map = maps[0]
	chargeurNiveau.start()
	$CanvasLayer.visible = false
