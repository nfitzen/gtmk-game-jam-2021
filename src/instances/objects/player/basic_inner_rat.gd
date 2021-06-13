extends KinematicBody2D

var index

func _on_player_adjust():
    position = Vector2($"../..".wheel_radius, 0).rotated(TAU*index/$"..".get_child_count())
    print(index)
