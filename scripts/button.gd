extends TextureButton


@export var text = ""
func _ready() -> void:
	$RichTextLabel.text = text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
