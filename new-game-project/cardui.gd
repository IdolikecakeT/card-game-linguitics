extends Control
@export var data : card_data


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if data == null:
		print("datanull")
		return
	$Name.text = data.card_name
	$Description.text = data.card_description
	$archetype.text=data.card_archetype

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
