extends Spatial

onready var car = get_node("../Car")
onready var carScene = preload("res://TrafficCar.tscn")
onready var distance_from_car = global_transform.origin.z - car.global_transform.origin.z

onready var trafficNode = get_node("../TrafficCars")

var spawn_delay = 1
var timer = 0.0

func _ready():
	randomize()

func _physics_process(delta):
	global_transform.origin.z = car.global_transform.origin.z + distance_from_car
	
	if(timer >= spawn_delay):
		timer -= spawn_delay
		var _car = carScene.instance()
		trafficNode.add_child(_car)
		print(global_transform.origin)
		_car.global_transform = global_transform
		if randi() % 2 == 0:
			_car.global_transform.origin.x -= 2.5
		else:
			_car.global_transform.origin.x += 2.5

	timer += delta
