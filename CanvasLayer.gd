extends CanvasLayer
@onready var menu : Node2D = $menu
@onready var mapa : Node2D = $mapa
# Called when the node enters the scene tree for the first time.
func _ready():
	menu.visible = false
	mapa.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("menu"):
		get_tree().paused = true
	menu.visible = get_tree().paused
	
	if Input.is_action_pressed("mapa"):
		mapa.visible  = true
	
func _on_restart_pressed():
	get_tree().reload_current_scene()
	


func _on_resume_pressed():
	get_tree().paused = false
	menu.visible = get_tree().paused


func _on_resume_m_pressed():
	mapa.visible = false
	
	
