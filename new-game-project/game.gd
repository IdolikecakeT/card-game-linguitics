extends Node2D
var saidpile = []
const startingcardsamount = 5
var current_player = 0
const numberofplayers = 4
var players = []
class Playerdata:
	var hand = []
	var deck = []

func get_current_player():
	return [players[current_player],current_player]

func get_all_cards(directory_path: String) -> Array:
	var dir = DirAccess.open(directory_path)
	var scene_files = []

	if dir:
		print("Successfully opened directory!")
	else:
		print("Failed to open directory!")
		return scene_files

	dir.list_dir_begin()

	var file_name = dir.get_next()

		while file_name != "":
			if file_name.ends_with(".tres"):
				scene_files.append(directory_path + file_name)

		if file_name.ends_with(".tscn"):
			scene_files.append(directory_path + file_name)

		file_name = dir.get_next()

	dir.list_dir_end()
	print("Scene files",scene_files)
	return scene_files

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(numberofplayers):
		players.append(Playerdata.new())

	for player in range(len(players)):
		for cards in get_all_scenes ("res://cards/"):
			players[player].deck.append(cards)
			players[player].deck.append(cards)
			
	$drawacard.startout(players)
	pass # Replace with function body.
	playerdeck =get_all_cards ("res://cards/")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
