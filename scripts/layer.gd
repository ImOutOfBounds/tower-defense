extends Node2D

@export var enemy : PackedScene

var has_started := false  # Impede que o timer inicie mais de uma vez

func _process(_delta: float) -> void:
	if not has_started and not Global.gamePaused:
		start_spawning()

func start_spawning():
	has_started = true
	var time = randi_range(20, 30)
	$Timer.start(time)

func _on_timer_timeout() -> void:
	if Global.gamePaused:
		# Espera o jogo ser despausado novamente
		$Timer.start(1)
		return

	var new_instance = enemy.instantiate()
	new_instance.position = $SpawnPoint.position
	add_child(new_instance)

	var time = randi_range(5, 20)
	$Timer.start(time)
