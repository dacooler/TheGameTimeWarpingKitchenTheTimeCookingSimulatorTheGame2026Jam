extends Node2D

@onready var label: Label = $Label

func _process(_delta: float) -> void:
	label.text = "Coins: " + str(Globals.coins)
