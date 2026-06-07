extends CharacterBody2D

var color_state = "blue"
var grav = 10

func _ready():
	$AnimatedSprite2D.play("bludle")

func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += grav

	if Input.is_action_pressed("ui_right"):
		velocity.x = 200
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -200
		$AnimatedSprite2D.flip_h = true
	else:
		velocity.x = 0

	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = -300

		if color_state == "blue":
			color_state = "orange"
		else:
			color_state = "blue"

		for p in get_tree().get_nodes_in_group("platform"):
			p.set_color(color_state)

	move_and_slide()

	if abs(velocity.x) > 0:
		if color_state == "blue":
			$AnimatedSprite2D.play("bluani")
		else:
			$AnimatedSprite2D.play("oraani")
	else:
		if color_state == "blue":
			$AnimatedSprite2D.play("bludle")
		else:
			$AnimatedSprite2D.play("oradle")

	# morte
	if is_on_floor():
		var collision = get_last_slide_collision()
		if collision:
			var obj = collision.get_collider()
			if obj.is_in_group("platform"):
				var p_color = obj.get_platform_color()
				if p_color != color_state:
					die()

func die():
	velocity = Vector2.ZERO
	set_physics_process(false)

func _input(event):
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
