extends Area2D
var pillar_llave:bool=false

# Called when the node enters the scene tree for the first time.
func _ready():
	position=global_position+Vector2(0,35)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pillarllave()
	pass
func pillarllave():
	if pillar_llave==true:
		if Input.is_action_just_pressed("Accion"):
			
			$clau.play("colected")


func _on_body_entered(body):
	
	if body.name=="CharacterBody2D":
		pillar_llave=true
		
	pass # Replace with function body.


func _on_body_exited(body):
	if body.name=="CharacterBody2D":
		pillar_llave=false
	pass # Replace with function body.


func _on_clau_animation_finished():
	get_parent().get_node("CharacterBody2D").num_claus += 1
	self.queue_free()
