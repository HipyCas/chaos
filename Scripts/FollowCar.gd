extends Spatial

onready var car = get_node("../Car")

func _physics_process(delta):
	global_transform.origin.z = car.global_transform.origin.z
