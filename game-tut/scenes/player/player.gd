extends CharacterBody2D


func _process(_delta: float):
	
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	
	# laser and grenade shooting input
	if Input.is_action_pressed("primary action"):
		print("Shoot laser")

	if Input.is_action_pressed("secondary action"):
		print("Shoot grenade")
