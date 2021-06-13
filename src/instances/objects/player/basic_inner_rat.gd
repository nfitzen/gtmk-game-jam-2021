extends RigidBody2D

var center
export var ass = Vector2(0,0)


func _physics_process(delta):
    var to_center = position.direction_to(center.position)
    linear_velocity = to_center * (
            position.distance_to(center.position) - center.wheel_radius
        ) * 9
    if position.distance_to(center.position) < center.wheel_radius:
        linear_velocity *= 3 * len(center.rats)
    for rat in center.rats:
        if rat != self:
            var nudge = rat.position.direction_to(position) * 100
            #nudge /= position.distance_to(rat.position)
            # MOSTLY remove parallel component
            nudge -= to_center * nudge.dot(to_center) * .8
            linear_velocity += nudge
