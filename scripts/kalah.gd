extends Node2D

@warning_ignore("unused_signal")
signal ketahuan

func _process(_delta: float) -> void:
	if Global.ketahuan:
		emit_signal("ketahuan")
