extends Node
var produces: Dictionary[Globals.Produce, int] = {}

func _ready():
	for produce in Globals.Produce.values():
		produces.set(produce, 0)
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(Globals.PORT, Globals.MAX_CLIENTS)
	multiplayer.multiplayer_peer = peer
	get_content.rpc(produces)

var time: float = 0
func _process(delta: float) -> void:
	time += delta
	if delta > 1:
		delta = 0

@rpc("any_peer")
func add_produce(produce: Globals.Produce):
	produces[produce] += 1
	get_content.rpc(produces)

@rpc("any_peer")
func remove_produce(produce: Globals.Produce):
	if produces[produce] > 0:
		produces[produce] -= 1
		get_content.rpc(produces)


@rpc("any_peer")
func request_get_content():
	get_content.rpc(produces)

@rpc("any_peer")
func get_content(_produces: Dictionary[Globals.Produce, int]):
	pass
