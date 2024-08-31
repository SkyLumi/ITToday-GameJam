extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var gelap = get_parent().get_node("CanvasModulate")
@onready var gui_buku = get_node("../CanvasLayer/gui_buku_biru")

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _process(_delta: float) -> void:
	if gelap.visible == false:
		interaction_area.action_name = "baca"
	
func _on_interact():
	if gelap.visible == false:
		gui_buku.visible = true
