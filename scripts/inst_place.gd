extends TextureRect

@export var ducks : Array  # Array de PackedScenes, com diferentes cenas de pato  # Variável global que determina qual pato será instanciado
@export var haveDuck : bool = false

# Função chamada quando o input do usuário é detectado
func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# Verifica se o id atual do pato está dentro do array
			if Global.currentDuck > 0 and not haveDuck:
				var selected_duck = ducks[Global.currentDuck - 1]  # Seleciona a cena do pato com base no currentDuck
				var new_instance = selected_duck.instantiate()  # Instancia a cena
				add_child(new_instance)  # Adiciona o pato à cena
				haveDuck = true
			else:
				print("ID do pato fora do alcance!")
