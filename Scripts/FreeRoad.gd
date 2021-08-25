extends Spatial

onready var car = get_node("../../Car")

func _process(delta):
	if global_transform.origin.z - car.global_transform.origin.z > 15:
		queue_free()
