extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@export var map: PackedScene

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	get_tree().change_scene_to_packed(map)
