extends Area2D
var direccio:Vector2=Vector2.DOWN
var velocitat:=300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position+= direccio*velocitat*delta
	pass

func dispara_fletxa():
	var escenafletxa: PackedScene=load("res://ESCENES/personatges/ENEMIGOS/FLECHA.tscn")
	var fletxa = escenafletxa.instantiate()
	fletxa.global_position = global_position





func _on_body_entered(body):
	print("hola")
	dispara_fletxa()
	pass # Replace with function body.
