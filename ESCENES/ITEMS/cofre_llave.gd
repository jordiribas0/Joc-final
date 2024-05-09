extends StaticBody2D
var cofre_abierto:bool=false
var poder_abrir_cofre:bool=false
var tres_coins:bool=false


# Called when the node enters the scene tree for the first time.
func _ready():
	$"3Coins".visible=false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().get_node("CharacterBody2D").num_coins>2.5:
		tres_coins=true
	if tres_coins==true:
		abrir_cofre()
		
	pass


func _on_area_2d_body_entered(body):
	if body.name=="CharacterBody2D":
		if cofre_abierto==false:
			poder_abrir_cofre=true
			$"3Coins".visible=true
	pass # Replace with function body.
func abrir_cofre():
	if poder_abrir_cofre==true:
		if Input.is_action_just_pressed("Accion"):
			$AnimatedSprite2D.play("open")
			cofre_abierto=true
			poder_abrir_cofre=false
			get_parent().get_node("CharacterBody2D").num_coins -= 3


func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation=="open":
		cofre_abierto=true
		dar_llave()
	pass # Replace with function body.


func dar_llave():
	if cofre_abierto==true:
		var escenallave: PackedScene=load("res://ESCENES/ITEMS/llave.tscn")
		var llave = escenallave.instantiate()
		llave.global_position = global_position
		get_parent().add_child(llave)
	


func _on_area_2d_body_exited(body):
	$"3Coins".visible=false
	pass # Replace with function body.
