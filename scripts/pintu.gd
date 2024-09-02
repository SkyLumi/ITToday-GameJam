extends Sprite2D

func _ready() -> void:
	if Global.pintu_map2_terbuka:
		queue_free()

func _on_pin_tombol_password_benar() -> void:
	queue_free()
