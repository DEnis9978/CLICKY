extends Node2D

@onready var pause_scene: Control = $PauseScene

@export var bat_scene: PackedScene
@export var bee_scene: PackedScene
@export var bird_scene: PackedScene
@export var ghost_scene: PackedScene
@export var pig_scene: PackedScene
@export var mushroom_scene: PackedScene
@export var radish_scene: PackedScene
@export var slime_scene: PackedScene
@export var turtle_scene: PackedScene

# the following constants are the ones that i use to tell
# godot that i want to start generating creaturs from this
# point in either y or x axis.
const GENERATE_POINT_X: int = -30
const GENERATE_POINT_Y: int = -30

const RANDNUM_FLY_1: int = 70
const RANDNUM_FLY_2: int = 1050

const RANDNUM_GHOST_1: int = 28
const RANDNUM_GHOST_2: int = 620

const RANDNUM_GROUND_1: int = 448
const RANDNUM_GROUND_2: int = 620

# the reason we do not use a global y_position or x_position is 
# the creatures are going to generate in the same position
# and they will overlap each other on just a line

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawner_function()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ScoreManager.save_highscore()
	back_to_menu()

# function to spawn bat
func spawn_bat() -> void:
	# we need to instantiate from the bat class
	var new_bat: Bat = bat_scene.instantiate()
	# we set the x position to a random value between 
	# RANDNUM_FLY_1 and RANDNUM_FLY_2 so each time we call this function
	# in timer, a random value is assigned to the x posotion and
	# appear on the screen. For here, we chose 70 and 1050
	# because they are in the range of the project width
	var x_position: float = randf_range(RANDNUM_FLY_1, RANDNUM_FLY_2)
	# we say that the generating point for the bats is a
	# vector2 with an x(x_position) and an y(GENERATE_POINT_Y)
	# and because they are flying, they start generating from
	# the top of the screen
	new_bat.position = Vector2(x_position, GENERATE_POINT_Y)
	# add this child to the scene in order to appear in the game
	add_child(new_bat)

func spawn_bee():
	var new_bee: Bee = bee_scene.instantiate()
	var x_position: float = randf_range(RANDNUM_FLY_1, RANDNUM_FLY_2)
	new_bee.position = Vector2(x_position, GENERATE_POINT_Y)
	add_child(new_bee)
	
func spawn_bird():
	var new_bird: BlueBird = bird_scene.instantiate()
	var x_position: float = randf_range(RANDNUM_FLY_1, RANDNUM_FLY_2)
	new_bird.position = Vector2(x_position, GENERATE_POINT_Y)
	add_child(new_bird)

func spawn_ghost():
	var new_ghost: Ghost = ghost_scene.instantiate()
	var y_position: float = randf_range(RANDNUM_GHOST_1, RANDNUM_GHOST_2)
	new_ghost.position = Vector2(GENERATE_POINT_X, y_position)
	add_child(new_ghost)
	
func spawn_pig():
	var new_pig: Pig = pig_scene.instantiate()
	var y_position: float = randf_range(RANDNUM_GROUND_1, RANDNUM_GROUND_2)
	new_pig.position = Vector2(GENERATE_POINT_X, y_position)
	add_child(new_pig)

func spawn_mushroom():
	var new_mushroom: Mushroom = mushroom_scene.instantiate()
	var y_position: float = randf_range(RANDNUM_GROUND_1, RANDNUM_GROUND_2)
	new_mushroom.position = Vector2(GENERATE_POINT_X, y_position)
	add_child(new_mushroom)
	
func spawn_radish():
	var new_radish: Radish = radish_scene.instantiate()
	var y_position: float = randf_range(RANDNUM_GROUND_1, RANDNUM_GROUND_2)
	new_radish.position = Vector2(GENERATE_POINT_X, y_position)
	add_child(new_radish)
	
func spawn_slime():
	var new_slime: Slime = slime_scene.instantiate()
	var y_position: float = randf_range(RANDNUM_GROUND_1, RANDNUM_GROUND_2)
	new_slime.position = Vector2(GENERATE_POINT_X, y_position)
	add_child(new_slime)
	
func spawn_turtle():
	var new_turtle: Turtle = turtle_scene.instantiate()
	var y_position: float = randf_range(RANDNUM_GROUND_1, RANDNUM_GROUND_2)
	new_turtle.position = Vector2(GENERATE_POINT_X, y_position)
	add_child(new_turtle)
	
func _on_spawn_timer_timeout() -> void:
	spawner_function()

func spawner_function():
	spawn_bat()
	spawn_bee()
	spawn_bird()
	spawn_ghost()
	spawn_mushroom()
	spawn_pig()
	spawn_radish()
	spawn_slime()
	spawn_turtle()
	
func back_to_menu():
	if Input.is_action_pressed("pause"):
		GameManager.load_main_scene()
