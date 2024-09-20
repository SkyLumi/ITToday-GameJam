extends TextureRect

@warning_ignore("unused_signal")
signal benar_merah

@onready var cocok = false
@onready var hitbox = false
@onready var posisi_awal = $Line2D.get_point_position(1)

func _on_mouse_entered() -> void:
	hitbox = true
	
func _on_mouse_exited() -> void:
	if !Input.is_action_pressed("klik_kiri"):
		hitbox = false
	
func _process(_delta: float) -> void:
	if hitbox and Input.is_action_pressed("klik_kiri"):
		$Line2D.set_point_position(1, get_local_mouse_position())
	elif hitbox and cocok and Input.is_action_just_released("klik_kiri"):
		emit_signal("benar_merah")
		queue_free()
	elif Input.is_action_just_released("klik_kiri"):
		$Line2D.set_point_position(1, posisi_awal)
		hitbox = false

func _on_kuning_kanan_mouse_entered() -> void:
	cocok = true

func _on_kuning_kanan_mouse_exited() -> void:
	cocok = false
