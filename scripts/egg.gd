extends Sprite2D

signal cracked  # Sinal emitido ao final da animação

@onready var timer = $Timer
@onready var tween := create_tween()

@export var sprite_texture : Texture2D  # ← Sprite configurável no editor

func _ready() -> void:
	if sprite_texture:
		texture = sprite_texture  # Aplica a textura ao Sprite2D
	start_crack_animation()

func _process(_delta: float) -> void:
	pass

func start_crack_animation() -> void:
	var shake_amount = deg_to_rad(15)
	var duration = 0.2

	for i in range(3):
		tween.tween_property(self, "rotation", -shake_amount, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self, "rotation",  shake_amount, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

	tween.tween_property(self, "rotation", 0.0, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

	tween.tween_callback(Callable(self, "_emit_cracked_signal"))
	tween.tween_callback(Callable(self, "queue_free"))

func _emit_cracked_signal() -> void:
	emit_signal("cracked")
