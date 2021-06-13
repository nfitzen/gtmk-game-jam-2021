# SPDX-FileCopyrightText: 2021 nfitzen
#
# SPDX-License-Identifier: GPL-3.0-or-later

extends Node2D

export onready var health = 5

var generator

signal banner_killed

func _ready():
    generator = $"../Generator"
    connect("banner_killed", generator, "_on_banner_killed")

func _process(_delta):

    if Input.is_action_just_pressed("test_damage"):
        health -= 1

    if health <= 0:
        emit_signal("banner_killed")
        queue_free()
