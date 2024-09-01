extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var gui_buku = get_node("../CanvasLayer/gui_buku_hijau")

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _process(_delta: float) -> void:
		interaction_area.action_name = "baca"
	
func _on_interact():
	if Global.is_manusia:
		gui_buku.visible = true
	else:
		interaction_area.action_name = "bang gada tangan bang"
