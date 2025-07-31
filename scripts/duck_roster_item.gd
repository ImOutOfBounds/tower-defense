extends TextureRect

@onready var sprite = $Sprite2D
@onready var cost = 0
@onready var isSelected = false

@export var data: Duck

func set_duck_info(new_data: Duck) -> void:
	if new_data == null:
		push_error("Recurso Duck não atribuído!")
		return
	data = new_data
	sprite.texture = data.spriteContent

func _ready() -> void:
	if data:
		set_duck_info(data)
	update_modulate()

func _process(_delta: float) -> void:
	update_modulate()

func update_modulate() -> void:
	if not data:
		return

	if Global.currentDuck == data.duckId:
		modulate = Color(1, 1, 1)  # Branco = selecionado
	elif data in Global.selected_ducks:
		modulate = Color(0.8, 1.0, 0.8)  # Verde claro = na hotbar
	else:
		modulate = Color(0.5, 0.5, 0.5)  # Cinza = inativo

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if not data:
			return

		# Adicionar ou remover do array global
		if data in Global.selected_ducks:
			Global.selected_ducks.erase(data)
		else:
			Global.selected_ducks.append(data)

		# Atualizar hotbar se referência existir
		if Global.hotbar_ref:
			Global.hotbar_ref.update_hotbar_from_selection()

		update_modulate()
