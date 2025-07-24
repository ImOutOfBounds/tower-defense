extends Node2D


func _physics_process(_delta: float) -> void:
	position.x += 4


func _on_body_entered(body: Node2D) -> void:
	if ("life" in body):
		body.life -= 25
	queue_free()
