extends VehicleWheel3D

@export var arriere:bool= false
var distance_parcourue := 0.0 # en tour
@onready var base_friction := wheel_friction_slip

var usure:=0.0
var usuremax:=0.3
var x:=0
var direction :=-1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	usure += delta * get_rpm() / 60000.0
	if usure>usuremax:
		usure=0.1
	
	if arriere and get_skidinfo()<1:
		usure += 1.0*delta*(1-get_skidinfo())
	
	steering+=log10(usure+1)*(0.003)*direction
	wheel_friction_slip = base_friction - min(log10(usure+1), base_friction*0.6)
		
	x+=1
	if x>200 :
		direction = -direction
		x=0


func log10(x):
	return log(x)/log(10)
