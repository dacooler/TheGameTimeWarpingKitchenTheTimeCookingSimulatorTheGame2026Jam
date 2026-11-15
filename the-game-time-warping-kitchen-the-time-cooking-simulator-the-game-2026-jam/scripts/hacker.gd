extends Node2D

const IP_ADDRESS = "172.20.40.220"
const PORT = 6767

var typed = ""
@onready var rich_text_label: RichTextLabel = $RichTextLabel
@onready var basket: Node = $Basket

var chopping: Array[Node2D] = []

var actions = [
	"cutcutcutcut",
	"slicesliceslice"
]

const cut_result = {
	Globals.Produce.ONION : Globals.Produce.CHOPPED_ONION,
	Globals.Produce.TOMATO : Globals.Produce.CHOPPED_TOMATO
}

@onready var cut_player: AudioStreamPlayer2D = $CutPlayer
@onready var done_player: AudioStreamPlayer2D = $DonePlayer
@onready var wrong_cut_player: AudioStreamPlayer2D = $WrongCutPlayer


var selected_action = ""

func start_cutting(body: Node2D):
	chopping.append(body)
	_new_thing()

func stop_cutting(body: Node2D):
	chopping.erase(body)
	typed = ""

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
	_new_thing()
	done_player.play()
	var chopped = chopping.pop_back()
	if (chopped == null):
		return
	if (!cut_result.has(chopped.type)):
		chopped.set_type(Globals.Produce.ASH)
		return
	chopped.set_type(cut_result[chopped.type])


func _send_cut():
	if (selected_action == typed):
		_good_cut()
	else:
		_wrong_cut()

func _wrong_cut():
	_new_thing()
	wrong_cut_player.play()
	rich_text_label.push_color(Color.RED)
	rich_text_label.add_text("\n WRONG")

func _type_cut(letter: String):
	typed += letter
	if (!_check_still_valid()):
		_wrong_cut()
		return
	else:
		cut_player.play()
	_show_progress()
