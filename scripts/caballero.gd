extends CharacterBody2D

@export var velocidad = 200
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("mov_derecha"):
		velocity.x +=1

	if Input.is_action_pressed("mov_izquierda"):
		velocity.x -=1
		
	if Input.is_action_pressed("mov_abajo"):
		velocity.y +=1
		
	if Input.is_action_pressed("mov_arriba"):
		velocity.y -=1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * velocidad
		if Input.is_action_pressed("mov_derecha") || Input.is_action_pressed("mov_arriba") && Input.is_action_pressed("mov_derecha") || Input.is_action_pressed("mov_derecha") && Input.is_action_pressed("mov_abajo") :
			$AnimatedSprite2D.play("correrDerecha")
		elif Input.is_action_pressed("mov_izquierda") || Input.is_action_pressed("mov_abajo") || Input.is_action_pressed("mov_arriba"):
			$AnimatedSprite2D.play("correrIzquierda")
	else:
		$AnimatedSprite2D.play("quieto")
#
			#
	position += velocity * delta
	#position = position.clamp(Vector2.ZERO, screen_size)
			

func _physics_process(_delta: float) -> void:
	var dir = Input.get_vector("mov_izquierda", "mov_derecha", "mov_arriba", "mov_abajo")
	velocity = dir * velocity
	var antes = position
	move_and_slide()
	
	#if dir != Vector2.ZERO:
		#print("vel:", velocity, "velocidad:", velocity, " movimiento:", position - antes, " choques:", get_slide_collision_count())
		#for i in get_slide_collision_count():
			#print("choca con: ", get_slide_collision(i).get_collider().name)

	if dir.length() > 0:
		if dir.x > 0:
			$AnimatedSprite2D.play("correrDerecha")
		else:
			$AnimatedSprite2D.play("correrIzquierda")
	else:
		$AnimatedSprite2D.play("quieto")
	
	
	
	
