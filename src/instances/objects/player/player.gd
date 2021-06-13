# SPDX-FileCopyrightText: 2021 UnrelatedString
#
# SPDX-License-Identifier: GPL-3.0-or-later

extends KinematicBody2D

export var speed = 220
export var vertical_mul = 1.0 # if we want to account for the perspective or some shit
export var initial_radius = 300
export var post_this_rat : PackedScene

func _ready():
    pass # Replace with function body.

func _process(delta):
    # lmao
    if Input.is_key_pressed(32):
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
    var new_rat = post_this_rat.instance()
    $"./other rats".add_child(new_rat)
