# SPDX-FileCopyrightText: 2021 UnrelatedString
#
# SPDX-License-Identifier: GPL-3.0-or-later

extends KinematicBody2D

export var speed = 220
export var vertical_mul = 1.0 # if we want to account for the perspective or some shit

func _ready():
    pass # Replace with function body.

func _physics_process(delta):
    var right = int(Input.is_action_pressed("right"))
    var left = int(Input.is_action_pressed("left"))
    var up = int(Input.is_action_pressed("up"))
    var down = int(Input.is_action_pressed("down"))
    var velocity = Vector2(right-left, down-up).normalized() * speed
    velocity.y *= vertical_mul
    move_and_slide(velocity)
    print(position)
