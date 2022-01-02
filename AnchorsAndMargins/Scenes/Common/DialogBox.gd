extends Control

var is_dialog_box_open: bool = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		is_dialog_box_open = !is_dialog_box_open
		var anim_name := "FadeIn" if is_dialog_box_open else "FadeOut"
		$AnimationPlayer.play(anim_name, 0.1)
