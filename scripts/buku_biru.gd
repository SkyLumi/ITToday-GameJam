extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var gui_buku = get_node("../CanvasLayer/gui_buku_biru")

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	if Global.is_manusia: 
		gui_buku.visible = true
		Global.player_jalan = false
	else:
		interaction_area.action_name = "Robot tidak punya tangan"


func _on_interaction_area_body_exited(_body: Node2D) -> void:
	interaction_area.action_name = "Baca"
