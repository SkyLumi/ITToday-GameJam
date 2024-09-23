extends TextureButton

@warning_ignore("unused_signal")
signal benar

@onready var cocok = false
@onready var hitbox = false
@onready var posisi_awal = $Line2D.get_point_position(1)

		
func _process(_delta: float) -> void:
	if hitbox and cocok and Input.is_action_just_released("klik_kiri"):
		emit_signal("benar")
		queue_free()
	elif hitbox:
		$Line2D.set_point_position(1, get_local_mouse_position())
		$Line2D.z_index = 1
	elif Input.is_action_just_released("klik_kiri"):
		$Line2D.set_point_position(1, posisi_awal)
		$Line2D.z_index = 0


func _on_button_down() -> void:
	hitbox = true

func _on_button_up() -> void:
	if !cocok:
		hitbox = false


func _on_biru_kanan_mouse_entered() -> void:
	cocok = true


func _on_biru_kanan_mouse_exited() -> void:
	cocok = false
