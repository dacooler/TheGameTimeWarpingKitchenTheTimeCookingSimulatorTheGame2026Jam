extends Node2D
const ONION = preload("uid://7xo8mbumihps")
@onready var sprout: MeshInstance2D = $Sprout

var type: Globals.Produce

var seed_to_produce = {
	Globals.Produce.ONION_SEED: Globals.Produce.ONION,
	Globals.Produce.TOMATO_SEED: Globals.Produce.TOMATO
}

var planted = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func plant(seed: Globals.Produce):
	sprout.visible = true
	type = seed_to_produce[seed]
	planted = true

func unplant():
	sprout.visible = false
	planted = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func grow():
	if (planted):
		var instance = ONION.instantiate()
		instance.set_type(type)
		instance.position = self.position
		instance.position.x += 580
		instance.position.y += 200
		instance.is_in_basket = false
		add_sibling(instance)
		unplant()
