extends Node2D

@onready var life = 100
@onready var tween := create_tween()

# Posição original no eixo Y
var base_y : float

func _ready() -> void:
	base_y = position.y
	start_bobbing_animation()

func _process(_delta: float) -> void:
	position.x -= 1
	
	if life <= 0:
		queue_free()

# Faz o objeto "subir e descer" no eixo Y a cada 1 segundo
func start_bobbing_animation() -> void:
	var duration = 0.5  # meio segundo para subir e meio para descer = 1s no total
	var offset = 10     # altura do movimento (pode ajustar)

	tween.set_loops()  # repete infinitamente

	tween.tween_property(self, "position:y", base_y - offset, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position:y", base_y, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
