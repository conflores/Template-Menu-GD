extends Control
@export var entra_sai_mouse : AnimationPlayer
@export var animador_de_transicao : AnimationPlayer
@export var pode_interagir : bool #true
@export var bt1 : Button
@export var bt2 : Button
@export var bt3 : Button
@export var timer : Timer

var goto1 : bool = false #entra no jogo
var goto2 : bool = false #entra na configuracao
var goto3 : bool = false #sai do jogo

func _ready() -> void:
	animador_de_transicao.play("entrada") 
	bt1.show()
	bt2.show()
	bt3.show()
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_down"):
		animador_de_transicao.play("entrada") 
		goto1 = false
		goto2 = false
		goto3 = false
		bt1.show()
		bt2.show()
		bt3.show()
		
		
##CLICKS
func _on_button_pressed() -> void:
	animador_de_transicao.play("sainda")
	goto1 = true
	timer.start()
func _on_options_pressed() -> void:
	animador_de_transicao.play("sainda")
	goto2 = true
	timer.start()
func _on_quit_game_pressed() -> void:
	animador_de_transicao.play("sainda")
	goto3 = true
	timer.start()


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
		if goto1:
			print("para o jogo")
			
			return
		if goto2:
			print("para para ali")
			#get_tree().change_scene_to_file("res://MainMenu/settings_menu.tscn")
			return
		if goto3:
			get_tree().quit()
			return


func _on_timer_timeout() -> void:
	if goto1:
		bt2.hide()
		bt3.hide()

	if goto2:
		bt1.hide()
		bt3.hide()

	if goto3:
		bt2.hide()
		bt1.hide()
