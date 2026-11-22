extends Node2D
@onready var gameinfo = get_parent()
# button + other mechanics (coming soon) can only be interacted w/ if it is their turn or anarchy state

func _ready() -> void:
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	# if its their turn
	drawcard(gameinfo.get_current_player()[1],1)


func drawcard(player:int,amount):
	for card in range(amount):
		var source = gameinfo.players[player].deck
		if source.is_empty():
			source = gameinfo.saidpile
		
		if source.is_empty():
			print("no cards remaining!")
			break
		take_cards(source,gameinfo.players[player].hand,1)
	get_node("/root/Game/hand").update_hand(player)

func take_cards(takefrom:Array,taketo:Array,quantity:int):
	for times in quantity:
		if takefrom.is_empty():
			print("error empty")
			return

		var index = randi_range(0, takefrom.size() - 1)
		var chosencard = takefrom[index]

		# Remove it from the deck
		takefrom.remove_at(index)
		# Add the card to the handn 
		taketo.append(chosencard)

func startout(players : Array):
	for index in range(len(gameinfo.players)):
		drawcard(index,gameinfo.startingcardsamount)
