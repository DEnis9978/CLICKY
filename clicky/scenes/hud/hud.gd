extends Control

@onready var score_text: Label = $ScoreText

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.score_updated.connect(score_updated)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func score_updated(score: int):
	score_text.text = str(score)
