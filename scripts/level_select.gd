extends Node2D

@onready var level_button: TextureButton = $level_button
@onready var level_button_2: TextureButton = $level_button2


func _on_level_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")


func _on_level_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")


func _on_level_button_mouse_entered() -> void:
	print("level 1!")
	level_button.popup.visible = true
	level_button.setPopUpPos()

func _on_level_button_mouse_exited() -> void:
	print("mouse exited")
	level_button.popup.visible = false


func _on_level_button_2_mouse_entered() -> void:
	print("level 2!")
	level_button_2.popup.visible = true
	level_button_2.setPopUpPos()

func _on_level_button_2_mouse_exited() -> void:
	print("mouse exited")
	level_button_2.popup.visible = false
