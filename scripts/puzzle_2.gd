extends Node2D

@onready var transisi = $CanvasLayer/Transition
@onready var colorRect = $CanvasLayer/Transition/ColorRect

func _ready() -> void:
	var player = $Player
	
		#komentar code ini untuk debug
	player.position = Global.player_position
	
	colorRect.visible = true
	transisi.play("fade_in")
	await transisi.animation_finished
	colorRect.visible = false
