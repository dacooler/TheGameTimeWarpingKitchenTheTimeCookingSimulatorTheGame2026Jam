extends Area2D

@onready var plant: Node2D = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_body_entered(body: Node2D):
	if (plant.planted):
		return
	if (plant.seed_to_produce.get(body.type) != null):
		plant.plant(body.type)
		body.queue_free()


	
