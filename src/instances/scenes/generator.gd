# SPDX-FileCopyrightText: 2021 nfitzen
#
# SPDX-License-Identifier: GPL-3.0-or-later

extends Node

const RandomSpawner = preload("res://instances/spawners/random/random.tscn")

export var testposition = Vector2(512, 300)

func _ready():
    var spawner = RandomSpawner.instance()
    spawner.global_position = testposition

    var count = randi() % 3 + 5

    spawner.min_radius = 40
    spawner.max_radius = 220
    spawner.count = count

    get_tree().get_root().call_deferred("add_child", spawner)
