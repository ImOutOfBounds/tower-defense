extends TextureRect

@export var plant : PackedScene


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var new_instance = plant.instantiate()
			add_child(new_instance)
