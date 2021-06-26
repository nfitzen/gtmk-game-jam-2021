# SPDX-FileCopyrightText: 2021 daatguy
#
# SPDX-License-Identifier: GPL-3.0-or-later

extends KinematicBody2D

export var player_range = 100
export var post_this_bullet : PackedScene

func _physics_process(delta):
    var vel = ($"../player".get_global_position()-get_global_position()).normalized()*32
    move_and_slide(vel)
    if(randf()>0.995):
        shoot()

func shoot():
    var bullet = post_this_bullet.instance()
    bullet.vel = ($"../player".get_global_position()-get_global_position()).normalized()*2
    bullet.position = get_global_position()
    $"..".call_deferred("add_child", bullet)
