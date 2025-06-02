extends Control
@export var entra_sai_mouse : AnimationPlayer
@export var animador_de_opcoes_menu : AnimationPlayer
@export var pode_interagir : bool #true

func _ready() -> void:
	animador_de_opcoes_menu.play("opcoeschegando") 
	


##CLICKS
func _on_button_pressed() -> void:
	print("wow")
func _on_options_pressed() -> void:
	pass
func _on_quit_game_pressed() -> void:
	pass


##ENTRADA DE MOUSE
func _on_start_game_mouse_entered() -> void:
	entra_sai_mouse.play("entrou")
func _on_options_mouse_entered() -> void:
	entra_sai_mouse.play("entrou")
func _on_quit_game_mouse_entered() -> void:
	entra_sai_mouse.play("entrou")

##SAINDA DE MOUSE
func _on_quit_game_mouse_exited() -> void:
	entra_sai_mouse.play("saindo")
func _on_options_mouse_exited() -> void:
	entra_sai_mouse.play("saindo")
func _on_start_game_mouse_exited() -> void:
	entra_sai_mouse.play("saindo")
