extends Node2D
var playerhand = []
var playerdeck = []


func get_all_cards(directory_path: String) -> Array:
	var dir = DirAccess.open(directory_path)
	var scene_files = []

	if dir:
		dir.list_dir_begin()

		var file_name = dir.get_next()

		while file_name != "":
			if file_name.ends_with(".tres"):
				scene_files.append(directory_path + file_name)

			file_name = dir.get_next()

		dir.list_dir_end()

	return scene_files

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	playerdeck =get_all_cards ("res://cards/")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
