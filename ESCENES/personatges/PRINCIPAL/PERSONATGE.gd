extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

var speed = 400
var ultima_direccio :Vector2 = Vector2.DOWN
func get_input():
	var input_direction = Input.get_vector("left","right","up","down")
	velocity = input_direction * speed

func animacio():
	if velocity.x == 0 and velocity.y == 0:
		if ultima_direccio == Vector2.RIGHT:
			animated_sprite_2d.play("idle_lado")
			animated_sprite_2d.flip_h = false
		if ultima_direccio == Vector2.LEFT:
			animated_sprite_2d.play("idle_lado")
			animated_sprite_2d.flip_h = true
		if ultima_direccio == Vector2.UP:
			animated_sprite_2d.play("idle_esquena")
			animated_sprite_2d.flip_h = false
		if ultima_direccio == Vector2.DOWN:
			animated_sprite_2d.play("idle_cara")
			animated_sprite_2d.flip_h = false
	if velocity.x > 0:
		animated_sprite_2d.play("run_lado")
		animated_sprite_2d.flip_h = false
		ultima_direccio = Vector2.RIGHT
	if velocity.x < 0:
		animated_sprite_2d.play("run_lado")
		animated_sprite_2d.flip_h = true
		ultima_direccio = Vector2.LEFT
	if velocity.y < 0 and velocity.x == 0:
		animated_sprite_2d.play("run_esquena")
		ultima_direccio = Vector2.UP
	if velocity.y > 0 and velocity.x == 0:
		animated_sprite_2d.play("run_cara")
		ultima_direccio = Vector2.DOWN
		
func _physics_process(_delta):
	get_input()
	move_and_slide()
	animacio()
	ultima_direccio = velocity.normalized()
	
