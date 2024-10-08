extends Sprite2D

@warning_ignore("unused_signal")
signal flashdisk_diambil

@onready var interaction_area: InteractionArea = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	if Global.is_manusia:
		emit_signal("flashdisk_diambil")
		hide()
		interaction_area.monitoring = false
		
	else:
		interaction_area.action_name = "eits robot tidak punya tangan"


func _on_interaction_area_body_entered(_body: Node2D) -> void:
	interaction_area.action_name = "ambil"
