extends Node

var produces: Dictionary[Globals.Produce, int] = {
	Globals.Produce.ONION: 0,
	Globals.Produce.TOMATO: 0,
}

func _ready():
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(Globals.PORT, Globals.MAX_CLIENTS)
	multiplayer.multiplayer_peer = peer

var time: float = 0
func _process(delta: float) -> void:
	time += delta
	if delta > 1:
		print(produces)
		delta = 0

@rpc("any_peer")
func add_produce(produce: Globals.Produce):
	produces[produce] += 1
	get_content(produces)

@rpc("any_peer")
func remove_produce(produce: Globals.Produce):
	if produces[produce] > 0:
		produces[produce] -= 1
		get_content(produces)

@rpc("any_peer")
func get_content(produces: Dictionary[Globals.Produce, int]):
	pass
