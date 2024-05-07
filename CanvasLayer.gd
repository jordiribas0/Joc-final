extends CanvasLayer
@onready var menu : Node2D = $menu
@onready var mapa : Node2D = $mapa
@onready var controls : Node2D = $controls
# Called when the node enters the scene tree for the first time.
func _ready():
	menu.visible = false
	mapa.visible = false
	controls.visible = false
	$claus.text = "Claus: " + str(get_parent().get_node("CharacterBody2D").num_claus)
	$coins.text = "Coins: " + str(get_parent().get_node("CharacterBody2D").num_coins)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$claus.text = "Claus: " + str(get_parent().get_node("CharacterBody2D").num_claus)
	$coins.text = "Coins: " + str(get_parent().get_node("CharacterBody2D").num_coins)
	if Input.is_action_just_pressed("menu"):
		get_tree().paused = true
		menu.visible = true
	
	if Input.is_action_pressed("mapa"):
		mapa.visible  = true
		get_tree().paused = true
func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
	

func _on_resume_pressed():
	get_tree().paused = false
	menu.visible = false

func _on_resume_m_pressed():
	mapa.visible = false
	get_tree().paused = false

func _on_controls_pressed():
	menu.visible = false
	controls.visible = true

func _on_salir_pressed():
	controls.visible = false
	menu.visible = true
