extends Area2D

export (PackedScene) var siguienteNivel
export var nivel = 0

func _ready():
	if global.nivelesDesbloqueados.has(nivel):
		$Sprite.set_frame(68)

func _on_puerta_body_entered(body):
	if body.is_in_group("jugador"):
		if global.nivelesDesbloqueados.has(nivel):
			get_tree().change_scene_to(siguienteNivel)