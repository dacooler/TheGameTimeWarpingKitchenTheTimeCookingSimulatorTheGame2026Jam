extends Node2D

const IP_ADDRESS = "172.20.40.220"
const PORT = 6767

var typed = ""

var actions = [
	"cutcutcutcut",
	"slicesliceslice"
]

var selected_action = ""

func _ready():
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(IP_ADDRESS, PORT)
	multiplayer.multiplayer_peer = peer
	set_process_unhandled_input(true)
	_new_thing()

func _process(_delta: float) -> void:
	pass
	#send_hello_world_to_server.rpc("hello i am calling")

func _new_thing():
	selected_action = actions.pick_random()
	print("do: " + selected_action)

func _unhandled_input(event : InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		var key_event := event as InputEventKey

		# filter for printable characters
		if (key_event.keycode == KEY_ENTER):
			_send_cut()
		if !(key_event.keycode & KEY_SPECIAL):
			var letter := String.chr(key_event.unicode)

			# do whatever with "letter"

			_type_cut(letter)
			# or on non-control nodes: get_viewport().set_input_as_handled()
func _check_still_valid():
	return selected_action.begins_with(typed)

func _send_cut():
	if (selected_action == typed):
		print("onion")
		add_produce.rpc(Globals.Produce.ONION)
		_new_thing()
	typed = ""

func _type_cut(letter: String):
	typed += letter
	if (!_check_still_valid()):
		print("WRONG")
		typed = ""
		_new_thing()
	print(selected_action)
	print(typed)


@rpc("any_peer")
func send_hello_world_to_server(hello: String):
	pass

@rpc("any_peer")
func add_produce(produce: Globals.Produce):
	pass
