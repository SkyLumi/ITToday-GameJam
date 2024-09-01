class_name MainMenu
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Start_Button as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button as Button
@onready var start_level = preload("res://scenes/game.tscn") as PackedScene
@onready var transisi = $Transition
@onready var colorect = $Transition/ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transisi.play("fade_in")
	await transisi.animation_finished
	colorect.visible = false
	start_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)

func on_start_pressed() -> void:
	$Hitsound.play()
	colorect.visible = true
	transisi.play("fade_out")
	await transisi.animation_finished
	colorect.visible = false
	get_tree().change_scene_to_packed(start_level)
	
func on_exit_pressed() -> void:
	$Hitsound.play()
	get_tree().quit()

## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
