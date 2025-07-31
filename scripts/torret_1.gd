extends Node2D

@export var data: Duck  # resource externo

@onready var isInTimer: bool = false
@onready var isBeingAtk: bool = false
@onready var currentLife: float = 0  # valor interno que copia o do resource

var can_shoot: bool = false  # Só atira depois que o ovo for chocado

func _ready() -> void:
	$Icon.visible = false
	if data != null:
		currentLife = data.life
	else:
		push_warning("PlantData não foi atribuído!")

func _process(_delta: float) -> void:
	if currentLife <= 0:
		queue_free()

	if isBeingAtk:
		currentLife -= 0.5

	if not data:
		return

	if can_shoot and ($RayCast2D.get_collider() or not data.isAtkDuck) and not isInTimer:
		isInTimer = true
		$Timer.start(data.bulletTime)
	elif not $RayCast2D.get_collider() and not isInTimer:
		$Timer.stop()

func _on_timer_timeout() -> void:
	if not can_shoot or not data:
		return

	var new_instance = data.bullet.instantiate()
	new_instance.position = $Aim.position
	add_child(new_instance)
	isInTimer = false

func _on_egg_cracked() -> void:
	can_shoot = true
	$Icon.visible = true

func _on_hitbox_body_entered(_body: Node2D) -> void:
	isBeingAtk = true

func _on_hitbox_body_exited(body: Node2D) -> void:
	isBeingAtk = false
