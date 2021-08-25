extends Spatial

const roadScene = preload("res://Road.tscn")
onready var car = get_node("../Car")
onready var last_road = get_node("Road7")
onready var roadsGroup = get_node(".")
onready var freeRoadScript = load("res://Scripts/FreeRoad.gd")

func _process(delta):
	if (car.global_transform.origin.z - last_road.global_transform.origin.z) / 60 <= 1:
		var new_road = roadScene.instance()
		new_road.set_script(freeRoadScript)
		roadsGroup.add_child(new_road)
		new_road.global_transform = last_road.global_transform
		new_road.global_transform.origin.z = last_road.global_transform.origin.z - 10
		last_road = new_road
