extends Node2D

func _ready() -> void:
	var player = $Player
	player.position = Global.player_position
