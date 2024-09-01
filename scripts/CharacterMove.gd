extends CharacterBody2D

@export var speed = 80
@export var is_active = false
@export var is_manusia = false

@onready var all_interactions = []
@onready var interactLabel = $"InteractionComponents/Label"

func get_input():
	if is_active:
		var input_direction = Input.get_vector("jalan_kiri", "jalan_kanan", "jalan_depan", "jalan_belakang")
		velocity = input_direction * speed
		
		if input_direction.y < 0:  # Gerakan ke atas (W)
			$AnimatedSprite2D.animation = "depan"
			$AnimatedSprite2D.play()
		elif input_direction.y > 0:  # Gerakan ke bawah (S)
			$AnimatedSprite2D.animation = "belakang"
			$AnimatedSprite2D.play()
		elif input_direction.x < 0:  # Gerakan ke kiri (A)
			$AnimatedSprite2D.animation = "kiri"
			$AnimatedSprite2D.play()
		elif input_direction.x > 0:  # Gerakan ke kanan (D)
			$AnimatedSprite2D.animation = "kanan"
			$AnimatedSprite2D.play()
		else:
			if is_manusia:
				$AnimatedSprite2D.stop()
			else:
				$AnimatedSprite2D.play()
	else:
		velocity = Vector2.ZERO
		if is_manusia:
			$AnimatedSprite2D.stop()
		else:
			$AnimatedSprite2D.play()

func _physics_process(_delta):
	get_input()
	move_and_slide()


func _on_interaction_area_area_entered(area: Area2D) -> void:
	all_interactions.insert(0,area)
	update_interactions()


func _on_interaction_area_area_exited(area: Area2D) -> void:
	all_interactions.erase(area)
	update_interactions()
	
func update_interactions():
	if all_interactions:
		interactLabel.text = all_interactions[0].interact_label
	else:
		interactLabel.text = ""
		
