extends Control

@warning_ignore("unused_signal")
signal buku_closed

func _on_silang_pressed() -> void:
	hide()
	Global.player_jalan = true
	emit_signal("buku_closed")
