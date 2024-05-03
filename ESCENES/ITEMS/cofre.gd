extends StaticBody2D
var cofre_abierto:bool=false
var poder_abrir_cofre:bool=false


# Called when the node enters the scene tree for the first time.
func _ready():
	$E.visible=false
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cofre_abierto==true:
		$E.visible=false
	pass
	abrir_cofre()
	



func _on_area_2d_body_entered(body):
	if body.name=="CharacterBody2D":
		if cofre_abierto==false:
			poder_abrir_cofre=true
			$E.visible=true
	
	
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation=="open":
		cofre_abierto=true
		dar_moneda()
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if body.name=="CharacterBody2D":
		poder_abrir_cofre=false
		$E.visible=false
	pass # Replace with function body.
func abrir_cofre():
	if poder_abrir_cofre==true:
		if Input.is_action_just_pressed("Accion"):
			$AnimatedSprite2D.play("open")
			cofre_abierto=true
			poder_abrir_cofre=false
func dar_moneda():
	if cofre_abierto==true:
		var escenamoneda: PackedScene=load("res://ESCENES/ITEMS/coin.tscn")
		var coin = escenamoneda.instantiate()
		coin.global_position = global_position
		get_parent().add_child(coin)
	else:
		pass
