extends Control

var original_size = Vector2()  # Menyimpan ukuran awal
var dragging = false  # Untuk mendeteksi apakah sedang di-drag
var start_mouse_pos = Vector2()  # Menyimpan posisi mouse saat klik dimulai
var start_scale = Vector2()  # Menyimpan skala awal saat klik dimulai

func _ready():
	# Menyimpan ukuran asli untuk referensi
	original_size = $MerahKiri.scale

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			dragging = true
			# Menyimpan posisi mouse dan skala saat klik dimulai
			start_mouse_pos = get_global_mouse_position()
			start_scale = $MerahKiri.scale
		elif event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			# Jika klik kiri dilepas, hentikan drag
			dragging = false
			# Mengembalikan skala ke ukuran asli
			$MerahKiri.scale = original_size

func _process(_delta):
	if dragging:
		var current_mouse_pos = get_global_mouse_position()
		# Menghitung delta (perbedaan) antara posisi mouse awal dan posisi mouse saat ini
		var delta_mouse = current_mouse_pos.x - start_mouse_pos.x
		
		# Mengubah skala berdasarkan perbedaan posisi mouse
		# Perbesar atau perkecil skala sumbu X berdasarkan perubahan posisi mouse
		$MerahKiri.scale = Vector2(start_scale.x + delta_mouse / 40, original_size.y)
