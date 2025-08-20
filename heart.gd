extends Area2D
var dir = 1
var speed1 = 330
var speed2 = 1
var leftLimit = 165  # Lewy limit, gdzie Sprite ma zaczynać powrót
var rightLimit = 1020  # Prawy limit, gdzie Sprite ma zaczynać ruch w lewo
var DP: int =1
var enemy : CharacterBody2D

func _ready():
	DP=1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move = Vector2(speed1 * dir * delta, 0)
	position += move
	if position.x >= rightLimit:
		position.x = rightLimit  # Zatrzymaj Sprite na prawym limicie
		dir = -1

	if position.x <= leftLimit:
		position.x = leftLimit  # Zatrzymaj Sprite na lewym limicie
		dir= 1



func _on_body_entered(body):
	if body is CharacterBody2D:
		print("trafiony1")
		if body.has_method("heal_self"):
			body.heal_self(DP)
			$AudioStreamPlayer2D.play()
			await get_tree().create_timer(0.1).timeout
			print("trafiony")
			queue_free()
