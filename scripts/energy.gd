extends Area2D

var tween_started := false
var target_position := Vector2.ZERO

func _ready() -> void:
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_OUT)
	var direction = Vector2(randf_range(-3.0, 3.0) * 50, randf_range(-3.0, 3.0) * 50)
	# Calcula a posição final (mais alta e para o lado)
	target_position = global_position + Vector2(direction)
	# Começa a animação de posição
	tween.tween_property(self, "global_position", target_position, 0.5)
	tween_started = true


func _process(delta: float) -> void:
	# Você pode adicionar lógica extra aqui se quiser algo contínuo
	pass


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		Global.nrg += 25
		queue_free()
