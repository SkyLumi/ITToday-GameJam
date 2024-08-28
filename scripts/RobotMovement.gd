extends CharacterBody2D

@export var speed = 80
@export var is_active = false

func get_input():
	if is_active:
		var input_direction = Input.get_vector("jalan_kiri", "jalan_kanan", "jalan_depan", "jalan_belakang")
		velocity = input_direction * speed
		
		if input_direction.y < 0:  # Gerakan ke atas (W)
			$AnimatedSprite2D.animation = "depan"
		elif input_direction.y > 0:  # Gerakan ke bawah (S)
			$AnimatedSprite2D.animation = "belakang"
		elif input_direction.x < 0:  # Gerakan ke kiri (A)
			$AnimatedSprite2D.animation = "kiri"
		elif input_direction.x > 0:  # Gerakan ke kanan (D)
			$AnimatedSprite2D.animation = "kanan"
	else:
		velocity = Vector2.ZERO

func _physics_process(_delta):
	get_input()
	move_and_slide()
