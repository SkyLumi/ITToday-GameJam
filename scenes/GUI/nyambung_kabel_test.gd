extends Control

# Store the drag state and connections
var dragging_wire = false
var wire_start_pos = Vector2()
var selected_connector = null
var current_wire = null
var connections = {}

# Define the connection points (left and right connectors)
@onready var left_connectors = $PanelContainer_Left.get_children()
@onready var right_connectors = $PanelContainer_Right.get_children()

# Called when the user starts dragging from a connector
func _on_connector_mouse_entered(connector):
	if Input.is_action_pressed("ui_select"):
		dragging_wire = true
		selected_connector = connector
		wire_start_pos = connector.global_position
		current_wire = Line2D.new()
		add_child(current_wire)
		current_wire.add_point(wire_start_pos)

# Called while dragging the wire
func _process(delta):
	if dragging_wire and selected_connector:
		var mouse_pos = get_global_mouse_position()
		current_wire.set_point_position(1, mouse_pos)
		
# When the wire is dropped
func _on_connector_mouse_exited(connector):
	if dragging_wire and Input.is_action_just_released("ui_select"):
		dragging_wire = false
		var mouse_pos = get_global_mouse_position()
		for right_connector in right_connectors:
			if right_connector.get_global_rect().has_point(mouse_pos):
				complete_connection(selected_connector, right_connector)
				break
	else:
		remove_child(current_wire)
		current_wire.queue_free()

# Complete the connection between two connectors
func complete_connection(left_connector, right_connector):
	current_wire.set_point_position(1, right_connector.global_position)
	connections[left_connector] = right_connector
	selected_connector = null
	current_wire = null

# Reset all connections
func reset_connections():
	for wire in get_children():
		if wire is Line2D:
			remove_child(wire)
			wire.queue_free()
	connections.clear()
