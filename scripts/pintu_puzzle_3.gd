extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var puzzle3 = load("res://scenes/puzzle_3.tscn") as PackedScene

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	if !Global.is_manusia:
		Global.player_position = Vector2(1736,-182)
		get_tree().change_scene_to_packed(puzzle3)
	else:
		interaction_area.action_name = "biarkan solus berjuang sendiri"


func _on_interaction_area_body_entered(_body: Node2D) -> void:
	interaction_area.action_name = "masuk"
