extends Control

signal text_finished

@onready var text_label = $DialoguePanel/TextLabel

func show_text(text: String):
	text_label.text = text
	show()

func _on_continue_button_pressed():
	text_finished.emit()
	hide()
