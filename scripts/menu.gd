extends Control

export (PackedScene) var juego

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to(juego)