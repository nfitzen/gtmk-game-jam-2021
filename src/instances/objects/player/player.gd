extends Node2D

func _ready():
    pass # Replace with function body.

func _process(delta):
    var right = int(Input.is_action_pressed("right"))
    var left = int(Input.is_action_pressed("left"))
    var up = int(Input.is_action_pressed("up"))
    var down = int(Input.is_action_pressed("down"))
    position += Vector2(right-left, down-up) * delta * 100
    print(position)
