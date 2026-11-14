extends Node2D

var foodTimer = 0
@export var foodTime: float;
@onready var basket: Node2D = $Basket
const ONION = preload("uid://7xo8mbumihps")

var products =[
	Globals.Produce.ONION_SEED,
	Globals.Produce.TOMATO_SEED,
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	foodTimer += delta;
	if (foodTimer > foodTime):
		_spawn_produce()
		foodTimer = 0

func _spawn_produce():
	var he_am = products.pick_random()
	var instance = ONION.instantiate()
	var position = randf_range(400, get_viewport_rect().size.x)
	instance.is_in_basket = false
	instance.position.x = position
	instance.position.y = -10
	instance.set_type(he_am)
	add_child(instance)
	
