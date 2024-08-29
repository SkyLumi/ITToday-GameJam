extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var gelap = get_parent().get_node("CanvasModulate")

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	gelap.visible = false
	queue_free() 
