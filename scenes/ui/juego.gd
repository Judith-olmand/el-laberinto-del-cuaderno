class_name Juego
extends Node


@onready var pausa_menu := $CanvasLayer/MenuPausa as MenuPausa


func _unhandled_input(input_event: InputEvent) -> void:
	if input_event.is_action_pressed(&"pantalla_completa"):
		var mode := DisplayServer.window_get_mode()
		if mode == DisplayServer.WINDOW_MODE_FULLSCREEN or \
				mode == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		get_tree().root.set_input_as_handled()

	elif input_event.is_action_pressed(&"pausa"):
		var tree := get_tree()
		tree.paused = not tree.paused
		if tree.paused:
			pausa_menu.abrir()
		else:
			pausa_menu.cerrar()
		get_tree().root.set_input_as_handled()
