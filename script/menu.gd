extends Node3D

@onready var chargeurNiveau:=$chargeurNiveau

@export var maps : Array[PackedScene]

func _on_desert_pressed():
	chargeurNiveau.map = maps[0]
	chargeurNiveau.start()
	$CanvasLayer.visible = false


func terminer():
	$CanvasLayer.visible = true


func _on_chargeur_niveau_niveau_termine():
	terminer()
