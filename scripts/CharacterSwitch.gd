extends Node2D

@export var Robot: NodePath = "Robot"
@export var Manusia: NodePath = "Manusia"

var active_character
var manusia
var robot

func _ready():
	manusia = get_node("Manusia")
	robot = get_node("Robot")
	
func switch_character():
	if active_character == robot:
		active_character = manusia
	else:
		active_character =  robot
	update_characters()

func update_characters():
	robot.set("is_active", active_character == robot)
	manusia.set("is_active", active_character == manusia)
	
	if active_character == manusia:
		manusia.get_node("Camera2D").make_current()
		manusia.get_node("plumbob").visible = true
		robot.get_node("plumbob").visible = false
	elif active_character == robot:
		robot.get_node("Camera2D").make_current()
		robot.get_node("plumbob").visible = true
		manusia.get_node("plumbob").visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("switch"):
		switch_character()
