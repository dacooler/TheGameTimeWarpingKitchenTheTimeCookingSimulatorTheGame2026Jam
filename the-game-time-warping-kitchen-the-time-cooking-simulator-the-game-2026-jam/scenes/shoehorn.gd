extends Button
@onready var plant: Node2D = $"../Plant"
@onready var plant_2: Node2D = $"../Plant2"
@onready var plant_3: Node2D = $"../Plant3"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(grow_all)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func grow_all():
	plant.grow()
	plant_2.grow()
	plant_3.grow()
	
