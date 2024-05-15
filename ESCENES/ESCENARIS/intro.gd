extends CanvasLayer

@onready var intro : Sprite2D = $intro
@onready var button : Button = $button
# Called when the node enters the scene tree for the first time.
func _ready():
	intro.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_introduccio_pressed():
	intro.visible = true
	button.visible = false
	pass # Replace with function body.


func _on_salir_pressed():
	intro.visible = false
	button.visible = true
	pass # Replace with function body.
