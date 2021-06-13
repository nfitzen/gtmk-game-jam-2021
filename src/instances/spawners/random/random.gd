# SPDX-FileCopyrightText: 2021 nfitzen
#
# SPDX-License-Identifier: GPL-3.0-or-later

extends Node2D

onready var scene = $"../.."

const GenericEnemy = preload("res://instances/objects/enemies/genericenemy/genericenemy.tscn")
const BannerEnemy = preload("res://instances/objects/enemies/bannerenemy/bannerenemy.tscn")

var min_radius = 40
var max_radius = 220
var count = 6

func _ready():
    place_enemies()
    queue_free()

func place_enemies():
    var angle
    var direction
    var distance
    var displacement

    for i in range(count):

        var enemy

        angle = rand_range(0, 2*PI)
        direction = Vector2.RIGHT.rotated(angle)
        distance = rand_range(min_radius, max_radius)
        displacement = distance * direction

        if i == count - 1:
            enemy = BannerEnemy.instance()
        else:
            enemy = GenericEnemy.instance()

        enemy.global_position = global_position + displacement

        scene.add_child(enemy)
