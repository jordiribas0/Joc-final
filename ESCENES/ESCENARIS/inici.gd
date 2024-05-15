extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$music.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://ESCENES/ESCENARIS/JOC.tscn")
	pass # Replace with function body.


func _on_introduccio_pressed():
	
	pass # Replace with function body.
