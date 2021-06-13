# SPDX-FileCopyrightText: 2021 daatguy
#
# SPDX-License-Identifier: GPL-3.0-or-later

extends Area2D

var vel : Vector2 = Vector2(0,0)

func _ready():
    connect("area_entered", self, "_on_area_entered")

func _physics_process(delta):
    position+= vel
    
func _on_area_entered(body):
    $"../player".remove_rat()
    queue_free()
