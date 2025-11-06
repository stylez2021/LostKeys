extends Node
#Part one of attempting game manager node thingy. Letting ClaudAI guide me on this one
#11.6.25

# Inventory
var inventory: Array = []

# Game state flags
var game_flags: Dictionary = {}

# Current room tracking
var current_room: String = ""

# Called when the node enters the scene tree
func _ready():
	print("GameManager initialized")

# Inventory methods
func add_item(item_name: String) -> void:
	if not inventory.has(item_name):
		inventory.append(item_name)
		print("Added to inventory: ", item_name)
	else:
		print("Already have: ", item_name)

func remove_item(item_name: String) -> void:
	if inventory.has(item_name):
		inventory.erase(item_name)
		print("Removed from inventory: ", item_name)

func has_item(item_name: String) -> bool:
	return inventory.has(item_name)

# Game flag methods
func set_flag(flag_name: String, value) -> void:
	game_flags[flag_name] = value
	print("Set flag: ", flag_name, " = ", value)

func get_flag(flag_name: String, default_value = false):
	return game_flags.get(flag_name, default_value)

# Scene transition
func change_scene(scene_path: String) -> void:
	current_room = scene_path
	get_tree().change_scene_to_file(scene_path)
