extends RigidBody2D

var center
export var ass = Vector2(0,0)


func _physics_process(delta):
    linear_velocity = position.direction_to(center.position) * (
            position.distance_to(center.position) - center.wheel_radius
        ) * 9
    if position.distance_to(center.position) < center.wheel_radius:
        linear_velocity *= 3 * len(center.rats)
    for rat in center.rats:
        linear_velocity += rat.position.direction_to(position) * 500 / len(center.rats)
