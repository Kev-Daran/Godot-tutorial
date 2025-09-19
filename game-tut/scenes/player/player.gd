extends CharacterBody2D

var can_laser : bool = true
var can_grenade : bool = true

signal laser(pos, direction)
signal grenade(pos, direction)

func _process(_delta: float):
	
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	
	# laser and grenade shooting input
	if Input.is_action_pressed("primary action") and can_laser:
		
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		var player_direction = (get_global_mouse_position() - position).normalized()
		laser.emit(selected_laser.global_position, player_direction)
		can_laser = false
		$LaserTimer.start()
		

	if Input.is_action_pressed("secondary action") and can_grenade:
		
		var grenade_markers = $LaserStartPositions.get_children()
		var selected_grenade = grenade_markers[0]
		var player_direction = (get_global_mouse_position() - position).normalized()
		
		grenade.emit(selected_grenade.global_position, player_direction)
		can_grenade = false
		$GrenadeTimer.start()
		
	# Rotate
	look_at(get_global_mouse_position())
		


func _on_laser_timer_timeout() -> void:
	can_laser = true


func _on_grenade_timer_timeout() -> void:
	can_grenade = true


func _on_laser(pos: Variant, direction: Variant) -> void:
	pass # Replace with function body.
