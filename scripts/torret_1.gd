extends Node2D

@export var bullet : PackedScene
@onready var isInTimer = false
@export var bulletTime : float = 1
@export var cost : int = 0
@export var isAtkDuck : bool = true
@onready var life : float = 100
@onready var isBeingAtk : bool = false

var can_shoot : bool = false  # Só atira depois que o ovo for chocado

func _ready() -> void:
	# Oculta o Sprite2D no início
	$Icon.visible = false

func _process(_delta: float) -> void:
	# Só atira se o sprite foi "ativado"
	if life <= 0:
		queue_free()
	if isBeingAtk:
		life -= 0.5
	if can_shoot and ($RayCast2D.get_collider() or not isAtkDuck) and not isInTimer:
		isInTimer = true
		$Timer.start(bulletTime)
	elif not $RayCast2D.get_collider() and not isInTimer:
		$Timer.stop()

func _on_timer_timeout() -> void:
	if not can_shoot:
		return

	var new_instance = bullet.instantiate()
	new_instance.position = $Aim.position
	add_child(new_instance)
	isInTimer = false

# Conectado ao sinal "cracked" emitido pelo ovo
func _on_egg_cracked() -> void:
	can_shoot = true
	$Icon.visible = true


func _on_hitbox_body_entered(body: Node2D) -> void:
	isBeingAtk = true
