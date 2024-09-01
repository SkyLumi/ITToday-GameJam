extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var start_puzzle = preload("res://scenes/puzzle1.tscn") as PackedScene

var pintu_visible = false

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	if Global.poster_removed_status:
		hide()
	
	
func _on_interact():
	if Global.is_manusia:
		hide()
		Global.poster_removed_status = true
		if pintu_visible:
			get_tree().change_scene_to_packed(start_puzzle)
		pintu_visible = true
	
