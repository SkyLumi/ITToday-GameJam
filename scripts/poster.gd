extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var start_puzzle = preload("res://scenes/puzzle1.tscn") as PackedScene


func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	if Global.poster_removed_status:
		hide()
		interaction_area.action_name = "masuk"
	
	
func _on_interact():
	if Global.poster_removed_status:
		Global.player_position = Vector2(833,385)
		get_tree().change_scene_to_packed(start_puzzle)
	elif Global.is_manusia:
		hide()
		Global.poster_removed_status = true
		interaction_area.action_name = "masuk"

	
