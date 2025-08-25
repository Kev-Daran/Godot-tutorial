extends Node2D

var laser_scene : PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene : PackedScene = preload("res://scenes/projectiles/grenade.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


# 4:23:13


func _on_area_2d_body_entered(_body: Node2D) -> void:
	pass # Replace with function body.


func _on_gate_player_entered_gate() -> void:
	print("Player has entered gate")


func _on_player_laser(pos, direction) -> void:
	var laser = laser_scene.instantiate() as Area2D
	laser.rotation_degrees = $Player.rotation_degrees + 90
	laser.position = pos
	laser.direction = direction
	$Projectiles.add_child(laser)


func _on_player_grenade(pos, direction) -> void:
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
