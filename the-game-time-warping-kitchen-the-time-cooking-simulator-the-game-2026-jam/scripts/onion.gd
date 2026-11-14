extends RigidBody2D

var is_draged := false

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				_pressed()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if !event.pressed:
				_unpressed()
				print("Mouse released!")

func _pressed():
	is_draged = true

func _unpressed():
	is_draged = false

func _process(delta: float):
	if is_draged:
		apply_central_force((get_global_mouse_position() - position) * 1000 * delta)
