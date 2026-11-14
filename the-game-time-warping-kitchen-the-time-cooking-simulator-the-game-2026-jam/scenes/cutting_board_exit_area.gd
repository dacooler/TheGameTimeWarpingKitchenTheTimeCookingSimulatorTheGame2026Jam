extends Area2D

@onready var chop: Node2D = $".."

func _ready():
	body_exited.connect(_on_body_exited)

func _on_body_exited(body):
	if body.is_in_chopping_board:
		body.is_in_chopping_board = false
		chop.stop_cutting(body)
