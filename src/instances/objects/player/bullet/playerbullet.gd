# SPDX-FileCopyrightText: 2021 daatguy
#
# SPDX-License-Identifier: GPL-3.0-or-later

extends Area2D

var vel : Vector2 = Vector2(0,0)

func _ready():
    connect("body_entered", self, "_on_area_entered")

func _physics_process(delta):
    position+= vel

func _on_area_entered(body):
    if(body.is_in_group("bannerenemy")):
        body.health -=1
        if(body.health==0):
            $"../player".add_rat()
    else:
        body.queue_free()
    queue_free()
