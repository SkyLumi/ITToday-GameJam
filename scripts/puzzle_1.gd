extends Node2D

@onready var transisi = $CanvasLayer/Transition
@onready var colorRect = $CanvasLayer/Transition/ColorRect

func _ready() -> void:
	var player = $Player
	player.position = Global.player_position
	colorRect.visible = true
	transisi.play("fade_in")
	await transisi.animation_finished
	colorRect.visible = false
	
	Dialogic.start("enter_map2")
	Global.player_jalan = false
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	
func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	Global.player_jalan = true
