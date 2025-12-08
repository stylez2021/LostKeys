extends Control

signal text_finished

@onready var text_label = $DialoguePanel/TextLabel
@onready var continue_button = $DialoguePanel/ContinueButton

var full_text: String = ""
var current_char: int = 0
var typing_speed: float = 0.05  # Seconds per character
var typing: bool = false

func _ready():
	print("TextBox _ready called")
	print("text_label node: ", text_label)
	print("text_label type: ", text_label.get_class() if text_label else "NULL")
	print("DialoguePanel children: ", $DialoguePanel.get_children())
	continue_button.hide()

func show_text(text: String):
	print("show_text called with: ", text)  # ADD THIS
	full_text = text
	current_char = 0
	text_label.text = ""
	print("text_label exists: ", text_label != null)  # ADD THIS
	show()
	continue_button.hide()
	typing = true
	start_typing()

func start_typing():
	print("start_typing called, text length: ", full_text.length())
	while current_char < full_text.length() and typing:
		# Instead of += let's rebuild the whole string
		text_label.text = full_text.substr(0, current_char + 1)
		print("Current text: ", text_label.text)
		current_char += 1
		await get_tree().create_timer(typing_speed).timeout
	
	# Text finished typing
	print("Typing finished!")
	typing = false
	continue_button.show()

func _on_continue_button_pressed():
	text_finished.emit()
	hide()

func _input(event):
	# func _input(event):
	if not visible:
		return
	
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Check if typing - skip to end
		if typing and current_char < full_text.length():
			text_label.text = full_text
			current_char = full_text.length()
			typing = false
			continue_button.show()
			get_viewport().set_input_as_handled()  # Consume the click
		# If done typing - close textbox (consume click so hotspots don't trigger)
		elif not typing:
			_on_continue_button_pressed()
			get_viewport().set_input_as_handled()  # Consume the click
