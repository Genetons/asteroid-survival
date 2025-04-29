extends Area2D

@export var mass: float = 1000.0
@export var repulsion_force: float = 2000.0
@export var shield_radius: float = 150.0

func _ready():
    connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
    if body is RigidBody2D:
        var direction = body.global_position - global_position
        body.apply_impulse(direction.normalized() * repulsion_force)
