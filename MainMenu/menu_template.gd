extends Control
@export var entra_sai_mouse : AnimationPlayer
@export var animador_de_transicao : AnimationPlayer
@export var pode_interagir : bool #true

var indo_pro_jogo : bool = false #entra no jogo
var indo_pro_config : bool = false #entra na configuracao
var indo_pro_caralho : bool = false #sai do jogo

func _ready() -> void:
	animador_de_transicao.play("entrada") 

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_down"):
		animador_de_transicao.play("entrada") 

##CLICKS
func _on_button_pressed() -> void:
	animador_de_transicao.play("sainda")
	indo_pro_jogo = true
func _on_options_pressed() -> void:
	animador_de_transicao.play("sainda")
	indo_pro_config = true
func _on_quit_game_pressed() -> void:
	animador_de_transicao.play("sainda")
	indo_pro_caralho = true


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
	pass
func _on_options_mouse_exited() -> void:
	entra_sai_mouse.play("saindo")
	pass
func _on_start_game_mouse_exited() -> void:
	entra_sai_mouse.play("saindo")
	pass


func _on_selesao_de_opcao_animation_finished(_anim_name: StringName) -> void:
	if _anim_name == "sainda":
		if indo_pro_jogo:
			print("para o jogo")
			return
		if indo_pro_config:
			print("para para ali")
			#get_tree().change_scene_to_file("res://MainMenu/settings_menu.tscn")
			return
		if indo_pro_caralho:
			get_tree().quit()
			return
