class_name Contador_Llaves
extends Panel

var llaves_consguidas: int = 0

@onready var llaves_label := $Label as Label


func _ready() -> void:
	llaves_label.set_text(str(llaves_consguidas))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func conseguir_llaves() -> void:
	llaves_consguidas += 1
	llaves_label.set_text(str(llaves_consguidas))
