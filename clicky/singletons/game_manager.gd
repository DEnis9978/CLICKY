extends Node

# create preloads for game in order to go to the game scene from
# main menu
const GAME = preload("res://scenes/game/game.tscn")
const MAIN_MENU = preload("res://scenes/main_menu/main_menu.tscn")

# to change the scene to game scene
func load_game_scene():
	get_tree().change_scene_to_packed(GAME)

func load_main_scene():
	get_tree().change_scene_to_packed(MAIN_MENU)
