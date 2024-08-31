extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var gelap = get_parent().get_node("CanvasModulate")
@onready var nyambung_kabel = get_node("../CanvasLayer/nyambung_kabel")
@onready var start_puzzle = preload("res://scenes/puzzle1.tscn") as PackedScene

var kabel_selesai = false
var pintu_visible = false

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
	nyambung_kabel.connect("kabel_selesai", Callable(self, "_on_kabel_selesai"))
	
func _process(_delta: float) -> void:
	pass
	
func _on_interact():
	if kabel_selesai:
		hide()
		if pintu_visible:
			get_tree().change_scene_to_packed(start_puzzle)
		pintu_visible = true
	

func _on_kabel_selesai():
	interaction_area.action_name = "?"
	kabel_selesai = true
