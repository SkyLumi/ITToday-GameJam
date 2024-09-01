extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var pin_tombol = get_node("../CanvasLayer/pin_tombol")

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _process(_delta: float) -> void:
		interaction_area.action_name = "baca"
	
func _on_interact():
	if Global.is_manusia:
		pin_tombol.visible = true
	else:
		$morse.play()


func _on_flashdisk_flashdisk_diambil() -> void:
	pass # Replace with function body.
