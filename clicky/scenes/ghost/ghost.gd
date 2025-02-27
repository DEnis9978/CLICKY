extends Area2D

class_name Ghost

@export var speed_x: float = 0.0
@export var points_value: float = 0.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _process(delta: float) -> void:
	position.x += speed_x * delta
	
	if position.x > get_viewport_rect().size.x:
		SignalManager.off_screen.emit()
		set_process(false)
		queue_free()

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		ghost_manager()
		
func ghost_manager():
	ScoreManager.add_score(points_value)
	#set_process(false)
	animation_player.play("destroy")
