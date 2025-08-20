extends Area2D
var dir = 1
var speed1 = 230
var speed2 = 1
var leftLimit = 165  # Lewy limit, gdzie Sprite ma zaczynać powrót
var rightLimit = 1020  # Prawy limit, gdzie Sprite ma zaczynać ruch w lewo
var DP: int =1
var enemy : CharacterBody2D
var HP=1
var red =1


func _ready():
	HP=1
	DP=1



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	#$ExplodeAnim.hide()
	$AnimatedSprite2D.show()
	$AnimatedSprite2D.play()

	var move = Vector2(speed1 * dir * delta, 0)
	position += move
	if position.x >= rightLimit:
		position.x = rightLimit  # Zatrzymaj Sprite na prawym limicie
		dir = -1

	if position.x <= leftLimit:
		position.x = leftLimit  # Zatrzymaj Sprite na lewym limicie
		dir= 1
	#explode()
func ending_animation():
	$AudioStreamPlayer2D.play()
	$AnimatedSprite2D.hide()
	$ExplodeAnim.show()
	$ExplodeAnim.play()
	await $ExplodeAnim.animation_finished
func explode():
	speed1=0
	#$AudioStreamPlayer2D.play()
	ending_animation()
	await get_tree().create_timer(0.34).timeout
	queue_free()
#ATTACK
func _on_body_entered(body):
	if body is CharacterBody2D:
		print("trafiony1")
		if body.has_method("demage_taken"):
			body.demage_taken(DP)
			print("trafiony")
	#explode()
func demage_taken(demage: int):
	HP-=demage
	#red-=0.2
	#$Sprite2D.modulate = Color(1, red, red, 1)
	if HP <= 0:
		explode()


