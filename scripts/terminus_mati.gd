extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var show_hint = $"../CanvasLayer/Label"


func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	$"../CanvasLayer/Timer".start()
	show_hint.show()

func _on_timer_timeout() -> void:
	show_hint.hide()
