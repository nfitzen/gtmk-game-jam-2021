extends RigidBody2D

var center
export var ass = Vector2(0,0)

func manage_tail(dist):
    $"tail".clear()
    for i in range(int(dist/64*1.412-0.3)):
        $"tail".set_cell(-1-i, i, $"tail".get_tileset().find_tile_by_name("tail"))

func _process(delta):
    if(linear_velocity.length()>10 and abs(linear_velocity.angle()-rotation)<1.4):
        if($sprite.animation!="walk"):
            $"sprite".animation = "walk"
    else:
        if($sprite.animation!="idle"):
            $"sprite".animation = "idle"

func _physics_process(delta):
    var to_center = position.direction_to(center.position)
    # Tails
    manage_tail(position.distance_to(center.position))
    
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
    angular_velocity = position.angle_to_point(center.position) - rotation
    if abs(angular_velocity) > PI:
        angular_velocity -= stepify(angular_velocity, PI) # if you're wondering why this isn't just fmod, that's a good question
    angular_velocity *= 15
    
    var cw = int(Input.is_action_pressed("turn_cw"))
    var ccw = int(Input.is_action_pressed("turn_ccw"))
    linear_velocity += position.direction_to(center.position).tangent() * (cw - ccw) * 120
