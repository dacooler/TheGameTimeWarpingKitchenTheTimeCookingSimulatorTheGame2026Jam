extends Node2D

@onready var rich_text_label: RichTextLabel = $RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rich_text_label.add_text(str(Globals.coins)) # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
