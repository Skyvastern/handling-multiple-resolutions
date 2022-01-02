extends KinematicBody2D


var velocity: Vector2
var dir: float

export(float) var gravity = 2000
export(float) var speed = 250
export(float) var jump_speed = -750



func _physics_process(delta: float) -> void:
	
	# Movement
	dir = 0.0
	if Input.is_action_pressed("right"):
		dir += 1
	elif Input.is_action_pressed("left"):
		dir -= 1
	
	velocity.x = dir * speed
	
	# Animation
	var anim_name = get_animation_name()
	$AnimatedSprite.play(anim_name)
	$AnimatedSprite.flip_h = dir == -1
	
	# Gravity
	velocity.y += gravity * delta
	
	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
	
	# Move
	velocity = move_and_slide(velocity, Vector2.UP)



func get_animation_name():
	if velocity.y != 0:
		return "Jump"
	elif dir == 0:
		return "Idle"
	else:
		return "Walk"
