extends CharacterBody2D

@export var speed = 100
@export var is_active = false

func get_input():
	if is_active:
		var input_direction = Input.get_vector("jalan_kiri", "jalan_kanan", "jalan_depan", "jalan_belakang")
		velocity = input_direction * speed
		if input_direction.y > 0:
			$AnimatedSprite2D.play()
		elif input_direction.y < 0:
			$AnimatedSprite2D.play()
		else:
			$AnimatedSprite2D.stop()
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.stop()
func _physics_process(_delta):
	get_input()
	move_and_slide()
