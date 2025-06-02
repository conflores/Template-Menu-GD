extends Control
@export var entra_sai_mouse : AnimationPlayer
@export var animador_de_opcoes_menu : AnimationPlayer
@export var animador_de_transicao : AnimationPlayer
@export var pode_interagir : bool #true

var music : bool = false #entra no jogo
var efeito : bool = false #entra na configuracao
var particula : bool = false #entra na configuracao
var voltar : bool = false #sai do jogo

func _ready() -> void:
	animador_de_opcoes_menu.play("opcoeschegando") 

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_down"):
		animador_de_opcoes_menu.play("opcoeschegando") 

##CLICKS
func _on_button_pressed() -> void:
	animador_de_transicao.play("TrocandoMenu")
	music = true
func _on_options_pressed() -> void:
	animador_de_transicao.play("TrocandoMenu")
	efeito = true
func _on_quit_game_pressed() -> void:
	animador_de_transicao.play("TrocandoMenu")
	particula = true
func _on_voltar_pressed() -> void:
	voltar = true

##ENTRADA DE MOUSE
func _on_start_game_mouse_entered() -> void:
	entra_sai_mouse.play("entrou")
func _on_options_mouse_entered() -> void:
	entra_sai_mouse.play("entrou")
func _on_quit_game_mouse_entered() -> void:
	entra_sai_mouse.play("entrou")
func _on_voltar_mouse_entered() -> void:
	entra_sai_mouse.play("entrou")


##SAINDA DE MOUSE

func _on_quit_game_mouse_exited() -> void:
	entra_sai_mouse.play("saindo")
func _on_options_mouse_exited() -> void:
	entra_sai_mouse.play("saindo")
func _on_start_game_mouse_exited() -> void:
	entra_sai_mouse.play("saindo")
func _on_voltar_mouse_exited() -> void:
	entra_sai_mouse.play("saindo")

func _on_transicao_menu_animation_finished(_anim_name: StringName) -> void:
	if music:
		print("para o jogo")
	if efeito:
		print("desatiava efeitos")
	if particula:
		print("opaganastaily")
	if voltar:
		get_tree().change_scene_to_file("res://MainMenu/menu_template.tscn")
	
