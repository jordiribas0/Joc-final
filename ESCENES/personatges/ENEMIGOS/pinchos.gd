extends AnimatableBody2D
var posicion=global_position


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("subir")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation =="subir":
		$CollisionShape2D.position=posicion
		$Timer.start()
	
	else:
		$CollisionShape2D.position=Vector2(1000000000000,1000000000000)
		$Timer2.start()
	pass # Replace with function body.


func _on_timer_timeout():
	$AnimatedSprite2D.play("bajar")
	pass # Replace with function body.


func _on_timer_2_timeout():
	$AnimatedSprite2D.play("subir")
	pass # Replace with function body.
