extends Control

@onready var silang = $silang

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	silang.pressed.connect(Callable(self, "on_silang_pressed"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_silang_pressed():
	hide()
