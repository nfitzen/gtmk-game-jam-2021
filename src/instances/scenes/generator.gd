# SPDX-FileCopyrightText: 2021 nfitzen
#
# SPDX-License-Identifier: GPL-3.0-or-later

extends Node

const RandomSpawner = preload("res://instances/spawners/random/random.tscn")

export var radius_variance = 80

onready var scene = $".."

var camera

func _ready():
    print(scene.name)
    scene.connect("ready", self, "_on_main_ready")

func _on_main_ready():
    camera = scene.get_node("camera")

    var min_radius = max(camera.zoom.x, camera.zoom.y) / 5

    var max_radius = min_radius + radius_variance

    var angle = rand_range(0, 2*PI)
    var direction = Vector2.RIGHT.rotated(angle)
    var distance = rand_range(min_radius, max_radius)
    var displacement = distance * direction

    spawn_group(displacement)


func _on_banner_killed():

    var min_radius = max(camera.zoom.x * 1024, camera.zoom.y * 600) / 2

    var max_radius = min_radius + radius_variance

    var angle = rand_range(0, 2*PI)
    var direction = Vector2.RIGHT.rotated(angle)
    var distance = rand_range(min_radius, max_radius)
    var displacement = distance * direction

    spawn_group(displacement)

func spawn_group(displacement: Vector2):

    print("spawned at")
    print(displacement)

    var spawner = RandomSpawner.instance()
    spawner.global_position = scene.get_node("player").global_position + displacement

    var count = randi() % 3 + 5

    spawner.min_radius = 40
    spawner.max_radius = 220
    spawner.count = count

    add_child(spawner)
