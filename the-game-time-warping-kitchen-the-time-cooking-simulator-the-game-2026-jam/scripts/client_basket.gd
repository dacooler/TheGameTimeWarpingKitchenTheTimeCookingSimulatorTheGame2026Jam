extends Node

const ONION = preload("uid://7xo8mbumihps")

var produce_in_basket: Dictionary[Globals.Produce, Array] = {
	Globals.Produce.ONION: [],
	Globals.Produce.TOMATO: [],
	Globals.Produce.CHOPPED_ONION: [],
	Globals.Produce.CHOPPED_TOMATO: [],
	Globals.Produce.SAUCE: [],
	Globals.Produce.ASH: [],
}

func _ready():
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(Globals.IP_ADDRESS, Globals.PORT)
	multiplayer.multiplayer_peer = peer
	request_get_content.rpc()

func add_produce_2(produce: Node2D):
	produce_in_basket[Globals.Produce.ONION].append(produce)
	add_produce.rpc(Globals.Produce.ONION)

func remove_produce_2(produce: Node2D):
	var index := produce_in_basket[Globals.Produce.ONION].find(produce)
	produce_in_basket[Globals.Produce.ONION].remove_at(index)
	remove_produce.rpc(Globals.Produce.ONION)

@rpc("any_peer")
func add_produce(_produce: Globals.Produce):
	pass

@rpc("any_peer")
func remove_produce(_produce: Globals.Produce):
	pass

@rpc("any_peer")
func request_get_content():
	pass

@rpc("any_peer")
func get_content(incomming_produces: Dictionary[Globals.Produce, int]):
	print(incomming_produces)
	for produce in incomming_produces:
		var diff = incomming_produces[produce] - produce_in_basket[produce].size()
		if diff > 0:
			_create_produce(produce, diff)
		elif diff < 0:
			_remove_produce(produce, -diff)

func _create_produce(produce: Globals.Produce, amount: int):
	for _i in range(amount):
		var onion := ONION.instantiate()
		add_sibling(onion)
		produce_in_basket[produce].append(onion)

func _remove_produce(produce: Globals.Produce, amount: int):
	for _i in range(amount):
		if produce_in_basket[produce].is_empty():
			break

		var to_remove: Node2D = produce_in_basket[produce].pop_back()
		to_remove.queue_free()
