extends Node

# creat a txt file to save the score in it
const SCORE_PATH = "user://clicky.txt"

# create variables for score and highscore
var score_container: float = 0.0
var high_score: float = 0.0

func _ready() -> void:
	load_highscore()
	
func get_score():
	return score_container
	
func get_highscore():
	return high_score

# to check if score is greater than a previous score it had saved in the file.
# if true, then replace the score with highscore
func set_score(s: float):
	score_container = s
	if score_container > high_score:
		high_score = score_container
	SignalManager.score_updated.emit(score_container)

# to save score. each creature has a different score value
func add_score(x):
	set_score(score_container + x)

# check in the output if highscore file is loaded correctly
func load_highscore():
	var file: FileAccess = FileAccess.open(SCORE_PATH, FileAccess.READ)
	if file:
		if file.get_length() > 0:
			high_score = file.get_as_text().to_int()
			print("highscore file is successfully loaded")
		else:
			print("file is empty")
		file.close()
	else:
		print("highscore file is unsuccessfully loaded")
		
# save high score as string to the file
func save_highscore():
	var file: FileAccess = FileAccess.open(SCORE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(str(high_score))
		file.close()
