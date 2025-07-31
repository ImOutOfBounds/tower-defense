extends TextureRect

@onready var sprite = $Sprite2D
@onready var cost = 0

@export var data: Duck  # Agora o recurso contendo todos os dados

# Função para configurar o sprite e o custo com base no Resource
func set_duck_info(data: Duck) -> void:
	if data == null:
		push_error("Recurso Duck não atribuído!")
		return

	sprite.texture = data.spriteContent
	cost = data.cost
	$Cost.text = str(cost)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if data:
		set_duck_info(data)
	update_modulate()

# Função para atualizar a cor com base no pato selecionado
func update_modulate() -> void:
	if data and Global.currentDuck == data.duckId:
		self.modulate = Color(1, 1, 1)  # Normal

func _process(_delta: float) -> void:
	if data and Global.currentDuck != data.duckId:
		self.modulate = Color(0.5, 0.5, 0.5)  # Desativado

# Quando clicado
func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if data and Global.nrg >= data.cost:
			Global.currentDuck = data.duckId
			update_modulate()
