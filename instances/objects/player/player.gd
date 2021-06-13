extends Spatial

# For locking rotaiion, for when you are just one rat
var qelocked = false

func _physics_process(delta):
    var right = int(Input.is_action_pressed("right"));
    var left = int(Input.is_action_pressed("left"));
    var up = int(Input.is_action_pressed("up"));
    var down = int(Input.is_action_pressed("down"));
    translation += Vector3(left-right,up-down,0) * .05
    if(!qelocked):
        var cw = int(Input.is_action_pressed("turn_cw"));
        var ccw = int(Input.is_action_pressed("turn_ccw"));
        rotation += Vector3(0,0,cw-ccw) * .05
    #position += Vector2(right-left,down-up)*delta*200
