extends Node2D

@onready var label: Label = $Label
@onready var remove: Button = $Remove
@onready var add: Button = $Add
@onready var server: Node2D = $".."

func _ready():
	add.pressed.connect(_add)
	remove.pressed.connect(_remove)

func _process(_delta: float) -> void:
	label.text = "Onions: " + str(server.produces[Globals.Produce.ONION])

func _add():
	server.produces[Globals.Produce.ONION] += 1

func _remove():
	server.produces[Globals.Produce.ONION] -= 1
