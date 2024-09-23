extends Control

func _ready() -> void:
	hide()
# Called when the node enters the scene tree for the first time.
func resume():
	get_tree().paused = false
	
func pause():
	get_tree().paused = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("escape") and !get_tree().paused and Global.player_jalan:
		pause()
		show()
	elif Input.is_action_just_pressed("escape") and get_tree().paused:
		resume()
		hide()


func _on_continue_pressed() -> void:
	resume()
	hide()


func _on_exit_pressed() -> void:
	get_tree().quit()
