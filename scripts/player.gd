extends CharacterBody2D


@export var speed: float = 500.0
@export_range(0,1) var lerp_factor: float = 0.15
@export var angle_direction: float = 15

# @onready var sprite = $Sprite
@onready var sprite = %Sprite # acesando pelo Unique Name, apenas 1 nome "Sprite" dentro do Player


func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var target_velocity = direction * speed
	velocity = lerp(velocity, target_velocity, lerp_factor)
	move_and_slide()
	
	# o _degress é pra usar angulos em graus
	#sprite.rotation_degrees = direction.x * angle_direction
	var target_rotation = direction.x * angle_direction
	sprite.rotation_degrees = lerp(sprite.rotation_degrees, target_rotation, .2)
