extends CharacterBody2D


const SPEED = 300.0

func _ready() -> void:
	position = Vector2(200, 200)

func _process(delta: float) -> void:
	var direction = Vector2.RIGHT
	
	velocity = direction * SPEED * delta
	
	move_and_slide()
	
func hit():
	print("dmg")
	
