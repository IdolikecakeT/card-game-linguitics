extends Control
@onready var gameinfo = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func update_hand(player_index:int):
	# Remove the currently displayed cards
	for card in $handui.get_children():
		card.queue_free()

	# Create a visual card for each card in the player's hand
	for card_path in gameinfo.players[player_index].hand:
		var card_scene = load(card_path)
		var card = card_scene.instantiate()
		$handui.add_child(card)
