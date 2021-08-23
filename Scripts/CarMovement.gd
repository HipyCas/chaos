extends KinematicBody

const acceleration = 2
const friction = .85

const defaultFov = 80

var cameraDefault = Vector3()

var velocity = Vector3.ZERO
var input_vector = Vector3()

func _ready():
	cameraDefault = $Camera.rotation_degrees

func _process(delta):
	$Camera.rotation_degrees.y = cameraDefault.y - velocity.x / 2
	$Camera.fov = defaultFov - velocity.z
	$Carv1.rotation_degrees.y = 180 - velocity.x / 2

func _physics_process(delta):
	
	input_vector = Vector3.FORWARD
	
	if Input.is_action_pressed("ui_up"):
		input_vector.z -= 1.5
	if Input.is_action_pressed("ui_down"):
		input_vector.z += .2
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1 
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1 
	
	velocity += input_vector * acceleration
	velocity *= friction
	
	move_and_slide(velocity, Vector3.UP)
	
