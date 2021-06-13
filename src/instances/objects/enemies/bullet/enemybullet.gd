# SPDX-FileCopyrightText: 2021 daatguy
#
# SPDX-License-Identifier: GPL-3.0-or-later

extends Area2D

func _ready():
    connect("area_entered", self, "_on_area_entered")

func _on_area_entered(body):
    print("hi")
    $"../player".remove_rat()
    queue_free()
