extends Node2D


func _on_static_body_2d_body_entered(body: Node2D) -> void:
	if ("life" in body):
		body.life -= 25
	queue_free()

func _physics_process(delta: float) -> void:
	position.x += 4
