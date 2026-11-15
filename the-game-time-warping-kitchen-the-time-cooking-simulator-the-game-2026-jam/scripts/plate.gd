extends Area2D
@onready var talking: AudioStreamPlayer2D = $Talking
@onready var error: AudioStreamPlayer2D = $Error

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.type == Globals.Produce.SAUCE:
		talking.play()
		Globals.coins += 30
		body.queue_free()
	if body.type == Globals.Produce.ASH:
		error.play()
		body.queue_free()
		Globals.coins += -1
