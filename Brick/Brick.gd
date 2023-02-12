extends StaticBody2D

var score = 0
var new_position = Vector2.ZERO
var dying = false

func _ready():
	position = new_position
	if score >= 100:
		$ColorRect.color = Color8(224,49,49)
	elif score >= 90:
		$ColorRect.color = Color8(253,126,20)
	elif score >= 80:
		$ColorRect.color = Color8(218,119,242)
	elif score >= 70:
		$ColorRect.color = Color8(153,233,242)
	elif score >= 60:
		$ColorRect.color = Color8(105,219,124)
	elif score >= 50:
		$ColorRect.color = Color8(255,212,59)
	elif score >= 40:
		$ColorRect.color = Color8(255,146,43)
	elif score >= 30:
		$ColorRect.color = Color8(102,168,15)
	elif score >= 20:
		$ColorRect.color = Color8(253,126,20)

func _physics_process(_delta):
	if dying and not $Confetti.emitting:
		queue_free()

func hit():
	die()

func die():
	dying = true
	collision_layer = 0
	$ColorRect.hide()
	Global.update_score(score)
	get_parent().check_level()
	$Confetti.emitting = true
