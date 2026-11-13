class_name MenuPausa
extends Control

@export var duracion_aparicion_menu := 0.3
@export var duracion_movimiento_contenedor := 0.2


# Busca CenterContainer dentro de ColorRect, partiendo del nodo que tiene este script, 
# y guarda su referencia en la variable center_cont, tratándola como un CenterContainer
@onready var center_cont := $ColorRect/CenterContainer as CenterContainer

@onready var boton_reanudar:= center_cont.get_node(^"VBoxContainer/BotonReanudar") as Button

#$ColorRect/nombre del nodo <-- as --> nombre de la clase
@onready var contador_llave := $ColorRect/contador_llaves as Contador_Llaves



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	
	
func cerrar() -> void:
	var tween := create_tween()
	get_tree().paused = false
	tween.tween_property(
			self,
			^"modulate:a",
			0.0,
			duracion_aparicion_menu
		).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(
			center_cont,
			^"anchor_bottom",
			0.5,
			duracion_movimiento_contenedor
		).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_callback(hide)
	
	
func abrir() -> void:
	show()
	boton_reanudar.grab_focus()

	modulate.a = 0.0
	center_cont.anchor_bottom = 0.5

	var tween := create_tween()

	# Hace aparecer el menú.
	tween.tween_property(
		self,
		^"modulate:a",
		1.0,
		duracion_aparicion_menu
	).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)

	# Anima el anclaje del contenedor a la vez.
	tween.parallel().tween_property(
		center_cont,
		^"anchor_bottom",
		1.0,
		duracion_movimiento_contenedor
	).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
	
func _on_llave_collected() -> void:
	contador_llave.conseguir_llaves()



func _on_boton_reanudar_pressed() -> void:
	cerrar()


func _on_boton_quitar_pressed() -> void:
	if visible:
		get_tree().quit()
