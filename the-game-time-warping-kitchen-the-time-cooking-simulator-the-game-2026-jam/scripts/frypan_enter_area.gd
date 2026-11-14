extends Area2D

@onready var frypan: Node2D = $".."

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if !body.is_in_frypan:
		body.is_in_frypan = true
		frypan._add_cooking_produce(body)
