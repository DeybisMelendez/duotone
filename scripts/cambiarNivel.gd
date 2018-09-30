extends Area2D

export (PackedScene) var siguienteNivel

func _on_cambiarNivel_body_entered(body):
	if body.is_in_group("jugador"):
		get_tree().change_scene_to(siguienteNivel)