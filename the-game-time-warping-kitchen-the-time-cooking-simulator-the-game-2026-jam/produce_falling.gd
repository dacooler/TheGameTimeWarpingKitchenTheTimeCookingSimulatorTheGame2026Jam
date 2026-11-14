extends RigidBody2D
@onready var mesh_instance_2d: MeshInstance2D = $MeshInstance2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


var products =[
	Globals.Produce.ONION,
	Globals.Produce.TOMATO,
]

var i_am: Globals.Produce

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	i_am = products.pick_random()
	mesh_instance_2d.texture = Globals.produceImages[i_am]
	var position = randf_range(0, get_viewport_rect().size.x)
	mesh_instance_2d.position.x = position
	collision_shape_2d.position.x = position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				_pressed()
				
func _pressed():
	get_parent().pick_produce(i_am)
	self.queue_free()
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	self.queue_free()
