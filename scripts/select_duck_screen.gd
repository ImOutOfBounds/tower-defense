extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.gamePaused = true

func _on_texture_button_pressed() -> void:
	Global.gamePaused = false
	queue_free()
