extends Node3D

var mouseInput: Vector2
var cameraRotationX = 0
var cameraRotationY = 0

@export var sens = 0.002

#Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event)-> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		mouseInput += event.relative
		cameraRotationX += -mouseInput.y * sens
		cameraRotationY += -mouseInput.x * sens


#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	cameraRotationX = clamp(cameraRotationX, deg_to_rad(-90), deg_to_rad(90))
	rotation.y = cameraRotationY
	rotation.x = cameraRotationX
	mouseInput = Vector2.ZERO
