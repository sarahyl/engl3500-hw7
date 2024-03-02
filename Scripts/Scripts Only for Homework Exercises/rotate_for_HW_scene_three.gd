extends Node2D
@export var rotation_speed : int 
var is_rotating : bool


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _start_rotating():
	is_rotating = true

func _stop_rotating():
	is_rotating = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (is_rotating):
		transform = transform.rotated_local(rotation_speed)
	pass






func _on_area_2d_body_entered(body):
	_start_rotating()


func _on_area_2d_body_exited(body):
	_stop_rotating()
