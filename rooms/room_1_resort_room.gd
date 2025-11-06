extends Node2D


var first_visit: bool = true

func _ready():
	if first_visit:
		show_opening_text()
		first_visit = false

func show_opening_text():
	# We'll add a dialogue box here next
	print("Opening exposition text would appear here")
