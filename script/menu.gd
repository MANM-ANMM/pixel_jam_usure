extends Node3D

@onready var chargeurNiveau:=$chargeurNiveau

@export var maps : Array[PackedScene]
@onready var canvasMenu := $CanvasMenu
@onready var canvasUI := $CanvasUI

func _ready():
	changeCanvas(false)

func changeCanvas(ui:bool):
	canvasMenu.visible = not ui
	canvasUI.visible = true



func terminer():
	changeCanvas(false)


func _on_chargeur_niveau_niveau_termine():
	print($CanvasUI/Time.stop())
	print($CanvasUI/Time.text)
	terminer()

func start_niveau(i):
	chargeurNiveau.map = maps[i]
	chargeurNiveau.start()
	changeCanvas(true)
	$CanvasUI/Time.start()

func _on_montagne_pressed():
	start_niveau(1)

func _on_foret_pressed():
	start_niveau(2)

func _on_desert_pressed():
	start_niveau(0)
