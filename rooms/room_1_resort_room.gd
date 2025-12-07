extends Node2D

@onready var text_box = $TextBox
@onready var dresser = $DresserHotspot
@onready var bathroom = $BathroomHotspot
@onready var window = $WindowHotspot
@onready var door = $DoorHotspot

var first_visit: bool = true

func _ready():
	text_box.hide()  # Start hidden
	dresser.hide()
	bathroom.hide()
	window.hide()
	door.hide()
	
	# Connect the text_finished signal
	text_box.text_finished.connect(_on_text_finished)
	
	if first_visit:
		show_opening_text()
		first_visit = false

func show_opening_text():
	print("show_opening_text called!")  # ADD THIS LINE
	var opening_text = "You wake up with a pounding headache. Last night was... intense. The Spring Fling Cruise party at the resort got out of hand. Your cruise ship leaves in a few hours, and you need to find your locker key to get your stuff and get out of here."
	text_box.show_text(opening_text)

func _on_text_finished():
	# Text box closed, player can now interact with room
	print("Player can now interact with the room")
	dresser.show()
	bathroom.show()
	window.show()
	door.show()
	# We'll add hotspot enabling here later


func _on_dresser_hotspot_input_event(_viewport, event, _shape_idx):
	# Check if it's a mouse click
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		on_dresser_clicked()

func on_dresser_clicked():
	print("Dresser clicked!")
	text_box.show_text("Check out this dope ass dresser! So much lube.")


func _on_bathroom_hotspot_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		on_bathroom_clicked()

func on_bathroom_clicked():
	print("Bathroom clicked!")
	text_box.show_text("You do not want to go in there.")


func _on_window_hotspot_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		on_window_clicked()

func on_window_clicked():
	print("Window clicked!")
	text_box.show_text("Outside you see parts of a pretty cool gay resort you found earlier.")


func _on_door_hotspot_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		on_door_clicked()

func on_door_clicked():
	print("Door to get out clicked!")
