extends TextureRect

@onready var sprite = $Sprite2D
@onready var cost = 0

@export var spriteContent : Texture
@export var costContent : int = 0
@export var duckId : int = 0

# Função para configurar o sprite e o custo externamente
func set_duck_info(new_sprite : Texture, new_cost : int) -> void:
	sprite.texture = new_sprite
	cost = new_cost
	spriteContent = new_sprite
	costContent = new_cost

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if spriteContent != null and costContent != 0:
		set_duck_info(spriteContent, costContent)
	# Inicializa a modulação de cor de acordo com o estado de currentDuck
	update_modulate()

# Função para atualizar a modulação com base no Global.currentDuck
func update_modulate() -> void:
	if Global.currentDuck == duckId:
		# Se o duckId for igual ao currentDuck, retorna à cor normal
		self.modulate = Color(1, 1, 1)  # Cor normal (sem modulação)

func _process(delta: float) -> void:
	if Global.currentDuck != duckId:
		self.modulate = Color(0.5, 0.5, 0.5)

# Função chamada no clique do botão do mouse
func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# Atualiza o ID do pato global ao clicar
			Global.currentDuck = duckId
			# Atualiza a modulação da cor
			update_modulate()  # Vai aplicar a cor correta com base no estado atual
