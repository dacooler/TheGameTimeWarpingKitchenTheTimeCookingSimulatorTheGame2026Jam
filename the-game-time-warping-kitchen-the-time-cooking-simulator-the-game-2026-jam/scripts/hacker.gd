extends Node2D

const IP_ADDRESS = "172.20.40.220"
const PORT = 6767

var typed = ""
@onready var rich_text_label: RichTextLabel = $RichTextLabel

var actions = [
	"cutcutcutcut",
	"slicesliceslice"
]


var selected_action = ""

func _ready():
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(Globals.IP_ADDRESS, Globals.PORT)
	multiplayer.multiplayer_peer = peer
	set_process_unhandled_input(true)
	_new_thing()

func _process(_delta: float) -> void:
	pass
	#send_hello_world_to_server.rpc("hello i am calling")

func _show_progress():
	rich_text_label.clear()
	rich_text_label.add_text(selected_action)
	rich_text_label.add_text("\n")
	rich_text_label.add_text(typed)

func _new_thing():
	typed = ""
	selected_action = actions.pick_random()
	print("do: " + selected_action)
	_show_progress()


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

func _good_cut():
	add_produce.rpc(Globals.Produce.ONION)
	_new_thing()
	rich_text_label.add_text("\n +1 Onion")

func _send_cut():
	if (selected_action == typed):
		_good_cut()
	else:
		_wrong_cut()

func _wrong_cut():
	_new_thing()
	rich_text_label.push_color(Color.RED)
	rich_text_label.add_text("\n WRONG")

func _type_cut(letter: String):
	typed += letter
	if (!_check_still_valid()):
		_wrong_cut()
		return
	_show_progress()


@rpc("any_peer")
func send_hello_world_to_server(hello: String):
	pass

@rpc("any_peer")
func add_produce(produce: Globals.Produce):
	pass
