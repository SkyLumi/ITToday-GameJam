extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var pin_tombol = get_node("../CanvasLayer/pin_tombol")

var flashdisk_diambil = false

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
	
func _on_interact():
	if Global.is_manusia:
		pin_tombol.visible = true
	elif flashdisk_diambil and !Global.is_manusia:
		$morse.play()
	else:
		interaction_area.action_name = "..."


func _on_flashdisk_flashdisk_diambil() -> void:
	pass # Replace with function body.


func _on_interaction_area_body_entered(_body: Node2D) -> void:
	interaction_area.action_name = "?"
