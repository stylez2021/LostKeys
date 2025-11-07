extends Node2D

@onready var text_box = $TextBox

var first_visit: bool = true

func _ready():
	text_box.hide()
	
	if first_visit:
		show_opening_text()
		first_visit = false
	
	text_box.text_finished.connect(_on_text_finished)

func show_opening_text():
	var opening_text = "You wake up with a pounding headache. Last night was... intense. The Spring Fling Cruise party at the resort got out of hand. Your cruise ship leaves in a few hours, and you need to find your locker key to get your stuff and get out of here."
	text_box.show_text(opening_text)

func _on_text_finished():
	# Text box closed, player can now interact with room
	enable_hotspots()
	print("Player can now interact with the room")

func enable_hotspots():
	# We'll implement this when we add clickable hotspots
	pass
