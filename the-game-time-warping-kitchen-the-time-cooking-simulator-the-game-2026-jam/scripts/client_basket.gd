extends Node

func _ready():
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(Globals.IP_ADDRESS, Globals.PORT)
	multiplayer.multiplayer_peer = peer

func add_produce_2(produce: Globals.Produce):
	print("HEJo")
	add_produce.rpc(produce)

@rpc("any_peer")
func add_produce(produce: Globals.Produce):
	pass

@rpc("any_peer")
func remove_produce(produce: Globals.Produce):
	pass

@rpc("any_peer")
func get_content(produces: Dictionary[Globals.Produce, int]):
	pass
