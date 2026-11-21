extends Node2D
@onready var gameinfo = get_node("/root/game")
# button + other mechanics (coming soon) can only be interacted w/ if it is their turn or anarchy state
var playerhand
var playerdeck

func _ready() -> void:
	playerhand = gameinfo.playerhand
	playerdeck = gameinfo.playerdeck
	
	
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	# Randomly select a card in the deck
	var index = randi_range(0, playerdeck.size() - 1)
	var chosencard = playerdeck[index]

	# Remove it from the deck
	playerdeck.remove_at(index)

	# Load and instantiate the card scene
	var card_scene = load(chosencard)
	var card = card_scene.instantiate()

	# Add the card to the hand
	playerhand.append(card)
	add_child(card)
	pass # Replace with function body.
