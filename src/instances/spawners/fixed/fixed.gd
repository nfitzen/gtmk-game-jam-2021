# SPDX-FileCopyrightText: 2021 nfitzen
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Doesn't work, because we need to copy over the children's global position.

extends Node2D

func _ready():
    var parent = get_tree().get_root()
    print(parent.name)
    for child in get_children():
        # print(child.name)
        remove_child(child)
        parent.call_deferred("add_child", child)

    print(get_children())

    queue_free()
