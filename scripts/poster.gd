extends Sprite2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var start_puzzle = preload("res://scenes/puzzle1.tscn") as PackedScene
@onready var transisi = get_node("../CanvasLayer/Transition")
@onready var colorRect = get_node("../CanvasLayer/Transition/ColorRect")


func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	if Global.poster_removed_status:
		hide()
		interaction_area.action_name = "masuk"
	
func _on_interact():
	if Global.poster_removed_status:
		Global.player_position = Vector2(833,385)
		colorRect.visible = true
		transisi.play("fade_out")
		await transisi.animation_finished
		colorRect.visible = false
		get_tree().change_scene_to_packed(start_puzzle)
	elif Global.is_manusia:
		hide()
		interaction_area.action_name = "masuk"
		pause()
		Dialogic.timeline_ended.connect(_on_dialog_selesai)
		Dialogic.start("pintu_rahasia")

func _on_dialog_selesai():
	Dialogic.timeline_ended.disconnect(_on_dialog_selesai)
	resume()
	Global.poster_removed_status = true

func pause():
	Global.player_jalan = false
	interaction_area.monitoring = false

func resume():
	Global.player_jalan = true
	interaction_area.monitoring = true
