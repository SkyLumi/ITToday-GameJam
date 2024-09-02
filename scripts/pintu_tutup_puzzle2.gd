extends Sprite2D

func _ready() -> void:
	if Global.pintu_map3_terbuka:
		queue_free()

func _on_sudoku_tombol_benar() -> void:
	
	queue_free()
