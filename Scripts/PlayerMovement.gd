extends KinematicBody

const ACCELERATION = 15
const FRICTION = 15
const MAX_SPEED = 60
const MIN_SPEED = 15

var velocity = Vector3()

func _physics_process(delta):
	var input_vector = Vector3.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	print('input', input_vector)

	if input_vector != Vector3.ZERO:
		if input_vector.z <= 0:
			velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		else:
			velocity = velocity.move_toward(MIN_SPEED * Vector3.FORWARD, ACCELERATION * delta)
			if velocity.z < -MIN_SPEED: velocity.z = min(velocity.z, -MIN_SPEED)
	else:
		velocity = velocity.move_toward(MIN_SPEED * Vector3.FORWARD, FRICTION * delta)

	print(velocity)
	velocity = move_and_slide(velocity)
