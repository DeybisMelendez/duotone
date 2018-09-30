extends KinematicBody2D

var vel = 150
var dir = 0
var grav = 20
var mov = Vector2()
var salto = 350

var anim = ""
var nuevoAnim = ""
var inicioPos = Vector2()
func _ready():
	inicioPos = global_position
func _physics_process(delta):
	
	if Input.is_action_pressed( "derecha" ):
		dir = 1
		$Sprite.flip_h = false
	elif Input.is_action_pressed( "izquierda" ):
		dir = -1
		$Sprite.flip_h = true
	else:
		dir = 0
	if Input.is_action_just_pressed( "salto" ) and is_on_floor():
		mov.y -= salto
		global.get_node("salto").play()
	
	mov.y += grav
	mov.y = clamp(mov.y,-salto,salto)
	mov.x = dir * vel
	mov = move_and_slide( mov , Vector2(0 , -1) )
	
	if is_on_floor():
		if dir == 0:
			nuevoAnim = "parado"
		else:
			nuevoAnim = "correr"
	else:
		nuevoAnim = "salto"
	
	if anim != nuevoAnim:
		anim = nuevoAnim
		$anim.play(anim)
		if dir == 0:
			$Sprite.flip_h = !$Sprite.flip_h #La animacion original de parado esta volteada, con esto lo reparo

func morir():
	global.get_node("golpe").play()
	get_tree().reload_current_scene()