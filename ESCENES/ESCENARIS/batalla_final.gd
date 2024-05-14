extends Node2D
var enemigo = preload("res://ESCENES/personatges/ENEMIGOS/NPC BATALLA.tscn")
@onready var slot1=$Node2D/Marker2D
@onready var slot2=$Node2D/Marker2D2
var turno_player=0
var turno_enemigo
func _ready():
	$Control.visible=false
	$Control2.visible=false
	enemigos()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func enemigos():
	var enemigo1 =enemigo.instantiate()
	slot1.add_child(enemigo1)
	var enemigo2 =enemigo.instantiate()
	slot2.add_child(enemigo2)


func _on_marker_2d_2_child_exiting_tree(node):
	$Node2D/Marker2D2.queue_free()
	$Area2D2.queue_free()
	$Control2.queue_free()
	pass # Replace with function body.


func _on_marker_2d_child_exiting_tree(node):
	$Node2D/Marker2D.queue_free()
	$Area2D.queue_free()
	$Control.queue_free()
	pass # Replace with function body.



	
	pass # Replace with function body.



	
	pass # Replace with function body.


func _on_area_2d_mouse_entered():
	$Control.visible=true
	
	pass # Replace with function body.


func _on_area_2d_2_mouse_entered():
	$Control2.visible=true
	pass # Replace with function body.


func _on_area_2d_2_mouse_exited():
	$Control2.visible=false
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	$Control.visible=false
	pass # Replace with function body.


func _on_button_2_button_down():
	get_node("CharacterBody2D").objetivo=2
	get_node("CharacterBody2D").poder_atacar=true
	pass # Replace with function body.


func _on_button_button_down():
	get_node("CharacterBody2D").objetivo=1
	get_node("CharacterBody2D").poder_atacar=true
	pass # Replace with function body.


func _on_button_button_up():
	get_node("CharacterBody2D").objetivo=0
	get_node("CharacterBody2D").poder_atacar=false
	pass # Replace with function body.


func _on_button_2_button_up():
	get_node("CharacterBody2D").objetivo=0
	get_node("CharacterBody2D").poder_atacar=false
	pass # Replace with function body.
