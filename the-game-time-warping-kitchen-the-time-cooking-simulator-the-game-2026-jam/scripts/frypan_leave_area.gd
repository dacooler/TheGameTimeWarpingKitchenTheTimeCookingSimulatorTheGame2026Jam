extends Area2D

@onready var frypan: Node2D = $".."

func _ready():
	body_exited.connect(_on_body_exited)

func _on_body_exited(body):
	if body.is_in_frypan:
		body.is_in_frypan = false
		frypan._remove_cooking_produce(body)
