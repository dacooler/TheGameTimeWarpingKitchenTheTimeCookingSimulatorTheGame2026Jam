extends Node2D

const PORT = 6767
const MAX_CLIENTS = 7

enum Produce {
	ONION,
	TOMATO,
}

var produces = {
	Produce.ONION: 0,
	Produce.TOMATO: 0,
}

func _ready():
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT, MAX_CLIENTS)
	multiplayer.multiplayer_peer = peer

var time: float = 0
func _process(delta: float) -> void:
	time += delta
	if delta > 1:
		print(produces)
		delta = 0

@rpc("any_peer")
func add_produce(produce: Produce):
	produces[produce] += 1

@rpc("any_peer")
func remove_produce(produce: Produce):
	if produces[produce] > 0:
		produces[produce] -= 1
