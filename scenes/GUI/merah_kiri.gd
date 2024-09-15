extends TextureRect

var original_size = Vector2()  # Menyimpan ukuran awal skala
var original_rotation = 0.0  # Menyimpan rotasi awal
var dragging = false  # Untuk mendeteksi apakah sedang di-drag
var start_mouse_pos = Vector2()  # Menyimpan posisi mouse saat klik dimulai
var start_scale = Vector2()  # Menyimpan skala awal saat klik dimulai
var rotation_speed = 0.004  # Kecepatan rotasi berdasarkan posisi Y mouse

func _ready():
	# Menyimpan ukuran, rotasi, dan posisi asli untuk referensi
	original_size = self.scale
	original_rotation = self.rotation

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			dragging = true
			# Menyimpan posisi mouse, skala, rotasi, dan posisi saat klik dimulai
			start_mouse_pos = get_global_mouse_position()
			start_scale = self.scale
			original_rotation = self.rotation
		elif event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			# Jika klik kiri dilepas, hentikan drag
			dragging = false
			# Mengembalikan skala, rotasi, dan posisi ke nilai asli
			self.scale = original_size
			self.rotation = original_rotation

func _process(_delta):
	if dragging:
		var current_mouse_pos = get_global_mouse_position()
		# Menghitung delta (perbedaan) antara posisi mouse awal dan posisi mouse saat ini
		var delta_mouse_x = current_mouse_pos.x - start_mouse_pos.x
		var delta_mouse_y = current_mouse_pos.y - start_mouse_pos.y
		
		# Mengubah skala berdasarkan perbedaan posisi mouse di sumbu X
		self.scale = Vector2(start_scale.x + delta_mouse_x / 40, original_size.y)
		
		# Mengubah rotasi berdasarkan perbedaan posisi mouse di sumbu Y
		self.rotation = original_rotation + delta_mouse_y * rotation_speed
