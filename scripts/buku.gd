extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var gui_buku = get_node("../CanvasLayer/gui_buku_hijau")

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	if Global.is_manusia:
		if Global.buku_sudah_dialog_hijau:
			Global.player_jalan = false
			gui_buku.visible = true
		else:
			Dialogic.start("interact_buku")
			Global.player_jalan = false
			interaction_area.monitoring = false
			Dialogic.timeline_ended.connect(_on_timeline_ended)
	else:
		interaction_area.action_name = "bang gada tangan bang"

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	gui_buku.visible = true
	interaction_area.monitoring = true
	Global.buku_sudah_dialog_hijau = true


func _on_interaction_area_body_entered(_body: Node2D) -> void:
	interaction_area.action_name = "baca"
