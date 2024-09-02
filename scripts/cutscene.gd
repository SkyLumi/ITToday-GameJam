extends Node2D

@onready var transisi = $CanvasLayer/Transition
@onready var colorRect = $CanvasLayer/Transition/ColorRect

func _ready() -> void:
	fade_out()
	$anim.play('new_animation')
	$Robot/AnimatedSprite2D.animation='depan'
	Dialogic.start('full_1')
	Dialogic.signal_event.connect(_on_dialogic_signal)
	
func _on_dialogic_signal(argument:String):
	if argument == 'ahan_datang':
		$anim.play('ahan_datang')
		$Manusia/AnimatedSprite2D.animation='depan'
		$Manusia/AnimatedSprite2D.play()

func fade_out():
	colorRect.visible = true
	transisi.play("fade_in")
	await transisi.animation_finished
	colorRect.visible = false
