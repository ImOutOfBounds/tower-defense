extends Node2D


@export var enemy : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var time = randi_range(5, 10)
	$Timer.start(time)


func _on_timer_timeout() -> void:
	var new_instance = enemy.instantiate()
	new_instance.position = $SpawnPoint.position
	add_child(new_instance)
	var time = randi_range(5, 20)
	$Timer.start(time)
