extends Area2D

signal hit
signal scored

var move_speed : int = 10
var direction := 1

func _on_body_entered(body):
	hit.emit()


func _on_score_area_body_entered(body):
	scored.emit()

func _ready():
	move_speed = 10 * randi_range(5, 15)

func moving_pipes(delta):
	var speed = move_speed * delta * direction
	
	var pipe_gap = $CollisionLower2.position.y - $CollisionUpper2.position.y
	if pipe_gap < 160:
		direction = -1
	elif pipe_gap > 300:
		direction = 1
		
	$Upper.position.y += speed
	$CollisionUpper1.position.y += speed
	$CollisionUpper2.position.y += speed

	$Lower.position.y -= speed
	$CollisionLower1.position.y -= speed
	$CollisionLower2.position.y -= speed

