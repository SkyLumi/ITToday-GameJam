extends Node2D

func _ready() -> void:
	var player = $Players
	player.position = Global.player_position
