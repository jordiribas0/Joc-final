extends ProgressBar



func _ready():
	pass # Replace with function body.



func _process(delta):
	value = General.vida
	if value == 0:
		get_tree().change_scene_to_file("res://ESCENES/ESCENARIS/derrota.tscn")
