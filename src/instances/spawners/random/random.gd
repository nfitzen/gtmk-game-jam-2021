# SPDX-FileCopyrightText: 2021 nfitzen
#
# SPDX-License-Identifier: GPL-3.0-or-later

extends Node2D

onready var root = get_tree().get_root()

const GenericEnemy = preload("res://instances/objects/enemies/genericenemy/genericenemy.tscn")

var min_radius = 40
var max_radius = 220
var count = 6

func _ready():
    place_enemies()

func place_enemies():
    var angle
    var direction
    var distance
    var displacement

    for _i in range(count):
        angle = rand_range(0, 2*PI)
        direction = Vector2.RIGHT.rotated(angle)
        distance = rand_range(min_radius, max_radius)
        displacement = distance * direction

        var enemy = GenericEnemy.instance()

        enemy.global_position = global_position + displacement

        root.add_child(enemy)
