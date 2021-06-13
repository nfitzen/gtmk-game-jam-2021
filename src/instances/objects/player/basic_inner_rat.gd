extends RigidBody2D

var center
export var ass = Vector2(0,0)

func _physics_process(delta):
    var force = position.direction_to(center.position) * .1
    force *= pow(position.distance_to(center.position) - center.wheel_radius, .5)
    add_force(ass, force)
