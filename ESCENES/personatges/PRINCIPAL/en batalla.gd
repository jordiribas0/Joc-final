extends CharacterBody2D
var dañoinicial=2
var daño=2
var vidapersonaje=30
var vidamaxima=30
var objetivo=0
var poder_atacar:bool=false
var seleccion=""
var seleccionvida="enemigo1"
var poder_hacer_critico=2
var poder_hacer_critico_bueno=2
var intento_critico=0
var paz_mental:bool=false
var posicion_inicial:Vector2 = Vector2(489,843)
var golpe_espada:bool=false
var movimientohecho:bool=false


func _ready():
	$Control.visible=false
	
	
func _process(delta):
	elegir_enemigo()
	
	if poder_atacar==true and get_parent().turno_player==get_parent().turno_enemigo:
		atacar()
		
	
	$ProgressBar.value=vidapersonaje
	if vidapersonaje==0:
		self.queue_free()
		get_tree().change_scene_to_file("res://ESCENES/ESCENARIS/derrota.tscn")
	pass
	
	
func atacar():
	$AnimatedSprite2D.play("ataque")
	self.position=seleccion.position-Vector2(200,100)
	
	

func elegir_enemigo():
	if golpe_espada==true:
		if objetivo==1:
			seleccion=$"../Node2D/Marker2D"
			
			poder_atacar=true
		
	


func _on_area_2d_mouse_entered():
	if get_parent().turno_player<=get_parent().turno_enemigo:
		$Control.visible=true
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	$Control.visible=false
	pass # Replace with function body.


func _on_button_pressed():
	golpe_espada=true
	movimientohecho=true
	
	randomize()
	if paz_mental==false:
		intento_critico= randf_range(1,11)
		if intento_critico==poder_hacer_critico:
			daño=dañoinicial*2
			seleccion.critico=true
			get_tree().get_nodes_in_group(str(seleccionvida))[0].critico=true
	else:
		intento_critico= randf_range(1,4)
		if intento_critico==poder_hacer_critico_bueno:
			daño=dañoinicial*2
			seleccion.critico=true
		get_tree().get_nodes_in_group(str(seleccionvida))[0].critico=true

	
	pass # Replace with function body.


func _on_button_2_pressed():
	get_tree().get_nodes_in_group(str(seleccionvida))[0].poder_atacar=false
	
	if paz_mental==false:
		paz_mental=true
		$AnimatedSprite2D.play("paz_mental")
		movimientohecho=true
		$Timer.start()

		pass # Replace with function body.

func _on_timer_timeout():
	$AnimatedSprite2D.play("default")
	
	
	$Timer2.start()
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation=="ataque":
		
		get_tree().get_nodes_in_group(str(seleccionvida))[0].vida-=daño
		get_tree().get_nodes_in_group(str(seleccionvida))[0].hitted()
		if get_tree().get_nodes_in_group(str(seleccionvida))[0].vida==0:
			get_tree().get_nodes_in_group(str(seleccionvida))[0].queue_free()
			get_tree().change_scene_to_file("res://ESCENES/ESCENARIS/Win.tscn")
		$Timer2.start()
		
		
		
		objetivo=0
		self.position=posicion_inicial
		$AnimatedSprite2D.play("default")
		golpe_espada=false
		paz_mental=false
		poder_atacar=false
		daño=dañoinicial
	
	pass # Replace with function body.


func _on_timer_2_timeout():
	get_tree().get_nodes_in_group(str(seleccionvida))[0].poder_atacar=true
	get_tree().get_nodes_in_group(str(seleccionvida))[0].ataqueenemigo()
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_changed():
	if movimientohecho==true:
		if $AnimatedSprite2D.animation=="default":
			get_parent().turno_player+=1
	pass # Replace with function body.
