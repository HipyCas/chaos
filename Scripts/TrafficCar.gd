extends KinematicBody

func _physics_process(delta):
	global_transform.origin.z -= 0.05
