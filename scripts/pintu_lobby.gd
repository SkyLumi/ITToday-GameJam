extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var lobby = load("res://scenes/lobby.tscn") as PackedScene

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	Global.player_position = Vector2(190,-64)
	get_tree().change_scene_to_packed(lobby)
