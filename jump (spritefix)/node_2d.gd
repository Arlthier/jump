extends Node2D

var orbs_total = 2
var orbs_collected = 0

func _ready():
	orbs_total = get_tree().get_nodes_in_group("orb").size()

func orb_collected():
	orbs_collected += 1
	print("ORB:", orbs_collected, "/", orbs_total)


func _on_button_pressed() -> void:
	pass # Replace with function body.
