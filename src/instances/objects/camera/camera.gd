extends Camera2D

var maxSpeed = 0.07;
var minSpeed = 0.0;
var workingSpeed = maxSpeed;
const bgColor = "#4b1b42"
var nextFramePos = null
var zoomTarget = 0.48
var zoomAmt = 0.48

func _ready():
    VisualServer.set_default_clear_color(Color(bgColor))

# Dont ask why its physics process
# Actually if you really want to know,
# its because regular process makes children 
# lag behind the parent 1 frame for some god forsaken reason
func _physics_process(delta):
    if(nextFramePos!=null):
        position = nextFramePos
        nextFramePos = null
    else:
        position += ($"../player".cameraTarget-position)*workingSpeed
    zoomAmt += (zoomTarget-zoomAmt)*0.05
    zoom = Vector2(zoomAmt, zoomAmt)

func toggleSpeed():
    setSpeed(workingSpeed==minSpeed)

func setSpeed(m:bool):
    if(m):
        workingSpeed = maxSpeed
    else:
        workingSpeed = minSpeed
