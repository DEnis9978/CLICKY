extends Area2D

class_name BlueBird

@export var speed_y: float = 0.0
@export var points_value: float = 0.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _process(delta: float) -> void:
	position.y += speed_y * delta

	if position.y > get_viewport_rect().size.y:
		SignalManager.off_screen.emit()
		set_process(false)
		queue_free()

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		bird_manager()
		
func bird_manager():
	ScoreManager.add_score(points_value)
	#set_process(false)
	animation_player.play("destroy")
