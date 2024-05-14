extends Node2D
var daño=1
var vida=20
var vidamaxima=20
var daño_recibido=0

# Called when the node enters the scene tree for the first time.
func _ready():
	$ProgressBar.value= vida*100/vidamaxima
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ProgressBar.value= vida*100/vidamaxima
	pass

	
