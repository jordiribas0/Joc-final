extends Area2D
var pillar_moneda:bool=false

# Called when the node enters the scene tree for the first time.
func _ready():
	position=global_position+Vector2(0,35)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pillarmoneda()
	pass
func pillarmoneda():
	if pillar_moneda==true:
		if Input.is_action_just_pressed("Accion"):
			
			$coin.play("colected")


func _on_body_entered(body):
	if body.name=="CharacterBody2D":
		pillar_moneda=true
	pass # Replace with function body.


func _on_body_exited(body):
	if body.name=="CharacterBody2D":
		pillar_moneda=false
	pass # Replace with function body.


func _on_coin_animation_finished():
	get_parent().get_node("CharacterBody2D").num_coins += 1
	self.queue_free()
	pass # Replace with function body.
