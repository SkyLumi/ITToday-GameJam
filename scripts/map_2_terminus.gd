extends Node2D

func _process(_delta: float) -> void:
	$Players/Robot/CollisionShape2D.disabled = false
