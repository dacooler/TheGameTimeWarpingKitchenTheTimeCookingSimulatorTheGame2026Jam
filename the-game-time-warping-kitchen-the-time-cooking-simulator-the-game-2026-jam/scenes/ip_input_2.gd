extends TextEdit

func _ready() -> void:
	text = str(Globals.time)

func _process(delta: float) -> void:
	Globals.time = int(text)
