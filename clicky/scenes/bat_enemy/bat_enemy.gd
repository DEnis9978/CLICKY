extends Area2D

# make this whole scene a class to be able to use it in different parts
# of the game
class_name Bat

# export some variables to inspector to be able to easily change them
# based on our prefrences
@export var speed_y: float = 0.0
@export var points_value: float = 0.0

# to point out to the animation player node and tell godot it is 
# going to be used 
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed_y * delta
	
	# to free the memory if it is out of the game screen
	if position.y > get_viewport_rect().size.y:
		SignalManager.off_screen.emit()
		set_process(false)
		queue_free()

# to destroy the object when we click the left mouse button
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		bat_manager()

# to do specific tasks when clicked on the bat
func bat_manager():
	ScoreManager.add_score(points_value)
	#set_process(false)
	animation_player.play("destroy")
