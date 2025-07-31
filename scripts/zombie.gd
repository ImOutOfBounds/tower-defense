extends CharacterBody2D

@onready var life = 100
@onready var tween := create_tween()
@onready var baseSpeed = Vector2(50, 0)
@onready var currentSpeed = baseSpeed

var base_y : float

func _ready() -> void:
	base_y = position.y
	start_bobbing_animation()

func _physics_process(delta: float) -> void:
	if Global.isPaused:
		velocity = Vector2.ZERO  # Parado
		return  # Ignora o resto do código se estiver pausado

	velocity = -currentSpeed
	move_and_slide()

	if life <= 0:
		queue_free()

func start_bobbing_animation() -> void:
	var duration = 0.5
	var offset = 10

	tween.set_loops()
	tween.tween_property(self, "position:y", base_y - offset, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position:y", base_y, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
