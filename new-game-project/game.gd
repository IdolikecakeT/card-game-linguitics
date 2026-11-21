extends Node2D
var playerhand = []
var playerdeck = []


func get_all_scenes(directory_path: String) -> Array:
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
		print(file_name)

		if file_name.ends_with(".tscn"):
			scene_files.append(directory_path + file_name)

		file_name = dir.get_next()

	dir.list_dir_end()
	print("Scene files",scene_files)
	return scene_files

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	playerdeck =get_all_scenes ("res://cards/")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
