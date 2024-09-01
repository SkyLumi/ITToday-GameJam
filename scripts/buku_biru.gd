extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var gui_buku = get_node("../CanvasLayer/gui_buku_biru")
@onready var gelap = get_node("../CanvasModulate")

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	if !gelap.visible:
		if Global.is_manusia and !Global.buku_sudah_dialog: 
			Dialogic.start("found_book")
			Dialogic.timeline_ended.connect(_on_timeline_ended)
			Global.player_jalan = false
		elif Global.is_manusia and Global.buku_sudah_dialog:
			gui_buku.visible = true
			Global.player_jalan = false
		else:
			interaction_area.action_name = "Robot tidak punya tangan"
	else:
		interaction_area.action_name = "terlalu gelap disini"


func _on_interaction_area_body_exited(_body: Node2D) -> void:
	interaction_area.action_name = "Baca"


func _on_interaction_area_body_entered(_body: Node2D) -> void:
	interaction_area.action_name = "baca"

func _on_timeline_ended():
	gui_buku.visible = true
	Global.buku_sudah_dialog = true
