extends Control

@warning_ignore("unused_signal")
signal password_benar

@onready var masukkan = $masukkan
@onready var password = "soluswangy"

var sekali = true

func _process(_delta: float) -> void:
	if visible and sekali:
		masukkan.grab_focus()
		Global.player_jalan = false
		sekali = false


func _on_silang_pressed() -> void:
	masukkan.release_focus()
	sekali = true
	hide()
	Global.player_jalan = true


func _on_masukkan_text_submitted(_new_text: String) -> void:
	if masukkan.text == password:
		emit_signal("password_benar")
		masukkan.text = ""
		masukkan.placeholder_text = "password benar!"
	else:
		masukkan.text = ""
		masukkan.placeholder_text = "password salah"
