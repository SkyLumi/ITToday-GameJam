extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var gelap = get_parent().get_node("CanvasModulate")
@onready var hint = get_node("../CanvasLayer/Label")
@onready var hint2 = get_node("../CanvasLayer/Label2")
@onready var nyambung_kabel = get_node("../CanvasLayer/nyambung_kabel")
@onready var manusia = get_node("../Manusia")

var batrai_ambil: bool = false
var kabel_ambil: bool = false

func _ready():
	hint.hide()
	hint2.hide()
	interaction_area.interact = Callable(self, "_on_interact")
	var batrai = get_node("../Batrai")
	var kabel = get_node("../Kabel")
	
	batrai.connect("batrai_ambil", Callable(self, "_on_batrai_diambil"))
	kabel.connect("kabel_ambil", Callable(self, "_on_kabel_diambil"))
	
func _process(_delta: float) -> void:
	if !gelap.visible:
		interaction_area.action_name = "lihat"
		
	hint.text = "- kamu membutuhkan kabel"
	hint2.text = "- kamu membutuhkan batrai"
	if batrai_ambil && kabel_ambil:
		hint.text = ""
		hint2.text = ""
	elif batrai_ambil:
		hint.text = "- kamu membutuhkan kabel"
		hint2.text = ""
	elif kabel_ambil:
		hint.text = "- kamu membutuhkan batrai"
		hint2.text = ""

func _on_kabel_diambil():
	kabel_ambil = true

func _on_batrai_diambil():
	batrai_ambil = true
	
func _on_interact():
	if !gelap.visible:
		if batrai_ambil && kabel_ambil:
			nyambung_kabel.visible = true
			manusia.is_active = false
			await nyambung_kabel.kabel_selesai
			manusia.is_active = true
			queue_free()
		else:
			hint.show()
			hint2.show()
