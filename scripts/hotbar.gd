extends CanvasLayer

@export var ducks: Array[Duck] = []

@onready var slot1 = $Control/HBoxContainer/HotbarItem
@onready var slot2 = $Control/HBoxContainer/HotbarItem2
@onready var slot3 = $Control/HBoxContainer/HotbarItem3
@onready var slot4 = $Control/HBoxContainer/HotbarItem4
@onready var label = $Control/HBoxContainer/TextureRect/Label

var slots := []

func _ready() -> void:
	slots = [slot1, slot2, slot3, slot4]
	Global.hotbar_ref = self  # Armazena referência global para poder atualizar
	update_hotbar_from_selection()

func _process(_delta: float) -> void:
	label.text = str(Global.nrg)

func update_hotbar_from_selection():
	clear_all_slots()
	for i in min(slots.size(), Global.selected_ducks.size()):
		slots[i].set_duck_info(Global.selected_ducks[i])

func clear_all_slots():
	for slot in slots:
		slot.clear_duck()
