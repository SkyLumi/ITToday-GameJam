extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
var images = {}
var current_image_index = 0
var initial_image_shown = false
var warna = ""

func change_image():
	var sprite = $Tombol   
	if !initial_image_shown:
		initial_image_shown = true
	else:
		var color_keys = images.keys()
		warna = color_keys[current_image_index]
		sprite.texture = images[warna]
		current_image_index = (current_image_index + 1) % images.size()

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")
	
	images["biru"] = load("res://assets/tilesets/Properties/biru.png")
	images["ijo"] = load("res://assets/tilesets/Properties/ijo.png")
	images["kuning"] = load("res://assets/tilesets/Properties/kuning.png")
	images["merah"] = load("res://assets/tilesets/Properties/merah.png")
	images["pink"] = load("res://assets/tilesets/Properties/pink.png")
	
	change_image()

func _on_interact():
	change_image()

func get_warna():
	return warna
