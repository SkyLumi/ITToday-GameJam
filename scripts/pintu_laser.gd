extends Node2D

@export var posisi:Vector2
@onready var interaction_area: InteractionArea = $InteractionArea
@onready var puzzle1 = load("res://scenes/puzzle1.tscn") as PackedScene

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	Global.player_position = posisi
	get_tree().change_scene_to_packed(puzzle1)
