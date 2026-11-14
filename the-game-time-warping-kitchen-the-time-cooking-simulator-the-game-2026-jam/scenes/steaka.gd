extends Node2D

var cooking: Globals.Produce
var cookedPercent = 0
@export var cookingSpeed: float;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cookedPercent += delta * cookingSpeed
	pass
	
func _stop_cooking():
	if (cookedPercent < 100):
		return
	if (cooking == Globals.Produce.ONION):
		add_produce.rpc(Globals.Produce.TOMATO)
	
func _start_cooking_produce(produce: Globals.Produce):
	remove_produce(produce)
	cooking = produce
	cookedPercent = 0

@rpc("any_peer")
func add_produce(produce: Globals.Produce):
	pass
	
@rpc("any_peer")
func remove_produce(produce: Globals.Produce):
	pass
