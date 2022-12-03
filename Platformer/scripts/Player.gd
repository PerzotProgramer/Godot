extends KinematicBody2D

export var speed = 5
export var jump_str = 10
var motion = Vector2()

func move(delta):
	
	motion.x = 0
	
	if motion.y < 1500:
		motion.y += 0.5 / delta
	
	if is_on_floor():
		motion.y = 0
	if is_on_ceiling():
		motion.y = 1
	
	if Input.is_action_pressed("cright"):
		motion.x = + speed / delta
	if Input.is_action_pressed("cleft"):
		motion.x = - speed / delta
	if Input.is_action_pressed("cjump") and is_on_floor():
		motion.y = - jump_str / delta

	move_and_slide(motion,Vector2(0,-1))
	
	
	
func _ready() -> void:
	set_physics_process(true)

func _physics_process(delta: float) -> void:
	move(delta)
