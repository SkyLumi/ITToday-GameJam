extends PathFollow2D

@onready var posisi_terakhir = position
var speed = 0.15

func _process(delta: float) -> void:
	if Global.player_jalan:
		progress_ratio += delta * speed

	var movement_vector = position - posisi_terakhir
	
	if movement_vector.y > 0:
		$robotMusuh/AnimatedSprite2D.animation = "depan"
		$robotMusuh/Node2D.rotation = 90
	elif movement_vector.y < 0:
		$robotMusuh/AnimatedSprite2D.animation = "belakang"
		$robotMusuh/Node2D.rotation = 270
	elif movement_vector.x > 0:
		$robotMusuh/AnimatedSprite2D.animation = "kanan"
		$robotMusuh/Node2D.rotation = 0
	elif movement_vector.x < 0:
		$robotMusuh/AnimatedSprite2D.animation = "kiri"
		$robotMusuh/Node2D.rotation = 180	
 
	posisi_terakhir = position
