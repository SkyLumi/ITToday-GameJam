extends Node2D

@onready var manusia = $Manusia

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start("enter_underlab")
	manusia.is_active = false
	Dialogic.timeline_ended.connect(_on_timeline_ended)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	manusia.is_active = true
