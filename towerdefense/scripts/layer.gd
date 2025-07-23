extends Node2D


@export var enemy = PackedScene



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemy = load("res://scenes/enemys/zombie.tscn")
	var time = randi_range(5, 10)
	$Timer.start(time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var new_instance = enemy.instantiate()
	add_child(new_instance)
	var time = randi_range(5, 20)
	$Timer.start(time)
