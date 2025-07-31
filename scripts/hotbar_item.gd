extends TextureRect

@onready var sprite = $Sprite2D
@onready var cost = 0

@export var data: Duck  # Agora o recurso contendo todos os dados

# Configura o slot com os dados do pato
func set_duck_info(new_data: Duck) -> void:
	if new_data == null:
		push_error("Recurso Duck não atribuído!")
		return

	data = new_data
	sprite.texture = data.spriteContent
	cost = data.cost
	$Cost.text = str(cost)
	update_modulate()

# Limpa o slot
func clear_duck() -> void:
	data = null
	sprite.texture = null
	cost = 0
	$Cost.text = ""
	update_modulate()

# Retorna true se o slot estiver vazio
func is_empty() -> bool:
	return data == null

# Atualiza a cor com base no pato selecionado
func update_modulate() -> void:
	if data and Global.currentDuck == data.duckId:
		self.modulate = Color(1, 1, 1)
	else:
		self.modulate = Color(0.5, 0.5, 0.5)

func _ready() -> void:
	if data:
		set_duck_info(data)
	else:
		clear_duck()  # Garante que esteja limpo se não tiver dado

func _process(_delta: float) -> void:
	update_modulate()

# Quando clicado
func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if data and Global.nrg >= data.cost:
			Global.currentDuck = data.duckId
			update_modulate()
