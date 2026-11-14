extends Node2D

var cooking: Dictionary[Globals.Produce, int] = {}
var cookedPercent = 0
@export var cookingSpeed: float;
@onready var basket: Node2D = $Basket

var rawToCooked = {
	{Globals.Produce.TOMATO: 1, Globals.Produce.ONION: 1}: {Globals.Produce.SAUCE : 1},
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if (cooking.is_empty()):
		return
	cookedPercent += delta * cookingSpeed
	if (cookedPercent < 100):
		return
	cookedPercent = 0
	if (rawToCooked.has(cooking)):
		cooking = (rawToCooked[cooking])
	else:
		cooking = {Globals.Produce.ASH : 1}
	
func _stop_cooking():
	cookedPercent = 0
	for produce in cooking:
		basket.add_produce(produce)
	
func _add_cooking_produce(produce: Globals.Produce):
	basket.remove_produce(produce)
	cooking.get_or_add(produce, 1)
	cookedPercent = 0
