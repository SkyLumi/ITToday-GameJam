extends Node2D

@onready var transisi = get_node("../CanvasLayer/Transition")
@onready var colorRect = get_node("../CanvasLayer/Transition/ColorRect")
@onready var robot = get_node("../Robot")

func _process(_delta: float) -> void:
	if Global.ketahuan:
		Dialogic.start("ketemu_terminius")
		fade_in()
		robot.position = Vector2(667, 1329)
		fade_out()
		Global.ketahuan = false

func fade_in():
		colorRect.visible = true
		transisi.play("fade_out")
		await transisi.animation_finished
		colorRect.visible = false

func fade_out():
		colorRect.visible = true
		transisi.play("fade_in")
		await transisi.animation_finished
		colorRect.visible = false
