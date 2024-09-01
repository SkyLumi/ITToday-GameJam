extends Control

@warning_ignore("unused_signal")
signal kabel_selesai

var correct_pairs = {
	"BiruKiri": "BiruKanan",
	"UnguKiri": "UnguKanan",
	"HijauKiri": "HijauKanan",
	"OrenKiri": "OrenKanan",
	"KuningKiri": "KuningKanan",
	"MerahKiri": "MerahKanan"
}

var matched_pairs: int = 0
var selected_left_button: TextureButton = null

func _ready():
	# Connect all left-side buttons using Callable
	$BiruKiri.pressed.connect(Callable(self, "_on_left_button_pressed").bind("BiruKiri"))
	$UnguKiri.pressed.connect(Callable(self, "_on_left_button_pressed").bind("UnguKiri"))
	$HijauKiri.pressed.connect(Callable(self, "_on_left_button_pressed").bind("HijauKiri"))
	$OrenKiri.pressed.connect(Callable(self, "_on_left_button_pressed").bind("OrenKiri"))
	$KuningKiri.pressed.connect(Callable(self, "_on_left_button_pressed").bind("KuningKiri"))
	$MerahKiri.pressed.connect(Callable(self, "_on_left_button_pressed").bind("MerahKiri"))

	# Connect all right-side buttons using Callable
	$BiruKanan.pressed.connect(Callable(self, "_on_right_button_pressed").bind("BiruKanan"))
	$UnguKanan.pressed.connect(Callable(self, "_on_right_button_pressed").bind("UnguKanan"))
	$HijauKanan.pressed.connect(Callable(self, "_on_right_button_pressed").bind("HijauKanan"))
	$OrenKanan.pressed.connect(Callable(self, "_on_right_button_pressed").bind("OrenKanan"))
	$KuningKanan.pressed.connect(Callable(self, "_on_right_button_pressed").bind("KuningKanan"))
	$MerahKanan.pressed.connect(Callable(self, "_on_right_button_pressed").bind("MerahKanan"))

func _on_left_button_pressed(button_name: StringName):
	selected_left_button = get_node(NodePath(button_name)) 

func _on_right_button_pressed(button_name: StringName):
	if selected_left_button == null:
		return

	if correct_pairs[selected_left_button.name] == button_name:
		selected_left_button.disabled = true
		get_node(NodePath(button_name)).disabled = true 
		
		_show_wire(selected_left_button.name)
		
		matched_pairs += 1
		
		if matched_pairs == correct_pairs.size():
			emit_signal("kabel_selesai")
			
			_close_gui()
			
	else:
		pass

	# Reset selection
	selected_left_button = null


func _show_wire(left_button_name: StringName):
	var wire_mapping = {
		"BiruKiri": "wireBiru",
		"UnguKiri": "wireUngu",
		"HijauKiri": "wireHijau",
		"OrenKiri": "wireOren",
		"KuningKiri": "wireKuning",
		"MerahKiri": "wireMerah"
		}

	var wire_name = wire_mapping[left_button_name]

	if wire_name != null:
		get_node(NodePath(wire_name)).visible = true
	else:
		pass

func _close_gui():
	self.visible = false
