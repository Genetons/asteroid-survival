extends Area2D

@export var mass: float = 3000.0
@export var gravitational_pull: float = 2000.0
@onready var effect_radius := $CollisionShape2D.shape.radius

func _process(delta):
    for body in get_overlapping_bodies():
        if body is RigidBody2D:
            var dir = global_position - body.global_position
            var dist_sq = dir.length_squared()
            if dist_sq > 0:
                var force = dir.normalized() * gravitational_pull * (mass / dist_sq)
                body.apply_central_force(force)
