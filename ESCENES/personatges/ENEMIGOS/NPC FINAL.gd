extends StaticBody2D
var enelarea:bool=false

func _ready():
	$Label.visible=false

func _process(delta):
	if enelarea==true:
		if Input.is_action_just_pressed("Accion"):
			get_tree().change_scene_to_file("res://ESCENES/ESCENARIS/batalla_final.tscn")
	pass

func _on_area_2d_body_entered(body):
	if body.name=="CharacterBody2D":
		$Label.visible=true
		enelarea=true
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if body.name=="CharacterBody2D":
		$Label.visible=false
		enelarea=false
	pass # Replace with function body.
