extends TextureRect

@export var ducks : Array  # Array de PackedScenes, com diferentes cenas de pato  # Variável global que determina qual pato será instanciado

# Função chamada quando o input do usuário é detectado
func _on_gui_input(event: InputEvent) -> void:
	print(Global.currentDuck)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# Verifica se o id atual do pato está dentro do array
			if Global.currentDuck > 0:
				var selected_duck = ducks[Global.currentDuck - 1]  # Seleciona a cena do pato com base no currentDuck
				var new_instance = selected_duck.instantiate()  # Instancia a cena
				add_child(new_instance)  # Adiciona o pato à cena
			else:
				print("ID do pato fora do alcance!")
