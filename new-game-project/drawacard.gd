extends Node2D
@onready var gameinfo = get_parent()
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
	drawcard(1)

func drawcard(amount):
	for times in amount:
		if gameinfo.playerdeck.is_empty():
			return
		# Randomly select a card in the deck
		# also will only work if it is their turn or anarchy state
		var index = randi_range(0, gameinfo.playerdeck.size() - 1)

		print(playerdeck)
		print(playerdeck.size())
		print(index)

		var chosencard = gameinfo.playerdeck[index]

		# Remove it from the deck
		gameinfo.playerdeck.remove_at(index)

		# Load and instantiate the card scene
		var card_scene = load(chosencard)
		var card = card_scene.instantiate()

		# Add the card to the hand
		gameinfo.playerhand.append(card)
		get_node("/root/Game/hand/handui").add_child(card)
