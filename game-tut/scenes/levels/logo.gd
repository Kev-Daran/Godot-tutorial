extends Sprite2D

var pos : Vector2 = Vector2.ZERO
var test_scale : Vector2 = Vector2(1,1)
var scale_increment : float = 0.01

func _ready() -> void:
	pos += Vector2(500, 300)
	position = pos
	
func _process(delta: float) -> void:
	test_scale += Vector2(scale_increment, scale_increment)
	scale = test_scale
