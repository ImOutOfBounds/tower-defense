extends Node2D

@export var bullet : PackedScene
@onready var isInTimer = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $RayCast2D.get_collider() and not isInTimer:
		isInTimer = true
		$Timer.start(1)
	elif not $RayCast2D.get_collider() and not isInTimer:
		$Timer.stop() 


func _on_timer_timeout() -> void:
	var new_instance = bullet.instantiate()
	new_instance.position = $Aim.position
	add_child(new_instance)
	isInTimer = false
