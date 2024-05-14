extends CharacterBody2D
var dañoinicial=2
var daño=2
var vida=30
var vidamaxima=30
var objetivo=0
var poder_atacar:bool=false
var seleccion=""
var poder_hacer_critico=10
var poder_hacer_critico_bueno=5
var intento_critico=0
var paz_mental:bool=false
var ataque_seleccionado:bool=false
var posicion_inicial:Vector2 = Vector2(489,843)


func _ready():
	$Control.visible=false
	ataque_seleccionado=false
	
func _process(delta):
	
	if poder_atacar==true||ataque_seleccionado==true:
		elegir_enemigo()
		atacar()
		
	
	
	pass
	
	
func atacar():
	if poder_atacar==true:
		$AnimatedSprite2D.play("ataque")
		self.global_position.x = seleccion.global_position.x-200
		self.global_position.y = seleccion.global_position.y-100
	

func elegir_enemigo():
	if ataque_seleccionado==true:
		if objetivo==1:
			seleccion=$"../Node2D/Marker2D"
		elif objetivo==2:
			seleccion=$"../Node2D/Marker2D2"
	


func _on_area_2d_mouse_entered():
	$Control.visible=true
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	$Control.visible=false
	pass # Replace with function body.


func _on_button_pressed():
	ataque_seleccionado=true
	randomize()
	if paz_mental==false:
		intento_critico= randf_range(1,11)
		if intento_critico==poder_hacer_critico:
			daño=dañoinicial*2
	else:
		intento_critico= randf_range(1,6)
		if intento_critico==poder_hacer_critico_bueno:
			daño=dañoinicial*2

	
	pass # Replace with function body.


func _on_button_2_pressed():
	paz_mental=true
	$AnimatedSprite2D.play("paz_mental")
	$Timer.start()
	pass # Replace with function body.

func _on_timer_timeout():
	$AnimatedSprite2D.play("default")
	get_parent().turno_player+=2
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation=="ataque":
		objetivo=0
		self.position=posicion_inicial
		$AnimatedSprite2D.play("default")
		ataque_seleccionado=false
		paz_mental=false
		poder_atacar=false
		daño=dañoinicial
	pass # Replace with function body.
