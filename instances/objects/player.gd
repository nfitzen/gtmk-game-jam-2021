extends Spatial

func _process(delta):
    var right = int(Input.is_action_pressed("ui_right"));
    var left = int(Input.is_action_pressed("ui_left"));
    var up = int(Input.is_action_pressed("ui_up"));
    var down = int(Input.is_action_pressed("ui_down"));
    translation += Vector3(left-right,up-down,0) * .05
    #position += Vector2(right-left,down-up)*delta*200
