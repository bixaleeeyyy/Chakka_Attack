extends CharacterBody2D

# Enemy properties
var speed : float = 200.0  # Adjust this for the enemy's movement speed
var scale_up : bool =  true


func _physics_process(_delta: float) -> void:
	velocity = speed * Vector2.UP
	move_and_slide()

func _on_scale_timer_timeout() -> void:
	if scale_up:
		%AnimationPlayer.speed_scale = 2
		%AnimationPlayer.play("scale-up")
		scale_up = false
	else:
		scale_up = true
