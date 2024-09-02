extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var teori_graf = preload("res://scenes/puzzle_2.tscn") as PackedScene
@onready var transisi = get_node("../CanvasLayer/Transition")
@onready var colorRect = get_node("../CanvasLayer/Transition/ColorRect")


func _ready():
	interaction_area.interact = Callable(self, "_on_interact")


func _on_interact():
		Global.player_position = Vector2(235,646)
		colorRect.visible = true
		transisi.play("fade_out")
		Global.player_jalan = false
		await transisi.animation_finished
		Global.player_jalan = true
		colorRect.visible = false
		get_tree().change_scene_to_packed(teori_graf)
