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



func _on_sudoku_tombol_benar() -> void:
	Dialogic.timeline_ended.connect(_on_dialog_selesai)
	Dialogic.start("teorigraf_solved")
	Global.player_jalan = false
	$Player/Manusia/CollisionShape2D.disabled = true
	$Player/Robot/CollisionShape2D.disabled = true

func _on_dialog_selesai():
	Global.player_jalan = true
	$Player/Manusia/CollisionShape2D.disabled = false
	$Player/Robot/CollisionShape2D.disabled = false
	
