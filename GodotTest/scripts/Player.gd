extends KinematicBody2D

export var speed = 1000
var motion = Vector2(0,0)
var gravity = 1000
func movement(delta: float) -> void:
	
	motion.x = 0
	if motion.y < gravity:
		motion.y += speed * delta
	if is_on_wall():
		motion.y = 0
	
	if Input.is_action_pressed("right"):
		motion.x = + speed * delta * 20
	if Input.is_action_pressed("left"):
		motion.x = - speed * delta * 20
	if Input.is_action_pressed("up") and is_on_wall():
		motion.y -= speed * delta * 50
	if Input.is_action_just_released("up") and motion.y < 0:
		motion.y += speed * delta * 20
	
	move_and_slide(motion)

func _ready() -> void:
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	movement(delta)
	
