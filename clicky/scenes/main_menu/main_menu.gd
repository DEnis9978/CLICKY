extends Control

@onready var highscore_value: Label = $Labels/Highscore/HighscoreValue

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	highscore_value.text = str(ScoreManager.get_highscore())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("start_game"):
		GameManager.load_game_scene()
