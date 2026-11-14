extends Area2D

@onready var basket: Node2D = $".."

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if !body.is_in_basket:
		body.is_in_basket = true
		print("adding the onion")
		basket.add_produce_2(body)
