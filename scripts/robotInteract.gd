extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var gelap = get_parent().get_node("CanvasModulate")
@onready var nyambung_kabel = get_node("../CanvasLayer/nyambung_kabel")
@onready var lobby = preload("res://scenes/lobby.tscn") as PackedScene
@onready var manusia = get_node("../Manusia")

var batrai_ambil = false
var kabel_ambil = false
var core_ambil = false
var toolbox_ambil = false

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
func _process(_delta: float) -> void:
	if !gelap.visible:
		interaction_area.action_name = "lihat"

func _on_kabel_diambil():
	kabel_ambil = true

func _on_batrai_diambil():
	batrai_ambil = true
	
func _on_core_core_ambil() -> void:
	core_ambil = true

func _on_toolbox_diambil() -> void:
	toolbox_ambil = true

	
func _on_interact():
	if !gelap.visible:
		if batrai_ambil && kabel_ambil && core_ambil && toolbox_ambil:
			nyambung_kabel.visible = true
			manusia.is_active = false
			await nyambung_kabel.kabel_selesai
			manusia.is_active = true
			Global.player_position = manusia.position
			get_tree().change_scene_to_packed(lobby)
		else:
			pass
			#diganti sama dialog ahan 
