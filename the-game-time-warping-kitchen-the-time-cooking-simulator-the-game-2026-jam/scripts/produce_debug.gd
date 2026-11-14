extends Node2D

@onready var label: Label = $Label
@onready var remove: Button = $Remove
@onready var add: Button = $Add
@onready var basket: Node = $"../Basket"

func _ready():
	add.pressed.connect(_add)
	remove.pressed.connect(_remove)

func _process(_delta: float) -> void:
	label.text = "Onions: " + str(basket.produces[Globals.Produce.ONION])

func _add():
	basket.produces[Globals.Produce.ONION] += 1

func _remove():
	basket.produces[Globals.Produce.ONION] -= 1
