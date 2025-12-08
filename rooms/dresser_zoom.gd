extends Control

signal zoom_closed

func _ready():
	hide()  # Start hidden
		
func show_zoom():
	show()
	print("DresserZoom showing!")

func _on_back_button_pressed():
	zoom_closed.emit()
	hide()

func _on_flyer_hotspot_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		on_flyer_clicked()

func on_flyer_clicked():
	# Check if already taken
	if GameManager.has_item("flyer"):
		print("Already have flyer")
	else:
		# Add to inventory
		GameManager.add_item("flyer")
		print("Picked up flyer!")
		
		# Hide the flyer hotspot
		$FlyerHotspot.queue_free()
		
		# Close the zoom view
		zoom_closed.emit()
		hide()
