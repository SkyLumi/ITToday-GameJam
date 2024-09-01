extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var gelap = get_parent().get_node("CanvasModulate")
@onready var nyambung_kabel = get_node("../CanvasLayer/nyambung_kabel")
@onready var lobby = preload("res://scenes/lobby.tscn") as PackedScene
@onready var manusia = get_node("../Manusia")
@onready var transisi = get_node("../CanvasLayer/Transition")
@onready var colorect = get_node("../CanvasLayer/Transition/ColorRect")

var batrai_ambil = false
var kabel_ambil = false
var core_ambil = false
var toolbox_ambil = false
var sudah_dialog = false

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
			pause_karakter()
			Dialogic.timeline_ended.connect(_on_dialog_selesai_afterfix)
			Dialogic.start("after_fix_solus")
		elif sudah_dialog:
			Dialogic.timeline_ended.connect(_on_dialog_selesai)
			Dialogic.start("interact_solus_rusak_after_buku")
			pause_karakter()
		else:
			Dialogic.timeline_ended.connect(_on_dialog_selesai)
			Dialogic.start("interact_solus_rusak")
			pause_karakter()
		
func _on_dialog_selesai_afterfix():
	Dialogic.timeline_ended.disconnect(_on_dialog_selesai_afterfix)
	Global.player_position = manusia.position
	colorect.visible = true
	transisi.play("fade_out")
	await transisi.animation_finished
	get_tree().change_scene_to_packed(lobby)
	
func _on_dialog_selesai():
	Dialogic.timeline_ended.disconnect(_on_dialog_selesai)
	resume_karakter()

func pause_karakter():
	interaction_area.monitoring = false
	manusia.is_active = false

func resume_karakter():
	interaction_area.monitoring = true
	manusia.is_active = true


func _on_gui_buku_biru_buku_closed() -> void:
	sudah_dialog = true
