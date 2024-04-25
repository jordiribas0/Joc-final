extends Area2D
var direccio:Vector2=Vector2.DOWN
var velocitat:=250

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position+= direccio*velocitat*delta
	pass








	pass # Replace with function body.


	pass # Replace with function body.


func _on_body_entered(body):
	self.queue_free()
	pass # Replace with function body.
