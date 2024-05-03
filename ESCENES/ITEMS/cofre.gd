extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$E.visible=false
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
		
	if body.name== "CharacterBody2D":
		if $AnimatedSprite2D.animation=="default":
			$AnimatedSprite2D.play("open")
		else:
			pass
		if $E.visible==true:
			$E.visible=false
		elif $E.visible==false:
			$E.visible=true
	else:
		pass
	
	
	pass # Replace with function body.
