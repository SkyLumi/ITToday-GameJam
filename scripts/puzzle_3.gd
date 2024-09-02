extends Node2D

@onready var transisi = $CanvasLayer/Transition
@onready var colorRect = $CanvasLayer/Transition/ColorRect
@onready var robot = $Robot
@onready var cutscene = preload("res://scenes/cutscene.tscn") as PackedScene

func _ready() -> void:
	$Robot.is_active = true
	Global.ketahuan = false


func _on_musuh_ketahuan() -> void:
	Dialogic.timeline_ended.connect(_on_dialog_selesai)
	Dialogic.start("ketemu_terminus")
	Global.ketahuan = false
	Global.player_jalan = false

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
	
func _on_dialog_selesai():
	Dialogic.timeline_ended.disconnect(_on_dialog_selesai)
	fade_in()
	robot.position = Vector2(667, 1329)
	fade_out()
	Global.player_jalan = true


func _on_interaction_area_body_entered(body: Node2D) -> void:
	fade_in()
	get_tree().change_scene_to_packed(cutscene)
