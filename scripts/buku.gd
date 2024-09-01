extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _process(_delta: float) -> void:
		interaction_area.action_name = "baca"
	
func _on_interact():
		print("gataww")
