extends StaticBody2D
var poder_abrir_puerta:bool=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	abrir_puerta()
	pass
func abrir_puerta():
	if get_parent().get_node("CharacterBody2D").num_claus >0:
		if poder_abrir_puerta==true:
			if Input.is_action_just_pressed("Accion"):
				self.queue_free()
				get_parent().get_node("CharacterBody2D").num_claus-=1

func _on_porta_h_body_entered(body):
	if body.name=="CharacterBody2D":
			poder_abrir_puerta=true
	pass # Replace with function body.


func _on_porta_h_body_exited(body):
	if body.name=="CharacterBody2D":
			poder_abrir_puerta=false
	pass # Replace with function body.
