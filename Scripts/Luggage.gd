extends RigidBody

func _ready():
	if randi() % 2 == 0:
		$Baggage1.visible = false
		$Baggage2.visible = true
	else:
		$Baggage1.visible = true
		$Baggage2.visible = false
