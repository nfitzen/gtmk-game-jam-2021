extends Area2D

var vel : Vector2 = Vector2(0,0)

func _ready():
    connect("area_entered", self, "_on_area_entered")

func _physics_process(delta):
    position+= vel

func _on_area_entered(body):
    body.queue_free()
    queue_free()
