extends AnimatableBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")
	$AnimatedSprite2D.flip_h=false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position=get_parent().global_position
	pass


func _on_timer_timeout():
	$Timer.start()
	if $AnimatedSprite2D.flip_h == false:
		$AnimatedSprite2D.flip_h =true
	else:
		$AnimatedSprite2D.flip_h =false
	pass # Replace with function body.
