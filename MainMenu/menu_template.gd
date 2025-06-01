extends Control
@export var animador : AnimationPlayer
func _ready() -> void:
	pass
	#anima.play("nome_chegada")

func _on_button_pressed() -> void:
	print("wow")

func _on_options_pressed() -> void:
	
	pass 

func _on_quit_game_pressed() -> void:
	pass 


func _on_start_game_mouse_entered() -> void:
	animador.play("entrou")
	pass # Replace with function body.
