extends Node2D

var cooking: Globals.Produce
var cookingEmpty: bool = true
var cookedPercent = 0
@export var cookingSpeed: float;

var rawToCooked = {
	Globals.Produce.TOMATO: Globals.Produce.COOKED_TOMATO,
	Globals.Produce.ONION: Globals.Produce.COOKED_ONION,
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (cookingEmpty):
		return
	cookedPercent += delta * cookingSpeed
	if (cookedPercent < 100):
		return
	cookedPercent = 0
	if (rawToCooked.has(cooking)):
		cooking = (rawToCooked[cooking])
	else:
		cooking = Globals.Produce.ASH
	
func _stop_cooking():
	cookingEmpty = true
	cookedPercent = 0
	add_produce(cooking)
	
func _start_cooking_produce(produce: Globals.Produce):
	remove_produce(produce)
	cookingEmpty = false
	cooking = produce
	cookedPercent = 0

@rpc("any_peer")
func add_produce(produce: Globals.Produce):
	pass
	
@rpc("any_peer")
func remove_produce(produce: Globals.Produce):
	pass
