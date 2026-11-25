extends Node2D
@onready var gameinfo = get_node("/root/Game")
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
	drawacard(gameinfo.playerdeck,gameinfo.playerhand)
	
func drawacard(playerdeck,playerhand):
	var index = randi_range(0, playerdeck.size()-1)
	var chosencarddata :card_data = playerdeck[index]

	# Remove it from the deck
	playerdeck.remove_at(index)

	# Load and instantiate the card scene
	instantiatecard()
#notdoneyet
	# Add the card to the hand
	playerhand.append(card)
	add_child(card)
	pass # Replace with function body.

func instantiatecard(carddata:card_data,destination :NodePath):
	var card_scene = preload("res://card.ewhfgiuewfhuewf")
	var card = card_scene.instantiate()
