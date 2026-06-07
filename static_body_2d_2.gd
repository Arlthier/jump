extends StaticBody2D

var platform_color = "orange"
var changeable = false

var blue_texture = preload("res://blu.png")
var orange_texture = preload("res://ora.png")

func _ready():
	update_visual()

func set_color(player_color):

	if changeable:
		if platform_color == "blue":
			platform_color = "orange"
		else:
			platform_color = "blue"

		update_visual()

func update_visual():
	if platform_color == "blue":
		$Sprite2D.texture = blue_texture
	else:
		$Sprite2D.texture = orange_texture

func get_platform_color():
	return platform_color
