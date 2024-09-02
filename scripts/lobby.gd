extends Node2D

@onready var transisi = $CanvasLayer/Transition
@onready var colorRect = $CanvasLayer/Transition/ColorRect

func _ready() -> void:
	var player = $Players
	player.position = Global.player_position
	colorRect.visible = true
	transisi.play("fade_in")
	await transisi.animation_finished
	colorRect.visible = false
	if !Global.after_fix_solus:
		Dialogic.timeline_ended.connect(_on_dialog_selesai_afterfix)
		Dialogic.start("after_fix_solus")
		Global.after_fix_solus = true
		Global.player_jalan = false

func _on_dialog_selesai_afterfix():
	Dialogic.timeline_ended.disconnect(_on_dialog_selesai_afterfix)
	Global.player_jalan = true
