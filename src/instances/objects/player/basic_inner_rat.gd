extends RigidBody2D

var center
export var ass = Vector2(0,0)


func _physics_process(delta):
    linear_velocity = position.direction_to(center.position) * (
            position.distance_to(center.position) - center.wheel_radius
        ) * 9
