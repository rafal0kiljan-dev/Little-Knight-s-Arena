extends CharacterBody2D
@export var speed = 300 # x – ruch, y – obrót 
var dir = Vector2.ZERO
var gravity = 580  # Wartość grawitacji
var jump_speed = -380  # Prędkość skoku
var is_jumping = false  # Czy postać jest w trakcie skoku
@export var HP=5
@export var XP=0
var red : float = 1
var DP=1
func demage_taken(demage: int):
	HP-=demage
	red-=0.2
	$Knight.modulate = Color(1, red, red, 1)
func heal_self(heal: int):
	if HP <5:
		HP+=heal
		red+=0.2
		$Knight.modulate = Color(1, red, red, 1)
func get_HP():
	return HP
func get_XP():
	return XP
func _physics_process(delta):
	#var move = speed * delta * dir
		# Add the gravity.
	velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed

	# Get the input direction.
	var direction = Input.get_axis("moveleft", "moveright")
	velocity.x = direction * speed
	move_and_slide()
func _input( _event ):
	pass


'func _on_enemy_body_entered(body):
	if body is CharacterBody2D:
		print("trafiony1")
		if body.has_method("demage_taken"):
			body.demage_taken(DP)
			print("trafiony")
	#explode()
'


func _on_sword_area_entered(area):
	if area is Area2D:
		print("trafiony1")
		if area.has_method("demage_taken"):
			area.demage_taken(DP)
			print("trafiony")
			XP+=1
			
	pass # Replace with function body.



func _on_body_entered(body):
	pass # Replace with function body.
