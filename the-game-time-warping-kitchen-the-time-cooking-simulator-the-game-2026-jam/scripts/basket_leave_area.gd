extends Area2D

@onready var basket: Node2D = $".."

func _ready():
	body_exited.connect(_on_body_exited)

func _on_body_exited(body):
	if body.is_in_basket:
		body.is_in_basket = false
		if !body.is_dead:
			basket.remove_produce_2(body)
