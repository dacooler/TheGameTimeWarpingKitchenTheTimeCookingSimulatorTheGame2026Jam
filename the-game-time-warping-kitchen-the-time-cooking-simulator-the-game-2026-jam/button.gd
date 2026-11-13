extends Button

@export var scene: String;

func _ready():
	self.pressed.connect(_button_pressed)

func _button_pressed():
	get_tree().change_scene_to_file(scene)
