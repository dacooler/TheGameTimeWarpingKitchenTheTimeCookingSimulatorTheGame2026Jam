extends TextEdit

func _ready() -> void:
	text = Globals.IP_ADDRESS

func _process(delta: float) -> void:
	Globals.IP_ADDRESS = text
