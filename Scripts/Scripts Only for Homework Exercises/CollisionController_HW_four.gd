extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _disable_collision():
	$CollisionShape2D.set_deferred("disabled", true)

func _enable_collision():
	$CollisionShape2D.set_deferred("disabled", false)





func _on_area_2d_body_entered(body):
	_disable_collision()
	
	


func _on_area_2d_body_exited(body):
	_enable_collision()


func _on_open_door_button_pressed():
	_disable_collision()


func _on_button_pressed():
	_enable_collision()
