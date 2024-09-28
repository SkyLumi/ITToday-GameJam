extends Node2D

@onready var posisi_awal_manusia = $Players/Manusia.position
@onready var posisi_awal_robot = $Players/Robot.position

func _process(_delta: float) -> void:
	$Players/Robot/CollisionShape2D.disabled = false
	if Global.ketahuan:
		$Path2D/PathFollow2D.progress_ratio = 0
		$Players/Manusia.position = posisi_awal_manusia
		$Players/Robot.position = posisi_awal_robot
		Global.ketahuan = false
