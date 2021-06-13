# SPDX-FileCopyrightText: 2021 UnrelatedString
#
# SPDX-License-Identifier: GPL-3.0-or-later

extends KinematicBody2D

export var speed = 200
export var vertical_mul = 1.0 # if we want to account for the perspective or some shit
export var wheel_radius = 60
export var post_this_rat : PackedScene
var rats = []

func _ready():
    pass # Replace with function body.

func _process(delta):
    # lmao
    if Input.is_action_just_pressed("testing_space"):
        add_rat()

func _physics_process(delta):
    var right = int(Input.is_action_pressed("right"))
    var left = int(Input.is_action_pressed("left"))
    var up = int(Input.is_action_pressed("up"))
    var down = int(Input.is_action_pressed("down"))
    var velocity = Vector2(right-left, down-up).normalized() * speed
    velocity.y *= vertical_mul
    move_and_slide(velocity)

func add_rat():
    var rat = post_this_rat.instance()
    $"..".call_deferred("add_child", rat)
    rat.position = position + Vector2(wheel_radius + 25, 1)
    rat.center = self
    rats.append(rat)
    wheel_radius = max(wheel_radius, len(rats) * 15 / PI)
