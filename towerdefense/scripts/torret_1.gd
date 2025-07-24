extends Node2D

@export var bullet : PackedScene
@onready var isInTimer = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $RayCast2D.get_collider() and not isInTimer:
		isInTimer = true
		$Timer.start(1)


func _on_timer_timeout() -> void:
	print("marcao")
	var new_instance = bullet.instantiate()
	new_instance.position = $Aim.position
	add_child(new_instance)
	isInTimer = false
