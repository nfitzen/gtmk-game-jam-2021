# SPDX-FileCopyrightText: 2021 daatguy
#
# SPDX-License-Identifier: GPL-3.0-or-later

extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
    $"sprite".playing= true
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if($"sprite".frame==10):
        $"sprite".animation="idle"
