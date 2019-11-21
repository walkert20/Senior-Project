extends KinematicBody2D

var motion = Vector2()
const GRAVITY = 20
const ACCELERATION = 50
const MAX_SPEED = 200
const JUMP_HEIGHT = -500
const UP = Vector2(0, -1)

func _physics_process(delta):
	var FRICTION = false
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		#$Sprite.flip_h = false
		#$Sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		#$Sprite.flip_h = true
		#$Sprite.play("run")
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		#$Sprite.play("idle")
		FRICTION = true
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if FRICTION == true:
			motion.x = lerp(motion.x, 0, 0.2)
			
	#else:
	#	if motion.y < 0:
	#		$Sprite.play("jump")
	#	else:
	#		$Sprite.play("fall")
	#	if FRICTION == true:
	#		motion.x = lerp(motion.x, 0, 0.05)

	motion = move_and_slide(motion, UP)
