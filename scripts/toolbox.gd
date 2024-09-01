extends Node2D

@warning_ignore("unused_signal")
signal toolbox_ambil

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var gelap = get_parent().get_node("CanvasModulate")
@onready var hint = get_node("../CanvasLayer/Label4")

var baca_buku = false

func _ready():
	hint.hide()
	interaction_area.interact = Callable(self, "_on_interact")
	hint.text = "- kamu membutuhkan peralatan"
	
func _process(_delta: float) -> void:
	if !gelap.visible and baca_buku:
		interaction_area.action_name = "ambil"
	
func _on_interact():
	if !gelap.visible and baca_buku:
		hint.text = ""
		emit_signal("toolbox_ambil")
		queue_free() 

func _on_gui_buku_biru_buku_closed() -> void:
	baca_buku = true
	hint.show()
