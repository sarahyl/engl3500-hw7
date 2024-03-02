extends Node2D
@export var rotation_speed : int 
var is_rotating : bool


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _rotate_me():
	transform = transform.rotated_local(rotation_speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_rotating == true:
		_on_button_pressed()




func _on_button_pressed():
	is_rotating = true
	_rotate_me()

