extends Node2D

@warning_ignore("unused_signal")
signal batrai_ambil

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var gelap = get_parent().get_node("CanvasModulate")
var bisa_diambil = true

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _process(_delta: float) -> void:
	if gelap.visible == false:
		interaction_area.action_name = "ambil"
	
func _on_interact():
	if gelap.visible == false:
		emit_signal("batrai_ambil")
		queue_free() 
