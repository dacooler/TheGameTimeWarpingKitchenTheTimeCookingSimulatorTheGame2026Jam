extends Area2D

@onready var chop: Node2D = $".."

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if !body.is_in_chopping_board:
		body.is_in_chopping_board = true
		chop.start_cutting(body)
