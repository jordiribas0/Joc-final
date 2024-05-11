extends StaticBody2D
var cofre_abierto:bool=false
var poder_abrir_cofre:bool=false
@onready var so_cofre = $so_cofre


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	abrir_cofre()
	
func _on_area_2d_body_entered(body):
	if body.name=="CharacterBody2D":
		if cofre_abierto==false:
			poder_abrir_cofre=true

func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation=="open":
		cofre_abierto=true
		dar_moneda()
	
func _on_area_2d_body_exited(body):
	if body.name=="CharacterBody2D":
		poder_abrir_cofre=false

func abrir_cofre():
	if poder_abrir_cofre==true:
		if Input.is_action_just_pressed("Accion"):
			$cofre.play()
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
