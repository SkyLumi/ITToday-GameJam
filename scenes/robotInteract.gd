extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var gelap = get_parent().get_node("CanvasModulate")
var key_collected: bool = false

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	if !gelap.visible:
		interaction_area.action_name = "Lihat"
	
func _process(_delta: float) -> void:
	var a
	
func _on_interact():
	if !gelap.visible:
		interaction_area.action_name = "Kamu Membutuhkan Kabel dan Batrai"
