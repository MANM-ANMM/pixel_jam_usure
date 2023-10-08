extends Node3D

var numero_checkpoint:=0
var check_actif:Checkpoint=null
var nombre_tours:=0


func _ready():
	check_actif = get_child(numero_checkpoint)
	active_checkpoint()

func next_checkpoint(body):
	desactive_checkpoint()
	
	numero_checkpoint += 1
	if numero_checkpoint==get_child_count():
		nombre_tours+=1
		numero_checkpoint = 0
	
	check_actif = get_child(numero_checkpoint)
	active_checkpoint()


func active_checkpoint():
	check_actif.connect("body_entered", next_checkpoint)
	check_actif.activer()

func desactive_checkpoint():
	check_actif.disconnect("body_entered", next_checkpoint)
	check_actif.desactiver()
