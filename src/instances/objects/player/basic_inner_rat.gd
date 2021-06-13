extends RigidBody2D

var center
export var ass = Vector2(0,0)

func _physics_process(delta):
    var force = position.direction_to(center.position)
    force *= position.distance_to(center.position) - 100
    add_force(ass, force)
