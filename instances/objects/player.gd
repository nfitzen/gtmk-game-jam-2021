extends Node2D

func _process(delta):
    var right = int(Input.is_action_pressed("ui_right"));
    var left = int(Input.is_action_pressed("ui_left"));
    var up = int(Input.is_action_pressed("ui_up"));
    var down = int(Input.is_action_pressed("ui_down"));
    position += Vector2(1,0)
    #position += Vector2(right-left,down-up)*delta*200
