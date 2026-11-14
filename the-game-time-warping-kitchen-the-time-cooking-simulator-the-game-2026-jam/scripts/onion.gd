extends RigidBody2D

var is_draged := false
var is_in_basket := true
var is_in_choppingBoard := false
var type: Globals.Produce

@onready var mesh_instance_2d: MeshInstance2D = $MeshInstance2D


func set_type(produce: Globals.Produce):
	type = produce
	if (mesh_instance_2d != null):
		mesh_instance_2d.texture = Globals.produceImages[produce]

func _ready():
	mesh_instance_2d.texture = Globals.produceImages[type]

func _input_event(_viewport, event, _shape_idx):
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
