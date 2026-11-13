extends Node2D

const IP_ADDRESS = "10.57.159.210"
const PORT = 6767

func _ready():
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(IP_ADDRESS, PORT)
	multiplayer.multiplayer_peer = peer

func _process(_delta: float) -> void:
	send_hello_world_to_server.rpc("hello i am calling")

@rpc("any_peer")
func send_hello_world_to_server(hello: String):
	pass
