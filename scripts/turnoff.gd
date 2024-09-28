extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var pathFollow = $"../Path2D/PathFollow2D"
var posisi:Vector2

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	posisi = pathFollow.position
	pathFollow.queue_free()
	$"../TerminusMati".position = posisi
	$"../TerminusMati".show()
