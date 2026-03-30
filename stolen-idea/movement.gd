extends RigidBody3D

@export var MAXSPEED = 10.0
@export var ACC = 1.0
@export var JUMP_VELOCITY = 4.5


func _physics_process(_delta: float) -> void:
	
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = ($camAnchor.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		print(direction)
		apply_impulse(direction * ACC * Vector3(1,0,1).normalized())
	
