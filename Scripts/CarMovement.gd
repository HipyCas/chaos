extends KinematicBody

const acceleration = 2
const friction = .85

const defaultFov = 80

onready var cameraDefault = $Camera.rotation_degrees

var velocity = Vector3.ZERO
var input_vector = Vector3()

onready var luggageScene = preload("res://Luggage.tscn")
const MAX_LUGGAGE_ROTATION = 200

func _start():
	randomize() # Initialize random seed

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
	
#	if Input.is_key_pressed(KEY_L):
	if Input.is_action_just_pressed("luggage_drop"):
		var luggage = luggageScene.instance()
		luggage.add_torque(Vector3(randi() % MAX_LUGGAGE_ROTATION, randi() % MAX_LUGGAGE_ROTATION, randi() % MAX_LUGGAGE_ROTATION))
		luggage.add_central_force(Vector3.FORWARD * 450)
		luggage.global_transform = global_transform
		get_node("..").add_child(luggage)
	
	velocity += input_vector * acceleration
	velocity *= friction
	
	move_and_slide(velocity, Vector3.UP)
	
