extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.type == Globals.Produce.SAUCE:
		Globals.coins += 30
		body.queue_free()
