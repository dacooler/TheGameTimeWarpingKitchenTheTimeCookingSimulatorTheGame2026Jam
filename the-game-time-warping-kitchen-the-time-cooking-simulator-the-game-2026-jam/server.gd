extends Node2D

const PORT = 6767
const MAX_CLIENTS = 7

func _ready():
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT, MAX_CLIENTS)
	multiplayer.multiplayer_peer = peer

@rpc("any_peer")
func send_hello_world_to_server():
	print("hello world")
