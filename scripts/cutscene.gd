extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$anim.play('new_animation')
	$Robot/AnimatedSprite2D.animation='depan'
	Dialogic.start('full_dialog')
	Dialogic.signal_event.connect(_on_dialogic_signal)
	
func _on_dialogic_signal(argument:String):
	if argument == 'ahan_datang':
		$anim.play('ahan_datang')
		$Manusia/AnimatedSprite2D.animation='depan'
		$Manusia/AnimatedSprite2D.play()
