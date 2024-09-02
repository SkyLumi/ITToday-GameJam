extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var pin_tombol = get_node("../CanvasLayer/pin_tombol")

var flashdisk_diambil = false
var sudah_dialog = false

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
	
func _on_interact():
	if flashdisk_diambil and Global.is_manusia:
		pin_tombol.visible = true
	elif flashdisk_diambil and !Global.is_manusia:
		if !sudah_dialog:
			Dialogic.timeline_ended.connect(_on_sudah_dialog)
			Dialogic.start("morse_pintu_flashdisk")
			Global.player_jalan = false
			interaction_area.monitoring = false
		else:
			$morse.play()
	else:
		Dialogic.timeline_ended.connect(_on_sudah_dialog)
		Dialogic.start("morse_pintu_awal")
		Global.player_jalan = false
		interaction_area.monitoring = false

func _on_sudah_dialog():
	Dialogic.timeline_ended.disconnect(_on_sudah_dialog)
	Global.player_jalan = true
	interaction_area.monitoring = true

func _on_flashdisk_flashdisk_diambil() -> void:
	flashdisk_diambil = true


func _on_interaction_area_body_entered(_body: Node2D) -> void:
	interaction_area.action_name = "?"
