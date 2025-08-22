extends CharacterBody2D

var can_laser : bool = true
var can_grenade : bool = true

signal laser
signal grenade

func _process(_delta: float):
	
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	
	# laser and grenade shooting input
	if Input.is_action_pressed("primary action") and can_laser:
		laser.emit()
		can_laser = false
		$LaserTimer.start()
		

	if Input.is_action_pressed("secondary action") and can_grenade:
		grenade.emit()
		can_grenade = false
		$GrenadeTimer.start()
		


func _on_laser_timer_timeout() -> void:
	can_laser = true


func _on_grenade_timer_timeout() -> void:
	can_grenade = true
