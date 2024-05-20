extends CanvasLayer
@onready var controls : Node2D = $controls

# Called when the node enters the scene tree for the first time.
func _ready():
	controls.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("menu"):
		controls.visible = true
	pass


func _on_salir_pressed():
	controls.visible = false
		
	pass # Replace with function body.
