extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func dispara_fletxa():
	var escenafletxa: PackedScene=load("res://ESCENES/personatges/ENEMIGOS/FLECHA.tscn")
	var fletxa = escenafletxa.instantiate()
	fletxa.global_position = global_position
	get_parent().add_child(fletxa)



func _on_timer_timeout():
	dispara_fletxa()




	pass # Replace with function body.



	pass # Replace with function body.
