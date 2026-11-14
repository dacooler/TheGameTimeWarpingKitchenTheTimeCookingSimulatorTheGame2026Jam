extends Node2D

var foodTimer = 0
@export var foodTime: float;
const PRODUCE_FALLING = preload("uid://cp8cq17ymuyqy")
@onready var basket: Node2D = $Basket



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
	var instance = PRODUCE_FALLING.instantiate()
	add_child(instance)
	
func pick_produce(produce: Globals.Produce):
	basket.add_produce_2(produce)
