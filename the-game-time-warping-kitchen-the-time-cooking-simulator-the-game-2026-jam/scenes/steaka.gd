extends Node2D

@onready var frying_pan: StaticBody2D = $FryingPan
const ONION = preload("uid://7xo8mbumihps")
var produces: Dictionary[Globals.Produce, Array] = {}
var cookedPercent = 0
@export var cookingSpeed: float;
@onready var basket: Node2D = $Basket
@onready var smoke_particle: CPUParticles2D = $SmokeParticle
@onready var dust_particle: CPUParticles2D = $DustParticle

var rawToCooked = {
	{Globals.Produce.CHOPPED_TOMATO: 1, Globals.Produce.CHOPPED_ONION: 1}: {Globals.Produce.SAUCE : 1},
	{Globals.Produce.SAUCE: 1, Globals.Produce.PASTA: 1 } : {Globals.Produce.TOMATO_PASTA : 1}
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for key in rawToCooked:
		var value = rawToCooked[key]
		key.sort()
		rawToCooked[key] = value
	pass # Replace with function body.

func _get_recipie() -> Dictionary[Globals.Produce, int]:
	var recipie: Dictionary[Globals.Produce, int] = {}
	for produce in produces:
		recipie[produce] = produces[produce].size()

	recipie.sort()
	return recipie

@onready var cook_sound: AudioStreamPlayer2D = $cookSound
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var success_sound: AudioStreamPlayer2D = $successSound
@onready var fail_sound: AudioStreamPlayer2D = $failSound
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var recipie = _get_recipie()

	if (recipie.is_empty()):
		smoke_particle.emitting = false
		dust_particle.emitting = false
		cook_sound.playing = false
		progress_bar.visible = false
		cookedPercent = 0
		return

	smoke_particle.emitting = true
	dust_particle.emitting = true
	progress_bar.visible = true
	if !cook_sound.playing:
		cook_sound.play()
	cookedPercent += delta * cookingSpeed
	progress_bar.value = cookedPercent
	if (cookedPercent < 100):
		return
	cookedPercent = 0
	if (rawToCooked.has(recipie)):
		recipie = (rawToCooked[recipie])
		success_sound.play()
	else:
		recipie = {Globals.Produce.ASH : 1}
		fail_sound.play()

	for produce_type in produces:
		for produce in produces[produce_type]:
			produce.is_dead = true
			produce.queue_free()

	call_deferred("_add_the_shit_1", recipie)

func _add_the_shit_1(recipie):
	call_deferred("_add_the_shit_2", recipie)

func _add_the_shit_2(recipie):
	for produce in recipie:
		produces[produce] = []
		for _i in range(recipie[produce]):
			var new := ONION.instantiate()
			new.is_in_frypan = true
			new.is_in_basket = false
			new.set_type(produce)
			new.position = frying_pan.position + Vector2(500, 200)
			add_sibling(new)
			produces[produce].append(new)

func _remove_cooking_produce(produce: Node2D):
	var produce_list = produces.get(produce.type)
	if produce_list == null:
		return

	var index = produce_list.find(produce)
	produce_list.remove_at(index)

	if produce_list.is_empty():
		produces.erase(produce.type)

func _add_cooking_produce(produce: Node2D):
	if !produces.has(produce.type):
		produces[produce.type] = []

	var produce_list = produces.get(produce.type)
	produce_list.append(produce)
