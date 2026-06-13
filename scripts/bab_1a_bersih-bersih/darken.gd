extends Sprite2D

func _process(delta: float) -> void:
	match Global.neutral_state:
		false:
			modulate = Color(1, 1, 1, 1)
			visible = true
		true:
			var tween = get_tree().create_tween()
			tween.tween_property(self, "modulate", Color(1, 1, 1, 0), 0.5)
			await tween.finished
			visible = false
		
