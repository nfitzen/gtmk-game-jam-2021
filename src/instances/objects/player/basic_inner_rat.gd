extends RigidBody2D

var center
export var ass = Vector2(0,0)


func _physics_process(delta):
    var to_center = position.direction_to(center.position)
    linear_velocity = to_center * (
            position.distance_to(center.position) - center.wheel_radius
        ) * 9
    if position.distance_to(center.position) < center.wheel_radius:
        linear_velocity *= 10 * len(center.rats)
    for rat in center.rats:
        if rat != self:
            var nudge = rat.position.direction_to(position) * 500000
            nudge /= max(position.distance_to(rat.position), position.distance_squared_to(rat.position))
            linear_velocity += nudge
