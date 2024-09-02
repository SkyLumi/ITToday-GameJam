extends Control

@warning_ignore("unused_signal")
signal buku_closed

func _on_silang_pressed() -> void:
	hide()
	Global.player_jalan = true
	emit_signal("buku_closed")


func _on_texture_button_pressed() -> void:
	$Label.text = "Komponen yang dibutuhkan untuk menyelesaikan robot:
-Core Terminus
-Kabel
-Tool
-Baterai

Sesuaikan kabel yang terhubung ke dalam core Terminus di dalam tubuh robot. Hubungkan dengan warna yang sama. Pasang baterai setelah seluruh kabel terhubung di dalamnya. Kode untuk mengaktifkan robot tersebut adalah 978234.
"
	$Label2.hide()
	$Tanda_Panah_Kanan.hide()
