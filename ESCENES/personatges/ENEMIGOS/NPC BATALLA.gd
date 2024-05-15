extends Node2D
var daño=1
var vida=20
var vidamaxima=20
var daño_recibido=0
var posicion_inicial:Vector2 = Vector2(1446,936)
var maincharacter=0
var critico:bool=false
var poder_atacar:bool=false
# Called when the node enters the scene tree for the first time.
func _ready():
	maincharacter=$PLAYER/CharacterBody2D
	$ProgressBar.value=vida
	$Critic.visible=false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func hitted():
	$AnimatableBody2D/AnimatedSprite2D.play("daño")
	$ProgressBar.value=vida
	if critico==true:
		$Critic.visible=true
	
	
	
	
	pass
func vidaescero():
	if vida <=0:
		self.queue_free()
	
func ataqueenemigo():
	if get_parent().get_parent().get_parent().turno_player> get_parent().get_parent().get_parent().turno_enemigo :
		if  poder_atacar==true:
			$AnimatableBody2D/AnimatedSprite2D.play("ataque")
			self.position=Vector2(100,0)
		
		
		
	

func _on_animated_sprite_2d_animation_finished():
	if $AnimatableBody2D/AnimatedSprite2D.animation=="daño":
		$AnimatableBody2D/AnimatedSprite2D.play("default")
	elif $AnimatableBody2D/AnimatedSprite2D.animation=="ataque":
		$AnimatableBody2D/AnimatedSprite2D.play("default")
		$Critic.visible=false
		poder_atacar=false
		self.position-=Vector2(100,0)
		get_parent().get_parent().get_parent().turno_enemigo+=1
		get_parent().get_parent().get_parent().get_node("CharacterBody2D").vidapersonaje-=daño
		
		
	pass # Replace with function body.


