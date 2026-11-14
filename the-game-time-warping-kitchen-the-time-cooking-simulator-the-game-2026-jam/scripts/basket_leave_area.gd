extends Area2D

@onready var basket: Node2D = $".."

func _ready():
	body_exited.connect(_on_body_exited)

func _on_body_exited(body):
	if body.is_in_basket:
		body.is_in_basket = false
		basket.remove_produce.rpc(Globals.Produce.ONION)
