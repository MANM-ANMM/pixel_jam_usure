extends Label

var running:=false
var time:=0.0

func _ready():
	update_text()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if running:
		time += delta
		update_text()

func reset():
	time = 0

func start():
	reset()
	running = true

func stop()->float:
	running = false
	return time

func resume():
	running = true

func update_text():
	var minutes := time / 60
	var seconds := fmod(time, 60)
	var milliseconds := fmod(time, 1) * 100
	text = "%02d:%02d:%02d" % [minutes, seconds, milliseconds]
	
