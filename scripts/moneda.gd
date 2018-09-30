extends Area2D

func _on_moneda_body_entered(body):
	if body.is_in_group("jugador"):
		global.get_node("moneda").play()
		queue_free()