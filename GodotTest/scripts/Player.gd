extends KinematicBody2D

export var speed = 5

const UPDIR = Vector2(0,-1)

var motion = Vector2(0,0)
var gravity = 1000
func movement(delta: float) -> void:
	
	motion.x = 0
	motion.y += 20
	if is_on_floor():
		motion.y = 0
	
	if Input.is_action_pressed("right"):
		motion.x = + speed / delta
		
	if Input.is_action_pressed("left"):
		motion.x = - speed / delta
	if Input.is_action_pressed("up") and is_on_floor():
		motion.y -= speed * 2 / delta
	
	move_and_slide(motion,UPDIR)

func _ready() -> void:
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	movement(delta)
	
