extends Control

signal text_finished

@onready var text_label = $DialoguePanel/TextLabel
@onready var continue_button = $DialoguePanel/ContinueButton

var full_text: String = ""
var current_char: int = 0
var typing_speed: float = 0.05  # Seconds per character
var typing: bool = false

func _ready():
	if continue_button:
		continue_button.hide()

func show_text(text: String):
	full_text = text
	current_char = 0
	text_label.text = ""
	show()
	if continue_button:
		continue_button.hide()
	typing = true
	start_typing()

func start_typing():
	while current_char < full_text.length() and typing:
		text_label.text += full_text[current_char]
		current_char += 1
		
		# Auto-scroll to bottom
		await get_tree().create_timer(typing_speed).timeout
		text_label.scroll_to_line(text_label.get_line_count())
	
	# Text finished typing
	typing = false
	if continue_button:
		continue_button.show()

func _on_continue_button_pressed():
	text_finished.emit()
	hide()

func _input(event):
	if event is InputEventMouseButton and event.pressed and typing:
		if current_char < full_text.length():
			# Skip to end
			text_label.text = full_text
			current_char = full_text.length()
			typing = false
			text_label.scroll_to_line(text_label.get_line_count())
			if continue_button:
				continue_button.show()
