extends Control

@warning_ignore("unused_signal")
signal kabel_selesai
var done = 0

func _on_kuning_kiri_benar() -> void:
	$wireKuning.show()
	done += 1

func _on_merah_kiri_benar() -> void:
	$wireMerah.show()
	done += 1

func _on_oren_kiri_benar() -> void:
	$wireOren.show()
	done += 1

func _on_hijau_kiri_benar() -> void:
	$wireHijau.show()
	done += 1

func _on_biru_kiri_benar() -> void:
	$wireBiru.show()
	done += 1

func _on_ungu_kiri_benar() -> void:
	$wireUngu.show()
	done += 1

func _process(_delta: float) -> void:
	if done == 6:
		emit_signal("kabel_selesai")
		hide()
