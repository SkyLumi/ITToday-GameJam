extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@export var PlayerPath: NodePath = "../Player/Manusia" 
@onready var player = get_node(PlayerPath)

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

	
func _process(_delta: float) -> void:
	pass
	
func _on_interact():
	var player_aktif = player.get("is_active")
	if player_aktif:
		interaction_area.action_name = "manusia"
	else:
		interaction_area.action_name = "robot"
	
	
